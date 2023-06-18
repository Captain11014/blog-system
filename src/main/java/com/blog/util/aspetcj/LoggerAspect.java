package com.blog.util.aspetcj;

import cn.hutool.core.net.Ipv4Util;
import cn.hutool.http.Header;
import cn.hutool.http.useragent.UserAgent;
import cn.hutool.http.useragent.UserAgentUtil;
import cn.hutool.json.JSON;
import cn.hutool.json.JSONObject;
import cn.hutool.json.JSONUtil;
import com.blog.mapper.SysLogMapper;
import com.blog.model.SysLog;
import com.blog.util.ServletUtil;
import com.blog.util.StringUtil;
import com.blog.util.annotation.Log;
import com.blog.util.ip.IpUtil;
import com.blog.util.jwt.JwtUtil;
import com.fasterxml.jackson.databind.util.JSONPObject;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.Signature;
import org.aspectj.lang.annotation.*;
import org.aspectj.lang.reflect.MethodSignature;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpServletRequest;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.Arrays;

/**
 * @author 姓陈的
 * 2023/6/17 20:54
 */
@Aspect
@Component
public class LoggerAspect {

    @Autowired
    private SysLogMapper sysLogMapper;

    @Pointcut("@annotation(com.blog.util.annotation.Log)")
    public void pointCut() {
    }

    //    @Before("@annotation(controllerLog)")
    @AfterReturning(pointcut = "@annotation(controllerLog)", returning = "jsonResult")
    public void doBefore(JoinPoint joinPoint, Log controllerLog, Object jsonResult) throws UnknownHostException {
        handle(joinPoint,controllerLog,null,jsonResult);
    }

    /**
     * 拦截异常操作
     *
     * @param joinPoint 切点
     * @param e 异常
     */
    @AfterThrowing(value = "@annotation(controllerLog)", throwing = "e")
    public void doAfterThrowing(JoinPoint joinPoint, Log controllerLog, Exception e)
    {
        handle(joinPoint, controllerLog, e, null);
    }


    protected void handle(JoinPoint joinPoint,Log controllerLog,final Exception e, Object jsonResult){

        HttpServletRequest request = ServletUtil.getRequest();
        //获取客户端信息
        UserAgent ua = UserAgentUtil.parse(request.getHeader(Header.USER_AGENT.toString()));
        Signature signature = joinPoint.getSignature();
        //获取token
        String token = request.getHeader("token");
        SysLog sysLog = new SysLog();

        if(StringUtil.isNotEmpty(token)){
            sysLog.setOperName(JwtUtil.getUsername(token));
        }

        if(e != null){
            sysLog.setStatus(1);
            sysLog.setJsonResult(e.getMessage());
        }

        sysLog.setTitle(controllerLog.title());
        sysLog.setMethod(signature.getDeclaringTypeName() + "." + signature.getName() + "()");
        sysLog.setRequestMethod(request.getMethod());
        sysLog.setOperUrl(request.getRequestURI());
        sysLog.setOperIp(IpUtil.getRequestIP());
        sysLog.setOperParam(JSONUtil.toJsonStr(joinPoint.getArgs()));
        sysLog.setJsonResult(JSONUtil.toJsonStr(jsonResult));

        System.out.println("==================================这里是日志测试接口啊==========================");
        System.out.println("注解上的参数：" + controllerLog.title() + " :" + controllerLog.operate());
        System.out.println("IP地址：" + IpUtil.getRequestIP());
        System.out.println("浏览器：" + ua.getBrowser().toString());
        System.out.println("操作系统：" + ua.getOs().toString());
        System.out.println("操作结果：" + JSONUtil.toJsonStr(jsonResult));
        System.out.println("requestMethod：" + request.getMethod());
        System.out.println("requestparams：" + Arrays.toString(joinPoint.getArgs()));
        System.out.println("requestUrl：" + request.getRequestURI());
        System.out.println("joinPoint：" + joinPoint.getSignature().getName());
        System.out.println("joinPoint：" + joinPoint.getSignature().getDeclaringTypeName());
        System.out.println("joinPoint：" + joinPoint.getSignature().getDeclaringType());
        System.out.println("joinPoint：" + joinPoint.getSignature().getModifiers());
        System.out.println("joinPoint：" + joinPoint.getSignature().getClass());
        System.out.println("method:" + joinPoint.getSignature().getDeclaringTypeName() + "." + joinPoint.getSignature().getName() + "()");
        System.out.println(sysLog);

        sysLogMapper.insertSysLog(sysLog);

    }
}
