package com.blog.controller;


import com.blog.model.Constant;
import com.blog.model.SysMenu;
import com.blog.service.SysMenuService;
import com.blog.util.annotation.Log;
import com.blog.util.base.BaseController;
import com.blog.util.page.TableDataInfo;
import com.blog.util.result.AjaxResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import org.springframework.stereotype.Controller;

import java.util.List;

/**
 * <p>
 * 菜单表 前端控制器
 * </p>
 *
 * @author 姓陈的
 * @since 2023-05-23
 */
@RestController
@RequestMapping("/system/menu")
public class SysMenuController extends BaseController {

    @Autowired
    private SysMenuService sysMenuService;

    /**
     * 查询菜单列表
     */
    @GetMapping("/list")
    public AjaxResult list(SysMenu sysMenu)
    {
//        startPage();
        List<SysMenu> list = sysMenuService.selectSysMenuList(sysMenu);
        return success(list);
    }


    /**
     * 查询角色菜单列表
     */
    @GetMapping("/roleList/{roleId}")
    public AjaxResult roleList(@PathVariable Long roleId)
    {
        List<SysMenu> list = sysMenuService.selectMenuByRoleId(roleId);
        return success(list);
    }


    /**
     * 获取菜单详细信息
     */
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(sysMenuService.selectSysMenuById(id));
    }

    /**
     * 新增菜单
     */
    @Log(title = "菜单管理",operate = Constant.OPERATE_INSERTE)
    @PostMapping
    public AjaxResult add(@RequestBody SysMenu sysMenu)
    {

        if(sysMenu.getType() == 0){
            sysMenu.setComponent("Layout");
        }

        return toAjax(sysMenuService.insertSysMenu(sysMenu));
    }

    /**
     * 修改菜单
     */
    @Log(title = "菜单管理",operate = Constant.OPERATE_UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody SysMenu sysMenu)
    {
        return toAjax(sysMenuService.updateSysMenu(sysMenu));
    }

    /**
     * 删除菜单
     */
    @Log(title = "菜单管理",operate = Constant.OPERATE_DELETE)
    @DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(sysMenuService.deleteSysMenuByIds(ids));
    }

}
