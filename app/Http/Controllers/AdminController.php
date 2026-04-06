<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use App\Models\User;
use App\Models\Project;
use App\Models\ProjectStep;

class AdminController extends Controller
{
    public function getDashboardStats()
    {
        // 1. Counters
        $counters = [
            'total_projects' => Project::count(),
            'total_clients' => User::where('role', 'client')->count(),
            'total_value' => Project::sum('total_value'),
            'average_progress' => round(Project::avg('progress') ?? 0, 1),
        ];

        // 2. Recent Activities
        $activities = collect();

        // New Projects
        $projects = Project::with('user')
            ->latest()
            ->take(5)
            ->get()
            ->map(function ($project) {
                return [
                    'id' => 'p' . $project->id,
                    'type' => 'project_created',
                    'title' => "Nouveau projet '{$project->name}' créé",
                    'user' => 'Admin',
                    'time' => $project->created_at,
                    'color' => '#10b981',
                ];
            });

        // New Users
        $users = User::where('role', 'client')
            ->latest()
            ->take(5)
            ->get()
            ->map(function ($user) {
                return [
                    'id' => 'u' . $user->id,
                    'type' => 'user_registered',
                    'title' => "Nouveau client inscrit : {$user->name}",
                    'user' => 'Système',
                    'time' => $user->created_at,
                    'color' => '#8b5cf6',
                ];
            });

        // Completed Steps
        $steps = ProjectStep::with('project')
            ->where('status', 'completed')
            ->latest('updated_at')
            ->take(5)
            ->get()
            ->map(function ($step) {
                return [
                    'id' => 's' . $step->id,
                    'type' => 'step_completed',
                    'title' => "Étape '{$step->label}' terminée - " . ($step->project->name ?? 'Projet introuvable'),
                    'user' => 'Chef Chantier',
                    'time' => $step->updated_at,
                    'color' => '#3b82f6',
                ];
            });

        $activities = $activities->concat($projects)->concat($users)->concat($steps);
        $sortedActivities = $activities->sortByDesc('time')->values()->take(10);
        
        return response()->json($sortedActivities);
    }

    public function getUsers()
    {
        $users = User::all();
        return response()->json($users);
    }

    public function storeUser(Request $request)
    {
        $validated = $request->validate([
            'name' => 'required|string|max:255',
            'email' => 'required|string|email|max:255|unique:users',
            'password' => 'required|string|min:8',
            'role' => 'required|in:admin,client',
            'phone' => 'nullable|string|max:50',
        ]);

        $user = User::create([
            'name' => $validated['name'],
            'email' => $validated['email'],
            'password' => Hash::make($validated['password']),
            'role' => $validated['role'],
            'phone' => $validated['phone'] ?? null,
        ]);

        return response()->json($user, 201);
    }

    public function updateUser(Request $request, $id)
    {
        $user = User::findOrFail($id);

        $validated = $request->validate([
            'name' => 'sometimes|string|max:255',
            'email' => 'sometimes|string|email|max:255|unique:users,email,' . $id,
            'role' => 'sometimes|in:admin,client',
            'phone' => 'nullable|string|max:50',
        ]);

        if ($request->filled('password')) {
            $validated['password'] = Hash::make($request->password);
        }

        $user->update($validated);

        return response()->json($user);
    }

    public function deleteUser($id)
    {
        $user = User::findOrFail($id);
        
        // Sécurité : Ne pas se supprimer soi-même
        if (auth()->id() == $id) {
            return response()->json(['message' => 'Vous ne pouvez pas supprimer votre propre compte.'], 403);
        }

        $user->delete();
        return response()->json(['message' => 'Utilisateur supprimé avec succès.']);
    }
}
