package com.dkd.applet.domain;

import com.baomidou.mybatisplus.annotation.*;
import lombok.Data;

import java.io.Serializable;
import java.time.LocalDateTime;

@Data
@TableName(value = "tb_sku")
public class Sku implements Serializable {

    @TableId(value = "sku_id", type = IdType.ASSIGN_ID)
    private Long skuId;//sku_id
    @TableField(value = "sku_name")
    private String skuName;//商品名称
    @TableField(value = "sku_image")
    private String skuImage;//商品图片
    @TableField(value = "price")
    private Integer price;//基础价格
    @TableField(value = "class_id")
    private Integer classId;//商品类别Id
    @TableField(value = "is_discount")
    private boolean discount;//是否打折促销
    @TableField(value = "unit")
    private String unit;//净含量
    @TableField(value = "brand_name")
    private String brandName;//商品品牌

    @TableField(value = "create_time", fill = FieldFill.INSERT)
    protected LocalDateTime createTime;
    @TableField(value = "update_time", fill = FieldFill.INSERT_UPDATE)
    protected LocalDateTime updateTime;

    @TableField(exist = false)
    private SkuClass skuClass;//商品类别

}
