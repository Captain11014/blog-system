package com.blog.service.impl;


import com.blog.mapper.ArticleMapper;
import com.blog.model.Article;
import com.blog.service.ArticleService;
import com.blog.util.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * <p>
 * 文章博客表 服务实现类
 * </p>
 *
 * @author 姓陈的
 * @since 2023-05-23
 */
@Service
public class ArticleServiceImpl implements ArticleService {
    @Autowired
    private ArticleMapper articleMapper;

    /**
     * 查询文章博客
     *
     * @param id 文章博客主键
     * @return 文章博客
     */
    @Override
    public Article selectArticleById(Long id)
    {
        return articleMapper.selectArticleById(id);
    }

    /**
     * 查询文章博客列表
     *
     * @param article 文章博客
     * @return 文章博客
     */
    @Override
    public List<Article> selectArticleList(Article article)
    {
        return articleMapper.selectArticleList(article);
    }

    /**
     * 查询文章博客列表
     * <hr>
     * 多表查询
     * @param article 文章博客
     * @return 文章博客集合
     */
    @Override
    public List<Article> selectArticleJoinList(Article article) {
        return articleMapper.selectArticleJoinList(article);
    }

    /**
     * 查询我的收藏文章
     * 此处传来的userId指的是收藏者的用户id并非作者Id
     * @param article
     * @return
     */
    @Override
    public List<Article> selectArticleWidthFavorite(Article article){
        return articleMapper.selectArticleWidthFavorite(article);
    }


    /**
     * 查询文章浏览记录
     * 此处传来的userId指的是收藏者的用户id并非作者Id
     *
     * @param article
     * @return
     */
    @Override
    public List<Article> selectArticleWidthBrowsingHistory(Article article){
        List<Article> list = articleMapper.selectArticleWidthBrowsingHistory(article);
        System.out.println(list);
        return list;
    }

    /**
     * 新增文章博客
     *
     * @param article 文章博客
     * @return 结果
     */
    @Override
    public int insertArticle(Article article)
    {
        article.setCreateTime(DateUtils.getNowDate());
        return articleMapper.insertArticle(article);
    }

    /**
     * 修改文章博客
     *
     * @param article 文章博客
     * @return 结果
     */
    @Override
    public int updateArticle(Article article)
    {
        article.setUpdateTime(DateUtils.getNowDate());
        return articleMapper.updateArticle(article);
    }

    /**
     * 批量删除文章博客
     *
     * @param ids 需要删除的文章博客主键
     * @return 结果
     */
    @Override
    public int deleteArticleByIds(Long[] ids)
    {
        return articleMapper.deleteArticleByIds(ids);
    }

    /**
     * 删除文章博客信息
     *
     * @param id 文章博客主键
     * @return 结果
     */
    @Override
    public int deleteArticleById(Long id)
    {
        return articleMapper.deleteArticleById(id);
    }

}
