package com.blog.interceptor;

import com.blog.model.Constant;
import com.blog.util.StringUtil;
import com.blog.util.annotation.Permission;
import com.blog.util.exception.BlogEcxeption;
import com.blog.util.jwt.JwtUtil;
import com.blog.util.result.HttpStatus;
import com.github.benmanes.caffeine.cache.Cache;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * @author 姓陈的
 * 2023/6/19 14:14
 */
public class PermissionInterceptor implements HandlerInterceptor {

    @Autowired
    private Cache<String,Object> cache;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

        if(handler instanceof HandlerMethod){
            HandlerMethod method = (HandlerMethod) handler;
            //查看方法是否有注解
            Permission permission = method.getMethodAnnotation(Permission.class);
            //接口没有权限注解则放行
            if(StringUtil.isNull(permission)){
                System.out.println("------------------------放行啦----------------");
                return true;
            }
            //没有token则拦截
            String token = request.getHeader("token");
            if(StringUtil.isEmpty(token)){
                System.out.println("------------------------没有token----------------");
                throw new BlogEcxeption(HttpStatus.UNAUTHORIZED,"未授权");
            }

            if(permission.value().equals("")){
                System.out.println("--------------------注解值为“”----放行啦----------------");
                return true;
            }

            //获取userId
            Long userId = JwtUtil.getUserId(token);

            //获取缓存的权限列表
            List<String> ifPresent = (List<String>) cache.getIfPresent(Constant.PERMS_NAME + userId);
            if(!(ifPresent != null)){
                throw new BlogEcxeption(HttpStatus.FORBIDDEN,"没有权限");
            }
            System.out.println("===================获取权限列表==============");
            System.out.println(ifPresent);
            boolean b = hasPerms(ifPresent,permission.value());

            if(!b){
                System.out.println("权限列表没有这个角色");
                throw new BlogEcxeption(HttpStatus.UNAUTHORIZED,"没有权限");
            }

        }

        return true;
    }

    protected boolean hasPerms(List<String> list , String permCode){
        boolean b = false;
        for (String s:list) {
            if(permCode.equals(s)){
                return true;
            }
        }
        return b;

    }
}
