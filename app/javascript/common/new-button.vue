<template>
    <v-app>
        <div class="n-btn">
            <v-btn color="light-green">
                <slot name="button">new book</slot>
            </v-btn>
        </div>
    </v-app>
</template>

<style scoped>
.n-btn{
    position: absolute;
    top: 20px;
    right: 40px;
}
</style>

