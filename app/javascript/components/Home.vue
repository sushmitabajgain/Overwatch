<template>
<div>
	<navbar />
  <v-container>
      <Week />
      <ProjectStatus />
      <Milestone />
  </v-container>
</div>
</template>


<script>
  import navbar from './navbar'
  import ProjectStatus from './ProjectStatus'
  import Milestone from './Milestone'
  import Week from './Week'
  export default {
    components:{
      navbar,
      ProjectStatus,
      Milestone,
      Week
    },
  }
</script>