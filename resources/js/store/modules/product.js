import axios from 'axios';

export const productModule = {
    state: {
        products: null,
        success: false,
        numPages: 1,
        productToUpdate: null
    },
    mutations: {
        setProducts(state, payload) {
            state.products = payload.data;
            state.numPages = payload.meta.links,
            state.success = true;
        },
        setSuccess(state, payload) {
            state.success = payload;
        },
        setProductToUpdate(state, payload){
            state.productToUpdate = payload;
        }
    },
    actions: {
        async getProducts(state, payload) {
            const res = await axios.get(`${payload.page_url}&order_by=${payload.sort_by_query.query_string}&type=${payload.sort_by_query.type}&search_query=${payload.search_query}`);
            if (res.status === 200) {
                state.commit('setProducts', res.data)
            }
        },
        async addProduct(state, payload) {
            const res = await axios.post('api/products/add', payload);
            if (res.status === 201) {
                state.commit('setSuccess', true);
            }
        },
        async deleteProduct(state, payload) {
            const res = await axios.get(`api/products/delete/${payload}`);
            if (res.status === 200) {
                state.commit('setSuccess', true)
            }
        },
        async getProductById(state, payload){
            const res = await axios.get(`api/products/${payload}`);
            if (res.status === 200) {
                state.commit('setProductToUpdate', res.data.data);
            }
        },
        async updateProduct(state, payload) {
            const res = await axios.post(`api/products/update/${payload.productId}`, {
                img: payload.body.img,
                name: payload.body.productName,
                description: payload.body.productDescription,
                price: payload.body.productPrice,
                count: payload.body.productCount,
                gender: payload.body.productGender,
                category_id: payload.body.productCategory.id
            });
            if (res.status === 200) {
                state.commit('setProductToUpdate', res.data.data);
            }
        },
    },
    getters: {
        getProductsFromStore: state => state.products,
        getSuccessFromStore: state => state.success,
        getNumPagesFromStore: state => state.numPages,
        getProductToUpdateFromStore: state => state.productToUpdate
    }
}