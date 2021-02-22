
export const userModule = {
    state: {
        currentUser: null,
        isLoggedIn: false
    },
    mutations: {
        setCurrentUser(state, user) {
            state.currentUser = user;
            state.isLoggedIn = !!user;
        },
        setError(state, error) {
            state.error = error;
            state.currentUser = null;
            state.isLoggedIn = false;
        }
    },
    actions: {
        async loginUser(state, payload) {
            try {
                const res = await axios.post('api/user/login', { email: payload.email, password: payload.password });
                if (res.status === 200) {
                    localStorage.setItem('auth_token', res.data.token);
                    state.commit('setCurrentUser', res.data.user);
                } else {
                    state.commit('setCurrentUser', null);
                }
            } catch (error) {
                state.commit('setError', error);
            }
        },
        async getUser(state, payload) {
            try {
                const token = localStorage.getItem('auth_token');
                const res = await axios.get('api/user/profile', { headers: { 'Authorization': `Bearer ${token}` } });
                if (res.status === 200) {
                    state.commit('setCurrentUser', res.data);
                } else {
                    state.commit('setCurrentUser', null);
                }
            } catch (error) {
                state.commit('setError', error);
            }
        }
    },
    getters: {
        getCurrentUserFromStore: state => state.currentUser,
        getCurrentUserIsLoggedIn: state => state.isLoggedIn,
        getCurrentUserError: state => state.error
    }
}