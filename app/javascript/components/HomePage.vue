<template>
<div>
  <NavHeader />
  <Dashboard />
  <List />
</div>
</template>


<script>
  import NavHeader from './Header/NavHeader'
  import Dashboard from './Dashboard'
  import List from './Home/List'
  export default {
    components:{
      NavHeader,
      Dashboard,
      List
    },
  }
</script>