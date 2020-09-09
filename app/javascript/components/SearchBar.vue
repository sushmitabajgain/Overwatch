<template>
  <v-select
    class="mt-8"
    v-model="select"
    :items="projects" item-value="id" item-text="name"
    light
    solo
    color="pink accent-3"
    append-icon="search"
    placeholder="Search Project...">
  </v-select>
</template>

<script>
import eventService from "../eventService"
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
}
</script>