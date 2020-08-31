<template>
  <v-app>
    <v-app-bar color="deep-purple accent-4"
                      dense
                      dark
                      app
      >
        <v-toolbar-title>Welcome</v-toolbar-title>
        <v-spacer></v-spacer>

        <router-link to="/SignIn">
          <v-btn rounded right class="ma-2" color="warning">Sign in</v-btn>
        </router-link>
        <v-btn rounded right class="ma-2" color="warning">Sign up</v-btn>
    </v-app-bar>
  </v-app>
</template>