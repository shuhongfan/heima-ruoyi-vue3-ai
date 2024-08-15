import request from '@/utils/request'

// 查询区域管理列表
export function listRegion(query) {
  return request({
    url: '/manage/region/list',
    method: 'get',
    params: query
  })
}

// 查询区域管理详细
export function getRegion(id) {
  return request({
    url: '/manage/region/' + id,
    method: 'get'
  })
}

// 新增区域管理
export function addRegion(data) {
  return request({
    url: '/manage/region',
    method: 'post',
    data: data
  })
}

// 修改区域管理
export function updateRegion(data) {
  return request({
    url: '/manage/region',
    method: 'put',
    data: data
  })
}

// 删除区域管理
export function delRegion(id) {
  return request({
    url: '/manage/region/' + id,
    method: 'delete'
  })
}
