<template>
  <div>
    <NavHeader />
    <Dashboard />
    <v-container class="blue lighten-5 fill-height" fluid>
      <v-input style="display:none"> {{currentWeek}}</v-input>
        <v-row align="center" justify=center>
          <v-col cols="6" sm="4" md="4">
            <v-card>
              <v-window class="">
                  <v-row>
                    <v-col cols="12">
                      <v-row align="center" justify=center>
                        <v-card-title > List Of Pending Raid Project</v-card-title>
                      </v-row>
                      <v-card-text>
                        <v-col class="text--accent-3">
                          <v-row v-for="project in pending_raid" :key="project">
                            <router-link :to="{ name: 'Project', params: { id: project.id } }">
                              <p> {{ project }} </p>
                            </router-link>
                          </v-row>
                        </v-col>
                      </v-card-text>
                    </v-col>
                  </v-row>
              </v-window>
            </v-card>
          </v-col>
        </v-row>
    </v-container>
  </div>
</template>
<script>
import eventService from '../../eventService'
import NavHeader from '../Header/NavHeader'
import Dashboard from '../Dashboard'
export default {
  components:{
    NavHeader,
    Dashboard
  },
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
                this.pending_raid.push(res.data[index].project);
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
      }
    }
}
</script>

<style lang="scss" scoped>
.fill-height{
  height: 100vh;
}
p{
  padding: 2px;
}
</style>