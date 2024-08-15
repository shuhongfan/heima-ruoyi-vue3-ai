package com.dkd.manage.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.dkd.common.annotation.Excel;
import com.dkd.common.core.domain.BaseEntity;

/**
 * 售货机货道对象 tb_channel
 * 
 * @author itheima
 * @date 2024-06-21
 */
public class Channel extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 主键 */
    private Long id;

    /** 货道编号 */
    @Excel(name = "货道编号")
    private String channelCode;

    /** 商品Id */
    @Excel(name = "商品Id")
    private Long skuId;

    /** 售货机Id */
    @Excel(name = "售货机Id")
    private Long vmId;

    /** 售货机软编号 */
    @Excel(name = "售货机软编号")
    private String innerCode;

    /** 货道最大容量 */
    @Excel(name = "货道最大容量")
    private Long maxCapacity;

    /** 货道当前容量 */
    @Excel(name = "货道当前容量")
    private Long currentCapacity;

    /** 上次补货时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "上次补货时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date lastSupplyTime;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
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
    public void setVmId(Long vmId) 
    {
        this.vmId = vmId;
    }

    public Long getVmId() 
    {
        return vmId;
    }
    public void setInnerCode(String innerCode) 
    {
        this.innerCode = innerCode;
    }

    public String getInnerCode() 
    {
        return innerCode;
    }
    public void setMaxCapacity(Long maxCapacity) 
    {
        this.maxCapacity = maxCapacity;
    }

    public Long getMaxCapacity() 
    {
        return maxCapacity;
    }
    public void setCurrentCapacity(Long currentCapacity) 
    {
        this.currentCapacity = currentCapacity;
    }

    public Long getCurrentCapacity() 
    {
        return currentCapacity;
    }
    public void setLastSupplyTime(Date lastSupplyTime) 
    {
        this.lastSupplyTime = lastSupplyTime;
    }

    public Date getLastSupplyTime() 
    {
        return lastSupplyTime;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("channelCode", getChannelCode())
            .append("skuId", getSkuId())
            .append("vmId", getVmId())
            .append("innerCode", getInnerCode())
            .append("maxCapacity", getMaxCapacity())
            .append("currentCapacity", getCurrentCapacity())
            .append("lastSupplyTime", getLastSupplyTime())
            .append("createTime", getCreateTime())
            .append("updateTime", getUpdateTime())
            .toString();
    }
}
