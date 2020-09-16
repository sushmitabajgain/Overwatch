import Vue from 'vue'
import Vuex from 'vuex'
import user from './modules/user'
import auth from './modules/auth'
import search from './modules/search'
import week from './modules/week'
import VueCookies from 'vue-cookies'

Vue.use(VueCookies)
Vue.use(Vuex)

export default new Vuex.Store({
    modules: {
        user: user,
        auth,
        search,
        week
    },
})
