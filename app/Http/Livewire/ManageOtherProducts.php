<?php

namespace App\Http\Livewire;

use Livewire\Component;
use Livewire\WithPagination;
use App\Models\Product;
use Illuminate\Http\Request;

class ManageOtherProducts extends Component
{
    use WithPagination;

    public $search = "";
    public $showDeleteModal = false;
    public $selectedToDelete = null;

    public function render(Request $request)
    {
        $products_list = Product::where('name', 'LIKE', '%'.$this->search.'%')
        ->orWhere('code', 'LIKE', '%'.$this->search.'%');

        return view('livewire.manage-other-products', [
            'products' => $products_list->paginate(14)
        ]);
    }

    public function showDeleteModal($productId){
        $this->selectedToDelete = $productId;
        $this->showDeleteModal = !$this->showDeleteModal;
    }

    public function hideDeleteModal(){
        $this->showDeleteModal = false;
        $this->selectedToDelete = null;
    }

    public function deleteProduct() {
        $productToDelete = Product::find($this->selectedToDelete);
        if ($productToDelete) {
            $productToDelete->delete();
            $this->showDeleteModal = false;
            $this->selectedToDelete = null;
        }
    }

    public function updatedSearch() {
        $this->resetPage();
    }
}
