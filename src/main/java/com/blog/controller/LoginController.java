package com.blog.controller;

import com.blog.model.Favorite;
import com.blog.service.FavoriteService;
import com.blog.util.base.BaseController;
import com.blog.util.page.TableDataInfo;
import com.blog.util.result.AjaxResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
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

    /**
     * 登录
     * @return
     */
    @PostMapping("login")
    public AjaxResult login() {
        Map<String, Object> map = new HashMap<>();
        map.put("token","admin");
        return success(map);
    }
    /**
     * 获取用户信息
     * @return
     */
    @GetMapping("info")
    public AjaxResult info() {
        Map<String, Object> map = new HashMap<>();
        map.put("roles","[admin]");
        map.put("name","admin");
        map.put("avatar","https://oss.aliyuncs.com/aliyun_id_photo_bucket/default_handsome.jpg");
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
