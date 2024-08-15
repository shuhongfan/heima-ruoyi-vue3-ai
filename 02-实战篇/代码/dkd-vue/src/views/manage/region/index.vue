<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryRef" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="区域名称" prop="regionName">
        <el-input
          v-model="queryParams.regionName"
          placeholder="请输入区域名称"
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
          v-hasPermi="['manage:region:add']"
        >新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="Edit"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['manage:region:edit']"
        >修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="Delete"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['manage:region:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="Download"
          @click="handleExport"
          v-hasPermi="['manage:region:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar v-model:showSearch="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="regionList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="序号" type="index" width="50" align="center" prop="id" />
      <el-table-column label="区域名称" align="center" prop="regionName" />
      <el-table-column label="点位数" align="center" prop="nodeCount" />
      <el-table-column label="备注说明" align="center" prop="remark" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template #default="scope">
          <el-button link type="primary"  @click="getRegionInfo(scope.row)" v-hasPermi="['manage:node:list']">查看详情</el-button>
          <el-button link type="primary"  @click="handleUpdate(scope.row)" v-hasPermi="['manage:region:edit']">修改</el-button>
          <el-button link type="primary"  @click="handleDelete(scope.row)" v-hasPermi="['manage:region:remove']">删除</el-button>
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

    <!-- 添加或修改区域管理对话框 -->
    <el-dialog :title="title" v-model="open" width="500px" append-to-body>
      <el-form ref="regionRef" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="区域名称" prop="regionName">
          <el-input v-model="form.regionName" placeholder="请输入区域名称" />
        </el-form-item>
        <el-form-item label="备注说明" prop="remark">
          <el-input v-model="form.remark" type="textarea" placeholder="请输入内容" />
        </el-form-item>
      </el-form>
      <template #footer>
        <div class="dialog-footer">
          <el-button type="primary" @click="submitForm">确 定</el-button>
          <el-button @click="cancel">取 消</el-button>
        </div>
      </template>
    </el-dialog>

    <!-- 查看详情对话框 -->
     <el-dialog title="区域详情" v-model="regionInfoOpen" width="500px" append-to-body>
      <el-form-item label="区域名称" prop="regionName">
          <el-input v-model="form.regionName" placeholder="请输入区域名称" disabled />
        </el-form-item>
        <label>包含点位：</label>
    <el-table :data="nodeList" >
      <el-table-column label="序号" type="index" width="50" align="center" prop="id" />
      <el-table-column label="点位名称" align="center" prop="nodeName" />
      <el-table-column label="设备数量" align="center" prop="vmCount" />
    </el-table>
    </el-dialog>
  </div>
</template>

<script setup name="Region">
import { listRegion, getRegion, delRegion, addRegion, updateRegion } from "@/api/manage/region";
import{listNode} from "@/api/manage/node";
import{loadAllParams} from "@/api/page";

const { proxy } = getCurrentInstance();

const regionList = ref([]);
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
    regionName: null,
  },
  rules: {
    regionName: [
      { required: true, message: "区域名称不能为空", trigger: "blur" }
    ],
    remark: [
      { required: true, message: "备注说明不能为空", trigger: "blur" }
    ]
  }
});

const { queryParams, form, rules } = toRefs(data);

/** 查询区域管理列表 */
function getList() {
  loading.value = true;
  listRegion(queryParams.value).then(response => {
    regionList.value = response.rows;
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
    regionName: null,
    createTime: null,
    updateTime: null,
    createBy: null,
    updateBy: null,
    remark: null
  };
  proxy.resetForm("regionRef");
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
  title.value = "添加区域管理";
}

/** 修改按钮操作 */
function handleUpdate(row) {
  reset();
  const _id = row.id || ids.value
  getRegion(_id).then(response => {
    form.value = response.data;
    open.value = true;
    title.value = "修改区域管理";
  });
}

/* 查看详情操作按钮 */
const nodeList=ref([]);
const regionInfoOpen=ref(false);
function getRegionInfo(row){
  // 查询区域信息
  reset();
  const _id = row.id 
  getRegion(_id).then(response => {
    form.value = response.data;
  });
  // 查看点位列表
  loadAllParams.regionId=row.id
  listNode(loadAllParams).then(response => {
    nodeList.value = response.rows;
  });
  regionInfoOpen.value=true;
}

/** 提交按钮 */
function submitForm() {
  proxy.$refs["regionRef"].validate(valid => {
    if (valid) {
      if (form.value.id != null) {
        updateRegion(form.value).then(response => {
          proxy.$modal.msgSuccess("修改成功");
          open.value = false;
          getList();
        });
      } else {
        addRegion(form.value).then(response => {
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
  proxy.$modal.confirm('是否确认删除区域管理编号为"' + _ids + '"的数据项？').then(function() {
    return delRegion(_ids);
  }).then(() => {
    getList();
    proxy.$modal.msgSuccess("删除成功");
  }).catch(() => {});
}

/** 导出按钮操作 */
function handleExport() {
  proxy.download('manage/region/export', {
    ...queryParams.value
  }, `region_${new Date().getTime()}.xlsx`)
}

getList();
</script>
