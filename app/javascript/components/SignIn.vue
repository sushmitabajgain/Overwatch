<template>
  <v-app>
    <v-main>
      <v-container class="fill-height" fluid>
        <v-row align="center" justify=center>
          <v-col cols="12" sm="8" md="8">
            <v-card elevation="12">
              <v-window>
                <v-window-item :value="1">
                  <v-row>
                    <v-col cols="12" md="8" class="text-right">
                      <router-link to="/">
                        <v-btn rounded color="teal accent-3" dark>
                          Home
                        </v-btn>
                      </router-link>
                      <v-card-text class="mt-12">
                        <h1 class="text-center display-2 teal--text text--accent-3"> 
                          Sign in
                        </h1>
                        <div class="mt-4"></div>
                        <v-form @submit.prevent="OnSubmit">
                          <v-text-field 
                            name="Email" 
                            label="Email"
                            prepend-icon="email"
                            type="text"
                            color="teal accent-3" 
                            v-model="email"
                          />
                          <v-text-field name="Password"
                            id="password"
                            label="Password" 
                            type="password"
                            color="teal accent-3"
                            prepend-icon="lock"
                            v-model="password"
                          />
                          <div class="text-center mt-3">
                            <v-btn rounded color="teal accent-3" dark type="submit"> Sign in </v-btn>
                          </div>
                        </v-form>
                        <h3 class="text-center mt-3"> Forget your password? </h3>
                      </v-card-text>
                    </v-col>
                    <v-col cols="12" md="4" class="teal accent-3">
                      <v-card-text class="white--text" mt-12>
                        <h1 class="text-center" display-1>
                          Hello users!
                        </h1>
                        <h5 class="text-center">
                          Enter your sign in credentials to view projects details.
                        </h5>
                      </v-card-text>
                      <div class="text-center">
                        <router-link to="/SignUp">
                          <v-btn rounded outlined="" dark @click="step++">
                            Sign up
                          </v-btn>
                        </router-link>
                      </div>
                    </v-col>
                  </v-row>
                </v-window-item>
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
    data() {
      return {
        email: '',
        password: '',
        submitted: false
      }
    },
    methods: {
        OnSubmit: function() {
          // Form completion validation
          this.submitted = true;
              const formData = {
                  email: this.email,
                  password: this.password,
              }
              this.$store.dispatch('auth/setToken',formData)
              .catch((error)  => {
                  this.$toaster.error(error)
              })
        }
    }
  }
</script>
