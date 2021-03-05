<template>
    <div>
        <Header class="header" />
        <MainContent class="main">
            <template v-slot:list>
                <SectionList v-for="section in sections" :key="section.id" :section-item="section" />
            </template>
        </MainContent>
    </div>
    
</template>

<script>
import Header from 'common/header'
import MainContent from 'common/main-content'
import SectionList from 'section/section-list'
import axios from 'axios'

export default {
    data: function() {
            return {
                sections: [],
            }           
        },
    components: {
        Header,
        MainContent,
        SectionList
    },
    computed: {
        id: function() {
            return this.$route.params.id;            
        }
    },
    mounted(){
        axios
            .get(`/api/v1/section/${this.id}`, {params: {id: this.id}})
            .then(response => (this.sections = response.data))
    }
    }
</script>

<style scoped>
.main{
  width:100%;
  background-color: #a7d7c5;
}
.header{
   background-color: #757575;
}
</style>