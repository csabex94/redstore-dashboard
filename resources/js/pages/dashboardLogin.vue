<template>
    <div class="login-page">
        <div class="login">
            <img src="\images\logo-white.png" alt="Logo">
            <h2>Login To Dashboard</h2>
            <form @submit="handleLogin">
                <div class="form-control">
                    <label for="email">Email Address</label>
                    <input id="email" type="text" v-model="form.email">
                </div>
                <div class="form-control">
                    <label for="password">Password</label>
                    <input id="password" type="password" v-model="form.password">
                </div>
                <button @submit="handleLogin" type="submit">Login</button>
            </form >
        </div>
    </div>
</template>

<script>
import { mapGetters } from 'vuex';

export default {
    data: () => {
        return {
            form: {
                email: "",
                password: ""
            }
        }
    },
    methods: {
        async handleLogin(event) {
            event.preventDefault();
            await this.$store.dispatch('loginUser', this.form);
        }
    },
    computed: {
        ...mapGetters({
            isLoggedIn: 'getCurrentUserIsLoggedIn',
            error: 'getCurrentUserError'
        })
    },
    watch: {
        isLoggedIn(newLogged, oldLogged) {
            if (newLogged) {
                this.$router.push('/');
            }
        },
        error(newError, oldError) {
            console.log({ error: newError });
        }
    }
}
</script>

<style scoped>
    .login-page {
        width: 100%;
        min-height: 100vh;
        background: radial-gradient(circle, rgba(255, 82, 59, 0.7) 0%, rgba(34,12,9,1) 100%);
        display: flex;
        align-items: center;
        justify-content: center;
    }
    .login {
        width: 350px;
        height: 450px;
        background: #000;
        display: flex;
        flex-direction: column;
        align-items: center;
        border-radius: 10px;
        padding: 0 25px;
    }
    .login > h2 {
        color: #fff;
    }
    .login > img {
        width: 200px;
        margin: 25px auto;
    }
    .login > .title {
        color: #fff;
        text-align: center;
    }
    .login > form {
        width: 100%;
        margin-top: 25px;
    }
    .form-control {
        width: 100%;
        margin: 15px 0;
    }
    .form-control > input {
        font-family: inherit;
        display: block;
        width: 100%;
        padding: 8px;
        font-weight: bold;
        font-size: 16px;
        border: none;
        transition: all .3s;
        margin-top: 15px;
    }
    .form-control > input:focus {
        outline: none;
        box-shadow: 0 0 8px 3px rgba(252, 120, 102, 0.707);
    }
    .form-control > label {
        color: #fff;
        font-family: inherit;
    }
    .login > form > button {
        width: 100%;
        padding: 8px;
        font-family: inherit;
        color: #fff;
        background: #ff523b;
        border: none;
        font-weight: bold;
        font-size: 16px;
        cursor: pointer;
    }
    .form-control:nth-child(2) {
        margin-bottom: 25px;
    }
</style>