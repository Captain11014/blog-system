package com.blog.controller;

import com.blog.model.*;
import com.blog.service.FavoriteService;
import com.blog.service.SysMenuService;
import com.blog.service.SysUserService;
import com.blog.util.MD5;
import com.blog.util.StringUtil;
import com.blog.util.base.BaseController;
import com.blog.util.exception.BlogEcxeption;
import com.blog.util.jwt.JwtUtil;
import com.blog.util.page.TableDataInfo;
import com.blog.util.result.AjaxResult;
import com.blog.util.result.HttpStatus;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author 姓陈的
 * 2023/5/23 16:25
 */
@RestController
@RequestMapping("/admin")
public class LoginController extends BaseController {

    @Autowired
    private SysUserService sysUserService;

    @Autowired
    private SysMenuService sysMenuService;

    /**
     * 登录
     * @return
     */
    @PostMapping("login")
    public AjaxResult login(@RequestBody LoginUser loginUser) {

        SysUser sysUser = sysUserService.selectSysUserByUsername(loginUser.getUsername());

        //判断账号密码
        if(StringUtil.isNull(sysUser) || !MD5.validate(sysUser.getPassword(),loginUser.getPassword())){
            throw new BlogEcxeption(HttpStatus.UNAUTHORIZED,"账号或密码错误");
        }

        //判断账号是否已停用
        if(sysUser.getStatus().equals(Constant.USER_STATUS_FALSE)){
            throw new BlogEcxeption(HttpStatus.UNAUTHORIZED,"账号已经停用，请联系管理员");
        }

        String token = JwtUtil.createToken(sysUser.getId(),sysUser.getUsername());

        Map<String, Object> map = new HashMap<>();
        map.put("token",token);
        return success(map);
    }
    /**
     * 获取用户信息
     * @return
     */
    @GetMapping("info")
    public AjaxResult info(HttpServletRequest request) {

        //1.从请求头获取用户信息
        String token = request.getHeader("token");
        //2.从token字符串获取用户id
        Long userId = JwtUtil.getUserId(token);
        //3.根据用户id查询数据库，获取用户信息
        SysUser sysUser = sysUserService.selectSysUserById(userId);
        //4.根据用户id获取用户可以操作的菜单列表
        //查询数据库动态构建路由结构，进行显示
        List<RouterVo> routerVos = sysMenuService.findUserMenuListByUserId(userId);

        //5.根据用户id获取用户可操作按钮列表
        List<String> permsList = sysMenuService.findMenuPermsByUserId(userId);

        Map<String, Object> map = new HashMap<>();
        map.put("name",sysUser.getUsername());
        map.put("avatar",sysUser.getHeadUrl());
        map.put("sysUser",sysUser);
        map.put("buttons", permsList);
        map.put("routers", routerVos);
        return success(map);
    }
    /**
     * 退出
     * @return
     */
    @PostMapping("logout")
    public AjaxResult logout(){
        return success();
    }

}
