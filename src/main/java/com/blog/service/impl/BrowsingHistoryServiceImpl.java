package com.blog.service.impl;

import com.blog.model.BrowsingHistory;
import com.blog.mapper.BrowsingHistoryMapper;
import com.blog.service.BrowsingHistoryService;
import com.blog.util.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * <p>
 * 浏览记录表 服务实现类
 * </p>
 *
 * @author 姓陈的
 * @since 2023-05-23
 */
@Service
public class BrowsingHistoryServiceImpl implements BrowsingHistoryService {

    @Autowired
    private BrowsingHistoryMapper browsingHistoryMapper;

    /**
     * 查询浏览记录
     *
     * @param id 浏览记录主键
     * @return 浏览记录
     */
    @Override
    public BrowsingHistory selectBrowsingHistoryById(Long id)
    {
        return browsingHistoryMapper.selectBrowsingHistoryById(id);
    }

    /**
     * 查询浏览记录列表
     *
     * @param browsingHistory 浏览记录
     * @return 浏览记录
     */
    @Override
    public List<BrowsingHistory> selectBrowsingHistoryList(BrowsingHistory browsingHistory)
    {
        return browsingHistoryMapper.selectBrowsingHistoryList(browsingHistory);
    }

    /**
     * 新增浏览记录
     *
     * @param browsingHistory 浏览记录
     * @return 结果
     */
    @Override
    public int insertBrowsingHistory(BrowsingHistory browsingHistory)
    {
        browsingHistory.setCreateTime(DateUtils.getNowDate());
        return browsingHistoryMapper.insertBrowsingHistory(browsingHistory);
    }

    /**
     * 修改浏览记录
     *
     * @param browsingHistory 浏览记录
     * @return 结果
     */
    @Override
    public int updateBrowsingHistory(BrowsingHistory browsingHistory)
    {
        browsingHistory.setUpdateTime(DateUtils.getNowDate());
        return browsingHistoryMapper.updateBrowsingHistory(browsingHistory);
    }

    /**
     * 批量删除浏览记录
     *
     * @param ids 需要删除的浏览记录主键
     * @return 结果
     */
    @Override
    public int deleteBrowsingHistoryByIds(Long[] ids)
    {
        return browsingHistoryMapper.deleteBrowsingHistoryByIds(ids);
    }

    /**
     * 删除浏览记录信息
     *
     * @param id 浏览记录主键
     * @return 结果
     */
    @Override
    public int deleteBrowsingHistoryById(Long id)
    {
        return browsingHistoryMapper.deleteBrowsingHistoryById(id);
    }

}
