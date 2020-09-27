<template>
  <v-row>
      <v-autocomplete
        v-model="currentWeek"
        :items="date" item-value="id" item-text="posted_date.date"
        @input="weekChanged"
        label="Select Week"
        color="#041037"
        append-icon="arrow_drop_down"
        hide-details
        single-line
        solo
        hide-no-data
        hide-selected
        style="max-width:200px; border-radius:15px"
      >
      </v-autocomplete>
  </v-row>
</template>

<script>
import eventService from '../eventService'
export default {
  data(){
    return{
      currentWeek: '',
      date:[],
      week: '',
    }
  },
  created(){
    eventService.weeks.getWeek()
    .then(res=>{
      if(res.status == 200){
        this.date = res.data
        this.currentWeek = this.date[0].id
        this.weekChanged()
      }
    })
  },
  methods: {
    weekChanged() {
      this.week = this.currentWeek
      console.log('week changed', this.week);
      this.$store.commit('week/saveWeek', this.week)
      // this.$router.go()
    }
  },
}
</script>