import VueRouter from 'vue-router';

import Dashboard from './pages/dashboard';
import Login from './pages/dashboardLogin';
import DashboardHome from './pages/dashboardHome';
import DashboardAddProduct from './pages/dashboardAddProduct';
import DashboardManageProducts from './pages/dashboardManageProducts';
import DashboardCategories from './pages/dashboardCategories';
import DahboardUpdateProduct from './pages/dashboardUpdateProduct';
import DashboardAdmins from './pages/dashboardAdmins';

import { store } from './store/store';
import auth from './middleware/auth';

export const router = new VueRouter({
    mode: 'history',
    routes: [
        {
            path: '/',
            component: Dashboard,
            meta: {
                middleware: [
                    auth
                ]
            },
            children: [
                {
                    path: '/',
                    name: 'dashboard_home',
                    component: DashboardHome,
                    meta: {
                        middleware: [
                            auth
                        ]
                    }
                },
                {
                    path: '/add_product',
                    name: 'dashboard_add_product',
                    component: DashboardAddProduct,
                    meta: {
                        middleware: [
                            auth
                        ]
                    }
                },
                {
                    path: '/manage_products',
                    name: 'dashboard_manage_products',
                    component: DashboardManageProducts,
                    meta: {
                        middleware: [
                            auth
                        ]
                    }
                },
                {
                    path: '/update_product',
                    name: 'dashboard_update_product',
                    component: DahboardUpdateProduct,
                    meta: {
                        middleware: [
                            auth
                        ]
                    }
                },
                {
                    path: '/dashboard_admins',
                    name: 'dashboard_admins',
                    component: DashboardAdmins,
                    meta: {
                        middleware: [
                            auth
                        ]
                    }
                },
                {
                    path: '/categories',
                    name: 'dashboard_categories',
                    component: DashboardCategories,
                    meta: {
                        middleware: [
                            auth
                        ]
                    }
                }
            ]
        },
        {
            path: '/dashboard_login',
            name: 'dashboard_login',
            component: Login,
            meta: {
                middleware: [
                    auth
                ]
            }
        }
    ],
});

router.beforeEach((to, from, next) => {
    if (!to.meta.middleware) {
        return next()
    }
    const middleware = to.meta.middleware;
    const context = {
        to,
        from,
        next,
        store
    }
    return middleware[0]({
        ...context
    });
});
