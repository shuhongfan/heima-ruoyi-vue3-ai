<el-button link type="primary" @click="handleGoods(scope.row)" v-hasPermi="['manage:vm:edit']">货道</el-button>

<!-- 货道组件 -->
<ChannelDialog :goodVisible="goodVisible" :goodData="goodData" @handleCloseGood="handleCloseGood"></ChannelDialog>
<!-- end -->



// ********************货道********************
// 货道组件
import ChannelDialog from './components/ChannelDialog.vue';
const goodVisible = ref(false); //货道弹层显示隐藏
const goodData = ref({}); //货道信息用来拿取 vmTypeId和innerCode
// 打开货道弹层
const handleGoods = (row) => {
  goodVisible.value = true;
  goodData.value = row;
};
// 关闭货道弹层
const handleCloseGood = () => {
  goodVisible.value = false;
};
// ********************货道end********************


<style lang="scss" scoped src="./index.scss"></style>