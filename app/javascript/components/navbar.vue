<template>
  <v-app>
    <v-app-bar class="pink accent-3"
                      dark
                      app
      >
        <v-toolbar-title>Welcome</v-toolbar-title>
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
        <v-btn
          color="primary"
          dark
          v-bind="attrs"
          v-on="on"
        >
          Hi! {{username}}
        </v-btn>
      </template>

      <v-list>
        <v-list-item>
          <a href="#" @click="logout()"> Logout</a>
        </v-list-item>
      </v-list>
    </v-menu>
    </v-app-bar>
  </v-app>
</template>

<script>
import eventService from '../eventService'
export default {
  data(){
    return {
      isAuth: false,
      user_id: '',
      username: ''
    }
  },
  created(){
    if(window.$cookies.get('auth')){
      this.isAuth = true
      this.username = window.$cookies.get('auth').username
      this.user_id = window.$cookies.get('auth').user_id
    }
  },
  methods:{
    logout(){
      const logoutStatus = this.$store.commit('auth/clearToken')
    }
  }
}
</script>