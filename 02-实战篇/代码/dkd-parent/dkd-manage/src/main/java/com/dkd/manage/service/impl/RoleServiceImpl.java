package com.dkd.manage.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.dkd.manage.mapper.RoleMapper;
import com.dkd.manage.domain.Role;
import com.dkd.manage.service.IRoleService;

/**
 * 工单角色Service业务层处理
 * 
 * @author itheima
 * @date 2024-06-15
 */
@Service
public class RoleServiceImpl implements IRoleService 
{
    @Autowired
    private RoleMapper roleMapper;

    /**
     * 查询工单角色
     * 
     * @param roleId 工单角色主键
     * @return 工单角色
     */
    @Override
    public Role selectRoleByRoleId(Long roleId)
    {
        return roleMapper.selectRoleByRoleId(roleId);
    }

    /**
     * 查询工单角色列表
     * 
     * @param role 工单角色
     * @return 工单角色
     */
    @Override
    public List<Role> selectRoleList(Role role)
    {
        return roleMapper.selectRoleList(role);
    }

    /**
     * 新增工单角色
     * 
     * @param role 工单角色
     * @return 结果
     */
    @Override
    public int insertRole(Role role)
    {
        return roleMapper.insertRole(role);
    }

    /**
     * 修改工单角色
     * 
     * @param role 工单角色
     * @return 结果
     */
    @Override
    public int updateRole(Role role)
    {
        return roleMapper.updateRole(role);
    }

    /**
     * 批量删除工单角色
     * 
     * @param roleIds 需要删除的工单角色主键
     * @return 结果
     */
    @Override
    public int deleteRoleByRoleIds(Long[] roleIds)
    {
        return roleMapper.deleteRoleByRoleIds(roleIds);
    }

    /**
     * 删除工单角色信息
     * 
     * @param roleId 工单角色主键
     * @return 结果
     */
    @Override
    public int deleteRoleByRoleId(Long roleId)
    {
        return roleMapper.deleteRoleByRoleId(roleId);
    }
}
