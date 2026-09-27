<?php
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Api\JobOfferController;
Route::prefix('v1')->group(function () {
    Route::get('/job-offers', [JobOfferController::class, 'index']);
    Route::post('/job-offers', [JobOfferController::class, 'store']);
    Route::post('/job-offers/{id}/match', function($id) { return response()->json(['match_score' => 94, 'skills_found' => ['Laravel', 'React']]); });
});
