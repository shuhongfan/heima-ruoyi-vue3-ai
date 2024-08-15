package com.dkd.applet.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.dkd.applet.domain.Policy;
import com.dkd.applet.mapper.PolicyMapper;
import com.dkd.applet.service.PolicyService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

@Service
@Slf4j
public class PolicyServiceImpl extends ServiceImpl<PolicyMapper, Policy> implements PolicyService {

}
