<template>
    <div class="manage-products">
        <h3 class="title">Manage Products</h3>
        <hr />
        <div class="search">
            <div class="form-control">
                <label for="search-field">Search</label>
                <input v-on:keyup.enter="applyFilter" v-model="filter.search_query" placeholder="name, category, code, gender" id="search-field" type="text">
            </div>
            <div class="form-control">
                <label for="sort-by">Sort By</label>
                <select v-model="filter.sort_by" id="sort-by">
                    <option v-bind:value="item.value" v-for="item in filter.sort_by_options" :key="item.id">{{ item.value }}</option>
                </select>
            </div>
            <button @click="applyFilter" type="submit">Apply</button>
        </div>
        <div class="header">
            <span>ID</span>
            <span>Name</span>
            <span>Code</span>
            <span>Gender</span>
            <span>Count</span>
            <span>Sold</span>
            <span>Category</span>
            <span>Created At</span>
            <span>Price</span>
            <span>Actions</span>
        </div>
        <h2 class="no-products" v-if="products && products.length === 0">
            No product found.
        </h2>
        <div class="product" v-for="product in products" :key="product.id">
            <span>{{ product.id }}</span>
            <span>{{ product.name.substring(0,15)+"..." }}</span>
            <span>{{ product.code }}</span>
            <span>{{ product.gender }}</span>
            <span>{{ product.count }}</span>
            <span>{{ product.sold }}</span>
            <span>{{ product.category.name }}</span>
            <span>{{ product.created_at | moment('DD/MM/YYYY') }}</span>
            <span>${{ product.price }}</span>
            <span>
                <font-awesome-icon @click="redirectToUpdate(product.id)" icon="pen-square"/>
                <font-awesome-icon @click="showDeleteProductModal(product)" icon="trash"/>
            </span>
        </div>
        <div class="pagination">
            <button :key="index" v-for="(page, index) in numPages">
                <span @click="handlePagination(page)" v-if="page.label === '&laquo; Previous'">
                    <font-awesome-icon icon="arrow-left" />
                </span>
                <span @click="handlePagination(page)" v-bind:class="page.active ? 'active' : ''" v-else-if="typeof(page.label) === 'number'">
                    {{ index }}
                </span>
                <span @click="handlePagination(page)" v-else-if="page.label === 'Next &raquo;'">
                    <font-awesome-icon icon="arrow-right" />
                </span>
            </button>
        </div>
        <modal :width="400" :height="150" name="delete">
            <delete-modal @closeModal="hideDeleteProductModal" :productId="selectedToDelete" />
        </modal>
    </div>
</template>

<script>
import { mapGetters } from 'vuex';
import DeleteModal from '../components/deleteModal';
export default {
    components: {
        DeleteModal
    },
    created: async function(){
        await this.$store.dispatch('getProducts', { 
            sort_by_query: this.filter.sort_by_options[2],
            page_url: this.url,
            search_query: this.filter.search_query
        });
    },
    computed: {
        ...mapGetters({
            products: 'getProductsFromStore',
            numPages: 'getNumPagesFromStore'
        })
    },
    data: function() {
        return {
            selectedToDelete: 0,
            url: 'api/products/all?page=1',
            filter: {
                sort_by_options: [
                    {
                        id: 1,
                        value: "best-seller-desc",
                        type: "DESC",
                        query_string: "sold"
                    },
                    {
                        id: 2,
                        value: "best-seller-asc",
                        type: "ASC",
                        query_string: "sold"
                    },
                    {
                        id: 3,
                        value: "created-at-desc",
                        type: "DESC",
                        query_string: "created_at"
                    },
                    {
                        id: 4,
                        value: "created-at-asc",
                        type: "ASC",
                        query_string: "created_at"
                    },
                    {
                        id: 5,
                        value: "price-asc",
                        type: "ASC",
                        query_string: "price"
                    },
                    {
                        id: 6,
                        value: "price-desc",
                        type: "DESC",
                        query_string: "price"
                    }
                ],
                search_query: '',
                sort_by: "created-at-desc"
            }
        }
    },
    methods: {
        async applyFilter(event) {
            event.preventDefault();
            await this.$store.dispatch(
                'getProducts', 
                {
                    sort_by_query: this.filter.sort_by_options.find(option => option.value === this.filter.sort_by),
                    page_url: this.url,
                    search_query: this.filter.search_query
                }
            );
        },
        async handlePagination(pageItem) {
            await this.$store.dispatch(
                'getProducts',
                {
                    sort_by_query: this.filter.sort_by_options.find(option => option.value === this.filter.sort_by),
                    page_url: pageItem.url.slice(22),
                    search_query: this.filter.search_query
                }
            )
        },
        showDeleteProductModal(product) {
            this.selectedToDelete = product.id;
            this.$modal.show('delete');
        },
        async hideDeleteProductModal(event) {
            if (event.refetch) {
                await this.$store.dispatch(
                    'getProducts', 
                    {
                        sort_by_query: this.filter.sort_by_options.find(option => option.value === this.filter.sort_by),
                        page_url: this.url,
                        search_query: this.filter.search_query
                    }
                );
            }
            this.$modal.hide('delete');
        },
        redirectToUpdate(productId){
            this.$router.push(`/update_product?productId=${productId}`);
        }
    }
}
</script>

