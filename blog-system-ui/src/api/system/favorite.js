import request from '@/utils/request'

// 查询收藏文章记录列表
export function listFavorite(query) {
  return request({
    url: '/system/favorite/list',
    method: 'get',
    params: query
  })
}

// 查询收藏文章记录详细
export function getFavorite(id) {
  return request({
    url: '/system/favorite/' + id,
    method: 'get'
  })
}

// 新增收藏文章记录
export function addFavorite(data) {
  return request({
    url: '/system/favorite',
    method: 'post',
    data: data
  })
}

// 修改收藏文章记录
export function updateFavorite(data) {
  return request({
    url: '/system/favorite',
    method: 'put',
    data: data
  })
}

// 删除收藏文章记录
export function delFavorite(id) {
  return request({
    url: '/system/favorite/' + id,
    method: 'delete'
  })
}

// 根据id判断是否已经收藏该文章
export function selectFavoriteArticleByIdAndUserId(paramsFavorite) {
  return request({
    url: '/system/favorite/selectFavoriteArticleByIdAndUserId',
    method: 'get',
    params:paramsFavorite
  })
}
