package com.blog.service.impl;

import com.blog.model.Constant;
import com.blog.model.MetaVo;
import com.blog.model.RouterVo;
import com.blog.model.SysMenu;
import com.blog.mapper.SysMenuMapper;
import com.blog.service.SysMenuService;
import com.blog.util.DateUtils;
import com.blog.util.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import java.awt.*;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

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
     * 根据角色id查询菜单列表
     * @param roleId
     * @return
     */
    @Override
    public List<SysMenu> selectMenuByRoleId(Long roleId) {

        //获取所有菜单列表
        List<SysMenu> allMenuList = sysMenuMapper.selectSysMenuList(new SysMenu());
        //获取角色所有的菜单列表
        List<SysMenu> roleMenuList = sysMenuMapper.selectMenuByRoleId(roleId);

        for(SysMenu sysMenu : allMenuList){
            for(SysMenu menu : roleMenuList){
                if(sysMenu.getId().longValue() == menu.getId().longValue()){
                    sysMenu.setSelect(true);
                    break;
                }
            }
        }
        return buildMenuTree(allMenuList);
    }

    /**
     * 根据角色id获取该角色所拥有的菜单列表
     * @param roleId
     * @return
     */
    @Override
    public List<SysMenu> getMenuByRoleId(Long roleId) {
        return buildMenuTree(sysMenuMapper.selectMenuByRoleId(roleId));
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
     * 查询数据库动态构建路由结构，进行显示
     * @return
     */
    @Override
    public List<RouterVo> findUserMenuListByUserId(Long userId) {

        List<SysMenu> sysMenus = null;

        if(userId == Constant.USER_ADMIN){
            //如果是管理员，查询所有菜单列表
            SysMenu sysMenu = new SysMenu();
            sysMenu.setStatus(Constant.MENU_STATUS_TRUE);
            sysMenus = sysMenuMapper.selectSysMenuList(sysMenu);
        }else{
            //2.如果不是管理员，根据userId查询可操作菜单列表
            //多表关联查询：用户角色关系表、角色菜单关系表、菜单表
            sysMenus = sysMenuMapper.findUserMenuListByUserId(userId);
        }

        //把查询出来数据列表构建成框架要求的路由数据结构
        List<SysMenu> sysMenuTreeList = buildMenuTree(sysMenus);
        List<RouterVo> routerVoList = this.buildRouter(sysMenuTreeList);

        return routerVoList;
    }

    /**
     * 根据用户id获取用户可操作按钮列表
     * @param userId
     * @return
     */
    @Override
    public List<String> findMenuPermsByUserId(Long userId) {

        List<SysMenu> sysMenus = null;

        if(userId == Constant.USER_ADMIN){
            //如果是管理员，查询所有菜单列表
            SysMenu sysMenu = new SysMenu();
            sysMenu.setStatus(Constant.MENU_STATUS_TRUE);
            sysMenus = sysMenuMapper.selectSysMenuList(sysMenu);
        }else{
            //2.如果不是管理员，根据userId查询可操作菜单列表
            //多表关联查询：用户角色关系表、角色菜单关系表、菜单表
            sysMenus = sysMenuMapper.findUserMenuListByUserId(userId);
        }

        List<String> permsList = sysMenus.stream().filter(item -> item.getType() == 2).map(item -> item.getPerms()).collect(Collectors.toList());

        return permsList;
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


    /**
     * 构建前端路由所以需要的结构
     * @param menus
     * @return
     */
    private List<RouterVo> buildRouter(List<SysMenu> menus) {

        List<RouterVo> routers = new ArrayList<>();

        for (SysMenu menu : menus) {
            RouterVo router = new RouterVo();
            router.setHidden(false);
            router.setAlwaysShow(false);
            router.setPath(getRouterPath(menu));
            router.setComponent(menu.getComponent());
            router.setMeta(new MetaVo(menu.getName(), menu.getIcon()));
            //下一层数据部分
            List<SysMenu> children = menu.getChildren();
            if(menu.getType().intValue() == 1) {
                //加载隐藏路由
                List<SysMenu> hiddenMenuList = children.stream().filter(item -> !StringUtil.isEmpty(item.getComponent())).collect(Collectors.toList());
                for (SysMenu hiddenMenu : hiddenMenuList) {
                    RouterVo hiddenRouter = new RouterVo();
                    hiddenRouter.setHidden(true);
                    hiddenRouter.setAlwaysShow(false);
                    hiddenRouter.setPath(getRouterPath(hiddenMenu));
                    hiddenRouter.setComponent(hiddenMenu.getComponent());
                    hiddenRouter.setMeta(new MetaVo(hiddenMenu.getName(), hiddenMenu.getIcon()));
                    routers.add(hiddenRouter);
                }
            } else {
                if (!CollectionUtils.isEmpty(children)) {
                    if(children.size() > 0) {
                        router.setAlwaysShow(true);
                    }
                    router.setChildren(buildRouter(children));
                }
            }
            routers.add(router);

        }

        return routers;
    }

    /**
     * 获取路由地址
     *
     * @param menu 菜单信息
     * @return 路由地址
     */
    public String getRouterPath(SysMenu menu) {
        String routerPath = "/" + menu.getPath();
        if(menu.getParentId().intValue() != 0) {
            routerPath = menu.getPath();
        }
        return routerPath;
    }

}
