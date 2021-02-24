<template>
    <div class="delete-modal">
        <h3 class="title">Delete product</h3>
        <p class="text">Are you sure you want to delete this product?</p>
        <div class="buttons">
            <button @click="closeModal">Cancel</button>
            <button type="button" @click="deleteProduct" >Confirm</button>
        </div>
    </div>
</template>

<script>
import { mapGetters } from 'vuex';
export default {
    props: ['productId'],
    methods: {
        async deleteProduct() {
            await this.$store.dispatch('deleteProduct', this.productId);
            if (this.deleteSuccess) {
                this.$emit('closeModal', { refetch: true });
            }
        },
        closeModal(){
            this.$emit('closeModal', { refetch: false });
        }
    },
    computed: {
        ...mapGetters({
            deleteSuccess: 'getSuccessFromStore'
        })
    }
}
</script>

<style scoped>
    .delete-modal {
        width: 100%;
        height: 100%;
        display: flex;
        flex-direction: column;
        justify-content: space-between;
        padding: 20px 30px;
    }
    .delete-modal > .buttons {
        width: 100%;
        display: flex;
        justify-content: flex-end;
    }
    .delete-modal > .buttons > button:first-child {
        margin-right: 20px;
    }
    .delete-modal > .buttons > button:nth-child(2) {
        background: #ff523b;
        color: #fff;
    }
    .delete-modal > .buttons > button {
        border: none;
        padding: 8px 16px;
        font-family: inherit;
        font-weight: bold;
        cursor: pointer;
    }
</style>