package com.blog.service.impl;

import com.blog.model.SysMenu;
import com.blog.mapper.SysMenuMapper;
import com.blog.service.SysMenuService;
import com.blog.util.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.awt.*;
import java.util.ArrayList;
import java.util.List;

/**
 * <p>
 * 菜单表 服务实现类
 * </p>
 *
 * @author 姓陈的
 * @since 2023-05-23
 */
@Service
public class SysMenuServiceImpl implements SysMenuService {

    @Autowired
    private SysMenuMapper sysMenuMapper;

    /**
     * 查询菜单
     *
     * @param id 菜单主键
     * @return 菜单
     */
    @Override
    public SysMenu selectSysMenuById(Long id)
    {
        return sysMenuMapper.selectSysMenuById(id);
    }

    /**
     * 查询菜单列表
     *
     * @param sysMenu 菜单
     * @return 菜单
     */
    @Override
    public List<SysMenu> selectSysMenuList(SysMenu sysMenu)
    {
        return buildMenuTree(sysMenuMapper.selectSysMenuList(sysMenu));
    }

    /**
     * 新增菜单
     *
     * @param sysMenu 菜单
     * @return 结果
     */
    @Override
    public int insertSysMenu(SysMenu sysMenu)
    {
        sysMenu.setCreateTime(DateUtils.getNowDate());
        return sysMenuMapper.insertSysMenu(sysMenu);
    }

    /**
     * 修改菜单
     *
     * @param sysMenu 菜单
     * @return 结果
     */
    @Override
    public int updateSysMenu(SysMenu sysMenu)
    {
        sysMenu.setUpdateTime(DateUtils.getNowDate());
        return sysMenuMapper.updateSysMenu(sysMenu);
    }

    /**
     * 批量删除菜单
     *
     * @param ids 需要删除的菜单主键
     * @return 结果
     */
    @Override
    public int deleteSysMenuByIds(Long[] ids)
    {
        return sysMenuMapper.deleteSysMenuByIds(ids);
    }

    /**
     * 删除菜单信息
     *
     * @param id 菜单主键
     * @return 结果
     */
    @Override
    public int deleteSysMenuById(Long id)
    {
        return sysMenuMapper.deleteSysMenuById(id);
    }

    /**
     * 构建树形结构菜单列表
     * @param menus
     * @return
     */
    @Override
    public List<SysMenu> buildMenuTree(List<SysMenu> menus) {

        List<SysMenu> trees = new ArrayList<>();

        for(SysMenu menu : menus){
            //0代表最顶级父节点，如果是父节点则遍历其所有的子节点
            if(menu.getParentId().longValue() == 0){
                trees.add(findChildren(menus,menu));
            }
        }
        return trees;
    }

    /**
     * 递归列表
     * 查找子节点
     * @param list
     * @param menu 子节点
     * @return
     */
    public SysMenu findChildren(List<SysMenu> list,SysMenu menu){

        menu.setChildren(new ArrayList<>());
        for(SysMenu s : list){
            //如果某节点的父id等于id则继续递归查找其子节点。
            if(menu.getId().longValue() == s.getParentId().longValue()){
                menu.getChildren().add(findChildren(list,s));
            }
        }
        return menu;
    }

}
