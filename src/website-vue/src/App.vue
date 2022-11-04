<template>
  <RouterView />
</template>

<script setup lang="ts">
  import { RouterView } from 'vue-router'
</script>

<style lang="scss">
  :root {
    background-color: #242424;
    color: rgba(255, 255, 255, 0.87);
    color-scheme: light dark;
  }

  @media (prefers-color-scheme: light) {
    :root {
      color: #213547;
      background-color: #ffffff;
      font-family: Verdana, Geneva, Tahoma, sans-serif;
    }
  }

  body {
    margin: 0;
  }
</style>
