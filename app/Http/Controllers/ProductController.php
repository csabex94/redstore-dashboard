<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Product;
use App\Http\Resources\ProductResource;

class ProductController extends Controller
{
    public function index(Request $request) {
        $products = Product::with('category')->orderBy($request->order_by, $request->type)->paginate(14);
        return ProductResource::collection($products);
    }

    public function show($id) {
        return new ProductResource(Product::with('category')->find($id));
    }

    public function store(Request $request) {
        $validData = $request->validate([
            'name' => 'required|string',
            'gender' => 'required|string',
            'img' => 'required|string',
            'price' => 'required|numeric',
            'count' => 'required|integer',
            'category_id' => 'required|integer',
            'description' => 'required'
        ]);
        $newProduct = Product::create([
            'name' => $request->name,
            'category_id' => $request->category_id,
            'gender' => $request->gender,
            'price' => $request->price,
            'code' => uniqid(),
            'img' => $request->img,
            'description' => $request->description,
            'count' => $request->count,
            'sold' => 0,
        ]);
        return response('', 201);
    }

    public function update(Request $request, $id) {
        $data = $request->all();
        $productToUpdate = Product::where('id', '=', $id)->first();
        $productToUpdate->update($data);
        $productToUpdate->save();
        $productToUpdate->load('category');
        return new ProductResource($productToUpdate);
    }

    public function destroy($id) {
        $productToDelete = Product::find($id);
        if (!$productToDelete) {
            return response(['error' => 'No product found.']);
        }
        $productToDelete->delete();
        return response('', 200);
    }
}
