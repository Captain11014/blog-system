package com.blog.controller;


import com.blog.model.Article;
import com.blog.service.ArticleService;
import com.blog.util.base.BaseController;
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
     * 新增文章博客
     */
    @PostMapping
    public AjaxResult add(@RequestBody Article article)
    {
        return toAjax(articleService.insertArticle(article));
    }

    /**
     * 修改文章博客
     */
    @PutMapping
    public AjaxResult edit(@RequestBody Article article)
    {
        return toAjax(articleService.updateArticle(article));
    }

    /**
     * 删除文章博客
     */
    @DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(articleService.deleteArticleByIds(ids));
    }

}
