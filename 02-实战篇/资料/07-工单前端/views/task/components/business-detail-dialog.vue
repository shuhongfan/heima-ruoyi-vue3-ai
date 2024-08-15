<template>
  <el-dialog
    width="630px"
    title="工单详情"
    :close-on-click-modal="false"
    :close-on-press-escape="false"
    v-model="visible"
    @close="cancel"
  >
    <div class="task-status">
      <img
        v-if="taskDada.taskStatus"
        class="icon"
        :src="require('@/assets/task/icon_' + taskDada.taskStatus + '.png')"
      />
      <span class="status">
        <label v-if="taskDada.taskStatus === 1">代办</label>
        <label v-else-if="taskDada.taskStatus === 2">进行</label>
        <label v-else-if="taskDada.taskStatus === 3">取消</label>
        <label v-else>完成</label>
      </span>
      <img
        v-if="taskDada.taskStatus"
        class="pic"
        :src="require('@/assets/task/pic_' + taskDada.taskStatus + '.png')"
      />
    </div>
    <el-form label-width="120">
      <el-row>
        <el-col :span="12">
          <el-form-item label="设备编号：">
            {{ taskDada.innerCode }}
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="创建日期：">
            {{ taskDada.createTime }}
          </el-form-item>
        </el-col>
        <el-col v-if="taskDada.taskStatus === 3" :span="12">
          <el-form-item label="取消日期：">
            {{ taskDada.updateTime ? taskDada.updateTime : '--' }}
          </el-form-item>
        </el-col>
        <el-col v-if="taskDada.taskStatus === 4" :span="12">
          <el-form-item label="完成日期：">
            {{ taskDada.updateTime ? taskDada.updateTime : '--' }}
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="运营人员：">
            {{ taskDada.userName }}
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="工单类型：">
            <span v-if="taskDada.productTypeId === 1">投放工单</span>
            <span v-else-if="taskDada.productTypeId === 2">补货工单</span>
            <span v-else-if="taskDada.productTypeId === 3">维修工单</span>
            <span v-else>撤机工单</span>
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="补货数量：" prop="details">
            <el-button type="text" @click="channelDetails">
              <el-icon><List /></el-icon>补货清单
            </el-button>
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="工单方式：">
            {{ taskDada.createType === 0 ? '自动' : '手动' }}
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item
            :label="taskDada.taskStatus === 3 ? '取消原因：' : '备注：'"
          >
            <div class="desc">
              {{ taskDada.desc }}
            </div>
          </el-form-item>
        </el-col>
        <el-col v-if="taskDada.productTypeId === 1" :span="12">
          <el-form-item label="定位：">
            <div class="addr">
              <el-icon><Location /></el-icon><span>{{ taskDada.addr }}</span>
            </div>
          </el-form-item>
        </el-col>
      </el-row>
    </el-form>
    <div v-if="taskDada.taskStatus !== 4" class="dialog-footer">
      <el-button
        v-if="taskDada.taskStatus === 1 || taskDada.taskStatus === 2"
        @click="handleCancelTask"
      >
        取消工单
      </el-button>
      <el-button
        type="primary"
        v-else-if="taskDada.taskStatus === 3"
        @click="handleCreateTask"
      >
        重新创建
      </el-button>
    </div>
    <!-- 货道列表弹层 -->
    <BusinessReplenishmentListDialog
      :listVisible="listVisible"
      :detailData="detailData"
      @handleClose="channelCloseDetails"
    ></BusinessReplenishmentListDialog>
    <!-- end -->
  </el-dialog>
</template>

<script setup name="Task">
import { watch } from 'vue';
import { require } from '@/utils/validate';
import { ElMessageBox } from 'element-plus';
import { cancelTaskType } from '@/api/manage/taskType';
// 组件
import BusinessReplenishmentListDialog from './business-replenishment-list-dialog.vue';
// 从父组件获取数据
const props = defineProps({
  // 工单详情
  taskDada: {
    type: Object,
    default: () => {},
  },
  // 获取货道列表
  detailData:{
    type: Object,
    default: () => [],
  },
  // 详情弹层显示隐藏
  detailVisible: {
    type: Boolean,
    default: false,
  },
  // 工单id
  taskId: {
    type: Number,
    default: '',
  },
});
// 定义变量
const emit = defineEmits(['handleClose', 'handleAdd', 'getList']);
const visible = ref(false);
const listVisible = ref(false); //货道弹层
watch(
  () => props.detailVisible,
  (val) => {
    if (val) {
      visible.value = val;
    }
  }
);
// 取消工单
const handleCancelTask = () => {
  ElMessageBox.confirm('取消工单后，将不能恢复，是否确认取消？', {
    confirmButtonText: '确定',
    cancelButtonText: '取消',
    type: 'warning',
  })
    .then(() => {
      const obj = {
        taskId: props.taskId,
        desc: '后台工作人员取消',
      };
      cancelTaskType(obj).then((res) => {
        if (res.code === 200) {
          emit('getList');
          cancel();
        }
      });
    })
    .catch(() => {});
};
// 关闭 弹层
const cancel = () => {
  visible.value = false;
  emit('handleClose');
};
// 重新创建
const handleCreateTask = () => {
  cancel(); //关闭详情窗口
  emit('handleAdd', 'anew'); //打开新增窗口
};
// 打开货道列表弹层
const channelDetails = () => {
  listVisible.value = true;
};
// 关闭货道列表 弹层
const channelCloseDetails = () => {
  listVisible.value = false;
};
</script>
