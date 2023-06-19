package com.blog.model;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;
import org.springframework.format.annotation.DateTimeFormat;

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
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss",timezone = "GMT+8")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date auditTime;

    /**
     * 审核人id
     */
    private Long auditUserId;

    /**
     * 删除标志（0代表存在 2代表删除）
     */
    private String delFlag;

    /**
     * 收藏数量
     */
    private Integer favoriteSum;

    /**
     * 浏览记录数量
     */
    private Integer browsingSum;

    /**
     * 用户信息（博客作者）
     */
    private SysUser user;

    /**
     * 审核员信息
     */
    private SysUser auditUser;

    /**
     * 作者
     */
    private String nickname;

    /**
     * 浏览记录
     */
    private BrowsingHistory browsingHistory;

    /**
     * 评论数量
     */
    private Integer commentSum;



}
