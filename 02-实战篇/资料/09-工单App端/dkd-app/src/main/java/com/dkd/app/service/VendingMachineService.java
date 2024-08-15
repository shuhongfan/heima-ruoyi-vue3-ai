package com.dkd.app.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.dkd.app.domain.TaskDetails;
import com.dkd.app.domain.VendingMachine;

import java.util.List;

public interface VendingMachineService extends IService<VendingMachine> {

    // 更改售货机状态
    boolean updateStatus(String innerCode, Integer vmStatus);

    // 更新货道库存
    boolean supply(String innerCode, List<TaskDetails> details);
}
