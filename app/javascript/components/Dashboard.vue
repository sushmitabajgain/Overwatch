<template>
      <v-navigation-drawer
        app
        floating
        color="#fff"
        width="75px"
      >
        <v-list
          dense
          nav
          class="py-0"
        >
          <v-list-item>
            <v-list-item-avatar>
              <img src="../images/pm.png" >
            </v-list-item-avatar>

            <v-list-item-content class="white--text font-weight-bold">
              <h4>Eagle Eye</h4>
            </v-list-item-content>
          </v-list-item>

          <v-divider></v-divider>

          <v-list-item
            v-for="item in items"
            :key="item.title"
            link
          >
            <v-list-item-icon>
              <v-icon color="white">{{ item.icon }}</v-icon>
            </v-list-item-icon>

            <v-list-item-content class="white--text font-weight-bold">
              <v-list-item-title>{{ item.title }}</v-list-item-title>
            </v-list-item-content>
          </v-list-item>
        </v-list>
      </v-navigation-drawer>
</template>


<script>
  export default {
    data () {
      return {
        items: [
          { title: 'Dashboard', icon: 'dashboard' },
          { title: 'About', icon: 'support' },
        ],
      }
    }
  }
</script>