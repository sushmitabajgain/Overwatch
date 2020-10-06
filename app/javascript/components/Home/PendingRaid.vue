<template>
  <router-link style="text-decoration: none; color: inherit;" to="/PendingRaidProject">
    <v-card class="ma-3" color="orange lighten-5" justify="center">
      <v-row justify="center">
        <v-card-title justify="center">Pending Raid</v-card-title>
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
  </router-link>
</template>
<script>
import eventService from '../../eventService'
export default {
  data(){
    return{
      pending_raid: [],
      loading: true
    }
  },
  methods: {
    getWeeklyRaid(week){
      this.pending_raid= [],
        eventService.project.getWeeklyProject(week) 
        .then(res => {
          if(res.status == 200){
          var count =0;
          var index;
          for(index in res.data)
            if(res.data.length>0){
              if(res.data[index].pending_raid !== null){
                this.pending_raid.push(res.data[index].pending_raid);
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
          this.getWeeklyRaid(week)
        }
        return week;
      },
      value: function() {
        return this.pending_raid.length
      },
    }
}
</script>