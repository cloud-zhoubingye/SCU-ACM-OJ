import { createRouter, createWebHistory } from 'vue-router'
import Home from '@/components/Home.vue'
import Login from '@/components/Login.vue'
import MainPage from '@/components/CategorizedExercises.vue'
import LoginSuccess from '@/components/LoginSuccess.vue'
import HardBasedExercises from '@/components/HardBasedExercises.vue'
import History from '@/components/History.vue'
import LoginFailure from '@/components/LoginFailure.vue'
import PersonInfo from '@/components/PersonInfo.vue'
import Register from '@/components/Register.vue'
import ResetPassword from '@/components/ResetPassword.vue'
import ProblemPage from '@/components/ProblemPage.vue'
import axios from 'axios'



const routes = [
  {
    path: '/',
    name: 'home',
    component: Home
  },
  {
    path: '/login',
    name: 'login',
    component: Login
  },
  {
    path: '/contest_list',
    name: 'categorized_exercises',
    component: MainPage,
    meta: { requiresUser: true }
  },
  {
    path: '/success',
    name: 'success',
    component: LoginSuccess
  },
  {
    path: '/contest_details',
    name: 'hard_based_exercises',
    component: HardBasedExercises,
    meta: { requiresUser: true }
  },
  {
    path: '/history',
    name: 'history',
    component: History,
    meta: { requiresUser: true }
  },
  {
    path: '/failure',
    name: 'failure',
    component: LoginFailure
  },
  {
    path: '/person_info',
    name: 'person_info',
    component: PersonInfo,
    meta: { requiresUser: true }
  },
  {
    path: '/register',
    name: 'register',
    component: Register
  },
  {
    path: '/reset_password',
    name: 'reset_password',
    component: ResetPassword
  },
  {
    path:'/problem_page',
    name: 'problem_page',
    component: ProblemPage,
    meta: { requiresUser: true }
  },
]

const router = createRouter({
  routes,
  history: createWebHistory(process.env.BASE_URL),
  scrollBehavior() {
    return { top: 0 }
  }
})

// router.beforeEach((to, from, next) => {
//     const token = localStorage.getItem('token');
//     if (to.matched.some(record => record.meta.requiresAdmin)) {
//         axios.get('/api/admin_login_token', {
//             params: {
//                 token: token
//             }
//         })
//         .then((response) => {
//             if (response.data.admin_token_valid == 'success') {
//                 next();
//             }
//             else {
//                 next({ name: 'admin_login' });
//             }
//         })
//         .catch((error) => {
//             next({ name: 'admin_login' });
//         });
//     } else if (to.matched.some(record => record.meta.requiresUser)) {
//         axios.get('/api/user_login_token', {
//             params: {
//                 token: token
//             }
//         })
//         .then((response) => {
//             if (response.data.login_token_valid == 'success') {
//                 next();
//             }
//             else {
//                 next({ name: 'login' });
//             }
//         })
//         .catch((error) => {
//             next({ name: 'login' });
//         });
//     } else {
//         next(); // Always call next() to proceed with the navigation
//     }
// });


export default router
