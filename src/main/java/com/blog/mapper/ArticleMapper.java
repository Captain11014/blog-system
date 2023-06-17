package com.blog.mapper;

import com.blog.model.Article;

import java.util.List;


/**
 * <p>
 * 文章博客表 Mapper 接口
 * </p>
 *
 * @author 姓陈的
 * @since 2023-05-23
 */
public interface ArticleMapper{


    /**
     * 查询文章博客
     *
     * @param id 文章博客主键
     * @return 文章博客
     */
    public Article selectArticleById(Long id);

    /**
     * 查询文章博客列表
     *
     * @param article 文章博客
     * @return 文章博客集合
     */
    public List<Article> selectArticleList(Article article);

    /**
     * 查询文章博客列表
     * <hr>
     * 多表查询
     * @param article 文章博客
     * @return 文章博客集合
     */
    public List<Article> selectArticleJoinList(Article article);

    /**
     * 查询我的收藏文章
     * 此处传来的userId指的是收藏者的用户id并非作者Id
     * @param article
     * @return
     */
    public List<Article> selectArticleWidthFavorite(Article article);

    /**
     * 新增文章博客
     *
     * @param article 文章博客
     * @return 结果
     */
    public int insertArticle(Article article);

    /**
     * 修改文章博客
     *
     * @param article 文章博客
     * @return 结果
     */
    public int updateArticle(Article article);

    /**
     * 删除文章博客
     *
     * @param id 文章博客主键
     * @return 结果
     */
    public int deleteArticleById(Long id);

    /**
     * 批量删除文章博客
     *
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteArticleByIds(Long[] ids);



}
