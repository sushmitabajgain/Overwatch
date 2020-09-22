<template>
  <div>
    <v-container class="fill-height" fluid>
      <v-row align="center" justify=center>
        <v-col cols="6" sm="4" md="6">
          <v-card elevation="12">
            <v-window class="mt-8">
                <v-row>
                  <v-col cols="12">
                    <v-card-text>
                      <v-col class="pink--text text--accent-3">
                        <v-row>
                          <h3> Project: </h3>
                          <p> {{ project.project }} </p>
                        </v-row>
                        <v-row>
                          <h3> Status: </h3>
                          <p> {{ project.status }} </p>
                        </v-row>
                        <v-row>
                          <h3> Start Date: </h3>
                          <p> {{ project.start_date }} </p>
                        </v-row>
                        <v-row>
                          <h3> End Date: </h3>
                          <p> {{ project.end_date }} </p>
                        </v-row>
                        <v-row>
                          <h3> Notes: </h3>
                          <p> {{ project.notes }} </p>
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
  import Auth from './Header/Auth'
  import HeaderTopLeft from './Header/HeaderTopLeft'
  import eventService from '../eventService'
  export default {
    components: {
      Auth,
      HeaderTopLeft
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