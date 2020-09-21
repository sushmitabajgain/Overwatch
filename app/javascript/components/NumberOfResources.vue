<template>
  <v-card class="ma-3">
    <v-row justify="center" class="pa-3">
      <h2> Number Of Resources Per Project (Week {{currentWeek}}) </h2>
    </v-row>
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
      <apexchart type="bar" :options="chartOptions" :series="series"></apexchart>
    </div>
  </v-card>
</template>


<script>
  import eventService from '../eventService'
  export default {
    data() {
      return{
        loading: true,
        currentWeek: '',
        data: [],
        chartOptions: {
          chart: {
            width: 600,
            type: 'bar',
            toolbar: {
              show: false
            },
          },
          colors: "#F50057",
          plotOptions: {
            bar: {
              horizontal: true,
            }
          },
          dataLabels: {
            enabled: true
          },
          labels:[],
          xaxis: {
            labels: {
              rotate: -45,
              style: {
                fontSize: '10px', 
              }
            },
            title: {
              text: "Resources",
              style: {
                fontSize: '16px',
                color: '#37474F'
              }
            }
          },
          yaxis: [
            {
              title: {
                text: "Resources",
                style: {
                  fontSize: '16px',
                  color: '#37474F'
                }
              },
            }
          ]
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
              this.data.push(res.data[index].no_of_resources);
              this.chartOptions.labels.push(res.data[index].project);
            }
            this.loading = false;
          } 
        })
      }, 2000);    
    },
    computed: {
      series: function() {
        return [
          {
            data: this.data,
            name: "Resources"
          },
        ]
      },
    }
  }
</script>