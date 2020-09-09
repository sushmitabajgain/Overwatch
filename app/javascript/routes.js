import Vue from 'vue'
import VueRouter from 'vue-router'
import SignIn from './components/SignIn'
import SignUp from './components/SignUp'
import ForgetPassword from './components/ForgetPassword'
import MyProfile from './components/MyProfile'
import ChangePassword from './components/ChangePassword'
import Home from './components/Home'
import Resources from './components/Resources'

Vue.use(VueRouter)

const requireAuthenticated = (to, from, next) => {
  if(!window.$cookies.get('auth')){
    next({name:'root-path'});
  }
  else{
    next();
  }
};

export default new VueRouter({
  scrollBehavior(){
    return { x: 0, y: 0 };
  },
  routes: [
    {
      path: '/',
      name:'root-path',
      component: Home
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
      component: MyProfile,
      beforeEnter: requireAuthenticated
    },
    {
      path: '/ChangePassword',
      name: 'ChangePassword',
      component: ChangePassword,
      beforeEnter: requireAuthenticated
    },
    {
      path: '/Resources',
      name: 'Resources',
      component: Resources
    }
  ]
})