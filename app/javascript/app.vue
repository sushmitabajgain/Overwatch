<template>
  <div id="app">
    <v-app>
      <router-view />
    </v-app>
  </div>
</template>

<script>
import navbar from "./components/navbar.vue";
export default {
  components: {
    navbar
  }
};
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>
