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
                      <v-card-text class="mt-0">
                        <h1 class="text-center pink--text text--accent-3">
                          Sign Up
                        </h1>
                        <div class="mt-4"></div>
                          <v-form @submit.prevent="OnSubmit" ref="form" >
                            <v-row align="center" justify=center>
                              <div class="upload-img-wrapper">
                                <input type="file"
                                  name="image" @change="previewImage" accept="image/*" ref='image'
                                  id="image"
                                >
                                <span class="file">
                                    <div class="image-preview" v-if="imageData.length > 0">
                                    	<img class="preview" :src="imageData">
                                	</div>
                                </span>
                            </div>
                            </v-row>
                            <v-select
                              v-model="select"
                              :items="options" item-value="id" item-text="name"
                              :rules="[v => !!v || 'Role is required']"
                              label="Choose role"
                              color="pink accent-3"
                              prepend-icon="admin_panel_settings"
                              required
                            >
                            </v-select>
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
                          Login into your personal account.
                        </h5>
                      </v-card-text>
                      <div class="text-center">
                        <router-link to="/SignIn">
                          <v-btn rounded outlined="" dark>
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
import eventService from "../eventService"
export default {
  data(){
    return{
      user: {
      },
      imageData: '',
      username: '',
      select: '',
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
      ],
      options: [],
    }
  },
  created(){
    eventService.role.getRoles()
    .then(res => {
      if(res.status == 200){
        this.options = res.data
      }
    })
  },
  methods:{
    validate () {
      this.$refs.form.validate()
    },
      OnUpload(field) {
        document.getElementById(field).click()
      },
      previewImage: function(event) {
        var input = event.target;
          if (input.files && input.files[0]) {
          this.user.image = input.files[0]
          var reader = new FileReader();
          reader.onload = (e) => {
            this.imageData = e.target.result;
          }
          reader.readAsDataURL(input.files[0]);
        }
      },

    OnSubmit: function(){
        this.user.username = this.username,
        this.user.email = this.email,
        this.user.password = this.password,
        this.user.role_id = this.select,
      this.$store.dispatch('user/signUp', this.user)
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
.links{
  color: #f50057 !important;
}
.upload-img-wrapper,
.upload-wrapper {
  display: inline-block;
  overflow: hidden;
  position: relative;

  .btn {
    display: none;
    }

  .file {
    display: block;
    background: url(../images/input-upload.svg) no-repeat;
    height: 126px;
    width: 125px;
    }

  input[type=file] {
    left: 0;
    height: 177px;
    opacity: 0;
    position: absolute;
    text-indent: -9999px;
    top: 0;
    width: 125px;
  }

  &.upload-wrapper {
    width: 456px;

    input[type=file] {
      height: 44px;
      width: 456px;
    }
  }
}

img.preview {
  max-width: 100%;
  max-height: 100%;
}

</style>
