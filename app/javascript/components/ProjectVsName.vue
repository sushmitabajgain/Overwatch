<template>
  <v-card class="ma-3">
    <v-row justify="center" class="pa-3">
      <h2> Resource Engaged in Multiple Projects (Week {{currentWeek}})</h2>
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
      <div d-flex flex-no-wrap justify-space-between>
        <apexchart type="bar" :options="chartOptions" :series="series"></apexchart>
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
        multiple_resource: [],
        name: [],
      }
    },
    methods: {
      getWeekly(week){
        this.multiple_resource= [],
        this.name= [],
        eventService.project.getWeeklyResource(week) 
        .then(res => {
          if(res.status == 200){
          var count =0;
          var index;
          for(index in res.data)
            if(res.data.length>0){
              this.multiple_resource.push(res.data[index].multiple);
              this.name.push(res.data[index].name);
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
      series: function() {
        return [
          {
            data: this.multiple_resource,
            name: "Projects"
          },
        ]
      },
      chartOptions: function(){
        return {
          chart: {
            type: 'bar',
            width: "600",
            toolbar: {
              show: false
            },
            stacked: false
          },
          colors: "#ff2400",
          dataLabels: {
            enabled: true
          },
          xaxis: {
            categories: this.name,
            labels: {
              style: {
                colors: "#37474F",
                fontSize: '10px'
              }
            },
            title: {
              text: "Resources",
              style: {
                fontSize: '16px',
                margin: '12px',
                color: '#37474F'
              }
            }
          },
          yaxis: [
            {
              title: {
                text: "Project",
                style: {
                  fontSize: '16px',
                  color: '#37474F'
                }
              },
              labels: {
                style: {
                  colors: "#37474F",
                  fontSize: '10px'
                }
              }
            }
          ],
        }
      }
    }
  }
</script>