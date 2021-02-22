export default async function auth({ next, store, to }) {
    if (to.path !== '/dashboard_login') {
        if (store.state.user.isLoggedIn && store.state.user.currentUser) {
            return next();
        } else {
            await store.dispatch('getUser');
    
            if (!store.state.user.isLoggedIn || !store.state.user.currentUser) {
                return next('/dashboard_login')
            }
            return next();
        }
    } else {
        if (!store.state.user.isLoggedIn && !store.state.user.currentUser) {
            await store.dispatch('getUser');
            if (store.state.user.isLoggedIn && store.state.user.currentUser) {
                return next('/');
            } else {
                return next();
            }
        }
    }   
}