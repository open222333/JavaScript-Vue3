<template>
    <div>
        <form @submit.prevent="submitForm">
            <label for="username">Username:</label>
            <input type="text" id="username" v-model="formData.username" required>

            <label for="password">Password:</label>
            <input type="password" id="password" v-model="formData.password" required>

            <button type="submit">Submit</button>
        </form>
    </div>
</template>

<script>
import axios from 'axios';

export default {
    data() {
        return {
            formData: {
                username: '',
                password: '',
            },
        };
    },
    methods: {
        submitForm() {
            // 使用 Axios 發送 POST 請求到 Flask 服務器
            axios.post('http://your-flask-server-endpoint', this.formData)
                .then(response => {
                    // 在這裡處理服務器的回應
                    console.log(response.data);
                })
                .catch(error => {
                    // 在這裡處理錯誤
                    console.error(error);
                });
        },
    },
};
</script>

<style>
/* 添加樣式，可選 */
</style>
