<div class="manage-other-products-content">
    <h3>Manage Other Products</h3>
    <hr />
    <div class="form-control">
        <label for="search">Search</label>
        <input wire:model="search" type="text" placeholder="Name, code">
    </div>
    <div class="list-head">
        <span>Id</span>
        <span>Name</span>
        <span>Code</span>
        <span>Gender</span>
        <span>Count</span>
        <span>Sold</span>
        <span>Category</span>
        <span>Created</span>
        <span>Price</span>
        <span>Actions</span>
    </div>
    
    @foreach($products as $product)
        <div class="product">
            <span>{{ $product->id }}</span>
            <span>{{ substr($product->name, 0, 12) }}...</span>
            <span>{{ $product->code }}</span>
            <span>{{ $product->gender }}</span>
            <span>{{ $product->count }}</span>
            <span>{{ $product->sold }}</span>
            <span>{{ $product->category->name }}</span>
            <span>{{ date_format($product->created_at, 'd/m/y') }}</span>
            <span>${{ $product->price }}</span>
            <span>
                <a href={{ "/update_product?productId=".$product->id }}><i class="fas fa-pen-square"></i></a>
                <i wire:click="showDeleteModal({{ $product->id }})" class="fas fa-trash"></i>
            </span>
        </div>
    @endforeach
    {{ $products->links('livewire.livewire-pagination') }}
    @if($showDeleteModal)
    <div class="delete-modal-bg">
        <div class="delete-modal">
            <h3 class="title">Delete product</h3>
            <p class="text">Are you sure you want to delete this product? Product ID: {{ $selectedToDelete }}</p>
            <div class="buttons">
                <button type="button" wire:click="hideDeleteModal">Cancel</button>
                <button type="button" wire:click="deleteProduct">Confirm</button>
            </div>
        </div>
    </div>
    @endif
</div>