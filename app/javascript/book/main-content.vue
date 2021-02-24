<template>
    <div>
        <ul>
          <BookList v-for="book in books" :key="book.id" :book-item="book"></BookList>            
        </ul>
    </div>
</template>

<script>
import axios from 'axios';
import BookList from 'book/book-lists.vue'

export default {
  data: function () {
    return {
      books: []
    }
  },
  components: {
    BookList
  },
  mounted () {
    axios
      .get('/api/v1/book.json')
      .then(response => (this.books = response.data))
  },
}
</script>