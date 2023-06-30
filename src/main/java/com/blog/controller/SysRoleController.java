package com.blog.controller;


import com.blog.model.Constant;
import com.blog.model.SysRole;
import com.blog.service.SysRoleService;
import com.blog.util.annotation.Log;
import com.blog.util.base.BaseController;
import com.blog.util.page.TableDataInfo;
import com.blog.util.result.AjaxResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import org.springframework.stereotype.Controller;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * <p>
 * 角色 前端控制器
 * </p>
 * @RestController 将数据以json格式返回
 * @author 姓陈的
 * @since 2023-05-23
 */
@RestController
@RequestMapping("/system/role")
public class SysRoleController extends BaseController {


    @Autowired
    private SysRoleService sysRoleService;

    /**
     * 查询角色列表
     * 前端传递sysRole角色参数
     */
    @GetMapping("/list")
    public TableDataInfo list(SysRole sysRole)
    {
        startPage(); //分页
        List<SysRole> list = sysRoleService.selectSysRoleList(sysRole);
        return getDataTable(list);
    }

    /**
     * 根据id获取角色详细信息
     * PathVariable获取路径上的id参数
     */
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(sysRoleService.selectSysRoleById(id));
    }

    /**
     * 新增角色
     * @RequestBody主要用来接收前端传递给后端的json字符串中的数据的(请求体中的数据的)
     */
    @Log(title = "角色管理",operate = Constant.OPERATE_INSERTE)
    @PostMapping
    public AjaxResult add(@RequestBody SysRole sysRole)
    {
        return toAjax(sysRoleService.insertSysRole(sysRole));
    }

    /**
     * 修改角色
     */
    @Log(title = "角色管理",operate = Constant.OPERATE_UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody SysRole sysRole)
    {
        return toAjax(sysRoleService.updateSysRole(sysRole));
    }

    /**
     * 删除角色
     */
    @Log(title = "角色管理",operate = Constant.OPERATE_DELETE)
    @DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(sysRoleService.deleteSysRoleByIds(ids));
    }


}
