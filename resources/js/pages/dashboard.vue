<template>
    <div class="dashboard-section">
        <div class="sidebar">
            <img src="\images\logo-white.png" alt="logo" class="logo">
            <ul>
                <li>
                    <router-link exact-active-class="active-link" to="/">
                        <font-awesome-icon  icon="home" />
                        Dashboard
                    </router-link>
                </li>
                <li>
                    <router-link active-class="active-link" to="/add_product">
                        <font-awesome-icon icon="plus-square" />
                        Add Product
                    </router-link>
                </li>
                <li>
                    <router-link active-class="active-link" to="/manage_products">
                        <font-awesome-icon icon="list-alt" />
                        Manage Products
                    </router-link>
                </li>
                <li>
                    <a active-class="active-link" href="/manage_other_products">
                        <font-awesome-icon icon="list-alt" />
                        Manage Products2
                    </a>
                </li>
                <li>
                    <router-link active-class="active-link" to="/categories">
                        <font-awesome-icon icon="sliders-h" />
                        Categories
                    </router-link>
                </li>
                <li>
                    <router-link active-class="active-link" to="/dashboard_admins">
                        <font-awesome-icon icon="users-cog" />
                        Admins
                    </router-link>
                </li>
            </ul>
        </div>
        <div class="navbar">
             <ul>
                <li class="loggedidUser">
                    <div class="avatar">
                        <font-awesome-icon icon="user-circle" />
                    </div>
                    <p class="username">{{ currentUser.name }}</p>
                </li>
                <li>
                    <font-awesome-icon icon="bell" />
                </li>
                <li>
                    <font-awesome-icon @click="logout" icon="sign-out-alt" />
                </li>
            </ul>
        </div>
        <div class="content">
            <router-view />
        </div>
    </div>
</template>

<script>
import { mapGetters } from 'vuex';
export default {    
    computed: {
        ...mapGetters({
            currentUser: 'getCurrentUserFromStore'
        })
    },
    created: async function() {
        await this.$store.dispatch('getCategories');
    },
    methods: {
        logout() {
            localStorage.removeItem('auth_token');
            window.location.href = '/dashboard_login'
        }
    }
}
</script>

<style scoped>
    .dashboard-section {
        width: 100%;
        min-height: 100vh;
        display: grid;
        grid-template-columns: 280px 1fr 1fr 1fr 1fr;
        grid-template-rows: 80px 1fr;
        grid-template-areas: "sidebar navigation navigation navigation navigation"
        "sidebar content-children content-children content-children content-children";
    }
    .sidebar {
        grid-area: sidebar;
        background: #000;
        display: flex;
        flex-direction: column;
        align-content: center;
        grid-column: 1 / 1;
        grid-row: 1 / -1;
    }
    .sidebar > .logo {
        width: 200px;
        margin: 15px auto;
    }
    .sidebar > ul > li > a {
        width: 70%;
        margin: 20px auto;
        text-decoration: none;
        color: #fff;
        display: flex;
        justify-content: flex-start;
        align-items: center;
        font-size: 18px;
    }
    .sidebar > ul > li > a:hover,
    .sidebar > ul > li > a.active-link {
        color: #ff523b;
    }
    .sidebar > ul > li > a > svg {
        margin-right: 20px;
        font-size: 20px;
    }
    .navbar {
        grid-area: navigation;
        background: #fff;
        grid-column: 2 / -1;
        grid-row: 1 / 1;
    }
    .navbar > ul {
        display: flex;
        list-style: none;
        height: 100%;
        align-items: center;
        justify-content: flex-end;
        margin-right: 25px;
    }
    .navbar > ul > li {
        margin-left: 20px;
        transition: all .3s;
        height: 100%;
        display: flex;
        align-items: center;
    }
    .navbar > ul > li > svg {
        font-size: 20px;
        color: #333;
        cursor: pointer;
    }
    .navbar > ul > li > svg:hover {
        color: #ff523b;
    }
    .navbar > ul > li > .avatar > svg:hover {
        color: #ff523b;
    }
    .navbar > ul > li > .avatar {
        width: 35px;
        height: 35px;
        border-radius: 999px;
        display: flex;
        align-items: center;
        justify-content: center;
    }
    .navbar > ul > li > .avatar > svg {
        font-size: 25px;
        color: #333;
        cursor: pointer;
    }
    .navbar > ul > li > .username {
        font-weight: bold;
        color: #333;
        font-size: 14px;
        margin-left: 10px;
    }
    .content {
        grid-area: content-children;
        background: #F0F2F5;
        grid-column: 2 / -1;
        grid-row: 2 / -1;
    }
</style>