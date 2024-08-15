<template>
  <div>
    <el-row :gutter="15">
      <el-form ref="formRef" :model="formData" :rules="rules" size="default" label-width="100px">
        <el-col :span="24">
          <el-row gutter="15">
            <el-col :span="10">
              <el-form-item label="课程编号" prop="code">
                <el-input v-model="formData.code" type="text" placeholder="请输入课程编号" clearable
                  :style="{width: '100%'}"></el-input>
              </el-form-item>
            </el-col>
            <el-col :span="10">
              <el-form-item label="课程学科" prop="subject">
                <el-select v-model="formData.subject" placeholder="请选择课程学科" clearable
                  :style="{width: '100%'}">
                  <el-option v-for="(item, index) in subjectOptions" :key="index" :label="item.label"
                    :value="item.value" :disabled="item.disabled"></el-option>
                </el-select>
              </el-form-item>
            </el-col>
          </el-row>
        </el-col>
        <el-col :span="24">
          <el-row gutter="15">
            <el-col :span="10">
              <el-form-item label="课程名称" prop="field106">
                <el-input v-model="formData.field106" type="text" placeholder="请输入课程名称" clearable
                  :style="{width: '100%'}"></el-input>
              </el-form-item>
            </el-col>
            <el-col :span="10">
              <el-form-item label="课程价格" prop="field107">
                <el-input v-model="formData.field107" type="text" placeholder="请输入课程价格" clearable
                  :style="{width: '100%'}"></el-input>
              </el-form-item>
            </el-col>
          </el-row>
        </el-col>
        <el-col :span="24">
          <el-row gutter="15">
            <el-col :span="10">
              <el-form-item label="适用人群" prop="field109">
                <el-select v-model="formData.field109" placeholder="请选择适用人群" clearable
                  :style="{width: '100%'}">
                  <el-option v-for="(item, index) in field109Options" :key="index" :label="item.label"
                    :value="item.value" :disabled="item.disabled"></el-option>
                </el-select>
              </el-form-item>
            </el-col>
            <el-col :span="10">
              <el-form-item label="课程有效期" prop="field110">
                <el-date-picker type="daterange" v-model="formData.field110" format="YYYY-MM-DD"
                  value-format="YYYY-MM-DD" :style="{width: '100%'}" start-placeholder="开始日期"
                  end-placeholder="结束日期" range-separator="至" clearable></el-date-picker>
              </el-form-item>
            </el-col>
          </el-row>
        </el-col>
        <el-col :span="24">
          <el-row gutter="15">
            <el-col :span="10">
              <el-form-item label="课程封面" prop="field112" required>
                <el-upload ref="field112" :file-list="field112fileList" :action="field112Action"
                  :before-upload="field112BeforeUpload">
                  <el-button size="small" type="primary" icon="el-icon-upload">点击上传</el-button>
                </el-upload>
              </el-form-item>
            </el-col>
            <el-col :span="10">
              <el-form-item label="推荐指数" prop="field113">
                <el-rate v-model="formData.field113"></el-rate>
              </el-form-item>
            </el-col>
          </el-row>
        </el-col>
        <el-col :span="23">
          <el-row gutter="15">
            <el-col :span="18">
              <el-form-item label="课程介绍" prop="field115">
                <el-input v-model="formData.field115" type="textarea" placeholder="请输入课程介绍"
                  :autosize="{minRows: 4, maxRows: 4}" :style="{width: '100%'}"></el-input>
              </el-form-item>
            </el-col>
          </el-row>
        </el-col>
        <el-col :span="24">
          <el-form-item>
            <el-button type="primary" @click="submitForm">提交</el-button>
            <el-button @click="resetForm">重置</el-button>
          </el-form-item>
        </el-col>
      </el-form>
    </el-row>
  </div>
</template>
<script setup>
import {
  ElMessage
}
from 'element-plus'
const formRef = ref()
const data = reactive({
  formData: {
    code: undefined,
    subject: undefined,
    field106: undefined,
    field107: undefined,
    field109: undefined,
    field110: null,
    field112: null,
    field113: 0,
    field115: undefined,
  },
  rules: {
    code: [{
      required: true,
      message: '请输入课程编号',
      trigger: 'blur'
    }],
    subject: [{
      required: true,
      message: '请选择课程学科',
      trigger: 'change'
    }],
    field106: [{
      required: true,
      message: '请输入课程名称',
      trigger: 'blur'
    }],
    field107: [{
      required: true,
      message: '请输入课程价格',
      trigger: 'blur'
    }],
    field109: [{
      required: true,
      message: '请选择适用人群',
      trigger: 'change'
    }],
    field110: [{
      required: true,
      message: '课程有效期不能为空',
      trigger: 'change'
    }],
    field113: [{
      required: true,
      message: '推荐指数不能为空',
      trigger: 'change'
    }],
    field115: [{
      required: true,
      message: '请输入课程介绍',
      trigger: 'blur'
    }],
  }
})
const {
  formData,
  rules
} = toRefs(data)
const subjectOptions = ref([{
  "label": "选项一",
  "value": 1
}, {
  "label": "选项二",
  "value": 2
}])
const field109Options = ref([{
  "label": "选项一",
  "value": 1
}, {
  "label": "选项二",
  "value": 2
}])
// 上传请求路径
const field112Action = ref('https://jsonplaceholder.typicode.com/posts/')
// 上传文件列表
const field112fileList = ref([])
/**
 * @name: 上传之前的文件判断
 * @description: 上传之前的文件判断，判断文件大小文件类型等
 * @param {*} file
 * @return {*}
 */
function field112BeforeUpload(file) {
  let isRightSize = file.size / 1024 / 1024 < 2
  if (!isRightSize) {
    ElMessage.error('文件大小超过 2MB')
  }
  return isRightSize
}
/**
 * @name: 表单提交
 * @description: 表单提交方法
 * @return {*}
 */
function submitForm() {
  formRef.value.validate((valid) => {
    if (!valid) return
    // TODO 提交表单
  })
}
/**
 * @name: 表单重置
 * @description: 表单重置方法
 * @return {*}
 */
function resetForm() {
  formRef.value.resetFields()
}

</script>
<style>
.el-upload__tip {
  line-height: 1.2;
}

.el-rate {
  display: inline-block;
  vertical-align: text-top;
}

</style>
