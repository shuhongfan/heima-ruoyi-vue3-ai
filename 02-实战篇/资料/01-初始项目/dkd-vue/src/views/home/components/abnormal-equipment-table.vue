<template>
  <div class="box abnormal-equipment">
    <div class="header">
      <div class="title">异常设备监控</div>
      <el-icon @click="handleMore"><MoreFilled /></el-icon>
    </div>
    <el-scrollbar v-if="listData.length" class="scrollbar body">
      <el-table
        :data="listData"
        fit
        highlight-current-row
        style="width: 100%"
        :header-cell-style="{
          padding: '7px 0 6px',
          background: '#EFF0F2',
          'font-weight': '400',
          'text-align': 'left',
          color: '#333333',
        }"
        :cell-style="{
          padding: '15px 0',
          'text-align': 'left',
          color: '#999999',
        }"
      >
        <el-table-column label="故障时间" width="160px">
          <template #default="scope">
            <span>{{ scope.row.updateTime }}</span>
          </template>
        </el-table-column>
        <el-table-column label="设备地址" show-overflow-tooltip>
          <template #default="scope">
            <span>{{ scope.row.addr }}</span>
          </template>
        </el-table-column>
        <el-table-column label="设备编号" width="120px">
          <template #default="scope">
            <span>{{ scope.row.innerCode }}</span>
          </template>
        </el-table-column>
      </el-table>
    </el-scrollbar>
    <!-- TODO：一开始显示加载中 -->
    <div v-else class="empty">
      <img src="@/assets/images/empty.png" />
      <div class="tips">暂无数据</div>
    </div>
  </div>
</template>
<script setup>
import { onMounted } from 'vue';
// 定义变量
const router = useRouter();
const listData = ref([
        {
            "createBy": null,
            "createTime": "2020-12-18 15:49:03",
            "updateBy": null,
            "updateTime": "2024-05-14 09:21:58",
            "remark": null,
            "id": 80,
            "innerCode": "A1000001",
            "vmTypeId": 1,
            "vmTypeName": "饮料机",
            "channelMaxCapacity": 10,
            "nodeId": 6,
            "addr": "顺义奥林匹克水上公园",
            "lastSupplyTime": "2023-03-22",
            "businessId": 1,
            "regionId": 3,
            "regionName": "北京-顺义区",
            "ownerId": 28,
            "longitudes": 0,
            "vmStatus": 1,
            "clientId": "70122567fcc13e7615e7239812c20448",
            "ownerName": "金燕龙合作商",
            "latitude": 0,
            "runningStatus": "{\"key\": \"10001\",\"value\":\"正常\" }",
            "policyId": 1
        },
        {
            "createBy": null,
            "createTime": "2020-12-18 10:39:22",
            "updateBy": null,
            "updateTime": "2024-05-14 09:22:11",
            "remark": null,
            "id": 81,
            "innerCode": "Ut548Hpf",
            "vmTypeId": 1,
            "vmTypeName": "饮料机",
            "channelMaxCapacity": 10,
            "nodeId": 2,
            "addr": "北京市海淀区西直门北大街32号",
            "lastSupplyTime": "2000-01-01",
            "businessId": 2,
            "regionId": 1,
            "regionName": "北京-海淀区",
            "ownerId": 1,
            "longitudes": 0,
            "vmStatus": 1,
            "clientId": "3792e9c9b390e291514fd4f9b8fe95bb",
            "ownerName": "金燕龙合作商",
            "latitude": 0,
            "runningStatus": "{\"key\": \"10001\",\"value\":\"正常\" }",
            "policyId": 2
        },
        {
            "createBy": null,
            "createTime": "2020-12-18 11:45:28",
            "updateBy": null,
            "updateTime": "2024-05-16 12:25:30",
            "remark": null,
            "id": 82,
            "innerCode": "RHaV9Zaz",
            "vmTypeId": 1,
            "vmTypeName": "饮料机",
            "channelMaxCapacity": 10,
            "nodeId": 3,
            "addr": "北京市昌平区十三陵镇昌赤路 ",
            "lastSupplyTime": "2000-01-01",
            "businessId": 1,
            "regionId": 2,
            "regionName": "北京-昌平区",
            "ownerId": 1,
            "longitudes": 0,
            "vmStatus": 1,
            "clientId": "1b9e4df47a4c55124b54a4cb00b62123",
            "ownerName": "金燕龙合作商",
            "latitude": 0,
            "runningStatus": "{\"key\": \"10001\",\"value\":\"正常\" }",
            "policyId": 2
        },
        {
            "createBy": null,
            "createTime": "2020-12-18 11:46:19",
            "updateBy": null,
            "updateTime": "2024-05-14 09:24:44",
            "remark": null,
            "id": 83,
            "innerCode": "f8uK9ixf",
            "vmTypeId": 1,
            "vmTypeName": "饮料机",
            "channelMaxCapacity": 10,
            "nodeId": 4,
            "addr": "北京市昌平区南环路10号 ",
            "lastSupplyTime": "2022-11-29",
            "businessId": 2,
            "regionId": 2,
            "regionName": "北京-昌平区",
            "ownerId": 1,
            "longitudes": 0,
            "vmStatus": 1,
            "clientId": "d764e5e764db441de0ed5dbf68d48f90",
            "ownerName": "金燕龙合作商",
            "latitude": 0,
            "runningStatus": "{\"key\": \"10001\",\"value\":\"正常\" }",
            "policyId": 1
        }
    ]);

// 点击更多
const handleMore = () => {
  router.push({ path: 'vm/machine' });
};
</script>
<style lang="scss" scoped>
@import '@/assets/styles/variables.module.scss';

.abnormal-equipment {
  display: flex;
  flex-direction: column;
  height: calc((100vh - 120px) * 0.4);
  min-height: 353px;
  background: #ffffff;
  border-radius: 20px;

  .more {
    color: $--color-primary;
    cursor: pointer;
  }

  .empty {
    flex: 1;
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;

    .tips {
      margin-top: 25px;
      color: #20232a;
      font-size: 14px;
    }
  }

  .body {
    flex: 1;
    margin-top: 20px;
  }
}
</style>