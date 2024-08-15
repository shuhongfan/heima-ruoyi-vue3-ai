package com.dkd.applet.domain.dto;

import lombok.Data;

import java.io.Serializable;

/**
 * 小程序端支付请求对象
 */
@Data
public class PayDto implements Serializable {
    /**
     * 售货机编号
     */
    private String innerCode;

    /**
     * openId
     */
    private String openId;

    /**
     * 商品Id
     */
    private Long skuId;
}
