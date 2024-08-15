package com.sky.merchant.domain;

import com.sky.common.annotation.Excel;
import com.sky.common.core.domain.BaseEntity;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import java.math.BigDecimal;
import java.util.List;

/**
 * 菜品管理对象 tb_dish
 *
 * @author itheima
 * @date 2024-05-07
 */
public class Dish extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 主键 */
    private Long id;

    /** 菜品名称 */
    @Excel(name = "菜品名称")
    private String name;

    /** 售价 */
    @Excel(name = "售价")
    private BigDecimal price;

    /** 图片 */
    @Excel(name = "图片")
    private String image;

    /** 描述信息 */
    private String description;

    /** 售卖状态 */
    @Excel(name = "售卖状态")
    private Long status;

    /** 菜品口味关系信息 */
    private List<DishFlavor> dishFlavorList;

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
    public void setPrice(BigDecimal price)
    {
        this.price = price;
    }

    public BigDecimal getPrice()
    {
        return price;
    }
    public void setImage(String image)
    {
        this.image = image;
    }

    public String getImage()
    {
        return image;
    }
    public void setDescription(String description)
    {
        this.description = description;
    }

    public String getDescription()
    {
        return description;
    }
    public void setStatus(Long status)
    {
        this.status = status;
    }

    public Long getStatus()
    {
        return status;
    }

    public List<DishFlavor> getDishFlavorList()
    {
        return dishFlavorList;
    }

    public void setDishFlavorList(List<DishFlavor> dishFlavorList)
    {
        this.dishFlavorList = dishFlavorList;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("name", getName())
            .append("price", getPrice())
            .append("image", getImage())
            .append("description", getDescription())
            .append("status", getStatus())
            .append("createTime", getCreateTime())
            .append("updateTime", getUpdateTime())
            .append("dishFlavorList", getDishFlavorList())
            .toString();
    }
}
