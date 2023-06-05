package com.blog.service;

import com.blog.model.SysMenu;

import java.util.List;


/**
 * <p>
 * 菜单表 服务类
 * </p>
 *
 * @author 姓陈的
 * @since 2023-05-23
 */
public interface SysMenuService {


    /**
     * 查询菜单
     *
     * @param id 菜单主键
     * @return 菜单
     */
    public SysMenu selectSysMenuById(Long id);

    /**
     * 查询菜单列表
     *
     * @param sysMenu 菜单
     * @return 菜单集合
     */
    public List<SysMenu> selectSysMenuList(SysMenu sysMenu);

    /**
     * 根据角色id查询菜单列表
     * @param roleId
     * @return
     */
    public List<SysMenu> selectMenuByRoleId(Long roleId);

    /**
     * 根据角色id获取该角色所拥有的菜单列表
     * @param roleId
     * @return
     */
    public List<SysMenu> getMenuByRoleId(Long roleId);

    /**
     * 新增菜单
     *
     * @param sysMenu 菜单
     * @return 结果
     */
    public int insertSysMenu(SysMenu sysMenu);

    /**
     * 修改菜单
     *
     * @param sysMenu 菜单
     * @return 结果
     */
    public int updateSysMenu(SysMenu sysMenu);

    /**
     * 批量删除菜单
     *
     * @param ids 需要删除的菜单主键集合
     * @return 结果
     */
    public int deleteSysMenuByIds(Long[] ids);

    /**
     * 删除菜单信息
     *
     * @param id 菜单主键
     * @return 结果
     */
    public int deleteSysMenuById(Long id);

    /**
     * 构建树形结构菜单列表
     * @param menus
     * @return
     */
    public List<SysMenu> buildMenuTree(List<SysMenu> menus);

}
