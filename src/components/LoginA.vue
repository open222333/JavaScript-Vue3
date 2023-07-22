<template>
  <div class="login-container">
    <h2>登入頁面</h2>
    <el-form @submit.prevent="handleLogin">
      <el-form-item label="username">用戶名:</el-form-item>
      <input v-model="username" type="text" />
      <label for="password">密碼:</label>
      <input type="password" id="password" v-model="password" />
      <p></p>
    </el-form>
    <el-button type="primary">登入</el-button>
  </div>
</template>

<script>
import { ElButton } from "element-plus";
export default {
  data() {
    return {
      username: "",
      password: "",
    };
  },
  methods: {
    handleLogin() {
      console.log("登錄中...");
    },
  },
  components: {
    ElButton,
  },
};
</script>

<style scoped>
.login-container {
  max-width: 400px;
  margin: 0px;
  padding: 20px;
  border-radius: 4px;
  text-align: center;
  display: inline-block;
  margin-right: 20px;
  background-color: #0a1056;
  box-shadow: 3px 3px 11px rgb(48, 78, 154);
}

h2 {
  text-align: center;
}

label {
  display: block;
  margin-bottom: 5px;
}

input {
  width: 100%;
  padding: 5px;
  margin-bottom: 10px;
}

button {
  width: 100%;
  padding: 10px;
  background-color: #0a4583;
  color: #fff;
  border: none;
  cursor: pointer;
  box-shadow: 3px 3px 11px rgb(84, 80, 80);
}
</style>
