<template>
<div>
  <v-input style="display:none"> {{currentWeek}}</v-input>
  <v-data-table
    :headers="headers"
    :items="projects"
    class="elevation-1 ma-3"
    :hide-default-footer="true"
    items-per-page="50"
  >
    <template v-slot:item.project_health="{ item }">
      <v-chip :color="getColorHealth(item.project_health)" dark>{{ item.project_health }}</v-chip>
    </template>
    <template v-slot:item.project_timeline="{ item }">
      <v-chip :color="getColorTimeline(item.project_timeline)" dark>{{ item.project_timeline }}</v-chip>
    </template>
    <template v-slot:item.workload="{ item }">
      <v-chip :color="getColorWorkload(item.workload)" dark>{{ item.workload }}</v-chip>
    </template>
    <template #item.project="{ item }">
      <router-link :to="{ name: 'Project', params: { id: item.id } }">
        {{ item.project }}
      </router-link>
    </template>
  </v-data-table>
</div>
</template>


<script>
  import eventService from '../../eventService'
  export default {
    data () {
      return {
        headers: [
          {
            text: 'Project Name',
            align: 'start',
            sortable: false,
            value: 'project',
          },
          { text: 'Project Health', value: 'project_health' },
          { text: 'Project Timeline', value: 'project_timeline' },
          { text: 'Workload', value: 'workload'},
        ],

        projects: []
      }
    },

    methods: {
      getWeekly(week){
        eventService.project.getWeeklyProject(week)
        .then(res => {
          if(res.status == 200){
            this.projects = res.data        }  
        })
      },
      getColorHealth (project_health) {
        if (project_health == 'Good' ) return '#FFEA00'
        else if (project_health == 'Needs Checkup') return '#d50000'
        else return 'blue'
      },
      getColorTimeline (project_timeline) {
        if (project_timeline == 'On track' ) return '#76EE00'
        else if (project_timeline == 'Due') return '#d50000'
        else return '#FFEA00'
      },
      getColorWorkload (workload) {
        if (workload == 'Normal' ) return '#29B6F6'
        else if (workload == 'Relaxed') return '#D500F9'
        else if(workload == 'Overload') return '#FFEA00'
        else return '#d50000'
      }
    },
    computed: {
      currentWeek(){
        let week = this.$store.state.week.week;
        if (week){
          this.getWeekly(week)
        }
        return week;
      }
    }
  }
</script>