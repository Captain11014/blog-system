<template>
  <div class="blogs-index">
    <navigation-bar @myEvent="navigClick"></navigation-bar>

    <div class="blogs-content">
      <el-card class="box-card" v-for="item in articleList" :key="item.id">
        <div slot="header" class="clearfix">
          <span class="titleSpan" @click="toArticleDetail(item.id)">{{item.title}}</span>
          <el-button
            style="float: right; padding: 3px 5px"
            type="text"
            @click="toArticleDetail(item.id)"
          >详情</el-button>
        </div>
        <div class="text item articleUserInfo-p">
          <div class="articleUserInfo">
            <div><span>作者：{{item.user.nickname}}</span></div>
            <div><span>发布：{{parseTime(item.createTime,'{y}-{m}-{d}')}}</span></div>
            <div><span>浏览：{{item.browsingSum}}</span></div>
            <div><span>评论：0</span></div>
            <div><span>收藏：{{item.favoriteSum}}</span></div>
          </div>

          <!-- <el-button class="scBtn" type="warning" icon="el-icon-star-off" circle></el-button> -->
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
            <li>
              <span @click="toPersonalcenter('blog')">个人中心</span>
            </li>
            <li>
              <span @click="toPersonalcenter('blog')">我的博客</span>
            </li>
            <li>
              <span @click="toPersonalcenter('sc')">我的收藏</span>
            </li>
            <li>
              <span @click="toPersonalcenter('ls')">浏览历史</span>
            </li>
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
import { getToken } from "@/utils/auth";
import NavigationBar from "@/views/ordinaryuser/components/navigationBar";
import { selectSysUserByUsername } from "@/api/system/sysUser";
import {
  listArticle,
  getArticle,
  delArticle,
  addArticle,
  updateArticle,
  listjoin,
  selectArticleWidthFavorite
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
      },
      //用户已登录：true，未登录：false
      isShow: false
    };
  },
  created() {
    const toKen = getToken();
    toKen ? (this.isShow = true) : (this.isShow = false);
    this.getInfo();
    this.getList();
  },

  methods: {
    //获取用户信息
    getInfo() {
      //获取当前登录用户名
      const username = this.$store.getters.name;
      //根据用户名获取用户信息
      if (username) {
        selectSysUserByUsername(username).then(response => {
          console.log("获取用户信息");
          console.log(response);
          this.sysUser = response.data;
        });
      }
    },

    //获取文章列表信息
    getList() {
      this.$modal.loading("正在加载中...");
      listjoin(this.queryParams).then(response => {
        this.articleList = response.rows;
        this.total = response.total;
        console.log(this.articleList);
        this.$modal.closeLoading();
      });
    },

    //获取我的收藏文章列表
    getMyFavoriteList(){
      this.$modal.loading("正在加载中...");
      selectArticleWidthFavorite(this.queryParams).then(response => {
        this.articleList = response.rows;
        this.total = response.total;
        this.$modal.closeLoading();
      })
    },

    //子组件的点击事件
    navigClick(value){
      console.log("dd"+value);

      if(value == '1'){
        this.getList();
      }else{
        this.getMyFavoriteList();
      }

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
    toPersonalcenter(val) {
      this.$router.push({
        path: "/personalcenter",
        query:{
          tabVal:val
        }
      });
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
    // margin-left: 5px;
    padding: 0;
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

  .articleUserInfo-p{
    // border: 1px solid black;
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
        li {
          height: 30px;
          border-bottom: 1px rgb(246, 246, 246) solid;
          line-height: 30px;
          padding: 0px 10px;
          // padding-top: 10px;
          margin: 10px 0;
          span:hover {
            cursor: pointer;
            color: rgb(5, 109, 232);
          }
        }
      }
    }
  }
}

.articleUserInfo {
  // border: 1px solid red;
  width: 100%;
  display: flex;
  justify-content: space-between;
  // border: 1px solid red;
  div:nth-child(1){
    width: calc(100% - 400px); //341px
    // border: 1px solid red;
    // display: flex;
  }
  div:nth-child(2){
    width: 116px;
    // border: 1px solid red;
    // display: flex;
  }
  div:nth-child(3), div:nth-child(4), div:nth-child(5){
    width: 75px;
    // border: 1px solid red;
    // display: flex;
  }
  span {
    // border: 1px solid red;
    color: #878585;
  }
}

.titleSpan:hover {
  color: rgb(5, 109, 232);
}

// .scBtn{
//   position: relative;
//   top: 0;

// }
</style>