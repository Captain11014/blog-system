<template>
  <div class="blogs-index">
    <navigation-bar></navigation-bar>

    <div class="blogs-content">
      <el-card class="box-card" v-for="item in articleList" :key="item.id">
        <div slot="header" class="clearfix">
          <span @click="toArticleDetail(item.id)">{{item.title}}</span>
          <el-button
            style="float: right; padding: 3px 0"
            type="text"
            @click="toArticleDetail(item.id)"
          >详情</el-button>
        </div>
        <div class="text item">
          <div>
            <span>作者：{{item.user.nickname}}</span>
            <span style="margin-left: 20px">发布于：{{parseTime(item.createTime,'{y}-{m}-{d}')}}</span>
          </div>
        </div>
      </el-card>

      <pagination
        v-show="total>0"
        :total="total"
        :page.sync="queryParams.pageNum"
        :limit.sync="queryParams.pageSize"
        @pagination="getList"
      />
    </div>

    <div class="blogs-userInfo">
      <div class="userInfo" v-if="sysUser.username != undefined">
        <el-avatar shape="square" :size="50" fit="fill" :src="avatar"></el-avatar>
        <div class="userInfo-name">
          <div>昵称：{{sysUser.nickname}}</div>
          <div>账号：{{sysUser.username}}</div>
        </div>

        <div class="menu">
          <ul>
            <li><span @click="toPersonalcenter()">个人中心</span></li>
            <li><span>撰写博客</span></li>
            <li><span>我的收藏</span></li>
            <li><span>浏览历史</span></li>
            <!-- <li></li> -->
          </ul>
        </div>
      </div>

      <div class="userInfo" v-else>
        <h3>您还未登录</h3>
      </div>
    </div>
  </div>
</template>

<script>
import NavigationBar from "@/views/ordinaryuser/components/navigationBar";
import { selectSysUserByUsername } from "@/api/system/sysUser";
import {
  listArticle,
  getArticle,
  delArticle,
  addArticle,
  updateArticle,
  listjoin
} from "@/api/system/article";

export default {
  name: "Index",
  components: {
    NavigationBar
  },
  data() {
    return {
      avatar: this.$store.getters.avatar,
      //文章列表
      articleList: [],
      sysUser: {
        username: undefined,
        password: undefined,
        birthday: undefined,
        nickname: undefined,
        email: undefined,
        headUrl: undefined,
        openId: undefined,
        description: undefined,
        status: undefined
      },
      // 总条数
      total: 0,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        title: null,
        content: null,
        userId: null,
        status: "1",
        auditTime: null,
        auditUserId: null
      }
    };
  },
  created() {
    //获取当前登录用户名
    const username = this.$store.getters.name;
    //根据用户名获取用户信息
    if (username) {
      console.log("执行...");
      selectSysUserByUsername(username).then(response => {
        console.log(response);
        this.sysUser = response.data;
      });
    }
    this.getList();
  },

  methods: {
    getList() {
      listjoin(this.queryParams).then(response => {
        this.articleList = response.rows;
        this.total = response.total;
        console.log(this.articleList);
      });
    },
    //前往文章详情页
    toArticleDetail(id) {
      let url = this.$router.resolve({
        path: "/articleDetail",
        query: {
          articleId: id
        }
      }).href;

      window.open(url, "_blank");
    },
    //前往个人中心
    toPersonalcenter(){
        this.$router.push({
            path:'/personalcenter'
        })
    },
  }
};
</script>

<style lang="scss" scoped>
body {
  overflow-y: hidden;
}
.blogs-index {
  width: 100%;
  //   min-height: 100vh;
  overflow-y: hidden;
  //   border: 1px solid red;
  background-color: rgb(246, 246, 246);
}

.blogs-content {
  margin-top: 80px;
  //   border:1px solid red;
  min-height: calc(100vh - 80px);
  width: 40%;
  position: relative;
  left: calc(10% + 160px);
  background-color: white;
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.12), 0 0 6px rgba(0, 0, 0, 0.04);
  .text {
    font-size: 14px;
  }

  .item {
    // margin-bottom: 18px;
    margin-left: 5px;
  }

  .clearfix:before,
  .clearfix:after {
    display: table;
    content: "";
  }
  .clearfix:after {
    clear: both;
  }
  .clearfix {
    padding: 15px 10px;

    span {
      font-weight: bold;
      font-size: 20px;
      cursor: pointer;
    }
  }

  .box-card {
    // width: 480px;
    margin-bottom: 10px;
  }
}

.blogs-userInfo {
  //   border: 1px solid red;
  height: 300px;
  min-width: 300px;
  background-color: white;
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.12), 0 0 6px rgba(0, 0, 0, 0.04);
  //   position: absolute;
  position: fixed;
  top: 80px;
  left: calc(50% + 170px);
  .userInfo {
    // position: relative;
    // border: 1px solid red;
    margin-top: 10px;
    .userInfo-name {
      // float: right;
      position: absolute;
      top: 10px;
      left: 60px;
      //   border: 1px solid green;
      height: 50px;
      div {
        height: 25px;
        line-height: 25px;
        color: #111010;
        font-size: 13px;
      }
    }

    .menu {
      ul {
        padding-left: 0;
        list-style-type: none;
        // border: 1px solid green;
        // display: flex;
        // justify-content: space-between;
        // height: 100px;
        li{
            height: 30px;
            border-bottom: 1px rgb(246, 246, 246) solid;
            line-height: 30px;
            padding: 0px 10px ;
            // padding-top: 10px;
            margin: 10px 0;
            span:hover{
                cursor: pointer;
                color: rgb(5, 109, 232);
            }
        }
      }
    }
  }
}
</style>