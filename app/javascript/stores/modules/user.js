import eventService from '../../eventService'
import router from '../../routes'
import Vue from 'vue'
// import dialog from
 
const user = {
    namespaced: true,

    state: {
        user: null,
    },
    getters: {
        getUser: (state) => {
            return state.user
        },
    },
    mutations: {
        setUser: (state) => {
            state.user = user
        },
    },
    actions: {
        setUser: (context) => {
            context.commit('setUser')
        },

        signUp: ({commit} , userData) => {
            return new Promise((resolve,reject)=>{
                eventService.auth.userSignUp(userData)
                .then(res=>{
                    if(res.status == 201){    
                      {
                          router.push('/SignIn')      
                          Vue.toaster.info('Please login!')
                      }
                    }
                    else{
                        Vue.toaster.error('Something Went wrong please try again later!')
                    }

                })
                .catch((error)=>{
                    Vue.toaster.error(error || "Internal Server error!")
                    reject(error);
                })
            })
        }
    }
}

export default user
