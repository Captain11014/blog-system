package com.blog.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

import java.io.Serializable;


/**
 * <p>
 * 
 * </p>
 *
 * @author 姓陈的
 * @since 2023-05-23
 */
@NoArgsConstructor
@AllArgsConstructor
@Data
@ToString
public class FavoriteArticle extends BaseEntity {

    private static final long serialVersionUID = 1L;

    /**
     * 主键
     */
    private Long id;

    /**
     * 文章id
     */
    private Long articleId;


    /**
     * 用户id
     */
    private Long userId;

    /**
     * 删除标志（0代表存在 2代表删除）
     */
    private String delFlag;


}
