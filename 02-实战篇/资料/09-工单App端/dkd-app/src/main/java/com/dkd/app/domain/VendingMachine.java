package com.dkd.app.domain;

import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.io.Serializable;
import java.time.LocalDateTime;
import java.util.Date;

@Data
@TableName(value = "tb_vending_machine")
public class VendingMachine implements Serializable {

    private static final long serialVersionUID = 1L;

    /** 主键 */
    private Long id;

    /** 设备编号 */
    private String innerCode;

    /** 设备型号 */
    private Long vmTypeId;

    /** 设备容量 */
    private Long channelMaxCapacity;

    /** 点位Id */
    private Long nodeId;

    /** 详细地址 */
    private String addr;

    /** 上次补货时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    private Date lastSupplyTime;

    /** 商圈Id */
    private Long business_type;

    /** 区域Id */
    private Long regionId;

    /** 合作商Id */
    private Long partnerId;

    /** 经度 */
    private Long longitudes;

    /** 设备状态，0:未投放;1-运营;3-撤机 */
    private Long vmStatus;

    /** 客户端连接Id,做emq认证用 */
    private String clientId;

    /** 维度 */
    private Long latitude;

    /** 运行状态 */
    private String runningStatus;

    /** 策略id */
    private Long policyId;

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
}
