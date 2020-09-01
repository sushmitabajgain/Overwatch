<template>
  <v-app>
    <v-main>
      <v-container class="fill-height" fluid>
        <v-row align="center" justify=center>
          <v-col cols="12" sm="8" md="8">
            <v-card elevation="12">
              <v-window>
                  <v-row>
                    <v-col cols="12" md="8" class="text-right">
                      <router-link to="/">
                        <v-btn rounded color="pink accent-3" dark>
                          Home
                        </v-btn>
                      </router-link>
                      <v-card-text class="mt-12">
                        <h1 class="text-center display-2 pink--text text--accent-3"> 
                          New user?
                        </h1>
                        <br>
                        <h3 class="text-center pink--text text--accent-3">
                          Please enter your sign up details.
                        </h3>
                        <div class="mt-4"></div>
                          <v-form @submit.prevent="OnSubmit" ref="form" >
                            <v-text-field 
                              name="Username" 
                              label="Username"
                              color="pink accent-3"
                              prepend-icon="account_circle"
                              v-model="username"
                              :rules="nameRules"
                              required>
                            </v-text-field>
                            <v-text-field 
                              name="Email" 
                              label="Email"
                              color="pink accent-3"
                              prepend-icon="email"
                              v-model="email"
                              :rules="emailRules"
                              required>
                            </v-text-field>
                            <v-text-field 
                              name="Password" 
                              label="Password" 
                              type="password"
                              prepend-icon="lock"
                              color="pink accent-3" 
                              v-model="password"
                              :rules="passwordRules"
                              required>
                            </v-text-field>
                            <div class="text-center mt-3">
                              <v-btn rounded color="pink accent-3" dark type="submit" @click="validate"> Sign up </v-btn>
                            </div>
                          </v-form>
                        <h3 class="text-center mt-3"> Forget your password? </h3>
                      </v-card-text>
                    </v-col>
                    <v-col cols="12" md="4" class="pink accent-3">
                      <v-card-text class="white--text" mt-12>
                        <h1 class="text-center" display-1>
                          Hello users!
                        </h1>
                        <h5 class="text-center">
                          Login into your personal account.
                        </h5>
                      </v-card-text>
                      <div class="text-center">
                        <router-link to="/SignIn">
                          <v-btn rounded outlined="" dark @click="step++">
                            Sign In
                          </v-btn>
                        </router-link>
                      </div>
                    </v-col>
                  </v-row>
              </v-window>
            </v-card>
          </v-col>
        </v-row>
      </v-container>
    </v-main>
  </v-app>
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
      nameRules: [
        v => !!v || 'Name is required',
        v => (v && v.length <= 10) || 'Name must be less than 10 characters',
      ],
      email: '',
      emailRules: [
        v => !!v || 'E-mail is required',
        v => /.+@.+\..+/.test(v) || 'E-mail must be valid',
      ],
      password: '',
      passwordRules:[
        v => !!v || 'Password is required',
        v => v.length >= 6 || 'Min 6 characters',
      ]
    }
  },
  methods:{
    validate () {
      this.$refs.form.validate()
    },
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