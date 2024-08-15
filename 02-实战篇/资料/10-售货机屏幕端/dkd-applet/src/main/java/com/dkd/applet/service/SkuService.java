package com.dkd.applet.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.dkd.applet.domain.Sku;
import com.dkd.applet.domain.vo.SkuVo;

import java.util.List;

public interface SkuService extends IService<Sku> {

    /**
     * 根据售货机查询商品
     *
     * @param innerCode
     * @return
     */
    List<SkuVo> findSkuByInnerCode(String innerCode);

}
