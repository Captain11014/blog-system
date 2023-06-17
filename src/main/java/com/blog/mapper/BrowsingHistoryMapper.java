package com.blog.mapper;

import com.blog.model.BrowsingHistory;

import java.util.List;

/**
 * <p>
 * 浏览记录表 Mapper 接口
 * </p>
 *
 * @author 姓陈的
 * @since 2023-05-23
 */
public interface BrowsingHistoryMapper {

    /**
     * 查询浏览记录
     *
     * @param id 浏览记录主键
     * @return 浏览记录
     */
    public BrowsingHistory selectBrowsingHistoryById(Long id);

    /**
     * 查询浏览记录列表
     *
     * @param browsingHistory 浏览记录
     * @return 浏览记录集合
     */
    public List<BrowsingHistory> selectBrowsingHistoryList(BrowsingHistory browsingHistory);

    /**
     * 新增浏览记录
     *
     * @param browsingHistory 浏览记录
     * @return 结果
     */
    public int insertBrowsingHistory(BrowsingHistory browsingHistory);

    /**
     * 修改浏览记录
     *
     * @param browsingHistory 浏览记录
     * @return 结果
     */
    public int updateBrowsingHistory(BrowsingHistory browsingHistory);

    /**
     * 删除浏览记录
     *
     * @param id 浏览记录主键
     * @return 结果
     */
    public int deleteBrowsingHistoryById(Long id);

    /**
     * 批量删除浏览记录
     *
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteBrowsingHistoryByIds(Long[] ids);

}
