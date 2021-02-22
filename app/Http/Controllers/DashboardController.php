<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Product;
use App\Http\Resources\DashboardResource;


class DashboardData {
    public $totalProducts;

    function __construct($products) {
        $this->totalProducts = $products;
    }
}

class DashboardController extends Controller
{
    public function index(){
        $totalProducts = Product::all();
        $data = new DashboardData($totalProducts);
        return new DashboardResource($data);
    }
}
