package com.blog.util.exception;

import lombok.Data;

/**
 * @author 姓陈的
 * 2023/6/5 14:59
 */
@Data
public class BlogEcxeption extends RuntimeException {

    private Integer code;

    private String msg;


    /**
     * 通过状态码和错误消息创建异常对象
     * @param code
     * @param msg
     */
    public BlogEcxeption(Integer code, String msg) {
        super(msg);
        this.code = code;
        this.msg = msg;
    }

    

}
