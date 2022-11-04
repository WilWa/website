import { createRouter, createWebHistory } from 'vue-router'

import HomeView from '../components/HomeView.vue'

const routes = [
  {
    path: '/',
    name: 'Home',
    component: HomeView
  },
  {
    path: '/test',
    name: 'Test',
    component: () => import('../components/TestView.vue')
  }
]

const router = createRouter({
  history: createWebHistory(),
  routes
})

export default router
