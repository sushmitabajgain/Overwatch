import Vue from 'vue'
import Vuetify from 'vuetify'
import 'vuetify/dist/vuetify.min.css'
import App from '../app.vue'
import router from '../routes'
import axios from 'axios'

axios.defaults.baseURL = 'http://localhost:3000'
Vue.config.productionTip = false

Vue.use(Vuetify)
document.addEventListener('DOMContentLoaded', () => {
  const el = document.body.appendChild(document.createElement('hello'))
  const app = new Vue({
    el,
    router,
    vuetify: new Vuetify(),
    render: h => h(App), // eslint-disable-line arrow-parens
  })

  console.log(app)
})