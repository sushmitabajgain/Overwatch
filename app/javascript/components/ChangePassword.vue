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
                        <p class="text-center pink--text text--accent-3"> 
                          Enter the valid password.
                        </p>
                        <div class="mt-4"></div>
                        <v-form @submit.prevent="OnSubmit" ref="form">
                          <v-text-field name="Password"
                            id="password"
                            label="New Password" 
                            type="password"
                            color="pink accent-3"
                            prepend-icon="lock"
                            v-model="user.password"
                            :rules="passwordRules"
                            required
                          />
                          <div class="text-center mt-3">
                            <v-btn rounded color="pink accent-3" dark type="submit" @click="validate"> Change </v-btn>
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
          user:{
            password: '',
          },
          passwordRules:[
            v => !!v || 'Password is required',
            v => v.length >= 6 || 'Min 6 characters',
          ],
          submitted: false,
        }
      },
      methods: {
        validate () {
          this.$refs.form.validate()
        },
        OnSubmit: function() {
          eventService.auth.changePassword(this.user)
          .then(res =>{
          if(res.status == 201){
            this.$toaster.success('Your password has been changed successfully!')
            this.user.password="";
          }
          else{
            this.$toaster.error('Your password has not been submitted!')
          }
        })
			}
    },
  }
</script>
