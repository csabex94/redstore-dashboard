<template>
    <div class="dashboard-home">
        <h3>Welcome to RedStore's Dashboard</h3>
        <hr />
        <div v-if="dashboard_data" class="data">
            <div class="products">
                <span>Total products:<br /> {{ dashboard_data.total_products }}</span>
            </div>
            <div class="categories">
                <span>Total categories:<br /> {{ dashboard_data.total_categories }}</span>
            </div>
            <div class="admins">
                 <span>Total admins:<br /> {{ dashboard_data.total_admins }}</span>
            </div>
            <div class="orders">
                <span>Total orders:<br /> {{ dashboard_data.total_orders }}</span>
            </div>
            <div class="orders-value">
                 <span>Total orders value:<br /> ${{ dashboard_data.total_orders_value.toFixed(2) }}</span>
            </div>
        </div>
    </div>
</template>

<script>
import { mapGetters } from 'vuex';
    export default {
        computed: {
            ...mapGetters({
                dashboard_data: 'getDataFromStore'
            })
        },
        created: async function() {
            await this.$store.dispatch('getData');
        }
    }
</script>

<style scoped>
    .dashboard-home {
        width: 98%;
        min-height: 80%;
        background: #fff;
        border-radius: 5px;
        box-shadow: 1px 1px 8px rgba(0, 0, 0, .25);
        max-width: 1200px;
        margin: 30px auto 0;
        padding: 20px;
    }
    .dashboard-home > h3 {
        margin-bottom: 15px;
    }
    .dashboard-home > .data {
        display: grid;
        grid-template-columns: repeat(3, 1fr);
        grid-gap: 10px;
        margin-top: 50px;
    }
    .dashboard-home > .data > div {
        box-shadow: 1px 1px 8px rgba(0, 0, 0, .25);
        height: 200px;
        border-radius: 5px;
        display: flex;
        justify-content: center;
        align-items: center;
        flex-direction: column;
        text-align: center;
        font-size: 20px;
    }
</style>