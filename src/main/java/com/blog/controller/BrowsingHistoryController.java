package com.blog.controller;


import com.blog.model.BrowsingHistory;
import com.blog.service.BrowsingHistoryService;
import com.blog.util.base.BaseController;
import com.blog.util.page.TableDataInfo;
import com.blog.util.result.AjaxResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * <p>
 * 浏览记录表 前端控制器
 * </p>
 *
 * @author 姓陈的
 * @since 2023-05-23
 */
@RestController
@RequestMapping("/system/history")
public class BrowsingHistoryController extends BaseController {


    @Autowired
    private BrowsingHistoryService browsingHistoryService;

    /**
     * 查询浏览记录列表
     */
    @GetMapping("/list")
    public TableDataInfo list(BrowsingHistory browsingHistory)
    {
        startPage();
        List<BrowsingHistory> list = browsingHistoryService.selectBrowsingHistoryList(browsingHistory);
        return getDataTable(list);
    }


    /**
     * 获取浏览记录详细信息
     */
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(browsingHistoryService.selectBrowsingHistoryById(id));
    }

    /**
     * 新增浏览记录
     */
    @PostMapping
    public AjaxResult add(@RequestBody BrowsingHistory browsingHistory)
    {
        return toAjax(browsingHistoryService.insertBrowsingHistory(browsingHistory));
    }

    /**
     * 修改浏览记录
     */
    @PutMapping
    public AjaxResult edit(@RequestBody BrowsingHistory browsingHistory)
    {
        return toAjax(browsingHistoryService.updateBrowsingHistory(browsingHistory));
    }

    /**
     * 删除浏览记录
     */
    @DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(browsingHistoryService.deleteBrowsingHistoryByIds(ids));
    }

}
