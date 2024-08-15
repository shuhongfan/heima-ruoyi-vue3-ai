package com.dkd.applet.domain;

import com.baomidou.mybatisplus.annotation.*;
import lombok.Data;

import java.io.Serializable;
import java.time.LocalDateTime;

@Data
@TableName(value = "tb_policy")
public class Policy implements Serializable{
    @TableId(value = "policy_id",type = IdType.AUTO)
    private Integer policyId;//策略id
    @TableField(value = "policy_name")
    private String policyName;//策略名称
    @TableField(value = "discount")
    private Integer discount;//折扣，如：80代表8折

    @TableField(value = "create_time", fill = FieldFill.INSERT)
    protected LocalDateTime createTime;
    @TableField(value = "update_time", fill = FieldFill.INSERT_UPDATE)
    protected LocalDateTime updateTime;
}
