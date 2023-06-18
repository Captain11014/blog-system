package com.blog.controller;

import com.blog.model.Constant;
import com.blog.model.SysLog;
import com.blog.service.SysLogService;
import com.blog.util.annotation.Log;
import com.blog.util.base.BaseController;
import com.blog.util.page.TableDataInfo;
import com.blog.util.result.AjaxResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * @author 姓陈的
 * 2023/6/18 12:53
 */
@RestController
@RequestMapping("/system/log")
public class SysLogController extends BaseController {

    @Autowired
    private SysLogService sysLogService;

    /**
     * 查询系统日志列表
     */
    @GetMapping("/list")
    public TableDataInfo list(SysLog sysLog)
    {
        startPage();
        List<SysLog> list = sysLogService.selectSysLogList(sysLog);
        return getDataTable(list);
    }



    /**
     * 获取系统日志详细信息
     */
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(sysLogService.selectSysLogById(id));
    }

//    /**
//     * 新增系统日志
//     */
//    @PostMapping
//    public AjaxResult add(@RequestBody SysLog sysLog)
//    {
//        return toAjax(sysLogService.insertSysLog(sysLog));
//    }
//
//    /**
//     * 修改系统日志
//     */
//    @Log(title = "系统日志", businessType = BusinessType.UPDATE)
//    @PutMapping
//    public AjaxResult edit(@RequestBody SysLog sysLog)
//    {
//        return toAjax(sysLogService.updateSysLog(sysLog));
//    }

    /**
     * 删除系统日志
     */
//    @Log(title = "系统日志", operate = Constant.OPERATE_DELETE)
    @DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(sysLogService.deleteSysLogByIds(ids));
    }

}
