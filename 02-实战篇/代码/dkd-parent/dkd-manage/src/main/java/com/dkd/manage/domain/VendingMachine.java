package com.dkd.manage.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.dkd.common.annotation.Excel;
import com.dkd.common.core.domain.BaseEntity;

/**
 * 设备管理对象 tb_vending_machine
 * 
 * @author itheima
 * @date 2024-06-21
 */
public class VendingMachine extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 主键 */
    private Long id;

    /** 设备编号 */
    @Excel(name = "设备编号")
    private String innerCode;

    /** 设备容量 */
    private Long channelMaxCapacity;

    /** 点位Id */
    private Long nodeId;

    /** 详细地址 */
    @Excel(name = "详细地址")
    private String addr;

    /** 上次补货时间 */
    private Date lastSupplyTime;

    /** 商圈类型 */
    private Long businessType;

    /** 区域Id */
    private Long regionId;

    /** 合作商Id */
    @Excel(name = "合作商Id")
    private Long partnerId;

    /** 设备型号 */
    @Excel(name = "设备型号")
    private Long vmTypeId;

    /** 设备状态，0:未投放;1-运营;3-撤机 */
    @Excel(name = "设备状态，0:未投放;1-运营;3-撤机")
    private Long vmStatus;

    /** 运行状态 */
    private String runningStatus;

    /** 经度 */
    private Long longitudes;

    /** 维度 */
    private Long latitude;

    /** 客户端连接Id,做emq认证用 */
    private String clientId;

    /** 策略id */
    private Long policyId;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }
    public void setInnerCode(String innerCode) 
    {
        this.innerCode = innerCode;
    }

    public String getInnerCode() 
    {
        return innerCode;
    }
    public void setChannelMaxCapacity(Long channelMaxCapacity) 
    {
        this.channelMaxCapacity = channelMaxCapacity;
    }

    public Long getChannelMaxCapacity() 
    {
        return channelMaxCapacity;
    }
    public void setNodeId(Long nodeId) 
    {
        this.nodeId = nodeId;
    }

    public Long getNodeId() 
    {
        return nodeId;
    }
    public void setAddr(String addr) 
    {
        this.addr = addr;
    }

    public String getAddr() 
    {
        return addr;
    }
    public void setLastSupplyTime(Date lastSupplyTime) 
    {
        this.lastSupplyTime = lastSupplyTime;
    }

    public Date getLastSupplyTime() 
    {
        return lastSupplyTime;
    }
    public void setBusinessType(Long businessType) 
    {
        this.businessType = businessType;
    }

    public Long getBusinessType() 
    {
        return businessType;
    }
    public void setRegionId(Long regionId) 
    {
        this.regionId = regionId;
    }

    public Long getRegionId() 
    {
        return regionId;
    }
    public void setPartnerId(Long partnerId) 
    {
        this.partnerId = partnerId;
    }

    public Long getPartnerId() 
    {
        return partnerId;
    }
    public void setVmTypeId(Long vmTypeId) 
    {
        this.vmTypeId = vmTypeId;
    }

    public Long getVmTypeId() 
    {
        return vmTypeId;
    }
    public void setVmStatus(Long vmStatus) 
    {
        this.vmStatus = vmStatus;
    }

    public Long getVmStatus() 
    {
        return vmStatus;
    }
    public void setRunningStatus(String runningStatus) 
    {
        this.runningStatus = runningStatus;
    }

    public String getRunningStatus() 
    {
        return runningStatus;
    }
    public void setLongitudes(Long longitudes) 
    {
        this.longitudes = longitudes;
    }

    public Long getLongitudes() 
    {
        return longitudes;
    }
    public void setLatitude(Long latitude) 
    {
        this.latitude = latitude;
    }

    public Long getLatitude() 
    {
        return latitude;
    }
    public void setClientId(String clientId) 
    {
        this.clientId = clientId;
    }

    public String getClientId() 
    {
        return clientId;
    }
    public void setPolicyId(Long policyId) 
    {
        this.policyId = policyId;
    }

    public Long getPolicyId() 
    {
        return policyId;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("innerCode", getInnerCode())
            .append("channelMaxCapacity", getChannelMaxCapacity())
            .append("nodeId", getNodeId())
            .append("addr", getAddr())
            .append("lastSupplyTime", getLastSupplyTime())
            .append("businessType", getBusinessType())
            .append("regionId", getRegionId())
            .append("partnerId", getPartnerId())
            .append("vmTypeId", getVmTypeId())
            .append("vmStatus", getVmStatus())
            .append("runningStatus", getRunningStatus())
            .append("longitudes", getLongitudes())
            .append("latitude", getLatitude())
            .append("clientId", getClientId())
            .append("policyId", getPolicyId())
            .append("createTime", getCreateTime())
            .append("updateTime", getUpdateTime())
            .toString();
    }
}
