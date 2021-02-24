import axios from 'axios';

export const dashboard = {
    state: {
        dashboard_data: null
    },
    mutations: {
        setDashboardData(state, payload) {
            state.dashboard_data = payload;
        }
    },
    actions: {
        async getData(state, payload) {
            const res = await axios.get('api/dashboard/data');
            if (res.status === 200) {
                state.commit('setDashboardData', res.data.data);
            }
        }
    },
    getters: {
        getDataFromStore: state => state.dashboard_data
    }
}