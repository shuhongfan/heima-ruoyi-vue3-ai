package com.dkd.app.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.dkd.app.domain.Emp;
import com.dkd.app.domain.dto.LoginDto;
import com.dkd.app.domain.vo.LoginVo;

import java.io.IOException;


public interface EmpService extends IService<Emp> {

    /**
     * 登录
     *
     * @param req
     * @return
     */
    LoginVo login(LoginDto req) throws IOException;

    /**
     * 发送短信
     * @param mobile
     */
    void sendSms(String mobile);
}
