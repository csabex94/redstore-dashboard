import Vuex from 'vuex';
import Vue from 'vue';

import { userModule } from './modules/user';
import { categoryModule } from './modules/category';
import { productModule } from './modules/product';

Vue.use(Vuex);

export const store = new Vuex.Store({
    modules: {
        user: userModule,
        category: categoryModule,
        product: productModule
    }
});
