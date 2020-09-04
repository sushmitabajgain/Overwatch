<template>
  <v-app>
    <v-main>
      <v-container class="fill-height pink accent-3" fluid>
        <v-row align="center" justify=center>
          <v-col cols="6" sm="4" md="5">
            <v-card elevation="12">
              <v-window>
                  <v-row>
                    <v-col cols="12" class="text-left ml-2">
                      <router-link to="/">
                        <v-btn rounded color="pink accent-3" dark >
                          Home
                        </v-btn>
                      </router-link>
                      <v-card-text class="mt-12">
                        <h1 class="text-center pink--text text--accent-3"> 
                          Change password of your account.
                        </h1>
                        <br>
                        <div class="mt-4"></div>
                        <v-form @submit.prevent="OnSubmit" ref="form">
                          <v-text-field name="Password"
                            id="password"
                            label="New Password"
                            color="pink accent-3"
                            prepend-icon="lock"
                            :append-icon="value ? 'visibility' : 'visibility_off'"
                            @click:append="() => (value = !value)"
                            :type="value ? 'password' : 'text'"
                            v-model="user.password"
                            :rules="passwordRules"
                            required
                          />
                          <div class="text-center mt-3">
                            <v-btn rounded color="pink accent-3" dark type="submit"> Change </v-btn>
                          </div>
                        </v-form>
                      </v-card-text>
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
    import eventService from '../eventService';

    export default {
      data(){
        return {
          value: String,
          user:{
            password: '',
          },
          passwordRules:[
            v => !!v || 'Password is required',
            v => /^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#\$%\^&\*])(?=.{8,})/.test(v) || 'Min. 8 characters with at least one capital letter, a number and a special character.',
          ],
          submitted: false,
        }
      },
      methods: {
        OnSubmit: function() {
          this.passwordRules=this.passwordRules
          let self = this
          setTimeout(function () {
            if (self.$refs.form.validate()){
              eventService.auth.changePassword(self.user)
              .then(res =>{
              if(res.status == 201){
                self.$toaster.success('Your password has been changed successfully!')
                self.user.password="";
              }
              else{
                self.$toaster.error('Your password has not been submitted!')
              }
            })
          }
        })
			}
    },
  }
</script>
