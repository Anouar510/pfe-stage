<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

use App\Http\Controllers\AuthController;
use App\Http\Controllers\AdminController;
use App\Http\Controllers\ProjectController;
use App\Http\Controllers\ProjectStepController;
use App\Http\Controllers\SettingController;
use App\Http\Controllers\ChatController;

Route::post('/register', [AuthController::class, 'register']);
Route::post('/login', [AuthController::class, 'login']);

// IA Chat route - PUBLIC for stability
Route::post('/chat', [ChatController::class, 'ask']);

Route::middleware('auth:sanctum')->group(function () {
    Route::post('/logout', [AuthController::class, 'logout']);
    Route::get('/user', function (Request $request) {
        return $request->user();
    });
    Route::put('/user/profile', [AuthController::class, 'updateProfile']);
    Route::put('/user/password', [AuthController::class, 'updatePassword']);

    // Admin routes
    Route::get('/admin/stats', [AdminController::class, 'getDashboardStats']);
    Route::get('/admin/users', [AdminController::class, 'getUsers']);
    Route::post('/admin/users', [AdminController::class, 'storeUser']);
    Route::put('/admin/users/{id}', [AdminController::class, 'updateUser']);
    Route::delete('/admin/users/{id}', [AdminController::class, 'deleteUser']);

    // Project routes
    Route::get('/projects/export', [ProjectController::class, 'exportCsv']);
    Route::get('/projects/export-pdf', [ProjectController::class, 'exportPdf']);
    Route::get('/projects', [ProjectController::class, 'index']);
    Route::post('/projects', [ProjectController::class, 'store']);
    Route::put('/projects/{id}', [ProjectController::class, 'update']);
    Route::delete('/projects/{id}', [ProjectController::class, 'destroy']);

    // Step routes
    Route::post('/steps', [ProjectStepController::class, 'store']);
    Route::put('/steps/{id}', [ProjectStepController::class, 'update']);
    Route::delete('/steps/{id}', [ProjectStepController::class, 'destroy']);

    // Settings routes
    Route::get('/settings', [SettingController::class, 'getSettings']);
    Route::post('/settings', [SettingController::class, 'update']);

    // Contact route
    Route::post('/contact', [\App\Http\Controllers\ContactController::class, 'send']);
});

Route::get('/test', function () {
    return response()->json(['message' => 'Laravel API is connected!']);
});
