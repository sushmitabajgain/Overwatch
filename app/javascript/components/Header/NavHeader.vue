<template>
<v-app-bar absolute color="white">
    <v-spacer></v-spacer>
    <SearchBar />
  <v-spacer></v-spacer>
    <Week />
    <v-spacer></v-spacer>
  <v-menu v-if="isAuth">
    <template v-slot:activator="{ on, attrs }">
      <label
        color="primary"
        dark
        v-bind="attrs"
        v-on="on"
        class="text"
      >
      <v-row>
        <p class="pa-2"> Hi! {{username}} </p>
        <v-avatar tile size="40" class="mt-2">
          <img :src="image" alt="" style="border-radius:10px">
        </v-avatar>
          <span class="material-icons ma-2">
            arrow_drop_down
          </span>
      </v-row>
      </label>
    </template>

    <v-list class="mt-20">
      <v-list-item>
        <router-link to="/MyProfile" class="links" > Profile</router-link>
      </v-list-item>
      <v-list-item>
        <a class="links" href="#" @click="logout()"> Logout</a>
      </v-list-item>
    </v-list>
  </v-menu>
</v-app-bar>
</template>

<script>

  import eventService from '../../eventService'
  import SearchBar from './SearchBar'
  import Week from '../Week'
  export default {
    components:{
      SearchBar,
      Week
    },
    data(){
      return {
        isAuth: false,
        user_id: '',
        username: '',
        image: '',
      }
    },
    created(){
      if(window.$cookies.get('auth')){
        this.isAuth = true
        this.username = window.$cookies.get('auth').username
        this.user_id = window.$cookies.get('auth').user_id
        eventService.auth.getUser() 
        .then(res => {
          if(res.status == 200){
            this.image = res.data.image.url
          }
          })
      }
    },
    methods:{
      logout(){
        const logoutStatus = this.$store.commit('auth/clearToken')
      },
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

  .mt-20{
	  margin-top: 45px;
	}

  // .menu{
  //   top: 0px !important;
  // }

</style>