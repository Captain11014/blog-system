package com.blog.service.impl;

import com.blog.mapper.SysRoleMenuMapper;
import com.blog.model.SysRole;
import com.blog.mapper.SysRoleMapper;
import com.blog.model.SysRoleMenu;
import com.blog.service.SysRoleService;
import com.blog.util.DateUtils;
import com.blog.util.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

/**
 * <p>
 * 角色 服务实现类
 * </p>
 *
 * @author 姓陈的
 * @since 2023-05-23
 */
@Service
public class SysRoleServiceImpl  implements SysRoleService {


    @Autowired
    private SysRoleMapper sysRoleMapper;

    @Autowired
    private SysRoleMenuMapper sysRoleMenuMapper;

    /**
     * 查询角色
     * @param id 角色主键
     * @return 角色
     */
    @Override
    public SysRole selectSysRoleById(Long id)
    {
        return sysRoleMapper.selectSysRoleById(id);
    }

    /**
     * 根据用户id查询用户所拥有的角色
     * @param userId
     * @return
     */
    @Override
    public List<SysRole> selectRoleByUserId(Long userId) {

        List<SysRole> userRoles = sysRoleMapper.selectRoleByUserId(userId);
        List<SysRole> roles = selectSysRoleList(new SysRole());

        for(SysRole sysRole : roles){
            for (SysRole userRole : userRoles){
                if(sysRole.getId().longValue() == userRole.getId().longValue()){
                    sysRole.setFlag(true);
                    break;
                }
            }
        }
        return roles;
    }

    /**
     * 查询角色列表
     *
     * @param sysRole 角色
     * @return 角色
     */
    @Override
    public List<SysRole> selectSysRoleList(SysRole sysRole)
    {
        return sysRoleMapper.selectSysRoleList(sysRole);
    }

    /**
     * 新增角色
     * @Transactional 事务，如果有sql执行不成功则回滚。
     * @param sysRole 角色
     * @return 结果
     */
    @Override
    @Transactional
    public int insertSysRole(SysRole sysRole)
    {
        //设置当前系统时间
        sysRole.setCreateTime(DateUtils.getNowDate());
        //插入角色
        int i = sysRoleMapper.insertSysRole(sysRole);
//        获取插入之后的主键
        Long roleId = sysRole.getId();
        System.out.println("==================================================="+sysRole.getId());

        //如果前端分配了菜单权限则将数据插入sys_role_menu角色菜单表。
        if(StringUtil.isNotNull(sysRole.getMenuIds()) && sysRole.getMenuIds().length > 0){
            List<SysRoleMenu> sysRoleMenus = new ArrayList<>();
            for(Long menuId : sysRole.getMenuIds()){
                SysRoleMenu sysRoleMenu = new SysRoleMenu();
                sysRoleMenu.setRoleId(roleId);
                sysRoleMenu.setMenuId(menuId);
                sysRoleMenus.add(sysRoleMenu);
            }
            i = sysRoleMenuMapper.batchInsert(sysRoleMenus);
        }
        //如果i>0则插入成功；
        return i;
    }

    /**
     * 修改角色
     *
     * @param sysRole 角色
     * @return 结果
     */
    @Override
    @Transactional
    public int updateSysRole(SysRole sysRole)
    {
        //设置修改时间
        sysRole.setUpdateTime(DateUtils.getNowDate());
        int i = sysRoleMapper.updateSysRole(sysRole);

        //如果前端分配了菜单权限则将数据插入sys_role_menu角色菜单表。
        if(StringUtil.isNotNull(sysRole.getMenuIds()) && sysRole.getMenuIds().length > 0){
            //先将原有角色菜单的数据删除
            i = sysRoleMenuMapper.delRoleMenuByRoleId(sysRole.getId());
            List<SysRoleMenu> sysRoleMenus = new ArrayList<>();
            for(Long menuId : sysRole.getMenuIds()){
                SysRoleMenu sysRoleMenu = new SysRoleMenu();
                sysRoleMenu.setRoleId(sysRole.getId());
                sysRoleMenu.setMenuId(menuId);
                sysRoleMenus.add(sysRoleMenu);
            }
            //新增角色菜单数据
            i = sysRoleMenuMapper.batchInsert(sysRoleMenus);
        }

        return i;
    }

    /**
     * 批量删除角色
     *
     * @param ids 需要删除的角色主键
     * @return 结果
     */
    @Override
    public int deleteSysRoleByIds(Long[] ids)
    {
        return sysRoleMapper.deleteSysRoleByIds(ids);
    }

    /**
     * 删除角色信息
     *
     * @param id 角色主键
     * @return 结果
     */
    @Override
    public int deleteSysRoleById(Long id)
    {
        return sysRoleMapper.deleteSysRoleById(id);
    }

}
