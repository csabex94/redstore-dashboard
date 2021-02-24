<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;
use App\Http\Resources\ProductResource;

class DashboardResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array
     */
    public function toArray($request)
    {
        return [
            'total_products' => count($this->totalProducts),
            'total_categories' => count($this->totalCategories),
            'total_orders' => $this->totalOrders(),
            'total_orders_value' => $this->totalOrdersValue(),
            'total_admins' => count($this->totalAdmins)
        ];
    }
}
