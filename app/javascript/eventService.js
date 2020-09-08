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
    
    postResetPassword(userData) {
      return apiBase.post('/users/password',userData)
    },

    changePassword(userData){
      const id = (VueCookies.get('auth').user_id)
      return apiFeature.patch('/users/'+id, userData)
    },
  },
  
  role: {
    getRoles(){
      return apiFeature.get('/roles')
    },

    getRoleId(role_id){
      return apiFeature.get('/roles/'+role_id)
    },

    postRoles(role){
        return apiFeature.post('/roles', role)
    },

    deleteRole(role_id){
      return apiFeature.delete('/roles/'+role_id)
    }
  },

  project:{
    getProject(){
      return apiFeature.get('/projects')
    },

    getWorksheet(){
      return apiFeature.get('/worksheets')
    },

    getStatusCount(){
      return apiFeature.get('/status_count')
    },
  }
}