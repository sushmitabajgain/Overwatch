<template>
  <div id="app">
    <v-container>
      <v-layout row class="text-xs-center block">
        <slider />
        <v-flex xs4 class="grey lighten-4">
          <v-container style="position: relative;top: 13%;" class="text-xs-center">
            <v-card flat>
              <v-card-title primary-title>
                <h4>SIGN UP</h4>
              </v-card-title>
              <v-form @submit.prevent="OnSubmit">
                <v-text-field name="Username" label="Username" v-model="username"></v-text-field>
                <v-text-field name="Email" label="Email" v-model="email"></v-text-field>
                <v-text-field name="Password" label="Password" type="password" v-model="password"></v-text-field>
                <v-card-actions>
                  <v-btn primary large block type="submit" >sign up</v-btn>
                </v-card-actions>
              </v-form>
            </v-card>
          </v-container>
        </v-flex>
      </v-layout>
    </v-container>
  </div>
</template>
<script>
import slider from './slider'
export default {
  components:{
    slider
  },
  data(){
    return{
      username: '',
      email: '',
      password: ''
    }
  },
  methods:{
    OnSubmit: function(){
      this.$store.dispatch('user/signUp',{
        username: this.username,
        email: this.email,
        password: this.password,
      }, {root:true})
      .then(response => {
          this.signupSuccessful(response)
      })
      .catch( res => {
        this.loading = false
      })
    }
  }
}
</script>

<style lang="scss" scoped>
.block{
  height: 100vh;
  width: 250vh;
}
</style>