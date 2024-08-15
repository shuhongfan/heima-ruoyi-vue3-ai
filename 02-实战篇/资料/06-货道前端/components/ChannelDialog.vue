<template>
  <!-- 货道弹层 -->
  <el-dialog
    width="940px"
    title="货道设置"
    v-model="visible"
    :close-on-click-modal="false"
    :close-on-press-escape="false"
    @open="handleGoodOpen"
    @close="handleGoodcClose"
  >
    <div class="vm-config-channel-dialog-wrapper">
      <div class="channel-basic">
        <span class="vm-row">货道行数：{{ vmType.vmRow }}</span>
        <span class="vm-col">货道列数：{{ vmType.vmCol }}</span>
        <span class="channel-max-capacity"
          >货道容量（个）：{{ vmType.channelMaxCapacity }}</span
        >
      </div>
      <el-scrollbar ref="scroll" v-loading="listLoading" class="scrollbar">
        <el-row
          v-for="vmRowIndex in vmType.vmRow"
          :key="vmRowIndex"
          type="flex"
          :gutter="16"
          class="space"
        >
          <el-col
            v-for="vmColIndex in vmType.vmCol"
            :key="vmColIndex"
            :span="vmType.vmCol <= 5 ? 5 : 12"
          >
            <ChannelDialogItem
              :current-index="computedCurrentIndex(vmRowIndex, vmColIndex)"
              :channel="channels[computedCurrentIndex(vmRowIndex, vmColIndex)]"
              @openSetSkuDialog="openSetSkuDialog"
              @openRemoveSkuDialog="openRemoveSkuDialog"
            >
            </ChannelDialogItem>
          </el-col>
        </el-row>
      </el-scrollbar>
      <el-icon
        v-if="vmType.vmCol > 5"
        class="arrow arrow-left"
        :class="scrollStatus === 'LEFT' ? 'disabled' : ''"
        @click="handleClickPrevButton"
        ><ArrowLeft
      /></el-icon>
      <el-icon
        v-if="vmType.vmCol > 5"
        class="arrow arrow-right"
        :class="scrollStatus === 'RIGHT' ? 'disabled' : ''"
        @click="handleClickNextButton"
        ><ArrowRight
      /></el-icon>
    </div>
    <div class="dialog-footer">
      <el-button
        type="primary"
        class="el-button--primary1"
        @click="handleClick"
      >
        确认
      </el-button>
    </div>

    <!-- 商品选择 -->
    <el-dialog
      width="858px"
      title="选择商品"
      v-model="skuDialogVisible"
      :close-on-click-modal="false"
      :close-on-press-escape="false"
      append-to-body
      @open="handleListOpen"
      @close="handleListClose"
    >
      <div class="vm-select-sku-dialog-wrapper">
        <!-- 搜索区 -->
        <el-form
          ref="form"
          class="search"
          :model="listQuery"
          :label-width="formLabelWidth"
        >
          <el-form-item label="商品名称：">
            <el-row type="flex" justify="space-between">
              <el-col>
                <el-input
                  v-model="listQuery.skuName"
                  placeholder="请输入"
                  clearable
                  class="sku-name"
                  @input="resetPageIndex"
                />
              </el-col>
              <el-col>
                <el-button
                  type="primary"
                  class="el-button--primary1"
                  @click="handleListOpen"
                >
                  <el-icon><Search /></el-icon>&nbsp;&nbsp;查询
                </el-button>
              </el-col>
            </el-row>
          </el-form-item>
        </el-form>
        <el-scrollbar
          ref="scroll2"
          v-loading="listSkuLoading"
          class="scrollbar"
        >
          <el-row v-loading="listSkuLoading" :gutter="20">
            <el-col
              v-for="(item, index) in listSkuData.rows"
              :key="index"
              :span="5"
            >
              <div class="item">
                <!-- TODO: 只有一行的时候考虑 -->
                <div
                  class="sku"
                  :class="index < 5 ? 'space' : ''"
                  @click="handleCurrentChange(index)"
                >
                  <img
                    v-show="currentRow.skuId === item.skuId"
                    class="selected"
                    src="@/assets/vm/selected.png"
                  />
                  <img class="img" :src="item.skuImage" />
                  <div class="name" :title="item.skuName">
                    {{ item.skuName }}
                  </div>
                </div>
              </div>
            </el-col>
          </el-row>
        </el-scrollbar>
        <el-icon
          v-if="pageCount > 1"
          class="arrow arrow-left"
          :class="pageCount === 1 ? 'disabled' : ''"
          @click="handleClickPrev"
          ><ArrowLeft
        /></el-icon>
        <el-icon
          v-if="pageCount > 1"
          class="arrow arrow-right"
          :class="listQuery.pageIndex === pageCount ? 'disabled' : ''"
          @click="handleClickNext"
          ><ArrowRight
        /></el-icon>
      </div>
      <div class="dialog-footer">
        <el-button
          type="primary"
          class="el-button--primary1"
          @click="handleSelectClick"
        >
          确认
        </el-button>
      </div>
    </el-dialog>
    <!-- end -->
  </el-dialog>
  <!-- end -->
