package com.blog.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

import java.io.Serializable;
import java.util.Date;


/**
 * <p>
 * 文章博客表
 * </p>
 *
 * @author 姓陈的
 * @since 2023-05-23
 */
@NoArgsConstructor
@AllArgsConstructor
@Data
@ToString
public class Article extends BaseEntity{

    private static final long serialVersionUID = 1L;

    /**
     * 主键
     */
    private Long id;

    /**
     * 标题
     */
    private String title;

    /**
     * 文章内容
     */
    private String content;

    /**
     * 作者用户id
     */
    private Long userId;

    /**
     * 审核状态（0代表审核中 1代表审核通过 2代表审核未通过）
     */
    private String status;

    /**
     * 审核时间
     */
    private Date auditTime;

    /**
     * 审核人id
     */
    private Long auditUserId;

    /**
     * 删除标志（0代表存在 2代表删除）
     */
    private String delFlag;


}
