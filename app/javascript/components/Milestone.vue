<template>
  <div class="mt-16">
    <h2> Milestone Status</h2>
    <apexchart type="bar" :options="chartOptions" :series="series"></apexchart>
  </div>
</template>

<script>
import eventService from '../eventService'
export default {
  data() {
    return{  
      missed_milestone:[],
      no_of_milestone: [],
      completed_milestone: [],
      projects: [],
    }
  },
  created(){
    eventService.project.getProject() 
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
      }
    })

  },
  computed: {
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
        chart: {
          type: 'bar',
          width: "800",
          stacked: false
        },
        dataLabels: {
          enabled: true
        },
        xaxis: {
          categories: this.projects,
          title: {
            text: "Projects",
            style: {
              fontSize: '18px',
              margin: '12px',
            }
          }
        },
      }
    }
  }
}
</script>