import axios from 'axios';

export const categoryModule = {
    state: {
        categories: null,
        success: null
    },
    mutations: {
        setCategories(state, payload) {
            state.categories = payload
        }
    },
    actions: {
        async getCategories(state, payload) {
            const res = await axios.get('api/categories/all');
            if (res.status === 200) {
                state.commit('setCategories', res.data.data);
            }
            
        },
        async addCategory(state, payload) {
            const res = await axios.post('api/categories/add', payload);
            if (res.status === 200) {
                state.commit('setCategories', res.data.data);
            }
        },
        async deleteCategory(state, payload) {
            const res = await axios.post(`api/categories/delete/${payload}`);
            if (res.status === 200) {
                state.commit('setCategories', res.data.data);
            }
        }
    },
    getters: {
        getCategoriesFromStore: state => state.categories
    }
}