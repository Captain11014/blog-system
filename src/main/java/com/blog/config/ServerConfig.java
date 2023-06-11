package com.blog.config;

import cn.hutool.core.date.DateUtil;
import com.blog.util.ServletUtil;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpServletRequest;

/**
 * 服务器相关配置
 * @author 姓陈的
 * 2023/6/6 22:12
 */
@Component
public class ServerConfig
{

    public static final String uploadPathStr = "D:/studyCode/upload";

    /**
     * 获取完整的请求路径，包括：域名，端口，上下文访问路径
     *
     * @return 服务地址
     */
    public String getUrl()
    {
        HttpServletRequest request = ServletUtil.getRequest();
        return getDomain(request);
    }

    public static String getDomain(HttpServletRequest request)
    {
        StringBuffer url = request.getRequestURL();
        String contextPath = request.getServletContext().getContextPath();
        return url.delete(url.length() - request.getRequestURI().length(), url.length()).append(contextPath).toString();
    }

    /**
     * 上传路径
     * @return
     */
    public String uploadPath(){
        return uploadPathStr+"/" + dateUploadPath();
    }

    //配置日期上传路径 如 2022/10/15
    public String dateUploadPath(){
        return DateUtil.format(DateUtil.date(), "yyyy/MM/dd");
    }


}
