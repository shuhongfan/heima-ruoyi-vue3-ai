package com.dkd.manage.service;

import java.util.List;
import com.dkd.manage.domain.Role;

/**
 * 工单角色Service接口
 * 
 * @author itheima
 * @date 2024-06-15
 */
public interface IRoleService 
{
    /**
     * 查询工单角色
     * 
     * @param roleId 工单角色主键
     * @return 工单角色
     */
    public Role selectRoleByRoleId(Long roleId);

    /**
     * 查询工单角色列表
     * 
     * @param role 工单角色
     * @return 工单角色集合
     */
    public List<Role> selectRoleList(Role role);

    /**
     * 新增工单角色
     * 
     * @param role 工单角色
     * @return 结果
     */
    public int insertRole(Role role);

    /**
     * 修改工单角色
     * 
     * @param role 工单角色
     * @return 结果
     */
    public int updateRole(Role role);

    /**
     * 批量删除工单角色
     * 
     * @param roleIds 需要删除的工单角色主键集合
     * @return 结果
     */
    public int deleteRoleByRoleIds(Long[] roleIds);

    /**
     * 删除工单角色信息
     * 
     * @param roleId 工单角色主键
     * @return 结果
     */
    public int deleteRoleByRoleId(Long roleId);
}
