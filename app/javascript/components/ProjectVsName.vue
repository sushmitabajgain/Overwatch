<template>
  <div class="mt-16">
    <h2> Resource Engaged in Multiple Projects (Week {{currentWeek}})</h2>
    <apexchart width="800" height="200" type="bar" :options="chartOptions" :series="series"></apexchart>
  </div>
</template>


<script>
  import eventService from '../eventService'
  export default {
    data() {
      return{
        currentWeek: '',
        multiple_resource: [],
        name: [],
      }
    },
    created(){
      setTimeout(() => {
        this.currentWeek = localStorage.getItem('week');
        eventService.project.getWeeklyResource(this.currentWeek) 
        .then(res => {
          if(res.status == 200){
          var count =0;
          var index;
          for(index in res.data)
            if(res.data.length>0){
              this.multiple_resource.push(res.data[index].multiple);
              this.name.push(res.data[index].name);
            }
          }
        })
      }, 2000);
    },
    computed: {
      series: function() {
        return [
          {
            data: this.multiple_resource,
          },
        ]
      },
      chartOptions: function(){
        return {
          chart: {
            type: 'bar',
            width: "800",
            height: "200",
            stacked: false
          },
          dataLabels: {
            enabled: true
          },
          xaxis: {
            categories: this.name,
            title: {
              text: "Resources",
              style: {
                fontSize: '16px',
                margin: '12px',
              }
            }
          },
          yaxis: [
            {
              title: {
                text: "Project",
                style: {
                  fontSize: '16px',
                }
              },
            }
          ],
        }
      }
    }
  }
</script>