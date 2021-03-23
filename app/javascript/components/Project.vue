<template>
  <div>
  <NavHeader />
  <Dashboard />
  <v-container class="blue lighten-5 fill-height" fluid>
      <v-row align="center" justify=center>
        <v-col cols="6" sm="4" md="6">
          <v-card>
            <v-window class="">
                <v-row>
                  <v-col cols="12">
                    <v-card-text>
                      <v-col class="pink--text text--accent-3">
                        <v-row>
                          <h3> Project: </h3>
                          <p> {{ project.project }} </p>
                        </v-row>
                        <v-row>
                          <h3> Project Health: </h3>
                          <p> {{ project.project_health }} </p>
                        </v-row>
                        <v-row>
                          <h3> Project Timeline: </h3>
                          <p> {{ project.project_timeline }} </p>
                        </v-row>
                        <v-row>
                          <h3> Project Workload: </h3>
                          <p> {{ project.workload }} </p>
                        </v-row>
                        <v-row>
                          <h3> Project Milestone: </h3>
                          <p> {{ project.project_milestone }} </p>
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
  import NavHeader from './Header/NavHeader'
  import Dashboard from './Dashboard'
  import eventService from '../eventService'
  export default {
    components: {
      NavHeader,
      Dashboard
    },
    data(){
      return{
        project: ""
      }
    },

    created(){
      this.project = localStorage.getItem('project')
      const searchData = {
        project: this.project,
      }
      eventService.searchProject.getSearchList(searchData)
      .then(res => {
        if(res.status == 200){
          this.project = res.data[0]
        }  
      })
    },
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