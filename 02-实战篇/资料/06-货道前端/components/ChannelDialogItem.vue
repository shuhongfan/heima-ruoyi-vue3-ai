<template>
  <div v-if="channel" class="item">
    <div class="code">
      {{ channel.channelCode }}
    </div>
    <div class="sku">
      <img
        class="img"
        :src="channel.sku&&channel.sku.skuImage
            ? channel.sku.skuImage
            : require('@/assets/vm/default_sku.png')"
      />
      <div class="name" :title="channel.sku ? channel.sku.skuName : '暂无商品'">
        {{ channel.sku ? channel.sku.skuName : '暂无商品' }}
      </div>
    </div>
    <div>
      <el-button
        type="text"
        class="el-button--primary-text"
        @click="handleSetClick"
      >
        添加
      </el-button>
      <el-button
        type="text"
        class="el-button--danger-text"
        :disabled="!channel.sku ? true : false"
        @click="handleRemoveClick"
      >
        删除
      </el-button>
    </div>
  </div>
</template>
<script setup>
import { require } from '@/utils/validate';
const props = defineProps({
  currentIndex: {
    type: Number,
    default: 0,
  },
  channel: {
    type: Object,
    default: () => {},
  },
});
const emit = defineEmits(['openSetSkuDialog','openRemoveSkuDialog']);
// 添加商品
const handleSetClick = () => {
  emit('openSetSkuDialog', props.currentIndex, props.channel.channelCode);
};
// 删除产品
const handleRemoveClick = () => {
  emit('openRemoveSkuDialog', props.currentIndex, props.channel.channelCode);
};
</script>
<style scoped lang="scss">
@import '@/assets/styles/variables.module.scss';
.item {
  position: relative;
  width: 150px;
  height: 180px;
  background: $base-menu-light-background;
  box-shadow: 0px 2px 4px 0px rgba(0, 0, 0, 0.06);
  border-radius: 4px;
  text-align: center;

  .code {
    position: absolute;
    top: 10px;
    left: 0;
    width: 43px;
    height: 23px;
    line-height: 23px;
    background: #829bed;
    border-radius: 0px 10px 10px 0px;
    font-size: 12px;
    color: $base-menu-light-background;
  }

  .sku {
    height: 135px;
    padding-top: 16px;
    background-color: #f6f7fb;
    border-radius: 4px;

    .img {
      display: inline-block;
      width: 84px;
      height: 78px;
      margin-bottom: 10px;
      object-fit: contain;
    }

    .name {
      padding: 0 16px;
      overflow: hidden;
      white-space: nowrap;
      text-overflow: ellipsis;
    }
  }
}
</style>
