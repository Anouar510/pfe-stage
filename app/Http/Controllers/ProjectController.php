<?php

namespace App\Http\Controllers;

use App\Models\Project;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use Barryvdh\DomPDF\Facade\Pdf;
use App\Http\Resources\ProjectResource;
use App\Http\Requests\StoreProjectRequest;
use App\Notifications\ProjectStatusUpdated;

class ProjectController extends Controller
{
    public function index(Request $request)
    {
        $user = auth()->user();
        $query = Project::with(['user', 'steps']);

        // Filtering
        if ($request->has('status')) {
            $query->where('status', $request->status);
        }

        if ($request->has('search')) {
            $query->where('name', 'like', '%' . $request->search . '%');
        }

        // Role-based access
        if ($user->role !== 'admin') {
            $query->where('user_id', $user->id);
        }

        // Result
        return $query->latest()->get();
    }

    public function store(StoreProjectRequest $request)
    {
        $validated = $request->validated();

        if ($request->hasFile('document_path')) {
            $file = $request->file('document_path');
            $path = $file->store('documents', 'public');
            $validated['document_path'] = asset('storage/' . $path);
        }

        $project = Project::create($validated);
        return response()->json($project, 201);
    }

    public function update(Request $request, $id)
    {
        $project = Project::findOrFail($id);
        $oldStatus = $project->status;

        $validated = $request->validate([
            'user_id' => 'sometimes|exists:users,id',
            'name' => 'sometimes|string|max:255',
            'location' => 'sometimes|string|max:255',
            'progress' => 'sometimes|integer|min:0|max:100',
            'status' => 'sometimes|string|max:100',
            'image_path' => 'nullable|string',
            'document_path' => 'nullable|file|mimes:pdf,doc,docx,jpg,png|max:10240',
            'total_value' => 'sometimes|numeric',
            'delivery_date' => 'sometimes|date',
        ]);

        if ($request->hasFile('document_path')) {
            // Delete old file if exists
            if ($project->document_path) {
                $oldPath = str_replace(asset('storage/'), '', $project->document_path);
                Storage::disk('public')->delete($oldPath);
            }
            $file = $request->file('document_path');
            $path = $file->store('documents', 'public');
            $validated['document_path'] = asset('storage/' . $path);
        }

        $project->update($validated);

        // Notify client if status changed
        if (isset($validated['status']) && $validated['status'] !== $oldStatus) {
            $project->user->notify(new ProjectStatusUpdated($project));
        }

        return response()->json($project);
    }

    public function destroy($id)
    {
        Project::findOrFail($id)->delete();
        return response()->json(['message' => 'Projet supprimé']);
    }

    public function exportCsv(Request $request)
    {
        $user = auth()->user();
        $query = Project::with('user');

        // Apply same filters as index
        if ($request->has('status')) {
            $query->where('status', $request->status);
        }

        if ($request->has('search')) {
            $query->where('name', 'like', '%' . $request->search . '%');
        }

        if ($user->role !== 'admin') {
            $query->where('user_id', $user->id);
        }

        $projects = $query->latest()->get();

        $filename = "projets_bakkah_" . date('Y-m-d') . ".csv";
        
        $headers = [
            "Content-Type" => "text/csv; charset=UTF-8",
            "Content-Disposition" => "attachment; filename=$filename",
            "Pragma" => "no-cache",
            "Cache-Control" => "must-revalidate, post-check=0, pre-check=0",
            "Expires" => "0"
        ];

        $callback = function() use ($projects) {
            $file = fopen('php://output', 'w');
            fprintf($file, chr(0xEF).chr(0xBB).chr(0xBF)); // BOM for Excel UTF-8
            fputcsv($file, ['ID', 'Nom', 'Client', 'Localisation', 'Progrès (%)', 'Statut', 'Valeur (Dh)', 'Date Livraison']);

            foreach ($projects as $p) {
                fputcsv($file, [
                    $p->id,
                    $p->name,
                    $p->user ? $p->user->name : 'N/A',
                    $p->location,
                    $p->progress,
                    $p->status,
                    $p->total_value,
                    $p->delivery_date
                ]);
            }
            fclose($file);
        };

        return response()->stream($callback, 200, $headers);
    }

    public function exportPdf(Request $request)
    {
        $user = auth()->user();
        $query = Project::with('user');

        // Apply same filters as index
        if ($request->has('status')) {
            $query->where('status', $request->status);
        }

        if ($request->has('search')) {
            $query->where('name', 'like', '%' . $request->search . '%');
        }

        if ($user->role !== 'admin') {
            $query->where('user_id', $user->id);
        }

        $projects = $query->latest()->get();

        $pdf = Pdf::loadView('reports.projects', compact('projects'));
        return $pdf->download('projets_bakkah_' . date('Y-m-d') . '.pdf');
    }
}
