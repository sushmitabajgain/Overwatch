<template>
  <div class="ma-16">
    <v-card-title> Resource Engaged in Multiple Projects vs Name</v-card-title>
    <apexchart width="800" type="bar" :options="chartOptions" :series="series"></apexchart>
  </div>
</template>


<script>
  import eventService from '../eventService'
  export default {
    data() {
      return{
        multiple_resource: [],
        name: [],
      }
    },
    created(){
      eventService.project.getResource() 
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