<template>
  <el-dialog
    width="630px"
    title="工单配置"
    :close-on-click-modal="false"
    :close-on-press-escape="false"
    v-model="visible"
    append-to-body
    @close="cancel"
    @open="open"
  >
    <el-form
      ref="taskRef"
      :inline="true"
      :model="form"
      :rules="rules"
      label-width="120"
    >
      <el-form-item label="补货警戒线：" prop="alertValue">
        <el-input-number
          v-model="form.alertValue"
          controls-position="right"
          :min="1"
          :max="100"
          placeholder="请输入"
        />
      </el-form-item>
    </el-form>
    <div class="dialog-footer">
      <el-button @click="cancel"> 取消 </el-button>
      <el-button type="primary" @click="submitForm"> 确认 </el-button>
    </div>
  </el-dialog>
</template>
<script setup name="Task">
import { watch } from 'vue';
const { proxy } = getCurrentInstance();
// 接口
import { getJob, setJob } from '@/api/manage/task';
// 从父组件获取数据
const props = defineProps({
  // 弹层显示隐藏
  taskConfigVisible: {
    type: Boolean,
    default: false,
  },
});
// 定义变量
const emit = defineEmits(['handleClose']);
const visible = ref(false);
const data = reactive({
  form: {},
  rules: {
    alertValue: [{ required: true, message: '请输入', trigger: 'blur' }],
  },
});
const { form, rules } = toRefs(data);
watch(
  () => props.taskConfigVisible,
  (val) => {
    if (val) {
      visible.value = val;
    }
  }
);
// 打开弹层
const open = () => {
  getJobData()
};
// 获取获取补货预警值
const getJobData = () => {
  getJob(1).then((response) => {
    const res = response.data;
    form.value = {
      id: res.id,
      alertValue: res.alertValue,
    };
  });
};
// 提交表单
const submitForm = () => {
  proxy.$refs['taskRef'].validate((valid) => {
    setJob(form.value).then((res) => {
      if (res.code === 200) {
        proxy.$modal.msgSuccess('配置成功');
        cancel();
        getJobData()
      }
    });
  });
};
// 关闭弹层
const cancel = () => {
  visible.value = false;
  emit('handleClose');
};
</script>
