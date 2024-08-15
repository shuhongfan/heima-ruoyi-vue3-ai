package com.dkd.app.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.io.Serializable;

@Data
@TableName(value = "tb_role")
public class Role implements Serializable{

    @TableId(value = "role_id",type = IdType.AUTO)
    private Integer roleId;//id
    @TableField(value = "role_code")
    private String roleCode;//角色编号
    @TableField(value = "role_name")
    private String roleName;//角色名称

}
