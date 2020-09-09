<template>
<div>
	<navbar />
  <v-container>
    <v-row align="center" justify=center>
      <Milestone />
      <ProjectStatus />
      <div class="mt-4"></div>
      <div class="mt-4"></div>
      <NumberOfResources />
    </v-row>
  </v-container>
</div>
</template>


<script>
  import navbar from './navbar'
  import NumberOfResources from './NumberOfResources'
  import ProjectStatus from './ProjectStatus'
  import Milestone from './Milestone'
  export default {
    components:{
      navbar,
      NumberOfResources,
      ProjectStatus,
      Milestone,
    },
  }
</script>