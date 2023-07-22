<template>
  <div>
    <Login />
  </div>
</template>

<script>
import Login from "./components/LoginC.vue"; // 引入登入组件
import HelloWorld from "./components/HelloWorld.vue";
import LabelSample from "./components/LabelSample.vue";
import ButtonSample from "./components/ButtonSample.vue";

export default {
  components: {
    Login, // 注册登入组件
    HelloWorld,
    LabelSample,
    ButtonSample,
  },
};
</script>

<style>
/* 全局样式 */
body {
  font-family: Arial, sans-serif;
  margin: 0;
  padding: 0;
}

#app {
  display: flex;
  justify-content: center;
  align-items: center;
  height: 100vh;
}
</style>
