import axios from 'axios';

export const productModule = {
    state: {
        products: null,
        success: false,
        numPages: 1
    },
    mutations: {
        setProducts(state, payload) {
            state.products = payload.data;
            state.numPages = payload.meta.links
        },
        setSuccess(state, payload) {
            state.success = payload;
        }
    },
    actions: {
        async getProducts(state, payload) {
            const res = await axios.get(`api/products/all?order_by=${payload.query_string}&type=${payload.type}`);
            if (res.status === 200) {
                state.commit('setProducts', res.data)
            }
        },
        async addProduct(state, payload){
            const res = await axios.post('api/products/add', payload);
            if (res.status === 201) {
                state.commit('setSuccess', true);
            }
        }
    },
    getters: {
        getProductsFromStore: state => state.products,
        getSuccessFromStore: state => state.success,
        getNumPagesFromStore: state => state.numPages
    }   
}