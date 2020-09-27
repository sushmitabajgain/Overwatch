<template>
    <v-form @submit.prevent="OnSubmit">
      <v-row>
          <v-autocomplete
            v-model="select"
            :loading="isLoading"
            :items="projects" item-value="id" item-text="name"
            hide-details
            single-line
            solo
            hide-no-data
            hide-selected
            style="width: 350px; border-radius:15px"
            label="Start typing to Search"
          >
            <template v-slot:append>
              <v-btn icon type="submit">
                <v-icon>search</v-icon> 
              </v-btn>
            </template>
          </v-autocomplete>
      </v-row>
    </v-form>
</template>

<script>
import eventService from "../../eventService"
export default {
  data(){
    return{
      select: '',
      projects: [],
      isLoading: false,
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
          this.$router.push({path: "/Project/id"})
        })
      }
    }
  },
}
</script>