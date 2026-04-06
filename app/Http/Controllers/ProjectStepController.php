<?php

namespace App\Http\Controllers;

use App\Models\ProjectStep;
use Illuminate\Http\Request;

class ProjectStepController extends Controller
{
    public function store(Request $request)
    {
        $validated = $request->validate([
            'project_id' => 'required|exists:projects,id',
            'label' => 'required|string|max:255',
            'status' => 'required|in:pending,in_progress,completed',
            'order_num' => 'required|integer',
        ]);

        $step = ProjectStep::create($validated);
        
        // Update project progress
        $this->updateProjectProgress($step->project_id);

        return response()->json($step->load('project'), 201);
    }

    public function update(Request $request, $id)
    {
        $step = ProjectStep::findOrFail($id);
        
        $validated = $request->validate([
            'label' => 'sometimes|string|max:255',
            'status' => 'sometimes|in:pending,in_progress,completed',
            'order_num' => 'sometimes|integer',
        ]);

        $step->update($validated);

        // Update project progress
        $this->updateProjectProgress($step->project_id);

        return response()->json($step->load('project'));
    }

    public function destroy($id)
    {
        $step = ProjectStep::findOrFail($id);
        $projectId = $step->project_id;
        $step->delete();

        // Update project progress
        $this->updateProjectProgress($projectId);

        return response()->json(['message' => 'Etape supprimée']);
    }

    /**
     * Recalculate and update the project progress percentage.
     */
    private function updateProjectProgress($projectId)
    {
        $project = \App\Models\Project::with('steps')->findOrFail($projectId);
        $totalSteps = $project->steps()->count();
        
        if ($totalSteps === 0) {
            $project->update(['progress' => 0]);
            return;
        }

        $completedSteps = $project->steps()->where('status', 'completed')->count();
        $progress = round(($completedSteps / $totalSteps) * 100);
        
        $project->update(['progress' => $progress]);
    }
}
