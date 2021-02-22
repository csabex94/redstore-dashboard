<template>
    <div class="manage-products">
        <h3 class="title">Manage Products Page</h3>
        <hr />
        <div class="search">
            <div class="form-control">
                <label for="search-field">Search</label>
                <input v-model="filter.search_query" id="search-field" type="text">
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
        </div>
        <div class="product" v-for="product in products" :key="product.id">
            <span><input type="checkbox"> {{ product.id }}</span>
            <span>{{ product.name.substring(0,20)+"..." }}</span>
            <span>{{ product.code }}</span>
            <span>{{ product.gender }}</span>
            <span>{{ product.count }}</span>
            <span>{{ product.sold }}</span>
            <span>{{ product.category.name }}</span>
            <span>{{ product.created_at | moment('DD/MM/YYYY') }}</span>
            <span>${{ product.price }}</span>
        </div>
        <div class="pagination">
            <button :key="index" v-for="(page, index) in numPages">
                <span v-if="page.label === '&laquo; Previous'">
                    <font-awesome-icon icon="arrow-left" />
                </span>
                <span v-bind:class="page.active ? 'active' : ''" v-else-if="typeof(page.label) === 'number'">
                    {{ index }}
                </span>
                <span v-else-if="page.label === 'Next &raquo;'">
                    <font-awesome-icon icon="arrow-right" />
                </span>
            </button>
        </div>
    </div>
</template>

<script>
import { mapGetters } from 'vuex';
export default {
    created: async function(){
        await this.$store.dispatch('getProducts', this.filter.sort_by_options[2]);
    },
    computed: {
        ...mapGetters({
            products: 'getProductsFromStore',
            numPages: 'getNumPagesFromStore'
        })
    },
    data: function() {
        return {
            page: 1,
            pageination_buttons: [],
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
                this.filter.sort_by_options.find(option => option.value === this.filter.sort_by)
            );
        },
    }
}
</script>

<style scoped>
    .manage-products {
        width: 95%;
        max-width: 1200px;
        min-height: 95%;
        background: #fff;
        margin: 30px auto 0;
        box-shadow: 1px 1px 8px rgba(0, 0, 0, .25);
        padding: 20px 30px;
        border-radius: 5px;
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
    }
    .manage-products > .product > span:first-child {
        grid-column: 1 / 3;
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
        justify-content: flex-end;
    }
    .manage-products > .product > span:nth-child(2), .manage-products > .header > span:nth-child(2) {
        grid-column: 3 / 7;
        justify-content: flex-start;
    }
    .manage-products > .product > span:nth-child(3), .manage-products > .header > span:nth-child(3) {
        grid-column: 7 / 9;
    }
    .manage-products > .product > span:nth-child(4), .manage-products > .header > span:nth-child(4) {
        grid-column: 9 / 11;
    }
    .manage-products > .product > span:nth-child(5), .manage-products > .header > span:nth-child(5) {
        grid-column: 11 / 12;
    }
    .manage-products > .product > span:nth-child(6), .manage-products > .header > span:nth-child(6) {
        grid-column: 12 / 13;
    }
    .manage-products > .product > span:nth-child(7),.manage-products > .header > span:nth-child(7) {
        grid-column: 13 / 15;
    }
    .manage-products > .product > span:nth-child(8), .manage-products > .header > span:nth-child(8) {
        grid-column: 15 / 17;
    }
    .manage-products > .product > span:nth-child(9), .manage-products > .header > span:nth-child(9) {
        grid-column: 17 / 19;
    }
    .manage-products > .pagination {
        margin-top: 10px;
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
</style>