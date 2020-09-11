<template>
<div>
	<navbar />
  <v-container>
    <NumberOfResources />
    <ProjectVsName />
  </v-container>
</div>
</template>


<script>
  import navbar from './navbar'
  import NumberOfResources from './NumberOfResources'
  import ProjectVsName from './ProjectVsName'
  export default {
    components:{
      navbar,
      NumberOfResources,
      ProjectVsName
    },
  }
</script>