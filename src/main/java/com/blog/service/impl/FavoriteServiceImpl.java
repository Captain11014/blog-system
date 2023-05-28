package com.blog.service.impl;

import com.blog.model.Favorite;
import com.blog.mapper.FavoriteMapper;
import com.blog.service.FavoriteService;

import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * <p>
 * 收藏夹 服务实现类
 * </p>
 *
 * @author 姓陈的
 * @since 2023-05-23
 */
@Service
public class FavoriteServiceImpl implements FavoriteService {

    @Resource
    private FavoriteMapper favoriteMapper;

    @Override
    public List<Favorite> selectAll() {
        return favoriteMapper.selectAll();
    }
}
