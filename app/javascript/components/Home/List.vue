<template>
  <v-container class="blue lighten-5 mt-15" fluid>
      <v-row no-gutters>
        <v-col cols="3">
          <PendingRaid />
        </v-col>
        <v-col cols="3">
          <TotalProject />
        </v-col>
        <v-col cols="12" >
          <Table />
        </v-col>
        <v-col cols="6">
          <NumberOfResources />
        </v-col>
        <v-col cols="6">
          <Milestone />
        </v-col>
        <v-col cols="6">
          <!-- <ProjectVsName /> -->
        </v-col>
      </v-row>
  </v-container>
</template>
<script>
  import ProjectStatus from '../ProjectStatus'
  import Milestone from '../Milestone'
  import ProjectVsName from '../ProjectVsName'
  import Benched from '../Home/Benched'
  import TotalProject from '../Home/TotalProject'
  import ProjectTimeline from '../Project/ProjectTimeline'
  import PendingRaid from '../Home/PendingRaid'
  import ProjectHealth from '../Project/ProjectHealth'
  import Workload from '../Project/Workload'
  // import Test from '../Project/Test'
  import Table from '../Project/Table'
  import NumberOfResources from '../Home/NumberOfResources'

  export default {
    components:{
      ProjectStatus,
      Milestone,
      NumberOfResources,
      ProjectVsName,
      Benched,
      TotalProject,
      ProjectTimeline,
      PendingRaid,
      ProjectHealth,
      Workload,
      // Test,
      Table,
      NumberOfResources
    },
  }
</script>