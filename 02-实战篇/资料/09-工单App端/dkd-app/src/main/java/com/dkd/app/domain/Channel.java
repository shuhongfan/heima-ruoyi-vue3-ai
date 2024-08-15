package com.dkd.app.domain;

import com.baomidou.mybatisplus.annotation.*;
import lombok.Data;

import java.time.LocalDateTime;

/**
 * 售货机货道对象 tb_channel
 *
 * @author itheima
 * @date 2024-05-13
 */
@Data
@TableName("tb_channel")
public class Channel {
    private static final long serialVersionUID = 1L;

    /**
     * 主键
     */
    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    /**
     * 货道编号
     */
    private String channelCode;

    /**
     * 商品Id
     */
    private Long skuId;

    /**
     * 售货机Id
     */
    private Long vmId;

    /**
     * 售货机软编号
     */
    private String innerCode;

    /**
     * 货道最大容量
     */
    private Integer maxCapacity;

    /**
     * 货道当前容量
     */
    private Integer currentCapacity;

    /**
     * 上次补货时间
     */
    @TableField("last_supply_time")
    private LocalDateTime lastSupplyTime;

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
