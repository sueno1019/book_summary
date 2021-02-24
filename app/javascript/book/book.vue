<template>
  <Header></Header>
</template>

<script>
import axios from 'axios';
import Header from '../common/header' 

export default {
  data: function () {
    return {
      employees: []
    }
  },
  mounted () {
    axios
      .get('/api/v1/book.json')
      .then(response => (this.employees = response.data))
  },
  components: {
    Header
  }
}
</script>

<style scoped>

</style>