const search={
    namespaced: true,
    state:{
        search :{}
    },

    mutations:{
        setLocalSearchStorage: (state, searchProjectData) => {
           localStorage.setItem('project',searchProjectData.project)
        },
    },
}

export default search
