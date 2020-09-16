<template>
  <div>
    <h2> Number of resources per project (Week {{currentWeek}}) </h2>
    <div class="loading" v-if="loading">
      Loading...
      <v-progress-linear
            color="pink accent-3"
            indeterminate
            rounded
            height="6"
          ></v-progress-linear>
    </div>
    <div v-else>
      <apexchart type="pie" width="700" :options="chartOptions" :series="series"></apexchart>
    </div>
  </div>
</template>


<script>
  import eventService from '../eventService'
  export default {
    data() {
      return{
        loading: true,
        currentWeek: '',
        series: [],
        chartOptions: {
          chart: {
            width: 500,
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
      setTimeout(() => {
        this.currentWeek = localStorage.getItem('week');
        eventService.project.getWeeklyProject(this.currentWeek) 
        .then(res => {
          if(res.status == 200){
            var count =0;
            var index;
            for(index in res.data)
            if(res.data.length>0){
              this.series.push(res.data[index].no_of_resources);
              this.chartOptions.labels.push(res.data[index].project);
            }
            this.loading = false;
          } 
        })
      }, 2000);    
    },
  }
</script>