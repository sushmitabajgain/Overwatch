<template>
	<div>
		<navbar />
      <v-container class="fill-height" fluid>
        <v-row align="center" justify=center>
          <v-col cols="6" sm="4" md="6">
            <v-card elevation="12">
              <v-window>
                  <v-row>
                    <v-col cols="12">
                      <v-card-text class="mt-12">
												<v-row align="center" justify=center>
													<v-avatar size="150">
														<v-img :src="image" alt="" class="rounded-circle" />
													</v-avatar>
												</v-row>
												<div class="mt-4"></div>
                        <h3 class="text-center display-1 pink--text text--accent-3 text-decoration-underline" > 
                          Personal Information
                        </h3>
                        <div class="mt-4"></div>
												<v-col class="pink--text text--accent-3">
													<v-row justify=center>
														<h2> Role: </h2>
														<p> {{ role }} </p>
													</v-row>
													<v-row justify=center>
														<h2> Username: </h2>
														<p> {{ username }} </p>
													</v-row>
													<v-row justify=center>
														<h2> Email: </h2>
														<p> {{ email }} </p>
													</v-row>
												</v-col>
                      </v-card-text>
                    </v-col>
                  </v-row>
              </v-window>
            </v-card>
          </v-col>
        </v-row>
      </v-container>
	</div>
</template>

<script>
	import navbar from './navbar'
  import eventService from '../eventService'
  export default {
		components:{
			navbar
		},
    data(){
			return {
				username: "",
				email: "",
				image: "",
				role: ""
			}
    },
    
    created(){
			if(window.$cookies.get('auth')){
				this.isAuth = true
				this.username = window.$cookies.get('auth').username
				eventService.auth.getUser() 
					.then(res => {
						if(res.status == 200){
							this.email = res.data.email
							this.role = res.data.role.name
							this.image = res.data.image.url
						}  
				})
			}
    }    
  }
</script>
<style lang="scss" scoped>
.mt-25{
	margin-top: 25px;
}
p{
	size: 20px;
	font-size: 18px;
	padding: 0 5px;
}
</style>