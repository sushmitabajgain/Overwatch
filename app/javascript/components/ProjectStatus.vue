<template>
  <v-card class="ma-3">
    <v-row justify="center" class="pa-3">
      <h2>Project Timeline (Week {{currentWeek}})</h2>
    </v-row>
    <div class="loading justify-space-between" v-if="loading">
      Loading...
      <v-progress-linear
            color="pink accent-3"
            indeterminate
            rounded
            height="6"
          ></v-progress-linear>
    </div>
    <div class="d-flex flex-no-wrap justify-space-between" v-else>
      <div class="ma-3 ml-10">
        <table id="projects">
          <tr>
            <th style="background-color: #76EE00;">On Track </th>
          </tr>
          <template v-if="on_track_projects.length>0">
            <router-link tag="tr" :to="{name:'Project', params:{id: project.id}}" 
							v-for="project in on_track_projects" :key="project" exact :style="{ cursor: 'pointer'}">              
                <td> {{project}}</td>
            </router-link>
          </template>
          <template v-else>
            <tr>
              <td class="project-none"> None </td>
            </tr>
          </template>
        </table>
      </div>
      <div>
        <apexchart type="pie" width="450" :options="chartOptions" :series="series"></apexchart>
      </div>
      <div class="ma-3 mr-10">
       <table id="projects">
          <tr>
            <th style="background-color: #d50000;">Due</th>
          </tr>
          <template v-if="due_projects.length>0">
            <router-link tag="tr" :to="{name:'Project', params:{id: project.id}}"
              v-for="project in due_projects" :key="project" exact :style="{ cursor: 'pointer'}">
              <td> {{project}}</td>
            </router-link>
          </template>
          <template v-else>
            <tr>
              <td class="project-none"> None </td>
            </tr>
          </template>
        </table>
         <table id="projects">
          <tr>
            <th style="background-color: #FFEA00;">Ahead Schedule</th>
          </tr>
          <template v-if="ahead_schedule.length>0">
            <router-link tag="tr" :to="{name:'Project', params:{id: project.id}}"
              v-for="project in ahead_schedule" :key="project" exact :style="{ cursor: 'pointer'}">
              <td> {{project}}</td>
            </router-link>
          </template>
          <template v-else>
            <tr>
              <td class="project-none"> None </td>
            </tr>
          </template>
        </table>
      </div>
    </div>
  </v-card>
</template>


<script>
  import eventService from '../eventService'
  export default {
    data() {
      return{
        loading: true,
        on_track_projects: [],
        ahead_schedule:[],
        due_projects:[],
        chartOptions: {
          chart: {
            width: 500,
            type: 'pie',
          },
          colors: ['#76EE00','#d50000','#FFEA00'],
          labels: [
                    ['On track'],
                    ['Due'],
                    ['Ahead Schedule']
                  ],
          responsive: [{
            breakpoint: 480,
            options: {
              chart: {
                width: 200
              },
              legend: {
                position: 'bottom'
              }
            }
          }],
        }
      }
    },        
    methods: {
      getWeekly(week){
        this.on_track_projects= [],
        this.ahead_schedule=[],
        this.due_projects=[],
        eventService.project.getWeeklyProject(week) 
        .then(res => {
          if(res.status == 200){
          var count =0;
          var index;
          for(index in res.data)
            if(res.data.length>0){
              if (res.data[index].project_timeline == "On track"){
                this.on_track_projects.push(res.data[index].project);
              }
              if (res.data[index].project_timeline == "Ahead Schedule"){
                this.ahead_schedule.push(res.data[index].project);
              }
              if (res.data[index].project_timeline == "Due"){
                this.due_projects.push(res.data[index].project);
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
          this.getWeekly(week)
        }
        return week;
      },
      series: function(){
        return  [
                  this.on_track_projects.length,
                  this.due_projects.length,
                  this.ahead_schedule.length,
                ]
      }
    },
  }
</script>

<style>
#projects {
  font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
  border-collapse: collapse;
  width: 200px;
}

#projects td, #projects th {
  border: 1px solid #ddd;
  background-color: #f2f2f2;
  padding: 5px;
  font-size: 12px;
}

#projects th {
  padding-top: 1px;
  padding-bottom: 1px;
  text-align: left;
  color: white;
}

#projects 
.project-none {
  background-color: #f2f2f2;
}

.apexcharts-legend-series{
  margin: 0 !important;
}
</style>