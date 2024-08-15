package com.dkd.applet.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.dkd.applet.domain.Policy;
import com.dkd.applet.domain.Sku;
import com.dkd.applet.domain.VendingMachine;
import com.dkd.applet.domain.vo.SkuVo;
import com.dkd.applet.mapper.SkuMapper;
import com.dkd.applet.service.PolicyService;
import com.dkd.applet.service.SkuService;
import com.dkd.applet.service.VendingMachineService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SkuServiceImpl extends ServiceImpl<SkuMapper, Sku> implements SkuService {

    @Autowired
    private PolicyService policyService;
    @Autowired
    private VendingMachineService vendingMachineService;

    @Override
    public List<SkuVo> findSkuByInnerCode(String innerCode) {
        // 查询商品列表
        List<SkuVo> skuVOList = baseMapper.findSkuByInnerCode(innerCode);
        // 查询设备
        VendingMachine vm = vendingMachineService.getVendingMachineByInnerCode(innerCode);
        // 查询该售货机的策略
        Policy policy = policyService.getById(vm.getPolicyId());
        int discount = 100; //折扣率
        if (policy != null) {
            discount = policy.getDiscount();
        }
        // 循环，得到真实价格
        for (SkuVo skuVO : skuVOList) {
            skuVO.setRealPrice(skuVO.getPrice() * discount / 100);//真实价格
            if (skuVO.getRealPrice() < skuVO.getPrice()) {
                skuVO.setDiscount(true);
            } else {
                skuVO.setDiscount(false);
            }
        }
        return skuVOList;
    }
}
