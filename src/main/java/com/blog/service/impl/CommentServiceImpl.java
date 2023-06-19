package com.blog.service.impl;

import com.blog.model.Comment;
import com.blog.mapper.CommentMapper;
import com.blog.service.CommentService;
import com.blog.util.DateUtils;
import com.blog.util.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

/**
 * <p>
 * 评论表 服务实现类
 * </p>
 *
 * @author 姓陈的
 * @since 2023-05-23
 */
@Service
public class CommentServiceImpl implements CommentService {

    @Autowired
    private CommentMapper commentMapper;

    /**
     * 查询评论
     *
     * @param id 评论主键
     * @return 评论
     */
    @Override
    public Comment selectCommentById(Long id) {
        return commentMapper.selectCommentById(id);
    }

    /**
     * 查询评论列表
     *
     * @param comment 评论
     * @return 评论
     */
    @Override
    public List<Comment> selectCommentList(Comment comment) {
        comment.setParentId(0L);
        //获取所有父节点
        List<Comment> list = commentMapper.selectCommentList(comment);

        if (!list.isEmpty()) {
            List<Long> ids = list.stream().map(item -> item.getId()).collect(Collectors.toList());
            //清空parentId参数
            comment.setParentId(null);
            comment.setIds(ids);
            //获取对应子节点
            List<Comment> children = commentMapper.selectCommentList(comment);

            //遍历集合，构建二级树
            for (Comment c : list) {
                c.setChildren(new ArrayList<>());
                for (Comment c1 : children) {
                    if (c.getId().longValue() == c1.getParentId().longValue()) {
                        c.getChildren().add(c1);
                    }
                }
            }
        }

        return list;
    }

    /**
     * 查询子节点
     *
     * @param comment
     * @param list
     * @return
     */
    private Comment findChildren(Comment comment, List<Comment> list) {
        comment.setChildren(new ArrayList<>());
        for (Comment c : list) {
            if (c.getParentId().longValue() == comment.getId().longValue()) {
                comment.getChildren().add(findChildren(c, list));
            }
        }
        return comment;
    }

    /**
     * 新增评论
     *
     * @param comment 评论
     * @return 结果
     */
    @Override
    public int insertComment(Comment comment) {
        comment.setCreateTime(DateUtils.getNowDate());
        return commentMapper.insertComment(comment);
    }

    /**
     * 修改评论
     *
     * @param comment 评论
     * @return 结果
     */
    @Override
    public int updateComment(Comment comment) {
        comment.setUpdateTime(DateUtils.getNowDate());
        return commentMapper.updateComment(comment);
    }

    /**
     * 批量删除评论
     *
     * @param ids 需要删除的评论主键
     * @return 结果
     */
    @Override
    public int deleteCommentByIds(Long[] ids) {
        return commentMapper.deleteCommentByIds(ids);
    }

    /**
     * 删除评论信息
     *
     * @param id 评论主键
     * @return 结果
     */
    @Override
    public int deleteCommentById(Long id) {
        return commentMapper.deleteCommentById(id);
    }

}
