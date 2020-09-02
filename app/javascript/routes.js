import Vue from 'vue'
import VueRouter from 'vue-router'
import SignIn from './components/SignIn'
import SignUp from './components/SignUp'
import navbar from './components/navbar'
import ForgetPassword from './components/ForgetPassword'
import MyProfile from './components/MyProfile'

Vue.use(VueRouter)


export default new VueRouter({
  scrollBehavior(){
    return { x: 0, y: 0 };
  },
  routes: [
    {
      path: '/',
      name: 'navbar',
      component: navbar
    },
    { 
      path: '/SignIn',
      name:'SignIn',
      component: SignIn
    },
    { 
      path: '/SignUp',
      name:'SignUp',
      component: SignUp
    },
    { 
      path: '/ForgetPassword',
      name:'ForgetPassword',
      component: ForgetPassword
    },
    {
      path: '/MyProfile',
      name: 'MyProfile',
      component: MyProfile
    }
  ]
})