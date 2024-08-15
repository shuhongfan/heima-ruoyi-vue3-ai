<template>
  <div class="app-container home">
    <el-row :gutter="20">
      <el-col :span="18">
        <el-row :gutter="20">
          <el-col :span="13">
            <home-user-task-stats />
          </el-col>
          <el-col :span="11">
            <home-sku-sale-stats />
          </el-col>
        </el-row>
        <sku-sale-collect-chart />
      </el-col>
      <el-col :span="6">
        <sku-sale-rank-chart />
      </el-col>
    </el-row>
    <el-row :gutter="20" style="margin-top: 20px">
      <el-col :span="14">
        <partner-node-collect-chart />
      </el-col>
      <el-col :span="10">
        <abnormal-equipment-table />
      </el-col>
    </el-row>
  </div>
</template>

<script setup name="Index">
import HomeUserTaskStats from './components/home-user-task-stats.vue';
import HomeSkuSaleStats from './components/home-sku-sale-stats.vue';
import SkuSaleRankChart from './components/sku-sale-rank-chart.vue';
import SkuSaleCollectChart from './components/sku-sale-collect-chart.vue';
import PartnerNodeCollectChart from './components/partner-node-collect-chart.vue';
import AbnormalEquipmentTable from './components/abnormal-equipment-table.vue'
</script>

<style scoped lang="scss">
.home {
  blockquote {
    padding: 10px 20px;
    margin: 0 0 20px;
    font-size: 17.5px;
    border-left: 5px solid #eee;
  }
  hr {
    margin-top: 20px;
    margin-bottom: 20px;
    border: 0;
    border-top: 1px solid #eee;
  }
  .col-item {
    margin-bottom: 20px;
  }

  ul {
    padding: 0;
    margin: 0;
  }

  font-family: 'open sans', 'Helvetica Neue', Helvetica, Arial, sans-serif;
  font-size: 13px;
  color: #676a6c;
  overflow-x: hidden;

  ul {
    list-style-type: none;
  }

  h4 {
    margin-top: 0px;
  }

  h2 {
    margin-top: 10px;
    font-size: 26px;
    font-weight: 100;
  }

  p {
    margin-top: 10px;

    b {
      font-weight: 700;
    }
  }

  .update-log {
    ol {
      display: block;
      list-style-type: decimal;
      margin-block-start: 1em;
      margin-block-end: 1em;
      margin-inline-start: 0;
      margin-inline-end: 0;
      padding-inline-start: 40px;
    }
  }
  :deep(.box) {
    padding: 20px;
    border-radius: 20px;
    .title,
    .header {
      display: flex;
      .el-icon{
        cursor: pointer;
      }
    }
    .title {
      align-items: center;
      flex: 1;
      font-size: 16px;
      font-weight: 600;
      color: #333;
      
    }
    .sub-title {
      margin-left: 10px;
      font-size: 12px;
      font-weight: 400;
      color: #999;
    }
  }
  .chart {
    position: relative;
    display: inline-block;
    width: 50%;
    height: 100%;
  }
  .sku-sale-rank {
    flex-direction: column;
    height: calc(60vh - 72px);
    min-height: 538px;
    background: #fff;
    border-radius: 20px;
  }
}
</style>
