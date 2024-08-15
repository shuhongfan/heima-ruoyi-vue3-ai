<template>
  <div class="week-month-year">
    <div
      v-for="(item, index) in groupList"
      :key="index"
      :class="'item ' + (checkedIndex === index ? 'is-checked' : '')"
      @click="handleChange(index)"
    >
      {{ item.label }}
    </div>
  </div>
</template>
<script setup>
import { onMounted } from 'vue';
// 定义变量
const groupList = ref([
  { label: '周', value: 'week' },
  { label: '月', value: 'month' },
  { label: '年', value: 'year' },
]);
//触发日期
const handleChange = (index)=>{
    if(checkedIndex.value===index){
        return
    }
    checkedIndex.value = index
    emit('handleChange',groupList.value[index].value)
}
</script>
<style lang="scss" scoped>
@import '@/assets/styles/variables.module.scss';

.week-month-year {
  display: flex;
  justify-content: center;
  align-items: center;
  width: 129px;
  height: 34px;
  background: rgba(233, 243, 255, 0.37);
  border-radius: 10px;

  .item {
    display: flex;
    justify-content: center;
    align-items: center;
    width: 37px;
    height: 25px;
    font-size: 14px;
    color: #9CA3B4;
    cursor: pointer;
  }

  .is-checked {
    background: #FFFFFF;
    box-shadow: 0px 0px 4px 0px rgba(0, 0, 0, 0.11);
    border-radius: 7px;
    font-weight: 600;
    color: $--color-text-primary;
  }
}
</style>
