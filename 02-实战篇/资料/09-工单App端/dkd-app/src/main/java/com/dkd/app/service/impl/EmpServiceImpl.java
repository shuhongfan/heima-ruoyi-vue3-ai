package com.dkd.app.service.impl;

import cn.hutool.core.util.ObjectUtil;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.dkd.app.common.exception.LogicException;
import com.dkd.app.common.token.TokenObject;
import com.dkd.app.common.util.JWTUtil;
import com.dkd.app.common.util.SmsTemplate;
import com.dkd.app.domain.Emp;
import com.dkd.app.domain.dto.LoginDto;
import com.dkd.app.domain.vo.LoginVo;
import com.dkd.app.mapper.EmpMapper;
import com.dkd.app.service.EmpService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.time.Duration;

/**
 * 人员列表Service业务层处理
 *
 * @author itheima
 * @date 2024-05-16
 */
@Service
public class EmpServiceImpl extends ServiceImpl<EmpMapper, Emp> implements EmpService {

    @Autowired
    private StringRedisTemplate redisTemplate;

    @Autowired
    private SmsTemplate smsTemplate;

    @Override
    public void sendSms(String mobile) {
        // String code = RandomUtil.randomNumbers(5); // 生成5位随机验证码
        String code = "12345";
        // smsTemplate.sendSms(mobile,code); // 调用阿里云发送短信
        // 将验证码存入redis  dkd.sms:手机号 验证码  5分钟有效
        redisTemplate.opsForValue().set("dkd.sms:" + mobile, code, Duration.ofSeconds(300));
    }

    /**
     * 登录
     *
     * @param req
     * @return
     */
    @Override
    public LoginVo login(LoginDto req) throws IOException {
        //1. 比对验证码
        // 从redis中查询
        String redisCode = redisTemplate.opsForValue().get("dkd.sms:" + req.getMobile());
        if (!StrUtil.equals(req.getCode(), redisCode)) { // 注意此处有感叹号
            throw new LogicException("验证码错误");
        }

        // 2.比对手机号
        LambdaQueryWrapper<Emp> qw = new LambdaQueryWrapper<>();
        qw.eq(Emp::getMobile, req.getMobile());
        Emp emp = this.getOne(qw);
        if (ObjectUtil.isEmpty(emp)) {
            throw new LogicException("手机号非法");
        }
        //3. 登录成功，制作token返回结果
        LoginVo resp = new LoginVo();
        resp.setSuccess(true);
        resp.setRoleCode(emp.getRoleCode());
        resp.setUserName(emp.getUserName());
        resp.setUserId(emp.getId());
        resp.setRegionId(emp.getRegionId().toString());
        resp.setMsg("登录成功");
        TokenObject tokenObject = new TokenObject();
        tokenObject.setUserId(emp.getId());
        tokenObject.setMobile(emp.getMobile());
        tokenObject.setLoginType(req.getLoginType());
        tokenObject.setUserName(emp.getUserName());
        String token = JWTUtil.createJWTByObj(tokenObject);
        resp.setToken(token);
        // 是否为维修员
        if (emp.getRoleCode().equals("1003")) {
            resp.setRepair(true);
        }

        // 删除redis中验证码
        redisTemplate.delete("dkd.sms:" + req.getMobile());
        return resp;
    }

}
