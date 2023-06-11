package com.blog.controller;

import cn.hutool.core.date.DateUtil;
import cn.hutool.core.lang.UUID;
import com.blog.config.ServerConfig;
import com.blog.model.Constant;
import com.blog.util.ServletUtil;
import com.blog.util.exception.BlogEcxeption;
import com.blog.util.result.AjaxResult;
import com.blog.util.result.HttpStatus;
import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.Date;

/**
 * 通用controller
 * @author 姓陈的
 * 2023/6/6 21:56
 */
@RestController
@RequestMapping("/common")
public class CommonController {

    //win磁盘目录
    public static final String uploadPathStr = "D:/studyCode/upload";

    @Autowired
    private ServerConfig serverConfig;



    @RequestMapping("/upload")
    public AjaxResult uploadFile(MultipartFile file){

        //设置上传路劲
        String datePath = serverConfig.dateUploadPath();
        String uploadPath = uploadPathStr + "/" + datePath;
        System.out.println("========================"+uploadPath);

        String url = serverConfig.getUrl();
        //获取文件名
        String fileName = file.getOriginalFilename();
        //生成新文件名，避免重名
        String newFileName = UUID.randomUUID(true)+fileName;

        //文件的映射路径
        String path = Constant.RESOURCE_PREFIX+"/"+datePath+"/"+newFileName;

        AjaxResult ajax = AjaxResult.success();
        ajax.put("url", url+ path);
        ajax.put("fileName", path);
        ajax.put("newFileName", newFileName);
        ajax.put("originalFilename", file.getOriginalFilename());


        File file1 = new File(uploadPath);
        if(!file1.exists()){
            file1.mkdirs();
        }
        System.out.println(uploadPath + "/" + newFileName);
        try {
            file.transferTo(new File(uploadPath + "/" + newFileName));
        } catch (IOException e) {
            e.printStackTrace();
            throw new BlogEcxeption(HttpStatus.ERROR,"文件上传失败");
        }
        return ajax;
    }



}
