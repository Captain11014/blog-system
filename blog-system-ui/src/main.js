import Vue from 'vue'

import 'normalize.css/normalize.css' // A modern alternative to CSS resets

import ElementUI from 'element-ui'
import 'element-ui/lib/theme-chalk/index.css'
import '@/assets/styles/ruoyi.scss'
import locale from 'element-ui/lib/locale/lang/en' // lang i18n
import plugins from './plugins' // plugins
// 分页组件
import Pagination from "@/components/Pagination"

import '@/styles/index.scss' // global css

import App from './App'
import store from './store'
import router from './router'

import '@/icons' // icon
import '@/permission' // permission control

import { parseTime, resetForm, addDateRange, selectDictLabel, selectDictLabels, handleTree }  from "@/utils/blog"
//新增
import hasBtnPermission from '@/utils/btn-permission'

/**
 * If you don't want to use mock-server
 * you want to use MockJs for mock api
 * you can execute: mockXHR()
 *
 * Currently MockJs will be used in the production environment,
 * please remove it before going online ! ! !
 */
if (process.env.NODE_ENV === 'production') {
  const { mockXHR } = require('../mock')
  mockXHR()
}

Vue.prototype.resetForm = resetForm
Vue.prototype.parseTime = parseTime
Vue.prototype.$hasBP = hasBtnPermission


Vue.component('Pagination', Pagination)

// set ElementUI lang to EN
// Vue.use(ElementUI, { locale })
// 如果想要中文版 element-ui，按如下方式声明
Vue.use(ElementUI)
Vue.use(plugins)

Vue.config.productionTip = false

new Vue({
  el: '#app',
  router,
  store,
  render: h => h(App)
})
