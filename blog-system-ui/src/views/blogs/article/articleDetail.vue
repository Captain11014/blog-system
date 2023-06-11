<template>
  <div>
    <h1>文章详情{{this.$route.query.articleId}}</h1>
    <!-- <span v-html=""></span> -->
  </div>
</template>

<script>
export default {
    name:'ArticleDetail',
    data(){
        return{
            article:undefined,
        }
    },

}
</script>

<style>

</style>