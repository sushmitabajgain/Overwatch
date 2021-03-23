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

  h2 {
  font-size: 16px;
  padding-bottom: 5px;
  color: #37474F;

  &:before {
    color: #FFAB02;
    content: '|';
    font-size: 16px;
    font-weight: 300;
    font-family: Roboto,sans-serif;
    padding-right: 5px;
    position: relative;
    top: -3px;
  }
}
</style>