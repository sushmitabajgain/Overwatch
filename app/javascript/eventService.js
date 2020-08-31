import axios from 'axios'
import Vue from 'vue'
import VueCookies from 'vue-cookies'
Vue.use(VueCookies)

const apiBase = axios.create({
  baseURL: '',
})

const apiFeature = axios.create({
  baseURL: 'api/v1',
})

var customInterceptor = apiFeature.interceptors.request.use(function (config) {
  let token=''
  if(VueCookies.get('auth')){
    token = VueCookies.get('auth').token;
  }  
  config.headers.Authorization =  token;
  return config;
});

export default {
  auth: {
    userLogin(payload) {
      return apiBase.post('login', payload)
    },

    userSignUp(userData) {
      return apiFeature.post('/users',userData)
    },
    getUser(){
      const id = (VueCookies.get('auth').user_id)
      const url = '/users/'+id
      return apiFeature.get(url)
    },

    getAllUser(){
      return apiFeature.get('/users')
    },
  }
}