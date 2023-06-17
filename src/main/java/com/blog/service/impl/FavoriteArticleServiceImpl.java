package com.blog.service.impl;

import com.blog.model.FavoriteArticle;
import com.blog.mapper.FavoriteArticleMapper;
import com.blog.service.FavoriteArticleService;
import com.blog.util.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author 姓陈的
 * @since 2023-05-23
 */
@Service
public class FavoriteArticleServiceImpl implements FavoriteArticleService {

    @Autowired
    private FavoriteArticleMapper favoriteArticleMapper;

    /**
     * 查询收藏文章记录
     *
     * @param id 收藏文章记录主键
     * @return 收藏文章记录
     */
    @Override
    public FavoriteArticle selectFavoriteArticleById(Long id)
    {
        return favoriteArticleMapper.selectFavoriteArticleById(id);
    }

    /**
     * 查询收藏文章记录列表
     *
     * @param favoriteArticle 收藏文章记录
     * @return 收藏文章记录
     */
    @Override
    public List<FavoriteArticle> selectFavoriteArticleList(FavoriteArticle favoriteArticle)
    {
        return favoriteArticleMapper.selectFavoriteArticleList(favoriteArticle);
    }

    /**
     * 新增收藏文章记录
     *
     * @param favoriteArticle 收藏文章记录
     * @return 结果
     */
    @Override
    public int insertFavoriteArticle(FavoriteArticle favoriteArticle)
    {
        favoriteArticle.setCreateTime(DateUtils.getNowDate());
        return favoriteArticleMapper.insertFavoriteArticle(favoriteArticle);
    }

    /**
     * 修改收藏文章记录
     *
     * @param favoriteArticle 收藏文章记录
     * @return 结果
     */
    @Override
    public int updateFavoriteArticle(FavoriteArticle favoriteArticle)
    {
        favoriteArticle.setUpdateTime(DateUtils.getNowDate());
        return favoriteArticleMapper.updateFavoriteArticle(favoriteArticle);
    }

    /**
     * 批量删除收藏文章记录
     *
     * @param ids 需要删除的收藏文章记录主键
     * @return 结果
     */
    @Override
    public int deleteFavoriteArticleByIds(Long[] ids,Long userId)
    {
        return favoriteArticleMapper.deleteFavoriteArticleByIds(ids,userId);
    }

    /**
     * 删除收藏文章记录信息
     *
     * @param id 收藏文章记录主键
     * @return 结果
     */
    @Override
    public int deleteFavoriteArticleById(Long id)
    {
        return favoriteArticleMapper.deleteFavoriteArticleById(id);
    }

    /**
     * 根据id判断是否已经收藏该文章
     * @return
     */
    @Override
    public FavoriteArticle selectFavoriteArticleByIdAndUserId(Long userId,Long articleId){
        return favoriteArticleMapper.selectFavoriteArticleByIdAndUserId(userId,articleId);
    }

}
