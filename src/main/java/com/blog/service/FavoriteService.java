package com.blog.service;

import com.blog.mapper.FavoriteMapper;
import com.blog.model.Favorite;

import java.util.List;


/**
 * <p>
 * 收藏夹 服务类
 * </p>
 *
 * @author 姓陈的
 * @since 2023-05-23
 */
public interface FavoriteService  {


    List<Favorite> selectAll();

}
