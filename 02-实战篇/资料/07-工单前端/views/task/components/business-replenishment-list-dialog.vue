<template>
  <el-dialog
    width="630px"
    title="补货详情"
    :close-on-click-modal="false"
    :close-on-press-escape="false"
    v-model="visible"
    append-to-body
    @close="cancel"
    @open="open"
  >
    <el-scrollbar
      class="scrollbar"
      style="height: 330px;"
    >
      <el-table
        style="width: 552px;margin: 0 auto;"
        :data="detailData"
        :header-cell-style="{'line-height': '1.15', 'padding': '10px 0 9px', 'background': '#F3F6FB', 'font-weight': '500', 'text-align': 'left', 'color': '#666666'}"
        :cell-style="{'height': '44px', 'padding': '2px 0', 'text-align': 'left', 'color': '#666666'}"
      >
        <el-table-column label="货道编号">
          <template #default="scope">
            {{ scope.row.channelCode }}
          </template>
        </el-table-column>

        <el-table-column label="商品">
          <template #default="scope">
            {{ scope.row.skuName?scope.row.skuName:'--' }}
          </template>
        </el-table-column>

        <el-table-column label="补货数量">
          <template #default="scope">
            {{ scope.row.expectCapacity }}
          </template>
        </el-table-column>
      </el-table>
    </el-scrollbar>
  </el-dialog>
</template>

<script setup name="Task">
import { watch } from 'vue';
import { getTaskDetails } from '@/api/manage/task';
// 接口
// 获取货道接口
import { getGoodsList } from '@/api/manage/channel';
// 从父组件获取数据
const props = defineProps({
  // 详情弹层显示隐藏
  listVisible: {
    type: Boolean,
    default: false,
  },
  // 获取货道列表
  detailData:{
    type: Object,
    default: () => [],
  },
});
// 定义变量
const emit = defineEmits(['handleClose']);
const visible = ref(false);
watch(
  () => props.listVisible,
  (val) => {
    if (val) {
      visible.value = val;
    }
  }
);
// 关闭 弹层
const cancel = () => {
  visible.value = false;
  emit('handleClose');
};
</script>
