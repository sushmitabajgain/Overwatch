<template>
  <v-row>
    <a href="#" class="home" @click="home()"><v-toolbar-title>Home</v-toolbar-title></a>
    <div class="ml-4">
      <router-link to= "/Resources" class="home"><v-toolbar-title>Resources</v-toolbar-title></router-link>
    </div>
  </v-row>
</template>

<script>
  export default {
    methods:{
      home(){
        this.$router.push('/')
      },
    }
  }
</script>

<style lang="scss" scoped>
  .text{
    font-size: 20px;
  }

  .links{
    color: #f50057 !important;
  }
  .home{
    color: white;
  }
</style>