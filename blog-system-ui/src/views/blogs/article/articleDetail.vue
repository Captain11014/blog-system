<template>
  <div class="ArticleDetail">
    <navigation-bar></navigation-bar>
    <!-- <span v-html=""></span> -->

    <div class="blogs-content">
      <el-card class="box-card">
        <div slot="header" class="clearfix">
          <span style="font-size:25px;">
            <strong>{{article.title}}</strong>
          </span>
          <el-button
            v-if="isShow && article.userId != sysUser.id && !isFavoite"
            style="float: right; padding: 5px 5px"
            type="primary"
            icon="el-icon-star-off"
            @click="favoriteBtn()"
          >收藏</el-button>
          <div style="margin-top:10px">
            <span>
              <span>作者：{{article.user.nickname}}</span>
              <span style="margin-left: 20px">发布于：{{parseTime(article.createTime,'{y}-{m}-{d}')}}</span>
            </span>
          </div>
        </div>
        <div>
          <span class="ql-editor" v-html="article.content"></span>
          <!-- {{article.content}} -->
        </div>
      </el-card>
      <!-- <el-button
        v-if="isShow && article.userId != sysUser.id && !isFavoite"
        class="editUser"
        type="primary"
        icon="el-icon-star-off"
        @click="favoriteBtn()"
      >收藏</el-button>
      <div class="blog-title">
        <span>
          <h2>{{article.title}}</h2>

          <span>作者：{{article.user.nickname}}</span>
          <span style="margin-left: 20px">发布于：{{parseTime(article.createTime,'{y}-{m}-{d}')}}</span>
        </span>
      </div>
      <div class="content-div">
        <span v-html="article.content"></span>
      </div>-->

      <!--评论区-->
      <el-divider content-position="left">
        <span style="margin-right:10px">评论</span>
        <el-button
          v-if="isShow"
          size="mini"
          type="primary"
          icon="el-icon-edit"
          @click="handleAdd(0)"
          circle
        ></el-button>
      </el-divider>

      <!-- <div class="comment-div" v-if="open"> -->
      <div class="comment-div" v-if="open1 == 0 && open">
        <el-input
          style="margin-left:40px"
          class="comment-input"
          type="textarea"
          autosize
          placeholder="请输入评论"
          v-model="form.commentContent"
        ></el-input>
        <el-button class="comment-btn" type="primary" size="small" @click="submitForm">发布</el-button>
      </div>
      <div class="block">
        <el-timeline>
          <!-- <el-timeline-item timestamp="2018/4/12" placement="top"> -->
          <el-card style="margin-bottom:10px" v-for="item in commentList" :key="item.id">
            <div>
              <div class="hean-commont">
                <span>
                  <strong style="margin-right:10px">{{item.sysUser.nickname}}</strong>
                  &nbsp;&nbsp;{{parseTime(item.createTime,'{y}/{m}/{d}')}}
                </span>

                <el-button
                  v-if="isShow"
                  class="btn"
                  size="mini"
                  type="primary"
                  @click="handleAdd(item.id,item.sysUser.id,item.id)"
                >回复</el-button>

                <el-button
                  v-if="isShow && sysUser.id == item.sysUser.id"
                  class="btn"
                  style="margin-right:5px"
                  size="mini"
                  type="primary"
                  @click="handleDel(item.id)"
                >删除</el-button>
              </div>
              <div class="comment-div" v-if="open1 == item.id && open && isShow">
                <el-input
                  class="comment-input"
                  type="textarea"
                  autosize
                  placeholder="请输入评论"
                  v-model="form.commentContent"
                ></el-input>
                <el-button class="comment-btn" type="primary" size="small" @click="submitForm">发布</el-button>
              </div>
              <p>{{item.commentContent}}</p>
              <el-divider></el-divider>
              <div v-for="child in item.children" :key="child.id">
                <div class="hean-commont">
                  <span>
                    <strong style="margin-right:10px">{{child.sysUser.nickname}}</strong>
                    <strong style="margin-right:10px">回复</strong>
                    <strong style="margin-right:10px">{{child.replySysUser.nickname}}</strong>
                    &nbsp;&nbsp;{{parseTime(child.createTime,'{y}/{m}/{d}')}}
                  </span>
                  <el-button
                    v-if="isShow"
                    class="btn"
                    size="mini"
                    type="primary"
                    @click="handleAdd(child.id,child.sysUser.id,item.id)"
                  >回复</el-button>
                  <el-button
                    v-if="isShow && sysUser.id == child.sysUser.id"
                    class="btn"
                    style="margin-right:5px"
                    size="mini"
                    type="primary"
                    @click="handleDel(child.id)"
                  >删除</el-button>
                </div>
                <div class="comment-div" v-if="open1 == child.id && open && isShow">
                  <el-input
                    class="comment-input"
                    type="textarea"
                    autosize
                    placeholder="请输入评论"
                    v-model="form.commentContent"
                  ></el-input>
                  <el-button class="comment-btn" type="primary" size="small" @click="submitForm">发布</el-button>
                </div>
                <p>{{child.commentContent}}</p>
                <el-divider></el-divider>
              </div>
            </div>
          </el-card>
          <!-- </el-timeline-item> -->
        </el-timeline>
      </div>
      <pagination
        v-show="total>0"
        :total="total"
        :page.sync="queryParams.pageNum"
        :limit.sync="queryParams.pageSize"
        @pagination="getCommentList"
      />
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
import {
  listComment,
  getComment,
  delComment,
  addComment,
  updateComment
} from "@/api/system/comment";
import "quill/dist/quill.core.css";
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
      isFavoite: false,
      //是否打开对话框
      open: false,
      open1: 0,
      form: {},
      // 表单校验
      rules: {},
      //评论列表
      commentList: [],
      total: 0,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        parentId: null,
        commentContent: null,
        articleId: null,
        userId: null,
        replyUserId: null
      }
    };
  },
  created() {
    const toKen = getToken();
    console.log(toKen + "token");
    toKen ? (this.isShow = true) : (this.isShow = false);
    this.getInfo();
    this.getArticleInfo();
    this.getCommentList();
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
    },

    // 取消按钮
    cancel() {
      this.open = false;
      this.reset();
    },

    /** 新增按钮操作 */
    handleAdd(val, replyUserId, parentId) {
      this.reset();
      //点击评论或者回复显示对应输入框
      this.open ? (this.open = false) : (this.open = true);
      if (this.open1 != val) {
        this.open = true;
        this.open1 = val;
      }

      // if(val == 1){
      this.form.articleId = this.id; //文章Id
      this.form.userId = this.sysUser.id; //当前用户id
      this.form.replyUserId = replyUserId;
      this.form.parentId = parentId;
      // }
    },

    // 表单重置
    reset() {
      this.form = {
        id: null,
        parentId: null,
        commentContent: null,
        articleId: null,
        userId: null,
        replyUserId: null,
        delFlag: null,
        createBy: null,
        createTime: null,
        updateBy: null,
        updateTime: null,
        remark: null,
        children: []
      };
      this.resetForm("form");
    },

    /** 提交按钮 */
    submitForm() {
      console.log(this.form);

      addComment(this.form).then(response => {
        this.$modal.msgSuccess("新增成功");
        this.open = false;
        this.getCommentList();
      });
    },
    //获取评论数据
    getCommentList() {
      // let queryCommontParams = {
      //   articleId : this.id
      // }
      this.queryParams.articleId = this.id;
      listComment(this.queryParams).then(response => {
        console.log(response);
        this.commentList = response.rows;
        this.total = response.total;
      });
    },

     /** 删除按钮操作 */
    handleDel(id) {
      console.log(id);
      const ids = id;
      this.$modal.confirm('是否确认删除评论').then(function() {
        return delComment(ids);
      }).then(() => {
        this.getCommentList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
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

.comment-div {
  // border: 1px solid red;
  width: 100%;
  margin-bottom: 20px;
  .comment-input {
    width: 80%;
  }
  .comment-btn {
    float: right;
  }
}

.hean-commont {
  // border: 1px solid red;
  line-height: 30px;
  height: 30px;
  margin-bottom: 5px;
  .btn {
    float: right;
  }
  // float:right;
  // margin-top:-8px"
}

.content-div {
  // border: 1px solid red;
  margin-top: 10px;
  width: 90%;
  margin: 10px auto;
}
</style>