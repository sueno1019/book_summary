<template>
  <div>
    <Header></Header>
    <Main />
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

<style scoped>

</style>