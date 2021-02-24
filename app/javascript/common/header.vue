<template>
  <div class="header">
    <div class="logo">
      logo
    </div>
    <div>
      <Button>
        <template v-slot:button></template>
      </Button>
    </div>
  </div>
</template>
    
<script>
import Button from 'common/button.vue' 

export default {
    components: {
    Button
  }
}
</script>

<style  scoped>
.logo{

  position: absolute;
  left: 40px;
  top: 20px;
}
.header{
  width: 100%;
  height: 80px;
  border-style: solid;  
  border-color: limegreen;
}


</style>
