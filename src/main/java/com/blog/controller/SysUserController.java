package com.blog.controller;


import com.blog.model.Constant;
import com.blog.model.SysRole;
import com.blog.model.SysUser;
import com.blog.service.SysRoleService;
import com.blog.service.SysUserService;
import com.blog.util.annotation.Log;
import com.blog.util.base.BaseController;
import com.blog.util.page.TableDataInfo;
import com.blog.util.result.AjaxResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import org.springframework.stereotype.Controller;

import java.util.List;
import java.util.stream.Collectors;

/**
 * <p>
 * 用户表 前端控制器
 * </p>
 * 用户管理模块
 * @author 姓陈的
 * @since 2023-05-23
 */
@RestController
@RequestMapping("/system/user")
public class SysUserController extends BaseController {

    @Autowired
    private SysUserService sysUserService;

    @Autowired
    private SysRoleService sysRoleService;

    /**
     * 查询用户列表
     * @param sysUser 用户信息参数
     * @return
     */
    @GetMapping("/list")
    public TableDataInfo list(SysUser sysUser)
    {
        startPage();//分页
        List<SysUser> list = sysUserService.selectSysUserList(sysUser);
        return getDataTable(list);
    }


    /**
     * 根据id获取用户详细信息
     */
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(sysUserService.selectSysUserById(id));
    }

    /**
     * 根据用户名查询用户信息
     * @param username 前端传递用户名（参数）
     * @return
     */
    @GetMapping("/selectSysUserByUsername/{username}")
    public AjaxResult selectSysUserByUsername(@PathVariable String username){
        return success(sysUserService.selectSysUserByUsername(username));
    }

    /**
     * 新增用户
     * @param sysUser 前端传递用户参数
     * @return
     */
    @Log(title = "用户管理",operate = Constant.OPERATE_INSERTE)
    @PostMapping
    public AjaxResult add(@RequestBody SysUser sysUser)
    {
        return toAjax(sysUserService.insertSysUser(sysUser));
    }

    /**
     * 修改用户
     * @param sysUser 前端传递用户参数 （id和用户的状态账户的停用参数（0）或（2）
     * @return
     */
    @Log(title = "用户管理",operate = Constant.OPERATE_UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody SysUser sysUser)
    {
        return toAjax(sysUserService.updateSysUser(sysUser));
    }

    /**
     * 删除用户
     * 前端传递id数组，根据id删除
     */
    @Log(title = "用户管理",operate = Constant.OPERATE_DELETE)
    @DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(sysUserService.deleteSysUserByIds(ids));
    }

    /**
     * 根据用户编号获取授权角色
     */
    @GetMapping("/authRole/{userId}")
    public AjaxResult authRole(@PathVariable Long userId){

        SysUser sysUser = sysUserService.selectSysUserById(userId);
        List<SysRole> sysRoles = sysRoleService.selectRoleByUserId(userId);
        AjaxResult ajax = success();
        ajax.put("user",sysUser);
        ajax.put("roles",SysUser.isAdmin(userId)?sysRoles : sysRoles.stream().filter(r -> !r.isAdmin()).collect(Collectors.toList()));
        return ajax;
    }

    /**
     * 用户分配角色·
     * @param userId
     * @param roleIds
     * @return
     */
    @Log(title = "用户管理",operate = Constant.OPERATE_INSERTE)
    @PostMapping("/updateAuthRole")
    public AjaxResult insertAuthRole(Long userId,Long[] roleIds){
        return toAjax(sysUserService.insertAuthRole(userId,roleIds));
    }


}
