<template>
    <div class="addProduct">
        <h3 class="title">Add Product Page</h3>
        <hr />
        <h4 class="selectImage">Select Image</h4>
        <template v-if="form.img">
            <div class="img">
                <img :src="form.img" alt="product">
            </div>
        </template>
        <template v-else>
            <div class="no-img">
                <font-awesome-icon icon="camera" />
                <p>Click to select file</p>
                <input @change="uploadImgToCloudinary" type="file">
            </div>
        </template>
        <form @submit="addNewProduct">
            <div class="form-control">
                <label for="name">Product name</label>
                <input v-model="form.productName" id="name" type="text">
            </div>
            <div class="form-control">
                <label for="price">Product price $</label>
                <input step="0.01" v-model="form.productPrice" id="price" type="number">
            </div>
            <div class="form-control">
                <label for="count">Product count</label>
                <input v-model="form.productCount" id="count" type="number">
            </div>
            <div class="form-control">
                <label for="category">Category</label>
                <select id="category" v-model="form.productCategory">
                    <option selected disabled >Select category</option>
                    <option :key="category.id" v-bind:value="category.id" v-for="category in categories">{{ category.name }}</option>
                </select>
            </div>
            <div class="form-control">
                <label for="gender">Gender</label>
                <select id="gender" v-model="form.productGender">
                    <option selected disabled >Select gender</option>
                    <option value="men">Men</option>
                    <option value="women">Women</option>
                </select>
            </div>
            <div class="form-control">
                <label for="descritpion">Description</label>
                <textarea v-model="form.productDescription" id="description" rows="5"></textarea>
            </div>
            <button @submit="addNewProduct" type="submit">Add Product</button>
        </form>
    </div>
</template>

<script>
import { mapGetters } from 'vuex';

export default {
    data: function(){
        return {
            form: {
                img: null,
                productName: "",
                productPrice: 0,
                productCount: 0,
                productCategory: "Select category",
                productGender: "Select gender",
                productDescription: ""
            }
        }
    },
    methods: {
        async uploadImgToCloudinary(event) {
            let formdata = new FormData();
            formdata.append('file', event.target.files[0]);
            formdata.append('upload_preset', 'r1r2iysq');
            const cloudinaryResponse = await axios.post(
                "https://api.cloudinary.com/v1_1/dyz3jdfbl/image/upload", 
                formdata
            ).then((res) => res.data);
            this.form.img = cloudinaryResponse.url
        },
        async addNewProduct(event) {
            event.preventDefault();
            const newProduct = {
                name: this.form.productName,
                img: this.form.img,
                price: this.form.productPrice,
                count: this.form.productCount,
                category_id: this.form.productCategory,
                gender: this.form.productGender,
                description: this.form.productDescription
            }
            await this.$store.dispatch('addProduct', newProduct);
        }
    },
    created: async function() {
        await this.$store.dispatch('getCategories');
    },
    computed: {
        ...mapGetters({
            categories: 'getCategoriesFromStore',
            newProductSuccess: 'getSuccessFromStore'
        })
    },
    watch: {
        newProductSuccess(newVal, oldVal) {
            if (newVal === true) {
                this.$router.push('/manage_products');
            }
        }
    }
}
</script>

<style scoped>
    .addProduct {
        width: 95%;
        max-width: 1200px;
        min-height: 95%;
        background: #fff;
        margin: 30px auto 0;
        box-shadow: 1px 1px 8px rgba(0, 0, 0, .25);
        padding: 20px 30px;
        border-radius: 5px;
    }
    .addProduct > .title {
        color: #333;
        margin-bottom: 20px;
    }
    .addProduct > .selectImage {
        margin-top: 25px;
        color: #333;
        margin-bottom: 10px;
    }
    .addProduct > .img {
        width: 100%;
        display: flex;
        align-items: center;
        justify-content: center;
    }
    .addProduct > .img > img {
        width: 40%;
        height: 200px;
        margin: 0 auto;
        object-fit: cover;
        box-shadow: 1px 1px 8px rgba(0, 0, 0, .25);
        border-radius: 5px;
    } 
    .addProduct > .no-img {
        background: #F0F2F5;
        box-shadow: 1px 1px 8px rgba(0, 0, 0, .25);
        border-radius: 5px;
        width: 40%;
        margin: 0 auto;
        height: 200px;
        display: flex;
        align-items: center;
        justify-content: center;
        flex-direction: column;
        position: relative;
        cursor: pointer;
    }
    .addProduct > .no-img > svg {
        font-size: 30px;
        color: #ff523b
    }
    .addProduct > .no-img > p {
        font-size: 13px;
        font-weight: bold;
        color: #333;
        margin-top: 5px;
    }
    .addProduct > .no-img > input {
        width: 100%;
        height: 100%;
        position: absolute;
        top: 0;
        left: 0;
        right: 0;
        bottom: 0;
        opacity: 0;
        cursor: pointer;
    }
    .addProduct > form > .form-control > input,
    .addProduct > form > .form-control > select,
    .addProduct > form > .form-control > textarea {
        display: block;
        width: 100%;
        border: none;
        padding: 12px 8px;
        border-radius: 5px;
        margin-top: 10px;
        transition: all .3s;
        border: 1px solid #2f2f2f;
    }
    .addProduct > form > .form-control > label {
        font-weight: bold;
        color: #333;
    }
    .addProduct > form > .form-control > input:focus,
    .addProduct > form > .form-control > select:focus,
    .addProduct > form > .form-control > textarea:focus {
        outline: none;
        box-shadow: 1px 1px 8px #ff523b;
    }
    .addProduct > form > button {
        width: 100%;
        padding: 8px;
        background: #ff523b;
        color: #fff;
        font-family: inherit;
        font-size: 18px;
        font-weight: bold;
        border: none;
        cursor: pointer;
        grid-column: 1 / -1;
        border-radius: 5px;
        box-shadow: 1px 1px 8px rgba(0, 0, 0, .35);
    }
    .addProduct > form {
        display: grid;
        grid-template-columns: repeat(4, 1fr);
        grid-gap: 20px;
        margin-top: 25px;
    }
    .addProduct > form > .form-control:nth-child(1) {
        grid-column: 1 / -1;
    }
    .addProduct > form > .form-control:nth-child(6) {
        grid-column: 1 / -1;
    }
</style>