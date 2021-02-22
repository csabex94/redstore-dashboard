<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Category;
use App\Http\Resources\CategoryResource;


class CategoryController extends Controller
{
    public function store(Request $request) {
        $validData = $request->validate([
            'name' => 'required|string'
        ]);
        $newCategory = Category::create([
            'name' => $request->name
        ]);
        return response('', 201);
    }

    public function index(){
        return CategoryResource::collection(Category::all());
    }

    public function update(Request $request, $id) {
        $validData = $request->validate([
            'name' => 'required|string'
        ]);

        $categoryToUpdate = Category::where('id', '=', $id)->first();
        $categoryToUpdate->update(['name' => $request->name]);
        $categoryToUpdate->save();
        return new CategoryResource($categoryToUpdate);
    }

    public function destroy($id) {
        $categoryToDelete = Category::find($id);
        if (!$categoryToDelete) {
            return response(['error' => 'No category found.']);
        }
        $categoryToDelete->delete();
        return response('', 200);
    }
}
