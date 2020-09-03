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
                let formData = new FormData();
                formData.append('username', userData.username)
                formData.append('email', userData.email)
                formData.append('role_id', userData.role_id)
                formData.append('password', userData.password)
                formData.append('image', userData.image)

                return new Promise((resolve,reject)=>{
                eventService.auth.userSignUp(formData)
                .then(res=>{
                    if(res.status == 201){    
                      {
                          router.push('/SignIn')      
                          Vue.toaster.info('Confirmation Email is sent. Please verify!')
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
