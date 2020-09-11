<template>
    <v-form @submit.prevent="OnSubmit" class="mt-8" >
      <v-row>
      <v-select
        v-model="select"
        :items="projects" item-value="id" item-text="name"
        light
        solo
        color="pink accent-3"
        append-icon="search"
        placeholder="Search Project...">
      </v-select>
      <v-btn large right class="ma-1" outlined="" dark type="submit"> Search </v-btn>
      </v-row>
    </v-form>
</template>

<script>
import eventService from "../../eventService"
export default {
  data(){
    return{
      select: '',
      projects: []
    }
  },
  created(){
    eventService.project.getProject()
    .then(res => {
      if(res.status == 200){
        var count =0;
        var index;
        for(index in res.data)
          if(res.data.length>0){
            this.projects.push(res.data[index].project);
          }
      }
    })
  },
  methods: {
    OnSubmit(){
      const searchData = {
        project: this.select,
      }
      if (searchData!=""){
        eventService.searchProject.getSearchList(searchData)
        .then(res=>{
          this.search = searchData
          this.$store.commit('search/setLocalSearchStorage',this.search)
          this.$router.push({path: "/Project"})
        })
      }
    }
  },
}
</script>