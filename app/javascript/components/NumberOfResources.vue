<template>
  <div>
    <v-card-title> Number of resources per project </v-card-title>
    <apexchart type="pie" width="800" :options="chartOptions" :series="series"></apexchart>
  </div>
</template>


<script>
  import eventService from '../eventService'
  export default {
    data() {
      return{
        series: [],
        chartOptions: {
          chart: {
            width: 900,
            type: 'pie',
          }, 
          labels:[],
          responsive: [{
            breakpoint: 480,
            options: {
              chart: {
                width: 500
              },
              legend: {
                position: 'bottom'
              }
            }
          }]
        },
      }
    },
    created(){
      eventService.project.getWorksheet() 
      .then(res => {
        if(res.status == 200){
					var count =0;
					var index;
          for(index in res.data)
          if(res.data.length>0){
            this.series.push(res.data[index].no_of_resources);
            this.chartOptions.labels.push(res.data[index].project);
          }
        } 
      })
    },
  }
</script>