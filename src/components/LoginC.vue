<template>
  <div class="login">
    <el-card class="login_center">
      <template #header>
        <div class="card_header">
          <span>使用者登入</span>
        </div>
      </template>
      <el-form :model="loginFormState" :rules="rules" ref="loginFormRef">
        <el-form-item prop="name">
          <el-input
            prefix-icon="el-icon-user-solid"
            v-model.trim="loginFormState.name"
            maxlength="32"
            placeholder="請輸入賬號"
            clearable
          ></el-input>
        </el-form-item>
        <el-form-item prop="pwd">
          <el-input
            prefix-icon="el-icon-lock"
            v-model.trim="loginFormState.pwd"
            maxlength="16"
            show-password
            placeholder="請輸入密碼"
            clearable
            @keyup.enter.exact="handleLogin"
          ></el-input>
        </el-form-item>
        <el-form-item>
          <el-button
            type="primary"
            style="width: 100%"
            :loading="loginFormState.loading"
            @click="handleLogin"
            >登 錄</el-button
          >
        </el-form-item>
      </el-form>
    </el-card>
  </div>
</template>

<script>
import { getCurrentInstance, reactive, ref } from "vue";
import { useRouter } from "vue-router";
import { useStore } from "vuex";
import { encode } from "js-base64";
export default {
  setup() {
    // const { proxy } = getCurrentInstance();
    const router = useRouter();
    const store = useStore();
    const loginFormRef = ref();
    const loginFormState = reactive({
      name: "",
      pwd: "",
      loading: false,
    });
    const rules = {
      name: [{ required: true, message: "賬號不能為空", trigger: "blur" }],
      pwd: [
        { required: true, message: "密碼不能為空", trigger: "blur" },
        { min: 5, max: 16, message: "密碼長度為5-16位", trigger: "blur" },
      ],
    };
    const handleLogin = () => {
      loginFormRef.value.validate((valid) => {
        if (!valid) {
          return false;
        }
        loginFormState.loading = true;
        let params = { name: loginFormState.name, pwd: loginFormState.pwd };
        setTimeout(() => {
          let users = {
            role: loginFormState.name === "admin" ? "admin" : "",
            username: loginFormState.name,
          };
          Object.assign(params, users);
          sessionStorage.setItem("jwt", encode(JSON.stringify(params)));
          store.dispatch("setUser", params);
          loginFormState.loading = false;
          router.replace("/");
        }, 1000);
        // proxy.$axios
        // 	.post("/user/login", proxy.$qs.stringify(params))
        // 	.then(res => {
        // 		let { code, result_data, message } = res.data;
        // 		if (code == 1) {
        // 			console.log("login_success", result_data);
        // 			ElMessage.success("登入成功");
        // 		} else {
        // 			ElMessage.error("登入失敗：" + message);
        // 		}
        // 	})
        // 	.catch(err => {
        // 		console.log("login err", err);
        // 		ElMessage.error("登入失敗");
        // 	});
      });
    };
    return { loginFormRef, loginFormState, rules, handleLogin };
  },
};
</script>
