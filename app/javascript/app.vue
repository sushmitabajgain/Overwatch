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
  color: rgb(59, 39, 39);
  font-size: 36px;
  padding-bottom: 20px;

  &:before {
    color: #FFAB02;
    content: '|';
    font-size: 30px;
    font-weight: 300;
    font-family: Raleway;
    padding-right: 20px;
    position: relative;
    top: -3px;
  }

}
</style>