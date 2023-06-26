package com.blog.controller;


import com.blog.model.Article;
import com.blog.model.Constant;
import com.blog.service.ArticleService;
import com.blog.util.StringUtil;
import com.blog.util.annotation.Log;
import com.blog.util.annotation.Permission;
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
 * 文章博客表 前端控制器
 * </p>
 *
 * @author 姓陈的
 * @since 2023-05-23
 */
@RestController
@RequestMapping("/system/article")
public class ArticleController extends BaseController {

    @Autowired
    private ArticleService articleService;

    /**
     * 查询文章博客列表
     */
    @GetMapping("/list")
    public TableDataInfo list(Article article)
    {
        startPage();
        List<Article> list = articleService.selectArticleList(article);
        return getDataTable(list);
    }


    /**
     * 查询文章博客列表
     * 连表查询
     */
//    @Log(title = "文章管理",operate = "SELECT")
//    @Permission("article:list")
    @GetMapping("/listjoin")
    public TableDataInfo selectArticleJoinList(Article article)
    {
        startPage();
        List<Article> list = articleService.selectArticleJoinList(article);
        return getDataTable(list);
    }

    /**
     * 获取文章博客详细信息
     */
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(articleService.selectArticleById(id));
    }

    /**
     * 查询我的收藏文章
     * 此处传来的userId指的是收藏者的用户id并非作者Id
     * @param article
     * @return
     */
//    @Log(title = "文章管理",operate = Constant.OPERATE_SELECT)
    @GetMapping("/selectArticleWidthFavorite")
    public TableDataInfo selectArticleWidthFavorite(Article article,HttpServletRequest request){

        String token = request.getHeader("token");
        if(StringUtil.isNotEmpty(token)){
            article.setUserId(JwtUtil.getUserId(token));
        }

        startPage();
        List<Article> list = articleService.selectArticleWidthFavorite(article);
        return getDataTable(list);
    }


    /**
     * 查询文章浏览记录
     * 此处传来的userId指的是收藏者的用户id并非作者Id
     *
     * @param article
     * @return
     */
//    @Log(title = "文章管理",operate = Constant.OPERATE_SELECT)
    @GetMapping("/selectArticleWidthBrowsingHistory")
    public TableDataInfo selectArticleWidthBrowsingHistory(Article article,HttpServletRequest request){
//        String token = request.getHeader("token");
//        if(StringUtil.isNotEmpty(token)){
//            article.setUserId(JwtUtil.getUserId(token));
//        }
        startPage();
        List<Article> list = articleService.selectArticleWidthBrowsingHistory(article);
        return getDataTable(list);
    }

    /**
     * 新增文章博客
     */
    @Log(title = "文章管理",operate = Constant.OPERATE_INSERTE)
//    @Permission("article:add")
    @PostMapping
    public AjaxResult add(@RequestBody Article article)
    {
        return toAjax(articleService.insertArticle(article));
    }

    /**
     * 修改文章博客
     */
    @Log(title = "文章管理",operate = Constant.OPERATE_UPDATE)
//    @Permission("article:update")
    @PutMapping
    public AjaxResult edit(@RequestBody Article article)
    {
        return toAjax(articleService.updateArticle(article));
    }

    /**
     * 删除文章博客
     */
    @Log(title = "文章管理",operate = Constant.OPERATE_DELETE)
//    @Permission("article:del")
    @DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(articleService.deleteArticleByIds(ids));
    }

}
