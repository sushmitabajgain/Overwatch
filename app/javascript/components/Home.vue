<template>
<div>
  <v-container class="fill-height blue lighten-5" fluid>
    	<!-- <navbar /> -->
      <v-row no-gutters>
        <v-col cols="2" style="max-width: 15%">
          <Dashboard />
        </v-col>
        <v-col cols="10">
            <v-col col="12">
              <Week />
            </v-col>
          <v-row no-gutters>
            <v-col cols="12" >
              <ProjectStatus />
            </v-col>
            <v-col cols="6">
              <NumberOfResources />
            </v-col>
            <v-col cols="6">
              <ProjectVsName />
            </v-col>
            <v-col cols="8">
              <Milestone />
            </v-col>
          </v-row>
        </v-col>
      </v-row>
  </v-container>
</div>
</template>


<script>
  import navbar from './navbar'
  import ProjectStatus from './ProjectStatus'
  import Milestone from './Milestone'
  import NumberOfResources from './NumberOfResources'
  import ProjectVsName from './ProjectVsName'
  import Dashboard from './Dashboard'
  import Week from './Week'
  export default {
    components:{
      navbar,
      ProjectStatus,
      Milestone,
      Week,
      NumberOfResources,
      ProjectVsName,
      Dashboard
    },
  }
</script>