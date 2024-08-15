package com.dkd.manage.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.dkd.common.annotation.Excel;
import com.dkd.common.core.domain.BaseEntity;

/**
 * 工单角色对象 tb_role
 *
 * @author itheima
 * @date 2024-06-15
 */
public class Role extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** $column.columnComment */
    private Long roleId;

    /** 角色编码
 */
    @Excel(name = "角色编码")
    private String roleCode;

    /** 角色名称
 */
    @Excel(name = "角色名称")
    private String roleName;

    public void setRoleId(Long roleId)
    {
        this.roleId = roleId;
    }

    public Long getRoleId()
    {
        return roleId;
    }
    public void setRoleCode(String roleCode)
    {
        this.roleCode = roleCode;
    }

    public String getRoleCode()
    {
        return roleCode;
    }
    public void setRoleName(String roleName)
    {
        this.roleName = roleName;
    }

    public String getRoleName()
    {
        return roleName;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("roleId", getRoleId())
            .append("roleCode", getRoleCode())
            .append("roleName", getRoleName())
            .toString();
    }
}
