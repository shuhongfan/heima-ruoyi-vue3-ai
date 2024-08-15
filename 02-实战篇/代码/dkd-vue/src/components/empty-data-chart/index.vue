<template>
  <div class="empty" :class="isEmpty ? 'show' : 'hidden'">
    <img src="@/assets/images/empty.png" />
    <div class="tips">暂无数据</div>
  </div>
</template>
<script setup>
const props = defineProps({
  isEmpty: {
    type: Boolean,
    default: false,
  },
});
</script>
