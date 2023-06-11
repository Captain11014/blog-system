<template>
  <div class="blogs-index">
    <div class="blog-head">
        <span class="logo">BLOG</span>

        <div class="rightHead">
            <el-link :underline="false" type="primary">
                <router-link class="link-type" :to="'/login/pt'">登录</router-link>
            </el-link>
            |
            <el-link :underline="false" type="primary">
                <router-link class="link-type" :to="'/register'">注册</router-link>
            </el-link>
        </div>
    </div>
  </div>
</template>

<script>
export default {

}
</script>

<style lang="scss" scoped>
.blogs-index{
    width: 100%;
    height: 100%;
    // border: 1px solid gold;
    background-color: rgb(246,246,246);
}
.blog-head{
    width: 100%;
    height: 70px;
    // border: 1px solid red;
    background-color: white;
    box-shadow: 0 2px 4px rgba(0, 0, 0, .12), 0 0 6px rgba(0, 0, 0, .04);
    .logo{
        float: left;
        display: block;
        width: 130px;
        height: 70px;
        font-size: 40px;
        line-height: 70px;
        margin-left: 10%;
        text-align: center;
        // border: 1px solid red;
        color: rgb(5,109,232);
        cursor: pointer;
    }
    .rightHead{
        width: 130px;
        height: 70px;
        font-size: 40px;
        line-height: 70px;
        text-align: center;
        margin-right: 10%;
        color: rgb(5,109,232);
        // border: 1px solid red;
        float: right;
    }
}


</style>