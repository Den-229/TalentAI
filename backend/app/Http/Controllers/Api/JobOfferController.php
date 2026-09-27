<?php
namespace App\Http\Controllers\Api;
use App\Http\Controllers\Controller;
use App\Models\JobOffer;
use Illuminate\Http\Request;
class JobOfferController extends Controller {
    public function index() { return response()->json(JobOffer::all()); }
    public function store(Request $request) {
        $validated = $request->validate(['title' => 'required', 'required_skills' => 'required']);
        return response()->json(JobOffer::create($validated), 201);
    }
}