</template>
<script setup>
import { require } from '@/utils/validate';
const { proxy } = getCurrentInstance();
// 滚动插件
import { ElScrollbar } from 'element-plus';
// 接口
import {
  getGoodsList,
  getGoodsType,
  channelConfig,
} from '@/api/manage/channel';
import { listSku } from '@/api/manage/sku';
// 内部组件
import ChannelDialogItem from './ChannelDialogItem.vue';
import { watch } from 'vue';
// 获取父组件参数
const props = defineProps({
  //  弹层隐藏显示
  goodVisible: {
    type: Boolean,
    default: false,
  },
  //   触发的货道信息
  goodData: {
    type: Object,
    default: () => {},
  },
});
// 获取父组件的方法
const emit = defineEmits(['handleCloseGood']);
// ******定义变量******
const visible = ref(false); //货道弹层显示隐藏
const scrollStatus = ref('LEFT');
const listLoading = ref(false);
const vmType = ref({}); //获取货道基本信息
const channels = ref({}); //货道数据
const scroll = ref(null); //滚动条ref
// 监听货道弹层显示/隐藏
watch(
  () => props.goodVisible,
  (val) => {
    visible.value = val;
  }
);
// ******定义方法******
// 获取货道基本信息
const handleGoodOpen = () => {
  getVmType();
  channelList();
};
// 获取货道基本信息
const getVmType = async () => {
  const { data } = await getGoodsType(props.goodData.vmTypeId);
  vmType.value = data;
};
// 获取货道列表
const channelList = async () => {
  listLoading.value = true;
  const { data } = await getGoodsList(props.goodData.innerCode);
  channels.value = data;
  listLoading.value = false;
};
const computedCurrentIndex = (vmRowIndex, vmColIndex) => {
  return (vmRowIndex - 1) * vmType.value.vmCol + vmColIndex - 1;
};
// 关闭货道弹窗

const handleGoodcClose = () => {
    visible.value = false
    emit('handleCloseGood');
};
const handleClickPrevButton = () => {
  scroll.value.wrapRef.scrollLeft = 0;
  scrollStatus.value = 'LEFT';
};

const handleClickNextButton = () => {
  scroll.value.wrapRef.scrollLeft = scroll.value.wrapRef.scrollWidth;
  scrollStatus.value = 'RIGHT';
};
const currentIndex = ref(0);
const channelCode = ref('');
const skuDialogVisible = ref(false); //添加商品弹层
// 删除选中的商品
const openRemoveSkuDialog = (index, code) => {
  currentIndex.value = index;
  channelCode.value = code;
  channels.value[currentIndex.value].skuId = '0';
  channels.value[currentIndex.value].sku = undefined;
};
// 添加商品
const listQuery = ref({
  pageIndex: 1,
  pageSize: 10,
}); //搜索商品
const listSkuLoading = ref(false); //商品列表loading
const listSkuData = ref({}); //商品数据
const currentRow = ref({});
const pageCount = ref(0); //总页数
const channelModelView = ref({});
// 商品弹层列表
const handleListOpen = async () => {
  listSkuLoading.value = true;
  listQuery.value.skuName = listQuery.value.skuName || undefined;
  const data = await listSku(listQuery.value);
  listSkuData.value = data;
  pageCount.value = Math.ceil(data.total / 10);
  listSkuLoading.value = false;
};
// 打开商品选择弹层
const openSetSkuDialog = (index, code) => {
  currentIndex.value = index;
  channelCode.value = code;
  skuDialogVisible.value = true;
};
// 关闭商品详情
const handleListClose = () => {
  skuDialogVisible.value = false;
};
// 商品上一页
const handleClickPrev = () => {
  if (listQuery.value.pageIndex === 1) {
    return;
  }
  listQuery.value.pageIndex--;
  handleListOpen();
};
// 商品下一页
const handleClickNext = () => {
  if (listQuery.value.pageIndex === pageCount.value) {
    return;
  }
  listQuery.value.pageIndex++;
  handleListOpen();
};
// 搜索
const resetPageIndex = () => {
  listQuery.value.pageIndex = 1;
  handleListOpen();
};
// 商品选择
const handleCurrentChange = (i) => {
  // TODO：点击取消选中功能
  currentRow.value = listSkuData.value.rows[i];
};
// 确认商品选择
const handleSelectClick = (sku) => {
  handleListClose();
  channels.value[currentIndex.value].skuId = currentRow.value.skuId;
  channels.value[currentIndex.value].sku = {
    skuName: currentRow.value.skuName,
    skuImage: currentRow.value.skuImage,
  };
};
// 确认货道提交
const handleClick = async () => {
  channelModelView.value.innerCode = props.goodData.innerCode;
  channelModelView.value.channelList = channels.value.map((item) => {
    return {
      innerCode: props.goodData.innerCode,
      channelCode: item.channelCode,
      skuId: item.skuId,
    };
  });
  const res = await channelConfig(channelModelView.value);
  if (res.code === 200) {
    proxy.$modal.msgSuccess('操作成功');
    visible.value = false
    emit('handleCloseGood');
  }
};
</script>
// <style lang="scss" scoped src="../index.scss"></style>
