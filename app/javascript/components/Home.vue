<template>
<div>
  <NavHeader />
  <Dashboard />
    <v-container class="blue lighten-5 mt-15" fluid>
      <v-row no-gutters>
        <v-col cols="12">
          <Week />
        </v-col>
        <v-col cols="3">
          <Benched />
        </v-col>
        <v-col cols="3">
          <TotalProject />
        </v-col>
        <v-col cols="3">
          <Benched />
        </v-col>
        <v-col cols="3">
          <Benched />
        </v-col>
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
  </v-container>
</div>
</template>


<script>
  import NavHeader from './Header/NavHeader'
  import ProjectStatus from './ProjectStatus'
  import Milestone from './Milestone'
  import NumberOfResources from './NumberOfResources'
  import ProjectVsName from './ProjectVsName'
  import Dashboard from './Dashboard'
  import Benched from './Home/Benched'
  import TotalProject from './Home/TotalProject'
  import Week from './Week'
  export default {
    components:{
      NavHeader,
      ProjectStatus,
      Milestone,
      Week,
      NumberOfResources,
      ProjectVsName,
      Dashboard,
      Benched,
      TotalProject
    },
  }
</script>