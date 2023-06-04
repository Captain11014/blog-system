import request from '@/utils/request'

// 查询用户列表
export function listUser(query) {
  return request({
    url: '/system/user/list',
    method: 'get',
    params: query
  })
}

// 查询用户详细
export function getUser(id) {
  return request({
    url: '/system/user/' + id,
    method: 'get'
  })
}

// 新增用户
export function addUser(data) {
  return request({
    url: '/system/user',
    method: 'post',
    data: data
  })
}

// 修改用户
export function updateUser(data) {
  return request({
    url: '/system/user',
    method: 'put',
    data: data
  })
}

// 删除用户
export function delUser(id) {
  return request({
    url: '/system/user/' + id,
    method: 'delete'
  })
}

/**获取用户已有角色 */
export function getAuthRole(id){
  return request({
    url: '/system/user/authRole/' + id,
    method: 'get'
  })
}


// 保存授权角色
export function updateAuthRole(data) {
  return request({
    url: '/system/user/updateAuthRole',
    method: 'post',
    params: data
  })
}