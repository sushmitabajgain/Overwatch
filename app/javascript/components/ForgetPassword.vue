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
                          Reset password of your account.
                        </h1>
                        <br>
                        <p class="text-center pink--text text--accent-3"> 
                          Enter the email address you used to signup,
                          and we'll send you instructions on how to reset password. 
                        </p>
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
                          <div class="text-center mt-3">
                            <v-btn rounded color="pink accent-3" dark type="submit" @click="validate"> Send </v-btn>
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
	export default {
    data() {
      return {
        email: '',
        emailRules: [
          v => !!v || 'E-mail is required',
          v => /.+@.+\..+/.test(v) || 'E-mail must be valid',
        ],
      }
    },

    methods: {
    //Email validation
      validate () {
        this.$refs.form.validate()
      },
    OnSubmit: function() {
      this.$store.dispatch('auth/userPassword', {
        user: {
        email: this.email }}, {root:true})
        .catch(error =>{
        this.$toaster.error("Sorry, Something went wrong. Try Again Later!")
        })
      }
    }
 	}
</script>


