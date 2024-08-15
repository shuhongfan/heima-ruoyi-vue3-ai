<template>
  <div class="box sku-sale-collect">
    <div class="header">
      <div class="title">
        销售数据<span class="sub-title"
          >{{ datePickerFormat[0] }} ~ {{ datePickerFormat[1] }}</span
        >
      </div>
      <common-week-month-year @handleChange="handleRadioGroupSelChange" />
    </div>
    <div class="charts">
      <sku-sale-collect-line-chart
        id="amount-collect"
        title="销售额趋势图"
        :chart-option="lineChartOption"
      />
      <sku-sale-collect-bar-chart
        id="region-collect"
        title="销售额分布"
        :chart-option="barChartOption"
      />
    </div>
  </div>
</template>
<script setup>
import * as echarts from 'echarts';
import { onMounted } from 'vue';
import dayjs from 'dayjs';
import CommonWeekMonthYear from '@/components/week-month-year/index.vue';
import SkuSaleCollectLineChart from './sku-sale-collect-line-chart.vue';
import SkuSaleCollectBarChart from './sku-sale-collect-bar-chart.vue';
// 定义变量
const datePickerSel = ref([]);
const datePickerFormat = ref([]);
const radioGroupSel = ref('week');
const userTaskStatus = ref([]);
const lineChartOption = ref({
  xAxisData: [
      "2024-05-13",
      "2024-05-14",
      "2024-05-15",
      "2024-05-16"
  ],
  seriesData: [5,10,12,15],
  yAxisName: '单位：元',
});
const collectType = ref(1); // 统计时间类型，1:按日统计，2:按月统计
const barChartOption = ref({
  xAxisData: ["北京平西府街道", "霍营街道"],
  seriesData: [866,523],
  yAxisName: '单位：元',
});
onMounted(()=>{
    handleRadioGroupSelChange(radioGroupSel.value)
})
//
const handleRadioGroupSelChange = (radioGroup) => {
  radioGroupSel.value = radioGroup;
  const startFormat = dayjs()
      .startOf(radioGroupSel.value)
      .format('YYYY.MM.DD')
    const endFormat = dayjs()
      .endOf('day')
      .format('YYYY.MM.DD')
    datePickerFormat.value = [startFormat, endFormat]
};
</script>
<style lang="scss" scoped>
.sku-sale-collect {
  display: flex;
  flex-direction: column;
  // TODO: 临时解决方案，当前页面的横纵布局需要重新思考
  height: calc((100vh - 120px) * 0.4 - 20px);
  min-height: 352px;
  margin-top: 20px;
  background: #FFFFFF;
  border-radius: 20px;

  .charts {
    flex: 1;
    display: flex;
  }
}
</style>