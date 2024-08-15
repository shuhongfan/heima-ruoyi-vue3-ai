package com.dkd.manage.service.impl;

import com.dkd.common.utils.DateUtils;
import com.dkd.manage.domain.Emp;
import com.dkd.manage.domain.Role;
import com.dkd.manage.mapper.EmpMapper;
import com.dkd.manage.mapper.RegionMapper;
import com.dkd.manage.mapper.RoleMapper;
import com.dkd.manage.service.IEmpService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 人员列表Service业务层处理
 *
 * @author itheima
 * @date 2024-06-15
 */
@Service
public class EmpServiceImpl implements IEmpService
{
    @Autowired
    private EmpMapper empMapper;

    @Autowired
    private RegionMapper regionMapper;

    @Autowired
    private RoleMapper roleMapper;

    /**
     * 查询人员列表
     *
     * @param id 人员列表主键
     * @return 人员列表
     */
    @Override
    public Emp selectEmpById(Long id)
    {
        return empMapper.selectEmpById(id);
    }

    /**
     * 查询人员列表列表
     *
     * @param emp 人员列表
     * @return 人员列表
     */
    @Override
    public List<Emp> selectEmpList(Emp emp)
    {
        return empMapper.selectEmpList(emp);
    }

    /**
     * 新增人员列表
     *
     * @param emp 人员列表
     * @return 结果
     */
    @Override
    public int insertEmp(Emp emp)
    {
        // 补充区域名称
        emp.setRegionName(regionMapper.selectRegionById(emp.getRegionId()).getRegionName());
        // 补充角色信息
        Role role = roleMapper.selectRoleByRoleId(emp.getRoleId());
        emp.setRoleName(role.getRoleName());
        emp.setRoleCode(role.getRoleCode());
        emp.setCreateTime(DateUtils.getNowDate());
        return empMapper.insertEmp(emp);
    }

    /**
     * 修改人员列表
     *
     * @param emp 人员列表
     * @return 结果
     */
    @Override
    public int updateEmp(Emp emp)
    {
        // 补充区域名称
        emp.setRegionName(regionMapper.selectRegionById(emp.getRegionId()).getRegionName());
        // 补充角色信息
        Role role = roleMapper.selectRoleByRoleId(emp.getRoleId());
        emp.setRoleName(role.getRoleName());
        emp.setRoleCode(role.getRoleCode());
        emp.setUpdateTime(DateUtils.getNowDate());
        return empMapper.updateEmp(emp);
    }

    /**
     * 批量删除人员列表
     *
     * @param ids 需要删除的人员列表主键
     * @return 结果
     */
    @Override
    public int deleteEmpByIds(Long[] ids)
    {
        return empMapper.deleteEmpByIds(ids);
    }

    /**
     * 删除人员列表信息
     *
     * @param id 人员列表主键
     * @return 结果
     */
    @Override
    public int deleteEmpById(Long id)
    {
        return empMapper.deleteEmpById(id);
    }
}
