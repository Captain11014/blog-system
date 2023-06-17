package com.blog.service;

import com.blog.model.FavoriteArticle;

import java.util.List;


/**
 * <p>
 *  服务类
 * </p>
 *
 * @author 姓陈的
 * @since 2023-05-23
 */
public interface FavoriteArticleService{

    /**
     * 查询收藏文章记录
     *
     * @param id 收藏文章记录主键
     * @return 收藏文章记录
     */
    public FavoriteArticle selectFavoriteArticleById(Long id);

    /**
     * 查询收藏文章记录列表
     *
     * @param favoriteArticle 收藏文章记录
     * @return 收藏文章记录集合
     */
    public List<FavoriteArticle> selectFavoriteArticleList(FavoriteArticle favoriteArticle);

    /**
     * 新增收藏文章记录
     *
     * @param favoriteArticle 收藏文章记录
     * @return 结果
     */
    public int insertFavoriteArticle(FavoriteArticle favoriteArticle);

    /**
     * 修改收藏文章记录
     *
     * @param favoriteArticle 收藏文章记录
     * @return 结果
     */
    public int updateFavoriteArticle(FavoriteArticle favoriteArticle);

    /**
     * 批量删除收藏文章记录
     *
     * @param ids 需要删除的收藏文章记录主键集合
     * @return 结果
     */
    public int deleteFavoriteArticleByIds(Long[] ids,Long userId);

    /**
     * 删除收藏文章记录信息
     *
     * @param id 收藏文章记录主键
     * @return 结果
     */
    public int deleteFavoriteArticleById(Long id);


    /**
     * 根据id判断是否已经收藏该文章
     * @return
     */
    public FavoriteArticle selectFavoriteArticleByIdAndUserId(Long userId,Long articleId);

}
