<template>
  <div class="ArticleDetail">
    <navigation-bar></navigation-bar>
    <!-- <span v-html=""></span> -->

    <div class="blogs-content">
      <div class="blog-title">
        <span>
          <h2>{{article.title}}</h2>
          <!-- <div> -->
            <span>作者：{{article.user.nickname}}</span>
            <span style="margin-left: 20px">发布于：{{parseTime(article.createTime,'{y}-{m}-{d}')}}</span>
          <!-- </div> -->
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
export default {
  name: "ArticleDetail",
  components: {
    NavigationBar
  },
  data() {
    return {
      id : this.$route.query.articleId,
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
        user:{
          nickname:null,
        }
      }
    };
  },
  created(){
    this.getArticleInfo();
  },

  methods:{
    getArticleInfo(){
      getArticle(this.id).then(response => {
        console.log(response);
        this.article = response.data;
      })
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
  .blog-title{
    border-bottom: 1px solid rgb(123, 120, 120);
    // margin-top: 20px;
    span{
      // margin-left: 20px; 
    }
  }
}
</style>