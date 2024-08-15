package com.dkd.manage.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.dkd.common.annotation.Excel;
import com.dkd.common.core.domain.BaseEntity;

/**
 * 设备类型管理对象 tb_vm_type
 * 
 * @author itheima
 * @date 2024-06-21
 */
public class VmType extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 主键 */
    private Long id;

    /** 型号名称 */
    @Excel(name = "型号名称")
    private String name;

    /** 型号编码 */
    @Excel(name = "型号编码")
    private String model;

    /** 设备图片 */
    @Excel(name = "设备图片")
    private String image;

    /** 货道行 */
    @Excel(name = "货道行")
    private Long vmRow;

    /** 货道列 */
    @Excel(name = "货道列")
    private Long vmCol;

    /** 设备容量 */
    @Excel(name = "设备容量")
    private Long channelMaxCapacity;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }
    public void setName(String name) 
    {
        this.name = name;
    }

    public String getName() 
    {
        return name;
    }
    public void setModel(String model) 
    {
        this.model = model;
    }

    public String getModel() 
    {
        return model;
    }
    public void setImage(String image) 
    {
        this.image = image;
    }

    public String getImage() 
    {
        return image;
    }
    public void setVmRow(Long vmRow) 
    {
        this.vmRow = vmRow;
    }

    public Long getVmRow() 
    {
        return vmRow;
    }
    public void setVmCol(Long vmCol) 
    {
        this.vmCol = vmCol;
    }

    public Long getVmCol() 
    {
        return vmCol;
    }
    public void setChannelMaxCapacity(Long channelMaxCapacity) 
    {
        this.channelMaxCapacity = channelMaxCapacity;
    }

    public Long getChannelMaxCapacity() 
    {
        return channelMaxCapacity;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("name", getName())
            .append("model", getModel())
            .append("image", getImage())
            .append("vmRow", getVmRow())
            .append("vmCol", getVmCol())
            .append("channelMaxCapacity", getChannelMaxCapacity())
            .toString();
    }
}
