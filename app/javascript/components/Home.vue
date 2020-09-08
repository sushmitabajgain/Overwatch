<template>
<div>
	<navbar />
  <v-container>
    <v-row align="center" justify=center>
      <ProjectStatus />
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
  export default {
    components:{
      navbar,
      NumberOfResources,
      ProjectStatus
    },
  }
</script>