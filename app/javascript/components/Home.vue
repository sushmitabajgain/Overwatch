<template>
<div>
	<navbar />
  <v-container>
      <ProjectStatus />
      <Milestone />
  </v-container>
</div>
</template>


<script>
  import navbar from './navbar'
  import ProjectStatus from './ProjectStatus'
  import Milestone from './Milestone'
  export default {
    components:{
      navbar,
      ProjectStatus,
      Milestone,
    },
  }
</script>