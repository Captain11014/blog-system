<template>
  <div class="ArticleDetail">
    <navigation-bar></navigation-bar>
    <!-- <span v-html=""></span> -->

    <div class="blogs-content">
      <el-button
        v-if="isShow && article.userId != sysUser.id && !isFavoite"
        class="editUser"
        type="primary"
        icon="el-icon-star-off"
        @click="favoriteBtn()"
      >收藏</el-button>
      <div class="blog-title">
        <span>
          <h2>{{article.title}}</h2>
          <!-- <div> -->
          <span>作者：{{article.user.nickname}}</span>
          <span style="margin-left: 20px">发布于：{{parseTime(article.createTime,'{y}-{m}-{d}')}}</span>
        </span>
      </div>
      <span v-html="article.content"></span>
    </div>
  </div>
</template>

<script>
import NavigationBar from "@/views/ordinaryuser/components/navigationBar";
import {
  listArticle,
  getArticle,
  delArticle,
  addArticle,
  updateArticle,
  listjoin
} from "@/api/system/article";
import { selectSysUserByUsername } from "@/api/system/sysUser";
import { getToken } from "@/utils/auth";
import {
  addFavorite,
  selectFavoriteArticleByIdAndUserId
} from "@/api/system/favorite";
import {
  listHistory,
  getHistory,
  delHistory,
  addHistory,
  updateHistory
} from "@/api/system/history";
export default {
  name: "ArticleDetail",
  components: {
    NavigationBar
  },
  data() {
    return {
      id: this.$route.query.articleId,
      article: {
        id: null,
        title: null,
        content: null,
        userId: null,
        status: null,
        auditTime: null,
        auditUserId: null,
        delFlag: null,
        createBy: null,
        createTime: null,
        updateBy: null,
        updateTime: null,
        remark: null,
        user: {
          nickname: null
        }
      },
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
      //文章收藏记录对象
      favoriteArticle: {
        id: null,
        articleId: null,
        userId: null,
        delFlag: null,
        createBy: null,
        createTime: null,
        updateBy: null,
        updateTime: null,
        remark: null
      },
      //用户已登录：true，未登录：false
      isShow: false,
      isFavoite: false
    };
  },
  created() {
    const toKen = getToken();
    toKen ? (this.isShow = true) : (this.isShow = false);
    this.getInfo();
    this.getArticleInfo();
  },

  mounted() {
    if (getToken()) {
      this.isF();
    }
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
          //判断用户是否收藏了该文章
          this.isF();
          //新增浏览记录
          this.historyInsert(this.sysUser.id);
        });
      }
    },

    getArticleInfo() {
      getArticle(this.id).then(response => {
        console.log(response);
        this.article = response.data;
      });
    },

    //收藏按钮
    favoriteBtn() {
      this.favoriteArticle.articleId = this.article.id;
      this.favoriteArticle.userId = this.sysUser.id;
      this.$modal
        .confirm("是否确定收藏文章：" + this.article.title)
        .then(() => {
          addFavorite(this.favoriteArticle).then(response => {
            this.isF();
            this.$modal.msgSuccess("收藏成功");
          });
        });
    },

    //判断用户是否已经收藏该文章，已收藏不在展示收藏按钮。
    isF() {
      let param = {
        userId: this.sysUser.id,
        articleId: this.id
      };
      selectFavoriteArticleByIdAndUserId(param).then(response => {
        console.log(response);
        if (response.favTrue == "1") {
          this.isFavoite = true;
        } else {
          this.isFavoite = false;
        }
      });
    },

    //新增浏览记录，未登录情况下不计入浏览量
    historyInsert(userId) {
      let browsingHistory = {
        userId: userId,
        articleId: parseInt(this.id)
      };
      addHistory(browsingHistory).then(response => {
        console.log("添加浏览记录成功");
      });
    }
  }
};
</script>

<style lang="scss" scoped>
.ArticleDetail {
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
  width: 50%;
  position: relative;
  left: calc(10% + 160px);
  background-color: white;
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.12), 0 0 6px rgba(0, 0, 0, 0.04);
  padding: 10px 10px;
  // padding-left: 10px;
  .blog-title {
    border-bottom: 1px solid rgb(123, 120, 120);
    // margin-top: 20px;
    // span {
      // margin-left: 20px;
    // }
  }
  .editUser {
    position: absolute;
    right: 0;
  }
}
</style>