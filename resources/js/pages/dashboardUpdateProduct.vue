<template>
    <div @updateProduct="setProductToUpdate" class="updateProduct">
        <h3 class="title">Update Product</h3>
        <hr />
        <h4 class="selectImage">Select Image</h4>
        <template v-if="form.img">
            <div class="img">
                <img :src="form.img" alt="product">
            </div>
            <div class="select-img">
                   <span>Click to select file</span>
                   <input @change="uploadImgToCloudinary" type="file">
            </div>
        </template>
        <template v-else>
            <div class="no-img">
                <font-awesome-icon icon="camera" />
                <p>Click to select file</p>
                <input @change="uploadImgToCloudinary" type="file">
            </div>
        </template>
        <form @submit="updateProduct">
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
                    <option selected disabled >{{ form.productCategory }}</option>
                    <option :key="category.id" v-bind:value="category" v-for="category in categories">{{ category.name }}</option>
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
            <button @submit="updateProduct" type="submit">Update Product</button>
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
                productCategory: "",
                productGender: "",
                productDescription: "",
            }
        }
    },
    computed: {
        ...mapGetters({
            categories: 'getCategoriesFromStore',
            productToUpdate: "getProductToUpdateFromStore"
        })
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
        setProductToUpdate(product){
            this.form.img =  product.img;
            this.form.productName =  product.name;
            this.form.productCount =  product.count;
            this.form.productPrice =  product.price;
            this.form.productCategory =  product.category.name;
            this.form.productGender =  product.gender;
            this.form.productDescription =  product.description;
        },
        async updateProduct(event){
            event.preventDefault();
            await this.$store.dispatch('updateProduct', { body: this.form, productId: this.$route.query.productId });
        }
    },
    beforeRouteEnter(to, from, next) {
        if (from.name !== 'dashboard_manage_products') {
            next('/manage_products');
        }
        next();
    },
    created: async function () {
        await this.$store.dispatch('getProductById', this.$route.query.productId);
    },
    watch: {
        productToUpdate(newVal, oldVal){
            this.setProductToUpdate(newVal);
        }
    }
}
</script>

<style scoped>
    .updateProduct {
        width: 98%;
        max-width: 1200px;
        min-height: 95%;
        background: #fff;
        margin: 30px auto 0;
        box-shadow: 1px 1px 8px rgba(0, 0, 0, .25);
        padding: 20px;
        border-radius: 5px;
    }
    .updateProduct > .title {
        color: #333;
        margin-bottom: 20px;
    }
    .updateProduct > .selectImage {
        margin-top: 25px;
        color: #333;
        margin-bottom: 10px;
    }
    .updateProduct > .img {
        width: 100%;
        display: flex;
        align-items: center;
        justify-content: center;
    }
    .updateProduct > .img > img {
        width: 40%;
        height: 200px;
        margin: 0 auto;
        object-fit: cover;
        box-shadow: 1px 1px 8px rgba(0, 0, 0, .25);
        border-radius: 5px;
    } 
    .updateProduct > .no-img {
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
    .updateProduct > .no-img > svg {
        font-size: 30px;
        color: #ff523b
    }
    .updateProduct > .no-img > p {
        font-size: 13px;
        font-weight: bold;
        color: #333;
        margin-top: 5px;
    }
    .updateProduct > .no-img > input {
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
    .updateProduct > form > .form-control > input,
    .updateProduct > form > .form-control > select,
    .updateProduct > form > .form-control > textarea {
        display: block;
        width: 100%;
        border: none;
        padding: 12px 8px;
        border-radius: 5px;
        margin-top: 10px;
        transition: all .3s;
        border: 1px solid #2f2f2f;
    }
    .updateProduct > form > .form-control > label {
        font-weight: bold;
        color: #333;
    }
    .updateProduct > form > .form-control > input:focus,
    .updateProduct > form > .form-control > select:focus,
    .updateProduct > form > .form-control > textarea:focus {
        outline: none;
        box-shadow: 1px 1px 8px #ff523b;
    }
    .updateProduct > form > button {
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
    .updateProduct > form {
        display: grid;
        grid-template-columns: repeat(4, 1fr);
        grid-gap: 20px;
        margin-top: 25px;
    }
    .updateProduct > form > .form-control:nth-child(1) {
        grid-column: 1 / -1;
    }
    .updateProduct > form > .form-control:nth-child(6) {
        grid-column: 1 / -1;
    }
    .select-img {
        background: #ff523b;
        color: #fff;
        width: 150px;
        padding: 5px 0 5px 5px;
        position: relative;
        font-weight: bold;
        cursor: pointer;
    }
    .select-img > input {
        width: 100%;
        opacity: 0;
        cursor: pointer;
    }
    .select-img > span {
        position: absolute;
        cursor: pointer;
    }
</style>