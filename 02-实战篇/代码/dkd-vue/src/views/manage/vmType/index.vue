<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryRef" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="型号名称" prop="name">
        <el-input
          v-model="queryParams.name"
          placeholder="请输入型号名称"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="Search" @click="handleQuery">搜索</el-button>
        <el-button icon="Refresh" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button
          type="primary"
          plain
          icon="Plus"
          @click="handleAdd"
          v-hasPermi="['manage:vmType:add']"
        >新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="Edit"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['manage:vmType:edit']"
        >修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="Delete"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['manage:vmType:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="Download"
          @click="handleExport"
          v-hasPermi="['manage:vmType:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar v-model:showSearch="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="vmTypeList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="型号名称" align="center" prop="name" />
      <el-table-column label="型号编码" align="center" prop="model" />
      <el-table-column label="设备图片" align="center" prop="image" width="100">
        <template #default="scope">
          <image-preview :src="scope.row.image" :width="50" :height="50"/>
        </template>
      </el-table-column>
      <el-table-column label="货道行" align="center" prop="vmRow" />
      <el-table-column label="货道列" align="center" prop="vmCol" />
      <el-table-column label="设备容量" align="center" prop="channelMaxCapacity" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template #default="scope">
          <el-button link type="primary"  @click="handleUpdate(scope.row)" v-hasPermi="['manage:vmType:edit']">修改</el-button>
          <el-button link type="primary"  @click="handleDelete(scope.row)" v-hasPermi="['manage:vmType:remove']">删除</el-button>
        </template>
      </el-table-column>
    </el-table>
    
    <pagination
      v-show="total>0"
      :total="total"
      v-model:page="queryParams.pageNum"
      v-model:limit="queryParams.pageSize"
      @pagination="getList"
    />

    <!-- 添加或修改设备类型管理对话框 -->
    <el-dialog :title="title" v-model="open" width="500px" append-to-body>
      <el-form ref="vmTypeRef" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="型号名称" prop="name">
          <el-input v-model="form.name" placeholder="请输入型号名称" />
        </el-form-item>
        <el-form-item label="型号编码" prop="model">
          <el-input v-model="form.model" placeholder="请输入型号编码" />
        </el-form-item>
        <el-form-item label="货道数" prop="vmRow">
          <el-input-number :min="1" :max="10" v-model="form.vmRow" placeholder="请输入货道行" /> 行 &nbsp;&nbsp;
          <el-input-number :min="1" :max="10" v-model="form.vmCol" placeholder="请输入货道列" /> 列
        </el-form-item>
        <el-form-item label="设备容量" prop="channelMaxCapacity">
          <el-input-number
            v-model="form.channelMaxCapacity"
            :min="1"
            :max="10"
            placeholder="请输入设备容量"
          />
        </el-form-item>
        <el-form-item label="设备图片" prop="image">
          <image-upload v-model="form.image"/>
        </el-form-item>
      </el-form>
      <template #footer>
        <div class="dialog-footer">
          <el-button type="primary" @click="submitForm">确 定</el-button>
          <el-button @click="cancel">取 消</el-button>
        </div>
      </template>
    </el-dialog>
  </div>
</template>

<script setup name="VmType">
import { listVmType, getVmType, delVmType, addVmType, updateVmType } from "@/api/manage/vmType";

const { proxy } = getCurrentInstance();

const vmTypeList = ref([]);
const open = ref(false);
const loading = ref(true);
const showSearch = ref(true);
const ids = ref([]);
const single = ref(true);
const multiple = ref(true);
const total = ref(0);
const title = ref("");

const data = reactive({
  form: {},
  queryParams: {
    pageNum: 1,
    pageSize: 10,
    name: null,
    model: null,
  },
  rules: {
    name: [
      { required: true, message: "型号名称不能为空", trigger: "blur" }
    ],
    model: [
      { required: true, message: "型号编码不能为空", trigger: "blur" }
    ],
    image: [
      { required: true, message: "设备图片不能为空", trigger: "blur" }
    ],
    vmRow: [
      { required: true, message: "货道行不能为空", trigger: "blur" }
    ],
    vmCol: [
      { required: true, message: "货道列不能为空", trigger: "blur" }
    ],
    channelMaxCapacity: [
      { required: true, message: "设备容量不能为空", trigger: "blur" }
    ]
  }
});

const { queryParams, form, rules } = toRefs(data);

/** 查询设备类型管理列表 */
function getList() {
  loading.value = true;
  listVmType(queryParams.value).then(response => {
    vmTypeList.value = response.rows;
    total.value = response.total;
    loading.value = false;
  });
}

// 取消按钮
function cancel() {
  open.value = false;
  reset();
}

// 表单重置
function reset() {
  form.value = {
    id: null,
    name: null,
    model: null,
    image: null,
    vmRow: null,
    vmCol: null,
    channelMaxCapacity: null
  };
  proxy.resetForm("vmTypeRef");
}

/** 搜索按钮操作 */
function handleQuery() {
  queryParams.value.pageNum = 1;
  getList();
}

/** 重置按钮操作 */
function resetQuery() {
  proxy.resetForm("queryRef");
  handleQuery();
}

// 多选框选中数据
function handleSelectionChange(selection) {
  ids.value = selection.map(item => item.id);
  single.value = selection.length != 1;
  multiple.value = !selection.length;
}

/** 新增按钮操作 */
function handleAdd() {
  reset();
  open.value = true;
  title.value = "添加设备类型管理";
}

/** 修改按钮操作 */
function handleUpdate(row) {
  reset();
  const _id = row.id || ids.value
  getVmType(_id).then(response => {
    form.value = response.data;
    open.value = true;
    title.value = "修改设备类型管理";
  });
}

/** 提交按钮 */
function submitForm() {
  proxy.$refs["vmTypeRef"].validate(valid => {
    if (valid) {
      if (form.value.id != null) {
        updateVmType(form.value).then(response => {
          proxy.$modal.msgSuccess("修改成功");
          open.value = false;
          getList();
        });
      } else {
        addVmType(form.value).then(response => {
          proxy.$modal.msgSuccess("新增成功");
          open.value = false;
          getList();
        });
      }
    }
  });
}

/** 删除按钮操作 */
function handleDelete(row) {
  const _ids = row.id || ids.value;
  proxy.$modal.confirm('是否确认删除设备类型管理编号为"' + _ids + '"的数据项？').then(function() {
    return delVmType(_ids);
  }).then(() => {
    getList();
    proxy.$modal.msgSuccess("删除成功");
  }).catch(() => {});
}

/** 导出按钮操作 */
function handleExport() {
  proxy.download('manage/vmType/export', {
    ...queryParams.value
  }, `vmType_${new Date().getTime()}.xlsx`)
}

getList();
</script>
