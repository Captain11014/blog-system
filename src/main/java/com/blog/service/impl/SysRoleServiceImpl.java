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
     *
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
     *
     * @param sysRole 角色
     * @return 结果
     */
    @Override
    @Transactional
    public int insertSysRole(SysRole sysRole)
    {
        sysRole.setCreateTime(DateUtils.getNowDate());
        int i = sysRoleMapper.insertSysRole(sysRole);
        Long roleId = sysRole.getId();
        System.out.println("==================================================="+sysRole.getId());

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
        sysRole.setUpdateTime(DateUtils.getNowDate());
        int i = sysRoleMapper.updateSysRole(sysRole);

        if(StringUtil.isNotNull(sysRole.getMenuIds()) && sysRole.getMenuIds().length > 0){
            i = sysRoleMenuMapper.delRoleMenuByRoleId(sysRole.getId());
            List<SysRoleMenu> sysRoleMenus = new ArrayList<>();
            for(Long menuId : sysRole.getMenuIds()){
                SysRoleMenu sysRoleMenu = new SysRoleMenu();
                sysRoleMenu.setRoleId(sysRole.getId());
                sysRoleMenu.setMenuId(menuId);
                sysRoleMenus.add(sysRoleMenu);
            }
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
