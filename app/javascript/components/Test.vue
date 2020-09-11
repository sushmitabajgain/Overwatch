<template>
  <div>
    <v-card-title> Project Status</v-card-title>
    <apexchart width="800" type="bar" :options="options" :series="series"></apexchart>
  </div>
</template>


<script>
  import eventService from '../eventService'
  export default {
    data() {
      return{
        series: [{
          name: {
            on_track_projects: [],
            discuss_projects:[],
            halt_projects:[],
            deadline_projects:[],
            completed_projects:[],
          },
          data: []
        }],
        options: {
          plotOptions: {
            bar: {
              distributed: true
            }
          },
          legend: {
            show: false
          },
          xaxis: {
            categories: [
                          ['On Track'],
                          ['Need to Discuss','Back on Track'],
                          ['Project on Halt'],
                          ['Out of Deadline'], 
                          ['Completed Project']
                        ],
            title: {
              text: "Status",
              style: {
                fontSize: '18px',
                margin: '12px',
              }
            }
          },
          yaxis: [
            {
              title: {
                text: "Project",
                style: {
                  fontSize: '18px',
                }
              },
            }
          ],
          colors: ['#007700','#C70081', '#FFA500', '#C60400', '#0000A9']
        },
      }
    },
    created(){
      eventService.project.getStatusCount() 
      .then(res => {
        if(res.status == 200){
          this.series= [{
            data: res.data
          }]
        }
      })
      eventService.project.getProject() 
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
    },
  }
</script>