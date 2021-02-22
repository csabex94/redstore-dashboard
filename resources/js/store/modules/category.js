import axios from 'axios';

export const categoryModule = {
    state: {
        categories: null,
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
            
        }
    },
    getters: {
        getCategoriesFromStore: state => state.categories
    }
}