<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryRef" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="人员名称" prop="userName">
        <el-input
          v-model="queryParams.userName"
          placeholder="请输入人员名称"
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
          v-hasPermi="['manage:emp:add']"
        >新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="Edit"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['manage:emp:edit']"
        >修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="Delete"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['manage:emp:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="Download"
          @click="handleExport"
          v-hasPermi="['manage:emp:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar v-model:showSearch="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="empList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="序号" type="index" width="50" align="center" prop="id" />
      <el-table-column label="人员名称" align="center" prop="userName" />
      <el-table-column label="归属区域" align="center" prop="regionName" />
      <el-table-column label="角色名称" align="center" prop="roleName" />
      <el-table-column label="联系电话" align="center" prop="mobile" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template #default="scope">
          <el-button link type="primary"  @click="handleUpdate(scope.row)" v-hasPermi="['manage:emp:edit']">修改</el-button>
          <el-button link type="primary"  @click="handleDelete(scope.row)" v-hasPermi="['manage:emp:remove']">删除</el-button>
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

    <!-- 添加或修改人员列表对话框 -->
    <el-dialog :title="title" v-model="open" width="500px" append-to-body>
      <el-form ref="empRef" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="人员名称" prop="userName">
          <el-input v-model="form.userName" placeholder="请输入人员名称" />
        </el-form-item>
        <el-form-item label="角色" prop="roleId">
          <!-- <el-input v-model="form.roleId" placeholder="请输入角色id" /> -->
           <el-select v-model="form.roleId" placeholder="请选择角色">
            <el-option
              v-for="item in roleList"
              :key="item.roleId"
              :label="item.roleName"
              :value="item.roleId"
            />
           </el-select>
        </el-form-item>
        <el-form-item label="联系电话" prop="mobile">
          <el-input v-model="form.mobile" placeholder="请输入联系电话" />
        </el-form-item>
        <el-form-item label="创建时间" prop="mobile" v-if="form.id!=null">
          {{form.createTime}}
        </el-form-item>
        <el-form-item label="负责区域" prop="regionId">
          <!-- <el-input v-model="form.regionId" placeholder="请输入所属区域Id" /> -->
           <el-select v-model="form.regionId" placeholder="请选择负责区域">
            <el-option
              v-for="item in regionList"
              :key="item.id"
              :label="item.regionName"
              :value="item.id"
            />
           </el-select>
        </el-form-item>
        <el-form-item label="员工头像" prop="image">
          <image-upload v-model="form.image"/>
        </el-form-item>
        <el-form-item label="是否启用" prop="status">
          <el-radio-group v-model="form.status">
            <el-radio
              v-for="dict in emp_status"
              :key="dict.value"
              :label="parseInt(dict.value)"
            >{{dict.label}}</el-radio>
          </el-radio-group>
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

<script setup name="Emp">
import { listEmp, getEmp, delEmp, addEmp, updateEmp } from "@/api/manage/emp";
import{listRole} from "@/api/manage/role";
import{loadAllParams} from "@/api/page";
import{listRegion} from "@/api/manage/region";

const { proxy } = getCurrentInstance();
const { emp_status } = proxy.useDict('emp_status');

const empList = ref([]);
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
    userName: null,
    regionId: null,
    roleId: null,
    roleCode: null,
    status: null,
  },
  rules: {
    userName: [
      { required: true, message: "人员名称不能为空", trigger: "blur" }
    ],
    regionId: [
      { required: true, message: "所属区域Id不能为空", trigger: "blur" }
    ],
    roleId: [
      { required: true, message: "角色id不能为空", trigger: "blur" }
    ],
    mobile: [
      { required: true, message: "联系电话不能为空", trigger: "blur" }
    ],
    image: [
      { required: true, message: "员工头像不能为空", trigger: "blur" }
    ],
    status: [
      { required: true, message: "是否启用不能为空", trigger: "change" }
    ],
  }
});

const { queryParams, form, rules } = toRefs(data);

/** 查询人员列表列表 */
function getList() {
  loading.value = true;
  listEmp(queryParams.value).then(response => {
    empList.value = response.rows;
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
    userName: null,
    regionId: null,
    regionName: null,
    roleId: null,
    roleCode: null,
    roleName: null,
    mobile: null,
    image: null,
    status: null,
    createTime: null,
    updateTime: null
  };
  proxy.resetForm("empRef");
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
  title.value = "添加人员列表";
}

/** 修改按钮操作 */
function handleUpdate(row) {
  reset();
  const _id = row.id || ids.value
  getEmp(_id).then(response => {
    form.value = response.data;
    open.value = true;
    title.value = "修改人员列表";
  });
}

/** 提交按钮 */
function submitForm() {
  proxy.$refs["empRef"].validate(valid => {
    if (valid) {
      if (form.value.id != null) {
        updateEmp(form.value).then(response => {
          proxy.$modal.msgSuccess("修改成功");
          open.value = false;
          getList();
        });
      } else {
        addEmp(form.value).then(response => {
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
  proxy.$modal.confirm('是否确认删除人员列表编号为"' + _ids + '"的数据项？').then(function() {
    return delEmp(_ids);
  }).then(() => {
    getList();
    proxy.$modal.msgSuccess("删除成功");
  }).catch(() => {});
}

/** 导出按钮操作 */
function handleExport() {
  proxy.download('manage/emp/export', {
    ...queryParams.value
  }, `emp_${new Date().getTime()}.xlsx`)
}
/* 查询角色列表 */
const roleList=ref([]);
function getRoleList() {
  listRole(loadAllParams).then(response => {
    roleList.value = response.rows;
  });
}
/* 查询区域列表 */
const regionList=ref([]);
function getRegionList() {
  listRegion(loadAllParams).then(response => {
    regionList.value = response.rows;
  });
}
getRegionList();
getRoleList();
getList();
</script>
