<template>
    <v-app>
        <div class="n-btn">
            <v-btn color="light-green" elevation="10" @click="showModal=true">
                <slot name="button">new book</slot>
            </v-btn>
            <Modal v-if="showModal" @next="showNextModal=true,showModal=false"></Modal>
            <Modal2 v-if="showNextModal" @next="showNextModal=false">
                <template v-slot:header>Header2</template>
            </Modal2>
        </div>
    </v-app>
</template>

<script>
import Modal from "/app/javascript/common/modal"
import Modal2 from "/app/javascript/common/modal"

export default {
    data: function () {
    return {
      showModal: false,
      showNextModal: false
    }
    },
    components:{
        Modal,
        Modal2
    }

}
</script>

<style scoped>
.n-btn{
    position: absolute;
    top: 20px;
    right: 40px;
}
</style>

