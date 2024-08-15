package com.dkd.applet.domain.vo;

import lombok.Data;

import java.io.Serializable;

@Data
public class SkuVo implements Serializable{
    /**
     * 商品Id
     */
    private long skuId;
    /**
     * 商品名称
     */
    private String skuName;
    /**
     * 商品类别Id
     */
    private Integer classId;
    /**
     * 商品价格
     */
    private int price;

    /**
     * 真实售价
     */
    private int realPrice;

    /**
     * 货道余量
     */
    private int capacity;

    /**
     * 商品图片
     */
    private String image;

    /**
     * 净含量
     */
    private String unit;

    /**
     * 是否打折
     */
    private boolean discount;
}
