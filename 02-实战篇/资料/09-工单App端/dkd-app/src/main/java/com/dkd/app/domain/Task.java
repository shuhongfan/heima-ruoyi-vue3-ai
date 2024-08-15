package com.dkd.app.domain;

import com.baomidou.mybatisplus.annotation.*;
import lombok.Data;

import java.io.Serializable;
import java.time.LocalDateTime;

@Data
@TableName(value = "tb_task")
public class Task implements Serializable {

    @TableId(value = "task_id", type = IdType.AUTO)
    private Long taskId;//工单Id
    /**
     * 工单编号
     */
    private String taskCode;
    @TableField(value = "task_status")
    private Integer taskStatus;//工单状态
    @TableField(value = "create_type")
    private Integer createType;//创建类型 0：自动 1：手动
    @TableField(value = "inner_code")
    private String innerCode;//售货机编码
    /**
     * 所属区域Id
     */
    private Long regionId;
    @TableField(value = "user_id")
    private Integer userId;//执行人id
    @TableField(value = "user_name")
    private String userName;//执行人名称
    @TableField(value = "`desc`")
    private String desc;//描述
    @TableField(value = "product_type_id")
    private Integer productTypeId;//工单类型id
    @TableField(value = "assignor_id")
    private Integer assignorId;//指派人Id

    /**
     * 工单执行地址(点位地址)
     */
    private String addr;

    /**
     * 创建时间
     */
    @TableField(value = "create_time", fill = FieldFill.INSERT)
    private LocalDateTime createTime;

    /**
     * 修改时间
     */
    @TableField(value = "update_time", fill = FieldFill.INSERT_UPDATE)
    private LocalDateTime updateTime;

    /**
     * 工单状态
     */
    @TableField(exist = false)
    private TaskStatus taskStatusTypeEntity;
    /**
     * 工单类型
     */
    @TableField(exist = false)
    private TaskType taskType;

}
