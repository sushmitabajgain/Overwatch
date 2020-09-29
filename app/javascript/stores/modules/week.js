const week={
	namespaced: true,
	state: {
		week : "",
	},
  mutations:{
    saveWeek: (state, week) => {
      state.week = week;
    },
  },
}

export default week;