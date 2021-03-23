<template>
  <v-card class="ma-3" color="orange lighten-5" justify="center">
    <v-row justify="center">
      <v-card-title>Benched Resources</v-card-title>
    </v-row>
    <v-input style="display:none"> {{currentWeek}}</v-input>
    <div class="text-center" style="height: 150px;">
      <v-progress-circular
        :rotate="360"
        :size="100"
        :width="20"
        :value="value"
        color="orange "
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
      benched: [],
      loading: true
    }
  },
  methods: {
    getWeeklyBenched(week){
      this.benched= [],
        eventService.project.getWeeklyProject(week) 
        .then(res => {
          if(res.status == 200){
          var count =0;
          var index;
          for(index in res.data)
            if(res.data.length>0){
              if (res.data[index].project == "Benched"){
                this.benched.push(res.data[index].no_of_resources);
                console.log(res.data[index].project == "Benched")
              }
            }
            this.loading = false;
          }
        })
      },
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
        return this.benched = 6
      },
    }
}
</script>