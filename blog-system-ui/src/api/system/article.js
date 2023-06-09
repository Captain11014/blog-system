import request from '@/utils/request'

// 查询文章博客列表
export function listArticle(query) {
  return request({
    url: '/system/article/list',
    method: 'get',
    params: query
  })
}

// 查询文章博客列表
export function listjoin(query) {
  return request({
    url: '/system/article/listjoin',
    method: 'get',
    params: query
  })
}

// 查询我的收藏文章博客列表
export function selectArticleWidthFavorite(query) {
  return request({
    url: '/system/article/selectArticleWidthFavorite',
    method: 'get',
    params: query
  })
}

// 查询文章浏览记录
export function selectArticleWidthBrowsingHistory(query) {
  return request({
    url: '/system/article/selectArticleWidthBrowsingHistory',
    method: 'get',
    params: query
  })
}


// 查询文章博客详细
export function getArticle(id) {
  return request({
    url: '/system/article/' + id,
    method: 'get'
  })
}

// 新增文章博客
export function addArticle(data) {
  return request({
    url: '/system/article',
    method: 'post',
    data: data
  })
}

// 修改文章博客
export function updateArticle(data) {
  return request({
    url: '/system/article',
    method: 'put',
    data: data
  })
}

// 删除文章博客
export function delArticle(id) {
  return request({
    url: '/system/article/' + id,
    method: 'delete'
  })
}
