package com.blog.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

import java.io.Serializable;


/**
 * <p>
 * 评论表
 * </p>
 *
 * @author 姓陈的
 * @since 2023-05-23
 */
@NoArgsConstructor
@AllArgsConstructor
@Data
@ToString
public class Comment extends BaseEntity{

    private static final long serialVersionUID = 1L;

    /**
     * 主键
     */
    private Long id;

    /**
     * 评论父id
     */
    private Long parentId;

    /**
     * 评论内容
     */
    private String commentContent;

    /**
     * 文章id
     */
    private Long articleId;

    /**
     * 评论用户id
     */
    private Long userId;

    /**
     * 评论回复用户id
     */
    private Long replyUserId;

    /**
     * 删除标志（0代表存在 2代表删除）
     */
    private String delFlag;


}
