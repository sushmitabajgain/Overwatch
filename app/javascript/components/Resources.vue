<template>
<div>
	<navbar />
  <v-container>
    <v-row align="center" justify=center>
      <NumberOfResources />
      <ProjectVsName />
    </v-row>
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