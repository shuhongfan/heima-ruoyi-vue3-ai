package com.dkd.applet.controller;

import com.dkd.applet.domain.vo.SkuVo;
import com.dkd.applet.service.SkuService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/vm")
@Slf4j
public class VendingMachineController {

    @Autowired
    private SkuService skuService;

    /**
     * 获取售货机商品列表
     *
     * @param innerCode
     * @return
     */
    @RequestMapping("/skuList/{innerCode}")
    public List<SkuVo> getSkuListByInnerCode(@PathVariable String innerCode) {
        return skuService.findSkuByInnerCode(innerCode);
    }

}
