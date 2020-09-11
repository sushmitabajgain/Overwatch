<template>
  <v-app-bar class="pink accent-3"
                    dark
                    app
    >
      <HeaderTopLeft />
      <v-spacer></v-spacer>
        <SearchBar />
      <v-spacer></v-spacer>
      <Auth />
  </v-app-bar>
</template>

<script>
  import SearchBar from './Header/SearchBar'
  import Auth from './Header/Auth'
  import HeaderTopLeft from './Header/HeaderTopLeft'
  export default {
    components:{
      SearchBar,
      Auth,
      HeaderTopLeft
    },
  }
</script>
