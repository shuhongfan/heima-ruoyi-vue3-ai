package com.dkd.applet.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.dkd.applet.domain.Sku;
import com.dkd.applet.domain.vo.SkuVo;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface SkuMapper extends BaseMapper<Sku> {

    @Select("SELECT s.sku_id,sku_name,sku_image image,price,class_id,unit,c.capacity FROM tb_sku s ," +
            "( " +
            "SELECT sku_id, SUM(`current_capacity`) capacity  FROM `tb_channel` WHERE `inner_code`=#{innerCode} AND sku_id>0 GROUP BY `sku_id` " +
            ") c " +
            "WHERE s.sku_id=c.sku_id " +
            "ORDER BY c.capacity DESC")
    List<SkuVo> findSkuByInnerCode(String innerCode);

}
