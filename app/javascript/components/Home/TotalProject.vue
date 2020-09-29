<template>
  <v-card class="ma-3" color="pink lighten-5" justify="center">
    <v-card-title>Total Project</v-card-title>
    <v-input style="display:none"> {{currentWeek}}</v-input>
    <div class="text-center" style="height: 150px;">
      <v-progress-circular
        :rotate="360"
        :size="100"
        :width="20"
        :value="value"
        color="pink"
      >
        {{ value }}
      </v-progress-circular>
    </div>
  </v-card>
</template>
<script>
  import eventService from '../../eventService'
  export default {
    data(){
      return{
        project: [],
        loading: true
      }
    },
    methods: {
      getWeeklyBenched(week){
        this.project= [],
        eventService.project.getWeeklyProject(week) 
        .then(res => {
          if(res.status == 200){
          var count =0;
          var index;
          for(index in res.data)
            if(res.data.length>0){
              if (res.data[index].project !== "Benched"){
                this.project.push(res.data[index].project);
              }
            }
            this.loading = false;
          }
        })
      }
    },
    computed: {
      currentWeek(){
        let week = this.$store.state.week.week;
        if (week){
          this.getWeeklyBenched(week)
        }
        return week;
      },
      value: function() {
        return this.project.length
      },
    }
}
</script>