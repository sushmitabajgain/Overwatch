const week={
	namespaced: true,
	state: {
		week :{},
	},
  mutations:{
    saveWeek: (state, week) => {
        localStorage.setItem('week',week)
    },
  },
}

export default week;