<template>
  <div class="d-flex flex-no-wrap justify-space-between">  
    <div>
      <h2>Project Status (Week {{currentWeek}})</h2>
      <apexchart width="800" type="pie" :options="chartOptions" :series="series"></apexchart>
    </div>
    <div>
      <table id="projects">
        <tr>
          <th style="background-color: #00C853;">On Track </th>
        </tr>
        <template v-if="on_track_projects.length>0">
          <tr v-for="project in on_track_projects" :key="project">
            <td> {{project}}</td>
          </tr>
        </template>
        <template v-else>
          <tr>
            <td class="project-none"> None </td>
          </tr>
        </template>
      </table>
      <table id="projects">
        <tr>
          <th style="background-color: #AB47BC;">Need to Discuss/Back on Track</th>
        </tr>
        <template v-if="discuss_projects.length>0">
          <tr v-for="project in discuss_projects" :key="project">
            <td> {{project}}</td>
          </tr>
        </template>
        <template v-else>
          <tr>
            <td class="project-none"> None </td>
          </tr>
        </template>
      </table>
      <table id="projects">
        <tr>
          <th style="background-color: #FB8C00;">Project on Halt</th>
        </tr>
        <template v-if="halt_projects.length>0">
          <tr v-for="project in halt_projects" :key="project">
            <td> {{project}}</td>
          </tr>
        </template>
        <template v-else>
          <tr>
            <td class="project-none"> None </td>
          </tr>
        </template>
      </table>
      <table id="projects">
        <tr>
          <th style="background-color: #E53935;">Out of Deadline</th>
        </tr>
        <template v-if="deadline_projects.length>0">
          <tr v-for="project in deadline_projects" :key="project">
            <td> {{project}}</td>
          </tr>
        </template>
        <template v-else>
          <tr>
            <td class="project-none"> None </td>
          </tr>
        </template>
      </table>
      <table id="projects">
        <tr>
          <th style="background-color: #1E88E5;">Completed Projects</th>
        </tr>
        <template v-if="completed_projects.length>0">
          <tr v-for="project in completed_projects" :key="project">
            <td> {{project}}</td>
          </tr>
        </template>
        <template v-else>
          <tr>
            <td class="project-none"> None </td>
          </tr>
        </template>
      </table>
    </div>
  </div>
</template>


<script>
  import eventService from '../eventService'
  export default {
    data() {
      return{
        currentWeek: '',
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
          colors: ['#00C853','#AB47BC', '#FB8C00', '#E53935', '#1E88E5'],
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
          }]
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
  padding: 4px;
}

#projects th {
  padding-top: 6px;
  padding-bottom: 6px;
  text-align: left;
  color: white;
}

#projects 
.project-none {
  background-color: #f2f2f2;
}
</style>