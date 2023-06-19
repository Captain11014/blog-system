import Vue from 'vue'
import Router from 'vue-router'

Vue.use(Router)

/* Layout */
import Layout from '@/layout'

/**
 * Note: sub-menu only appear when route children.length >= 1
 * Detail see: https://panjiachen.github.io/vue-element-admin-site/guide/essentials/router-and-nav.html
 *
 * hidden: true                   如果设置为true，项目将不会显示在侧边栏中(默认为false) if set true, item will not show in the sidebar(default is false)
 * alwaysShow: true               if set true, will always show the root menu
 *                                if not set alwaysShow, when item has more than one children route,
 *                                it will becomes nested mode, otherwise not show the root menu
 * redirect: noRedirect           if set noRedirect will no redirect in the breadcrumb
 * name:'router-name'             the name is used by <keep-alive> (must set!!!)
 * meta : {
    roles: ['admin','editor']    control the page roles (you can set multiple roles)
    title: 'title'               the name show in sidebar and breadcrumb (recommend set)
    icon: 'svg-name'/'el-icon-x' the icon show in the sidebar
    breadcrumb: false            if set false, the item will hidden in breadcrumb(default is true)
    activeMenu: '/example/list'  if set path, the sidebar will highlight the path you set
  }
 */

/**
 * constantRoutes
 * a base page that does not have permission requirements
 * all roles can be accessed
 */
export const constantRoutes = [
  {
    path: '/login/admin',
    component: () => import('@/views/login/admin_index'),
    hidden: true
  },

  //普通用户登录
  {
    path: '/login/pt',
    component: () => import('@/views/ordinaryuser/login'),
    hidden: true
  },

   //普通用户登录
   {
    path: '/register',
    component: () => import('@/views/ordinaryuser/register/index'),
    hidden: true
  },

  {
    path: '/404',
    component: () => import('@/views/404'),
    hidden: true
  },

  {
    path: '/',
    component: () => import('@/views/index'),
    hidden:true
  },

  {
    path: '/admin',
    component: Layout,
    children: [{
      path: 'index',
      name: 'Dashboard',
      component: () => import('@/views/dashboard/index'),
      meta: { title: '个人中心', icon: 'dashboard' }
    }]
  },

  //前往文章详情页
  {
    path: '/articleDetail',
    component: () => import('@/views/blogs/article/articleDetail'),
    hidden: true
  },

  //前往个人中心
  {
    path:'/personalcenter',
    component:() => import('@/views/ordinaryuser/personalcenter/index'),
    hidden:true
  }

  // {
  //   path: '/example',
  //   component: Layout,
  //   redirect: '/example/table',
  //   name: 'Example',
  //   meta: { title: 'Example', icon: 'el-icon-s-help' },
  //   children: [
  //     {
  //       path: 'table',
  //       name: 'Table',
  //       component: () => import('@/views/table/index'),
  //       meta: { title: 'Table', icon: 'table' }
  //     },
  //     {
  //       path: 'tree',
  //       name: 'Tree',
  //       component: () => import('@/views/tree/index'),
  //       meta: { title: 'Tree', icon: 'tree' }
  //     }
  //   ]
  // },

  // {
  //   path: '/system',
  //   component: Layout,
  //   children: [
  //     {
  //       path: 'role',
  //       name: '角色管理',
  //       component: () => import('@/views/system/role/index'),
  //       meta: { title: '角色管理', icon: 'table' }
  //     },
  //   ]
  // },
  // {
  //   path: '/system/sysUser',
  //   component: Layout,
  //   children: [
  //     {
  //       path: '',
  //       name: '用户管理',
  //       component: () => import('@/views/system/sysUser/index'),
  //       meta: { title: '用户管理', icon: 'table' }
  //     },
  //   ]
  // },
  // {
  //   path: '/system/sysMenu',
  //   component: Layout,
  //   children: [
  //     {
  //       path: '',
  //       name: '菜单管理',
  //       component: () => import('@/views/system/sysMenu/index'),
  //       meta: { title: '菜单管理', icon: 'table' }
  //     },
  //   ]
  // },

  // {
  //   path: '/system/doAssignRole',
  //   component: Layout,
  //   hidden: true,
  //   children: [
  //     {
  //       path: '',
  //       name: '分配角色',
  //       component: () => import('@/views/system/sysUser/doAssignRole'),
  //       meta: { title: '分配角色',activeMenu:'/system/sysUser' }
  //     },
  //   ]
  // },

  // {
  //   path: '/form',
  //   component: Layout,
  //   children: [
  //     {
  //       path: 'index',
  //       name: 'Form',
  //       component: () => import('@/views/form/index'),
  //       meta: { title: 'Form', icon: 'form' }
  //     }
  //   ]
  // },

 

  // 404 page must be placed at the end !!!
  // { path: '*', redirect: '/404', hidden: true }
]

const createRouter = () => new Router({
  // mode: 'history', // require service support
  scrollBehavior: () => ({ y: 0 }),
  routes: constantRoutes
})

const router = createRouter()

// Detail see: https://github.com/vuejs/vue-router/issues/1234#issuecomment-357941465
export function resetRouter() {
  const newRouter = createRouter()
  router.matcher = newRouter.matcher // reset router
}

export default router
