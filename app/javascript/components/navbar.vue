<template>
  <v-app-bar class="pink accent-3"
                    dark
                    app
    >
      <a href="#" class="home" @click="home()"><v-toolbar-title>Home</v-toolbar-title></a>
      <div class=" pe-4 ma-4">
        <router-link to= "/Resources" class="home"><v-toolbar-title>Resources</v-toolbar-title></router-link>
      </div>
      <v-spacer></v-spacer>
        <SearchBar />
      <v-spacer></v-spacer>
    <div v-if="!isAuth">
      <router-link to="/SignIn">
        <v-btn rounded right class="ma-2" outlined="" dark>Sign in</v-btn>
      </router-link>
      <router-link to="/SignUp">
        <v-btn rounded right class="ma-2" outlined="" dark>Sign up</v-btn>
      </router-link>
    </div>
    <v-menu v-else>
    <template v-slot:activator="{ on, attrs }">
      <label
        color="primary"
        dark
        v-bind="attrs"
        v-on="on"
        class="text"
      >
        <v-avatar size="36">
          <img :src="image" alt="" class="rounded-circle profile_image">
        </v-avatar>
          Hi! {{username}}
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
import eventService from '../eventService'
import SearchBar from './SearchBar'
export default {
  components:{
    SearchBar
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
.mt-20{
  margin-top: 45px;
}
.links{
  color: #f50057 !important;
}
.home{
  color: white;
}
</style>