package com.blog.service;

import com.blog.model.SysLog;

import java.util.List;

/**
 * @author 姓陈的
 * 2023/6/18 12:50
 */
public interface SysLogService {

    /**
     * 查询系统日志
     *
     * @param id 系统日志主键
     * @return 系统日志
     */
    public SysLog selectSysLogById(Long id);

    /**
     * 查询系统日志列表

     * @param sysLog 系统日志
     * @return 系统日志集合
     */
    public List<SysLog> selectSysLogList(SysLog sysLog);

    /**
     * 新增系统日志
     *
     * @param sysLog 系统日志
     * @return 结果
     */
    public int insertSysLog(SysLog sysLog);

    /**
     * 修改系统日志
     *
     * @param sysLog 系统日志
     * @return 结果
     */
//    public int updateSysLog(SysLog sysLog);

    /**
     * 批量删除系统日志
     *
     * @param ids 需要删除的系统日志主键集合
     * @return 结果
     */
    public int deleteSysLogByIds(Long[] ids);

    /**
     * 删除系统日志信息
     *
     * @param id 系统日志主键
     * @return 结果
     */
    public int deleteSysLogById(Long id);
}
