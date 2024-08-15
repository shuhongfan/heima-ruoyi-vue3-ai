import request from '@/utils/request';

// 查询货道列表
export function getGoodsList(innerCode) {
  return request({
    url: '/manage/channel/list/' + innerCode,
    method: 'get',
  });
}
// 查询设备类型
export function getGoodsType(typeId) {
  return request({
    url: '/manage/vmType/' + typeId,
    method: 'get',
  });
}
// 提交获取的货道
export function channelConfig(data) {
  return request({
    url: '/manage/channel/config',
    method: 'put',
    data: data,
  });
}
