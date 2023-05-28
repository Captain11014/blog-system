package com.blog.mapper;

import com.blog.model.Favorite;

import java.util.List;

/**
 * <p>
 * 收藏夹 Mapper 接口
 * </p>
 *
 * @author 姓陈的
 * @since 2023-05-23
 */
public interface FavoriteMapper {

    /**
     * 查询全部收藏夹
     * @return
     */
    List<Favorite> selectAll();

}
