<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Product;
use App\Models\User;
use App\Models\Category;
use App\Http\Resources\DashboardResource;


class DashboardData {
    public $totalProducts;
    public $totalCategories;
    public $totalAdmins;

    function __construct($products, $categories, $totalAdmins) {
        $this->totalProducts = $products;
        $this->totalCategories = $categories;
        $this->totalAdmins = $totalAdmins;
    }
    function totalOrders(){
        $orderNum = 0;
        foreach ($this->totalProducts as $value) {
            $orderNum += $value->sold;
        }
        return $orderNum;
    }
    function totalOrdersValue() {
        $wallet = 0;
        foreach ($this->totalProducts as $value) {
            $wallet += ($value->price * $value->sold);
        }
        return $wallet;
    }
}

class DashboardController extends Controller
{
    public function index(){
        $totalProducts = Product::all();
        $totalCategories = Category::all();
        $totalAdmins = User::all();
        $data = new DashboardData($totalProducts, $totalCategories, $totalAdmins);
        return new DashboardResource($data);
    }
}
