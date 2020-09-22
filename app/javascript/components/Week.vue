<template>
  <v-row align="center">
    <v-col class="d-flex" cols="12" sm="2">
      <v-select 
        v-model="currentWeek"
        :items="date" item-value="id" item-text="posted_date.date"
        @input="weekChanged"
        label="Select Week"
        color="#041037"
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
      date:[],
      week: ''
    }
  },
  created(){
    eventService.weeks.getWeek()
    .then(res=>{
      if(res.status == 200){
        this.date = res.data
      }
    })
  },
  methods: {
    weekChanged() {
      this.week = this.currentWeek
      console.log('week changed', this.week);
      this.$store.commit('week/saveWeek', this.week)
      this.$router.go()
    }
  },
}
</script>