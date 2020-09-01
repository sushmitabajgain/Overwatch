<template>
  <div id="app">
    <v-app>
      <v-main>
        <router-view />
      </v-main>
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

<style lang="scss">
  @import 'v-toaster/dist/v-toaster.css';
  .v-toaster {
    right: 50%;
    left: 50%;
  }
</style>