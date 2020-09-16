<template>
  <v-row align="center">
    <v-col class="d-flex" cols="12" sm="2">
      <v-select 
        v-model="currentWeek"
        :items="weeks"
        @input="weekChanged"
        label="Select Week"
        color="pink accent-3"
        append-icon="event"
      >
      </v-select>
    </v-col>
  </v-row>
</template>

<script>
import eventService from '../eventService'
export default {
  data(){
    return{
      currentWeek: '',
      weeks: [],
    }
  },
  created(){
    eventService.weeks.getWeek()
    .then(res=>{
      if(res.status == 200){
        var count =0;
        var index;
        for(index in res.data)
        if(res.data.length>0){
          this.weeks.push(res.data[index].week)
        }
      }
    })
  },
  methods: {
    weekChanged(week) {
      console.log('week changed',week);
      this.$store.commit('week/saveWeek',week)
      this.$router.go()
    }
  },
}
</script>