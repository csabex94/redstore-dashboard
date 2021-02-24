<template>
    <div class="dashboard-categories">
        <h3 class="title">Categories</h3>
        <hr />
        <div class="dashboard-categories-body">
            <div class="categories-wrapper">
                <div :key="category.id" class="category" v-for="category in categories">
                    {{ category.name }}
                    <font-awesome-icon @click="deleteProduct(category.id)" icon="trash" />
                </div>
            </div>
            <form @submit="addCategory">
                <h4>Add Category</h4>
                <div class="form-control">
                    <label for="category-name">Category name</label>
                    <input v-model="categoryName" type="text">
                </div>
                <button @submit="addCategory" type="submit">Add Category</button>
            </form>
        </div>
    </div>
</template>

<script>
import { mapGetters } from 'vuex';
export default {
    computed: {
        ...mapGetters({
            categories: 'getCategoriesFromStore',
        })
    },
    data: function() {
        return {
            categoryName: "",
        }
    },
    methods: {
        async addCategory(event){
            event.preventDefault()
            await this.$store.dispatch('addCategory', { name: this.categoryName });
            this.categoryName = ""
        },
        async deleteProduct(id){
            await this.$store.dispatch('deleteCategory', id);
        }
    }
}
</script>

<style scoped>
    .dashboard-categories {
        width: 98%;
        min-height: 80%;
        background: #fff;
        border-radius: 5px;
        box-shadow: 1px 1px 8px rgba(0, 0, 0, .25);
        max-width: 1200px;
        margin: 30px auto 0;
        padding: 20px;
    }
    .dashboard-categories > .title {
        margin-bottom: 10px;
    }
    .dashboard-categories > .dashboard-categories-body > .categories-wrapper {
        box-shadow: 1px 1px 8px rgba(0, 0, 0, .25);
        border-radius: 5px;
        width: 100%;
        display: flex;
        flex-direction: column;
        align-items: center;
        padding: 25px;
    }
    .dashboard-categories > .dashboard-categories-body > .categories-wrapper > .category {
        margin: 5px 0;
        font-weight: bold;
        color: #333;
        cursor: pointer;
    }
    .dashboard-categories > .dashboard-categories-body > .categories-wrapper > .category > svg {
        margin-left: 10px;
    }
    .dashboard-categories > .dashboard-categories-body > form > h4 {
        margin-bottom: 10px;
    }
    .dashboard-categories > .dashboard-categories-body {
        display: grid;
        margin-top: 50px;
        grid-template-columns: 2fr 5fr;
        grid-gap: 2rem;
    }
    .form-control > input {
        display: block;
        width: 70%;
        border: 1px solid #333;
        padding: 8px;
        border-radius: 5px;
        margin-top: 10px;
        transition: .3s;
    }
    .form-control > input:focus {
        outline: none;
        box-shadow: 1px 1px 8px #ff523b;
    }
    .form-control > label {
        font-weight: bold;
        color: #333;
    }
    .dashboard-categories > .dashboard-categories-body > form > button {
        border: none;
        color: #fff;
        background: #ff523b;
        padding: 8px;
        width: 120px;
        margin-top: 10px;
        border-radius: 5px;
        box-shadow: 1px 1px 8px rgba(0, 0, 0, .25);
        font-family: inherit;
        font-weight: bold;
        cursor: pointer;
    }
</style>