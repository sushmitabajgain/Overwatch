import eventService from '../../eventService'
import Vue from 'vue'
import VueCookies from 'vue-cookies'
import router from '../../routes'

Vue.use(VueCookies)
const auth ={
  namespaced: true,
  state:{
    auth:{
      token: '',
      exp: '',
      username: '',
      userId: ''
    }   
  },
  getters:{
    getToken: state => {    
    }
  },
  mutations:{
    clearToken: (state,payload) =>{
      window.$cookies.remove('auth')
      document.location.reload(true)
      router.push('/')
    }

  },
  actions:{
    authToken: ({commit},formData) => {
      commit('setToken',formData)
    },

    setToken: (state,loginData) => {
      return new Promise((resolve,reject)=>{
        eventService.auth.userLogin(loginData)
        .then(res => {
          if(res.status == 200){
            window.$cookies.set('auth', res.data)
            eventService.auth.getUser(res.data.user_id)
            .then(res => {
              if(res.status== 200){
                router.push('/')
              }
              else{
                Vue.toaster.error('Something Went wrong please try again later!')
              }
            })
          }
        })
        .catch(error => {
          reject(error.response.data.error)
        })
      })
    },

    userPassword: (commit, userData) => {
      return new Promise((resolve,reject)=>{
        eventService.auth.postResetPassword(userData)
        .then(res => {
          if(res.status == 201){
            Vue.dialog.alert('Confirmation Email is sent. Please verify!')
            router.push('/SignIn')                      
          }
        })
        .catch(error => {
          reject(error.response.data.error)
        })
      })
    },
  }
}

export default auth