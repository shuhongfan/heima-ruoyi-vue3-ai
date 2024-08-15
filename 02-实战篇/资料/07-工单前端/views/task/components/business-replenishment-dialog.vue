<template>
  <el-dialog
    width="630px"
    title="补货详情"
    :close-on-click-modal="false"
    :close-on-press-escape="false"
    v-model="visible"
    @close="cancel"
    @open="open"
  >
    <el-scrollbar class="scrollbar" style="height: 330px">
      <el-table
        style="width: 568px; margin: 0 auto"
        :data="channelList"
        :header-cell-style="{
          'line-height': '1.15',
          padding: '10px 0 9px',
          background: '#F3F6FB',
          'font-weight': '500',
          'text-align': 'left',
          color: '#666666',
        }"
        :cell-style="{
          height: '44px',
          padding: '2px 0',
          'text-align': 'left',
          color: '#666666',
        }"
      >
        <el-table-column label="货道编号">
          <template #default="scope">
            {{ scope.row.channelCode }}
          </template>
        </el-table-column>

        <el-table-column label="商品名称">
          <template #default="scope">
            {{ scope.row.skuId && scope.row.sku.skuId? scope.row.sku.skuName : '-' }}
          </template>
        </el-table-column>

        <el-table-column label="当前数量">
          <template #default="scope">
            {{ scope.row.skuId && scope.row.sku.skuId? scope.row.currentCapacity : '-' }}
          </template>
        </el-table-column>

        <el-table-column label="还可添加">
          <template #default="scope">
            {{ scope.row.skuId && scope.row.sku.skuId? getAvailableCapacity(scope.row) : '-' }}
          </template>
        </el-table-column>

        <el-table-column label="补满数量" width="200">
          <template #default="scope">
            <el-input-number
              v-if="scope.row.skuId && scope.row.sku.skuId"
              v-model="scope.row.expectCapacity"
              controls-position="right"
              :min="0"
              :max="getAvailableCapacity(scope.row)"
              label="补满数量"
              style="width: 100%"
              placeholder="请输入"
            />
            <span v-else>货道暂无商品</span>
          </template>
        </el-table-column>
      </el-table>
    </el-scrollbar>
    <div class="dialog-footer">
      <el-button @click="cancel">取消</el-button>
      <el-button type="primary" @click="ensureDialog">确认</el-button>
    </div>
  </el-dialog>
</template>

<script setup name="Task">
import { watch } from 'vue';
import { require } from '@/utils/validate';
import { ElMessageBox } from 'element-plus';
import { cancelTaskType } from '@/api/manage/taskType';
// 接口
// 获取货道接口
import { getGoodsList } from '@/api/manage/channel';
// 从父组件获取数据
const props = defineProps({
  // 详情弹层显示隐藏
  channelVisible: {
    type: Boolean,
    default: false,
  },
  // 设备编号
  innerCode: {
    type: String,
    default: '',
  },
});
// 定义变量
const emit = defineEmits(['handleClose', 'getDetailList']);
const visible = ref(false);
const channelList = ref([]); //货道列表
const detailList = ref([]); //补货列表
watch(
  () => props.channelVisible,
  (val) => {
    if (val) {
      visible.value = val;
    }
  }
);
// 弹层打开
const open = () => {
  getChannelList();
};
// 还可添加
const getAvailableCapacity = (channel) => {
  let availableCapacity = channel.maxCapacity - channel.currentCapacity;
  return availableCapacity > 0 ? availableCapacity : 0;
};
// 获取货道列表
const getChannelList = () => {
  getGoodsList(props.innerCode).then((response) => {
    channelList.value = response.data;
    channelList.value.map((channel) => {
      channel.expectCapacity =
        channel.sku !== null
          ? channel.maxCapacity - channel.currentCapacity
          : 0;
    });
  });
};
// 确定货道清单
const ensureDialog = () => {
  cancel();
  channelList.value.forEach((ele) => {
    
    if (ele.sku&&ele.sku.skuId&&ele.expectCapacity>0) {
      detailList.value.push({
        channelCode: ele.channelCode,
        expectCapacity: ele.expectCapacity,
        skuId: ele.skuId,
        skuName: ele.sku ? ele.sku.skuName : '',
        skuImage: ele.sku ? ele.sku.skuImage : '',
      });
    }
  });
  emit('getDetailList', detailList.value);
};
// 关闭 弹层
const cancel = () => {
  visible.value = false;
  detailList.value=[]
  emit('handleClose');
};
</script>
