package com.dkd.manage.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.dkd.common.annotation.Excel;
import com.dkd.common.core.domain.BaseEntity;

/**
 * 订单管理对象 tb_order
 * 
 * @author itheima
 * @date 2024-07-29
 */
public class Order extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 主键 */
    private Long id;

    /** 订单编号 */
    @Excel(name = "订单编号")
    private String orderNo;

    /** 第三方平台单号 */
    private String thirdNo;

    /** 机器编号 */
    private String innerCode;

    /** 货道编号 */
    private String channelCode;

    /** skuId */
    private Long skuId;

    /** 商品名称 */
    @Excel(name = "商品名称")
    private String skuName;

    /** 商品类别Id */
    private Long classId;

    /** 订单状态:0-待支付;1-支付完成;2-出货成功;3-出货失败;4-已取消 */
    @Excel(name = "订单状态:0-待支付;1-支付完成;2-出货成功;3-出货失败;4-已取消")
    private Long status;

    /** 支付金额 */
    @Excel(name = "支付金额")
    private Long amount;

    /** 商品金额 */
    private Long price;

    /** 支付类型，1支付宝 2微信 */
    private String payType;

    /** 支付状态，0-未支付;1-支付完成;2-退款中;3-退款完成 */
    private Long payStatus;

    /** 合作商账单金额 */
    private Long bill;

    /** 点位地址 */
    private String addr;

    /** 所属区域Id */
    private Long regionId;

    /** 区域名称 */
    private String regionName;

    /** 所属商圈 */
    private Long businessType;

    /** 合作商Id */
    private Long partnerId;

    /** 跨站身份验证 */
    private String openId;

    /** 点位Id */
    private Long nodeId;

    /** 点位名称 */
    private String nodeName;

    /** 取消原因 */
    private String cancelDesc;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }
    public void setOrderNo(String orderNo) 
    {
        this.orderNo = orderNo;
    }

    public String getOrderNo() 
    {
        return orderNo;
    }
    public void setThirdNo(String thirdNo) 
    {
        this.thirdNo = thirdNo;
    }

    public String getThirdNo() 
    {
        return thirdNo;
    }
    public void setInnerCode(String innerCode) 
    {
        this.innerCode = innerCode;
    }

    public String getInnerCode() 
    {
        return innerCode;
    }
    public void setChannelCode(String channelCode) 
    {
        this.channelCode = channelCode;
    }

    public String getChannelCode() 
    {
        return channelCode;
    }
    public void setSkuId(Long skuId) 
    {
        this.skuId = skuId;
    }

    public Long getSkuId() 
    {
        return skuId;
    }
    public void setSkuName(String skuName) 
    {
        this.skuName = skuName;
    }

    public String getSkuName() 
    {
        return skuName;
    }
    public void setClassId(Long classId) 
    {
        this.classId = classId;
    }

    public Long getClassId() 
    {
        return classId;
    }
    public void setStatus(Long status) 
    {
        this.status = status;
    }

    public Long getStatus() 
    {
        return status;
    }
    public void setAmount(Long amount) 
    {
        this.amount = amount;
    }

    public Long getAmount() 
    {
        return amount;
    }
    public void setPrice(Long price) 
    {
        this.price = price;
    }

    public Long getPrice() 
    {
        return price;
    }
    public void setPayType(String payType) 
    {
        this.payType = payType;
    }

    public String getPayType() 
    {
        return payType;
    }
    public void setPayStatus(Long payStatus) 
    {
        this.payStatus = payStatus;
    }

    public Long getPayStatus() 
    {
        return payStatus;
    }
    public void setBill(Long bill) 
    {
        this.bill = bill;
    }

    public Long getBill() 
    {
        return bill;
    }
    public void setAddr(String addr) 
    {
        this.addr = addr;
    }

    public String getAddr() 
    {
        return addr;
    }
    public void setRegionId(Long regionId) 
    {
        this.regionId = regionId;
    }

    public Long getRegionId() 
    {
        return regionId;
    }
    public void setRegionName(String regionName) 
    {
        this.regionName = regionName;
    }

    public String getRegionName() 
    {
        return regionName;
    }
    public void setBusinessType(Long businessType) 
    {
        this.businessType = businessType;
    }

    public Long getBusinessType() 
    {
        return businessType;
    }
    public void setPartnerId(Long partnerId) 
    {
        this.partnerId = partnerId;
    }

    public Long getPartnerId() 
    {
        return partnerId;
    }
    public void setOpenId(String openId) 
    {
        this.openId = openId;
    }

    public String getOpenId() 
    {
        return openId;
    }
    public void setNodeId(Long nodeId) 
    {
        this.nodeId = nodeId;
    }

    public Long getNodeId() 
    {
        return nodeId;
    }
    public void setNodeName(String nodeName) 
    {
        this.nodeName = nodeName;
    }

    public String getNodeName() 
    {
        return nodeName;
    }
    public void setCancelDesc(String cancelDesc) 
    {
        this.cancelDesc = cancelDesc;
    }

    public String getCancelDesc() 
    {
        return cancelDesc;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("orderNo", getOrderNo())
            .append("thirdNo", getThirdNo())
            .append("innerCode", getInnerCode())
            .append("channelCode", getChannelCode())
            .append("skuId", getSkuId())
            .append("skuName", getSkuName())
            .append("classId", getClassId())
            .append("status", getStatus())
            .append("amount", getAmount())
            .append("price", getPrice())
            .append("payType", getPayType())
            .append("payStatus", getPayStatus())
            .append("bill", getBill())
            .append("addr", getAddr())
            .append("regionId", getRegionId())
            .append("regionName", getRegionName())
            .append("businessType", getBusinessType())
            .append("partnerId", getPartnerId())
            .append("openId", getOpenId())
            .append("nodeId", getNodeId())
            .append("nodeName", getNodeName())
            .append("cancelDesc", getCancelDesc())
            .append("createTime", getCreateTime())
            .append("updateTime", getUpdateTime())
            .toString();
    }
}
