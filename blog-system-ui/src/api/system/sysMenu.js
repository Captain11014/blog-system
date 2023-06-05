import request from '@/utils/request'

// 查询树形菜单列表
export function listMenu(query) {
  return request({
    url: '/system/menu/list',
    method: 'get',
    params: query
  })
}

// 查询菜单详细
export function getMenu(id) {
  return request({
    url: '/system/menu/' + id,
    method: 'get'
  })
}

// 新增菜单
export function addMenu(data) {
  return request({
    url: '/system/menu',
    method: 'post',
    data: data
  })
}

// 修改菜单
export function updateMenu(data) {
  return request({
    url: '/system/menu',
    method: 'put',
    data: data
  })
}

// 删除菜单
export function delMenu(id) {
  return request({
    url: '/system/menu/' + id,
    method: 'delete'
  })
}



// 查询角色菜单
export function selectRoleList(roleId) {
  return request({
    url: '/system/menu/roleList/' + roleId,
    method: 'get'
  })
}




