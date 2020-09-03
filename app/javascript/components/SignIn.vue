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
                          Sign in
                        </h1>
                        <div class="mt-4"></div>
                        <v-form @submit.prevent="OnSubmit" ref="form">
                          <v-text-field 
                            name="Email" 
                            label="Email"
                            prepend-icon="email"
                            type="text"
                            color="pink accent-3" 
                            v-model="email"
                            :rules="emailRules"
                            required
                          />
                          <v-text-field name="Password"
                            id="password"
                            label="Password" 
                            type="password"
                            color="pink accent-3"
                            prepend-icon="lock"
                            v-model="password"
                            :rules="passwordRules"
                            required
                          />
                          <div class="text-center mt-3">
                            <v-btn rounded color="pink accent-3" dark type="submit"> Sign in </v-btn>
                          </div>
                        </v-form>
                        <router-link to="/Forgetpassword" class="links">
                          <h3 class="text-center pink--text text--accent-3 mt-3">
                            Forget your password?
                          </h3>
                        </router-link>
                      </v-card-text>
                    </v-col>
                    <v-col cols="12" md="4" class="pink accent-3">
                      <v-card-text class="white--text" mt-12>
                        <h1 class="text-center" display-1>
                          Hello users!
                        </h1>
                        <h5 class="text-center">
                          New here?
                          Join us by signing up.
                        </h5>
                      </v-card-text>
                      <div class="text-center">
                        <router-link to="/SignUp">
                          <v-btn rounded outlined="" dark>
                            Sign up
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
  export default {
    data() {
      return {
        validate: false,
        email: '',
        password: '',
        emailRules: [],
        passwordRules:[]
      }
    },
    
    watch: {
      'email' (val) {
        this.emailRules = []
      },
      'password' (val){
        this.passwordRules = []
      }
    },

    methods: {
        OnSubmit() {
          const formData = {
            email: this.email,
            password: this.password,
          }
          this.emailRules= [
            v => !!v || 'E-mail is required',
            v => /.+@.+\..+/.test(v) || 'E-mail must be valid',
          ],
          this.passwordRules=[
            v => !!v || 'Password is required',
            v => v.length >= 6 || 'Min 6 characters',
          ]
          let self = this
          setTimeout(function () {
            if (self.$refs.form.validate()){
              self.$store.dispatch('auth/setToken',formData)
              .catch(error  => {
                self.$toaster.error(error)
              })
            }
          })
        }
    }
  }
</script>
<style lang="scss" scoped>
.links{
  color: #f50057 !important;
}
</style>