<template>
  <div class="navigationBar">
    <div class="blog-head">
      <span class="logo" @click="toIndex()">BLOG</span>

      <el-menu
        :default-active="activeIndex"
        class="el-menu-demo"
        mode="horizontal"
        @select="handleSelect"
      >
        <el-menu-item index="1">首页</el-menu-item>

        <el-menu-item v-if="open" index="2">我的收藏</el-menu-item>
      </el-menu>

      <div class="rightHead" v-if="isShow">
        <el-link :underline="false" type="primary">
          <router-link class="link-type" :to="'/login/pt'">登录</router-link>
        </el-link>
        <span>&nbsp;|&nbsp;</span>
        <el-link :underline="false" type="primary">
          <router-link class="link-type" :to="'/register'">注册</router-link>
        </el-link>
      </div>
      <div class="rightHead" v-if="!isShow">
        <el-link :underline="false" type="primary" @click="logout">退出登录</el-link>
      </div>
    </div>
  </div>
</template>

<script>
import { getToken } from "@/utils/auth";
export default {
  name: "NavigationBar",
  data() {
    return {
      isShow: true,
      activeIndex: "1",
      open: true
    };
  },
  created() {
    const toKen = getToken();
    toKen ? (this.isShow = false) : (this.isShow = true);

    //如果是该路由地址则隐藏-》我的收藏
    if (
      this.$route.path == "/personalcenter" ||
      this.$route.path == "/articleDetail" ||
      !this.$store.getters.name
    ) {
      this.open = false;
    } else {
      this.open = true;
    }
  },
  methods: {
    /**退出登录 */
    logout() {
      this.$modal.confirm("确定退出登录吗？").then(() => {
        this.isShow = true;
        this.$store.dispatch("user/logout");
        setTimeout(() => {
          location.reload();
        }, 1200);
      });
    },

    handleSelect(value) {
      this.toIndex();
      console.log(value);
      this.$emit("myEvent", value);
    },
    toIndex() {
      this.$router.push({
        path: "/"
      });
    }
  }
};
</script>

<style lang="scss" scoped>
// .blogs-index{
//     width: 100%;
//     height: 100%;
//     // border: 1px solid gold;
//     background-color: rgb(246,246,246);
// }
.blog-head {
  width: 100%;
  height: 70px;
  // border: 1px solid red;
  background-color: white;
  position: fixed;
  top: 0;
  z-index: 10;
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.12), 0 0 6px rgba(0, 0, 0, 0.04);
  .logo {
    float: left;
    display: block;
    width: 130px;
    height: 70px;
    font-size: 40px;
    line-height: 70px;
    margin-left: 10%;
    text-align: center;
    // border: 1px solid red;
    color: rgb(5, 109, 232);
    cursor: pointer;
  }
  .rightHead {
    width: 130px;
    height: 70px;
    font-size: 40px;
    line-height: 70px;
    text-align: center;
    margin-right: 10%;
    color: rgb(5, 109, 232);
    // border: 1px solid red;
    float: right;
  }
  .el-menu-demo {
    width: 170px;
    height: 100%;
    float: left;
    margin-left: 30px;
    // border: 1px solid red;
  }
}
</style>