<template>
  <div>
		<navbar />

      <tr v-for="(data,index) in projectData" :key="index" >
        <span v-for="(project, k) in data" :key="k">
          <td>{{project}}</td>
        </span>
      </tr>
  </div>
</template>


<script>
  import navbar from './navbar'
  import eventService from '../eventService'
  export default {
    components:{
      navbar
    },
    data () {
      return {
        headers: "",
        projectData: ""
      }
    },
    created(){
      eventService.project.getProject() 
      .then(res => {
        if(res.status == 200){
          this.projectData = res.data
          console.log(res.data)
        }  
      })
    }
  }
</script>
<style lang="scss" scoped>
td, th {
  border: 1px solid #dddddd;
  text-align: left;
  padding: 8px;
}

tr:nth-child(even) {
  background-color: #dddddd;
}
</style>