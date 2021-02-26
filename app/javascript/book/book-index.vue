<template>
  <div>
    <Header class="header"></Header>
    <Main class="main"></Main>
  </div>
</template>

<script>
import Header from '../common/header' 
import Main from "book/main-content.vue"

export default {
  components: {
    Header,
    Main
  }
}
</script>

<style  scoped>
.main{
  width:100%;
  background-color: #a7d7c5;
}
.header{
   background-color: #757575;
}
</style>