<style scoped>
    .manage-products {
        width: 98%;
        max-width: 1200px;
        min-height: 765px;
        background: #fff;
        margin: 30px auto 0;
        box-shadow: 1px 1px 8px rgba(0, 0, 0, .25);
        padding: 20px;
        border-radius: 5px;
        position: relative;
    }
    .manage-products > .title {
        color: #333;
        margin-bottom: 20px;
    }
    .manage-products > .search > button {
        background: #ff523b;
        color: #fff;
        border: none;
        padding: 8px;
        margin-top: 25px;
        width: 100%;
        font-family: inherit;
        font-weight: bold;
        border-radius: 5px;
        cursor: pointer;
        flex-basis: 10%;
    }
    .manage-products > .search {
        width: 100%;
        display: flex;
        align-items: center;
        margin: 15px 0;
        justify-content: space-between;
    }
    .manage-products > .search > .form-control:first-child {
        flex-basis: 60%;
    }
    .manage-products > .search > .form-control:nth-child(2) {
        flex-basis: 20%;
    }
    .manage-products > .search > .form-control > label {
        font-size: 14px;
        font-weight: bold;
        color: #333;
    }
    .manage-products > .search > .form-control > input,
    .manage-products > .search > .form-control > select  {
        display: block;
        width: 100%;
        padding: 8px;
        border: 1px solid #333;
        border-radius: 5px;
        transition: all .3s;
        margin-top: 5px;
    }
    .manage-products > .search > .form-control > input:focus,
    .manage-products > .search > .form-control > select:focus {
        outline: none;
    }
    .manage-products > .product, .manage-products > .header {
        display: grid;
        grid-template-columns: repeat(18, 1fr);
        border-bottom: 1px solid #333;
    }
    .manage-products > .header {
        color: #fff;
        background: #ff523b;
        border: none;
        padding: 10px 0;
    }
    .manage-products > .product > span, .manage-products > .header > span {
        display: flex;
        height: 100%;
        width: 100%;
        align-items: center;
        justify-content: center;
    }
    .manage-products > .product > span {
        font-size: 14px;
        font-weight: bold;
        color: #333;
        padding: 8px 0;
        width: 100%;
    }
    .manage-products > .product > span:first-child {
        grid-column: 1 / 2;
        justify-content: center;
        position: relative;
    }
    .manage-products > .product > span:first-child > input {
        position: absolute;
        top: 50%;
        transform: translateY(-50%);
        left: 15px;
    }
    .manage-products > .header > span:nth-child(1) {
        justify-content: center;
    }
    .manage-products > .product > span:nth-child(2), .manage-products > .header > span:nth-child(2) {
        grid-column: 2 / 5;
        justify-content: flex-start;
    }
    .manage-products > .product > span:nth-child(3), .manage-products > .header > span:nth-child(3) {
        grid-column: 5 / 7;
    }
    .manage-products > .product > span:nth-child(4), .manage-products > .header > span:nth-child(4) {
        grid-column: 7 / 9;
    }
    .manage-products > .product > span:nth-child(5), .manage-products > .header > span:nth-child(5) {
        grid-column: 9/ 10;
    }
    .manage-products > .product > span:nth-child(6), .manage-products > .header > span:nth-child(6) {
        grid-column: 10 / 11;
    }
    .manage-products > .product > span:nth-child(7),.manage-products > .header > span:nth-child(7) {
        grid-column: 11 / 13;
    }
    .manage-products > .product > span:nth-child(8), .manage-products > .header > span:nth-child(8) {
        grid-column: 13 / 15;
    }
    .manage-products > .product > span:nth-child(9), .manage-products > .header > span:nth-child(9) {
        grid-column: 15 / 17;
    }
    .manage-products > .product > span:nth-child(10), .manage-products > .header > span:nth-child(10) {
        grid-column: 17 / 19;
        align-items: center;
        justify-content: center;
    }
    .manage-products > .product > span:nth-child(10) {
        font-size: 20px;
    }
    .manage-products > .product > span:nth-child(10) > svg:first-child {
        margin-right: 15px;
    }
    .manage-products > .product > span:nth-child(10) > svg {
        cursor: pointer;
        transition: .3s;
        color: #333;
    }
    .manage-products > .product > span:nth-child(10) > svg:hover {
        color: #ff523b;
    }
    .manage-products > .pagination {
        position: absolute;
        bottom: 5px;
    }
    .manage-products > .pagination > button > span.active {
        background: #ff523b;
        padding: 8px 12px; 
    }
    .manage-products > .pagination > button > span {
        padding: 8px 12px;
        background: #333;
        border-radius: 5px;
        font-weight: bold;
    }
    .manage-products > .pagination > button {
        color: #fff;
        border: none;
        margin-right: 5px;
        cursor: pointer;
        font-family: inherit;
        transition: all .3s;
        height: 100%;
        padding: 8px 0;
    }
    .manage-products > .pagination > button:focus {
        outline: none;
    }
</style>
