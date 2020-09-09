<template>
  <div>
    <v-card-title> Project Status</v-card-title>
    <apexchart width="900" type="bar" :options="options" :series="series"></apexchart>
  </div>
</template>


<script>
  import eventService from '../eventService'
  export default {
    data() {
      return{
        series: [{
          name: 'project',
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
    },
  }
</script>