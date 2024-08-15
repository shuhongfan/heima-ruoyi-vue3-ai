package com.dkd.app.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.dkd.app.domain.Channel;

import java.util.List;


public interface ChannelService extends IService<Channel> {

    //按照售货机编号查询货道列表
    List<Channel> getChannelesByInnerCode(String innerCode);
}
