<template>
  <v-card class="ma-3">
    <v-row justify="center" class="pa-3">
      <h2> Milestone Status (Week {{currentWeek}})</h2>
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
      <apexchart type="bar" height="400" :options="chartOptions" :series="series"></apexchart>
    </div>
  </v-card>
</template>

<script>
import eventService from '../eventService'
export default {
  data() {
    return{  
      loading: true,
      missed_milestone:[],
      no_of_milestone: [],
      completed_milestone: [],
      projects: [],
    }
  },

  methods: {
    getWeeklyMilestone(week){
      this.missed_milestone = [],
      this.no_of_milestone = [],
      this.completed_milestone = [],
      this.projects = [],
      eventService.project.getWeeklyProject(week) 
      .then(res => {
        if(res.status == 200){
        var count =0;
        var index;
        for(index in res.data)
          if(res.data.length>0){
            if (res.data[index].no_of_milestone !== ""){
              this.no_of_milestone.push(res.data[index].no_of_milestone);
            }
            if (res.data[index].missed_milestone !== ""){
              this.missed_milestone.push(res.data[index].missed_milestone);
            }
            if (res.data[index].completed_milestone !== ""){
              this.completed_milestone.push(res.data[index].completed_milestone);
            }
            if ((res.data[index].completed_milestone !== "") ||(res.data[index].no_of_milestone !== "") || (res.data[index].missed_milestone !== "")){
              this.projects.push(res.data[index].project);
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
        this.getWeeklyMilestone(week)
      }
      return week;
    },
    series: function() {
      return [
        {
          name: 'No of Milestones',
          data: this.no_of_milestone,
        },
        {
          name: 'Completed Milestones',
          data: this.completed_milestone
        },
        {
          name: 'Missed Milestones',
          data: this.missed_milestone
        }
      ]
    },

    chartOptions: function(){
      return {
        colors: ['#29B6F6', '#64DD17', '#d50000'],
        chart: {
          type: 'bar',
          stacked: false,
          toolbar: {
            show: false
          },
        },
        dataLabels: {
          enabled: true
        },
        xaxis: {
          categories: this.projects,
          title: {
            text: "Projects",
            style: {
              fontSize: '16px',
              margin: '12px',
              color: '#37474F'
            }
          },
          labels: {
            style: {
              colors: "#37474F",
              fontSize: '10px'
            }
          },
        },
        yaxis: [
            {
              labels: {
                style: {
                  colors: "#37474F",
                  fontSize: '10px'
                }
              },
              title: {
                text: "Milestone",
                style: {
                  fontSize: '16px',
                  color: '#37474F'
                }
              },
            }
        ]
      }
    }
  }
}
</script>