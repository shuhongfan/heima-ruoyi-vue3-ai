package com.dkd.applet.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.dkd.applet.domain.VendingMachine;
import com.dkd.applet.mapper.VendingMachineMapper;
import com.dkd.applet.service.VendingMachineService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

@Service
@Slf4j
public class VendingMachineServiceImpl extends ServiceImpl<VendingMachineMapper, VendingMachine> implements VendingMachineService {

    @Override
    public VendingMachine getVendingMachineByInnerCode(String innerCode) {
        return this.lambdaQuery().eq(VendingMachine::getInnerCode, innerCode).one();
    }
}
