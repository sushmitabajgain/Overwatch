<template>
  <v-card class="ma-3">
    <v-row justify="center" class="pa-3">
      <h2>Project Status (Week {{currentWeek}})</h2>
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
            <th style="background-color: #29B6F6;">On Track </th>
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
        <table id="projects">
          <tr>
            <th style="background-color: #d50000;">Out of Deadline</th>
          </tr>
          <template v-if="deadline_projects.length>0">
            <router-link tag="tr" :to="{name:'Project', params:{id: project.id}}"
              v-for="project in deadline_projects" :key="project" exact :style="{ cursor: 'pointer'}">
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
        <apexchart type="pie" width="550" :options="chartOptions" :series="series"></apexchart>
      </div>
      <div class="ma-3 mr-10">
        <table id="projects">
          <tr>
            <th style="background-color: #FFEA00;">Project on Halt</th>
          </tr>
          <template v-if="halt_projects.length>0">
            <router-link tag="tr" :to="{name:'Project', params:{id: project.id}}"
              v-for="project in halt_projects" :key="project" exact :style="{ cursor: 'pointer'}">
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
            <th style="background-color: #64DD17;">Completed Projects</th>
          </tr>
          <template v-if="completed_projects.length>0">
            <router-link tag="tr" :to="{name:'Project', params:{id: project.id}}"
              v-for="project in completed_projects" :key="project" exact :style="{ cursor: 'pointer'}">
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
            <th style="background-color: #D500F9;">Need to Discuss/Back on Track</th>
          </tr>
          <template v-if="discuss_projects.length>0">
            <router-link tag="tr" :to="{name:'Project', params:{id: project.id}}"
              v-for="project in discuss_projects" :key="project" exact :style="{ cursor: 'pointer'}">
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
        currentWeek: '',
        loading: true,
        on_track_projects: [],
        discuss_projects:[],
        halt_projects:[],
        deadline_projects:[],
        completed_projects:[],
        chartOptions: {
          chart: {
            width: 500,
            type: 'pie',
          },
          colors: ['#29B6F6','#D500F9', '#FFEA00', '#d50000', '#64DD17'],
          labels: [
                    ['On Track'],
                    ['Need to Discuss/Back on Track'],
                    ['Project on Halt'],
                    ['Out of Deadline'], 
                    ['Completed Project']
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
    created(){
      setTimeout(() => {
        this.currentWeek = localStorage.getItem('week');
        eventService.project.getWeeklyProject(this.currentWeek) 
        .then(res => {
          if(res.status == 200){
          var count =0;
          var index;
          for(index in res.data)
            if(res.data.length>0){
              if (res.data[index].status == "On Track"){
                this.on_track_projects.push(res.data[index].project);
              }
              if (res.data[index].status == "Need to Discuss/Back on Track"){
                this.discuss_projects.push(res.data[index].project);
              }
              if (res.data[index].status == "Project on Halt"){
                this.halt_projects.push(res.data[index].project);
              }
              if (res.data[index].status == "Out of Deadline"){
                this.deadline_projects.push(res.data[index].project);
              }
              if (res.data[index].status == "Completed Project"){
                this.completed_projects.push(res.data[index].project);
              }
            }
            this.loading = false;
          }
        })
      }, 2000);
    },
    computed: {
      series: function(){
        return  [
                  this.on_track_projects.length,
                  this.discuss_projects.length,
                  this.halt_projects.length,
                  this.deadline_projects.length,
                  this.completed_projects.length
                ]
      }
    },
  }
</script>

<style>
#projects {
  font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
  border-collapse: collapse;
  width: 100%;
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