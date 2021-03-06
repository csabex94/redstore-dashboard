require('./bootstrap');

import Vue from 'vue';
import VueRouter from 'vue-router';
import VModal from 'vue-js-modal';

import { store } from './store/store';
import { router } from './routes';

import { library } from '@fortawesome/fontawesome-svg-core';
import { faHome, faPlusSquare, faListAlt, faSlidersH, faUsers, 
    faUserCircle, faCopyright, faUsersCog, faCogs, faSignOutAlt, faBell, faCamera,
    faArrowLeft, faArrowRight, faPenSquare, faTrash, 
} from '@fortawesome/free-solid-svg-icons';
import { FontAwesomeIcon } from '@fortawesome/vue-fontawesome';


import App from './components/app';

library.add(faHome, faPlusSquare, faListAlt, faSlidersH, 
    faUsers, faUserCircle, faCopyright, faUsersCog, faCogs, 
    faSignOutAlt, faBell, faCamera, faArrowLeft, faArrowRight,
    faPenSquare, faTrash
);

Vue.component('font-awesome-icon', FontAwesomeIcon);
Vue.use(require('vue-moment'));

Vue.use(VueRouter);
Vue.use(VModal);

Vue.component("app", App);

const app = new Vue({
    el: '#app',
    component: {
        App
    },
    router: router,
    store: store
});
