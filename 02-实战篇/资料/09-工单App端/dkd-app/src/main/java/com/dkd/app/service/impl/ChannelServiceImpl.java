package com.dkd.app.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.dkd.app.domain.Channel;
import com.dkd.app.mapper.ChannelMapper;
import com.dkd.app.service.ChannelService;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ChannelServiceImpl extends ServiceImpl<ChannelMapper, Channel> implements ChannelService {

    @Override
    public List<Channel> getChannelesByInnerCode(String innerCode) {
        LambdaQueryWrapper<Channel> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.eq(Channel::getInnerCode,innerCode);
        return this.list(queryWrapper);
    }
}
