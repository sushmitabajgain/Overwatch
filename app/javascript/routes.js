import Vue from 'vue'
import VueRouter from 'vue-router'
import SignIn from './components/SignIn'
import navbar from './components/navbar'

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
  ]
})