package com.dkd.app.service.impl;

import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.dkd.app.domain.Channel;
import com.dkd.app.domain.TaskDetails;
import com.dkd.app.domain.VendingMachine;
import com.dkd.app.mapper.VendingMachineMapper;
import com.dkd.app.service.ChannelService;
import com.dkd.app.service.VendingMachineService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Service
@Slf4j
public class VendingMachineServiceImpl extends ServiceImpl<VendingMachineMapper, VendingMachine> implements VendingMachineService {

    @Autowired
    private ChannelService channelService;

    // 更改售货机状态
    public boolean updateStatus(String innerCode, Integer status) {
        UpdateWrapper<VendingMachine> uw = new UpdateWrapper<>();
        uw.lambda()
                .eq(VendingMachine::getInnerCode, innerCode)
                .set(VendingMachine::getVmStatus, status);
        return this.update(uw);
    }

    // 更新货道库存
    @Override
    public boolean supply(String innerCode, List<TaskDetails> details) {
        //更新最后补货时间
        UpdateWrapper<VendingMachine> uw = new UpdateWrapper<>();
        uw.lambda()
                .eq(VendingMachine::getInnerCode, innerCode)
                .set(VendingMachine::getLastSupplyTime, LocalDateTime.now());
        this.update(uw);
        //按照售货机编号查询货道列表
        List<Channel> channelList = channelService.getChannelesByInnerCode(innerCode);

        List<Channel> channelEntityList = new ArrayList<>();  //构建集合便于批量保存
        details.forEach(
                        d -> {
                            //通过stream流筛选货道，比在数据库中查询性能高
                            Optional<Channel> item =
                                    channelList.stream()
                                            .filter(channel -> channel.getChannelCode().equals(d.getChannelCode()))
                                            .findFirst();
                            if (item.isPresent()) {
                                Channel channelEntity = item.get();
                                //更新货道库存
                                if (channelEntity.getCurrentCapacity()==null) {
                                    channelEntity.setCurrentCapacity(0);
                                }
                                channelEntity.setCurrentCapacity(channelEntity.getCurrentCapacity() + d.getExpectCapacity());
                                //更新货道最后补货时间
                                channelEntity.setLastSupplyTime(LocalDateTime.now());
                                channelEntityList.add(channelEntity);
                            }
                        });
        return channelService.updateBatchById(channelEntityList);
    }
}
