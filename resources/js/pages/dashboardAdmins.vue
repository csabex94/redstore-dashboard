<template>
    <div class="dashboard-admins">
        <h3>Admins</h3>
        <hr />
        <div class="head">
            <span>Name</span>
            <span>Email</span>
            <span>Registered</span>
        </div>
        <div class="content">
            <div class="admin" v-for="admin in admins" :key="admin.id" >
                <span>{{ admin.name }}</span>
                <span>{{ admin.email }}</span>
                <span>{{ admin.created_at | moment("DD/MM/YYYY") }}</span>
            </div>
        </div>
    </div>
</template>

<script>
import { mapGetters } from 'vuex';
    export default {
        created: async function() {
            await this.$store.dispatch('getAdmins');
        },
        computed: {
            ...mapGetters({
                admins: 'getAdminsFromStore'
            })
        }
    }
</script>

<style scoped>
    .dashboard-admins {
         width: 98%;
        min-height: 80%;
        background: #fff;
        border-radius: 5px;
        box-shadow: 1px 1px 8px rgba(0, 0, 0, .25);
        max-width: 1200px;
        margin: 30px auto 0;
        padding: 20px;
    }
    .dashboard-admins > h3 {
        margin-bottom: 15px;
    }
    .head {
        margin-top: 25px;
        display: grid;
        grid-template-columns: repeat(6, 1fr);
        border-bottom: 1px solid #333;
    }
    .admin > span:first-child {
        margin-right: 50px;
    }
    .admin > span:nth-child(2) {
        margin-right: 80px;
    }
    
</style>