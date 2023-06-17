package com.blog.controller;


import com.blog.model.FavoriteArticle;
import com.blog.service.FavoriteArticleService;
import com.blog.util.StringUtil;
import com.blog.util.base.BaseController;
import com.blog.util.jwt.JwtUtil;
import com.blog.util.page.TableDataInfo;
import com.blog.util.result.AjaxResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import org.springframework.stereotype.Controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author 姓陈的
 * @since 2023-05-23
 */
@RestController
@RequestMapping("/system/favorite")
public class FavoriteArticleController extends BaseController {

    @Autowired
    private FavoriteArticleService favoriteArticleService;

    /**
     * 查询收藏文章记录列表
     */
    @GetMapping("/list")
    public TableDataInfo list(FavoriteArticle favoriteArticle)
    {
        startPage();
        List<FavoriteArticle> list = favoriteArticleService.selectFavoriteArticleList(favoriteArticle);
        return getDataTable(list);
    }


    /**
     * 获取收藏文章记录详细信息
     */
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(favoriteArticleService.selectFavoriteArticleById(id));
    }

    /**
     * 新增收藏文章记录
     */
    @PostMapping
    public AjaxResult add(@RequestBody FavoriteArticle favoriteArticle)
    {
        return toAjax(favoriteArticleService.insertFavoriteArticle(favoriteArticle));
    }

    /**
     * 修改收藏文章记录
     */
    @PutMapping
    public AjaxResult edit(@RequestBody FavoriteArticle favoriteArticle)
    {
        return toAjax(favoriteArticleService.updateFavoriteArticle(favoriteArticle));
    }

    /**
     * 删除收藏文章记录
     */
    @DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids, HttpServletRequest request)
    {
        String token = request.getHeader("token");
        Long userId = null;
        if(StringUtil.isNotEmpty(token)){
            userId = JwtUtil.getUserId(token);
        }
        return toAjax(favoriteArticleService.deleteFavoriteArticleByIds(ids,userId));
    }


    /**
     * 根据id判断是否已经收藏该文章
     * @return
     */
    @GetMapping("/selectFavoriteArticleByIdAndUserId")
    public AjaxResult selectFavoriteArticleByIdAndUserId(Long userId,Long articleId){

        FavoriteArticle favoriteArticle = favoriteArticleService.selectFavoriteArticleByIdAndUserId(userId, articleId);
        AjaxResult ajax = success();
        if(StringUtil.isNull(favoriteArticle)){
            ajax.put("favTrue",'0'); //0代表没有收藏
        }else{
            ajax.put("favTrue",'1'); //1代表已经收藏
        }

        return ajax;
    }

}
