package com.dkd.app.controller;

import com.dkd.app.domain.Emp;
import com.dkd.app.domain.dto.LoginDto;
import com.dkd.app.domain.vo.EmpVo;
import com.dkd.app.domain.vo.LoginVo;
import com.dkd.app.service.EmpService;
import com.dkd.app.service.RoleService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;

// 员工
@RestController
@RequestMapping("/user-service/user")
@Slf4j
public class EmpController {

    @Autowired
    private EmpService empService;
    @Autowired
    private RoleService roleService;

    // 发送短信验证码
    @GetMapping("/code/{mobile}")
    public void sendSms(@PathVariable("mobile") String mobile) {
        empService.sendSms(mobile);
    }

    // 登录
    @PostMapping("/login")
    public LoginVo login(@RequestBody LoginDto req) throws IOException {
        return empService.login(req);
    }

    // 查询员工基本信息
    @GetMapping("/{id}")
    public EmpVo findById(@PathVariable Integer id) {
        Emp emp = empService.getById(id);
        if (emp == null) {
            return null;
        }
        return convertToVM(emp);
    }

    // 封装返回结果
    private EmpVo convertToVM(Emp emp) {
        EmpVo empVo = new EmpVo();
        empVo.setMobile(emp.getMobile());
        empVo.setRoleId(emp.getRoleId());
        empVo.setRoleCode(emp.getRoleCode());
        empVo.setLoginName(emp.getUserName());
        empVo.setUserId(emp.getId());
        empVo.setRoleName(roleService.getById(emp.getRoleId()).getRoleName());
        empVo.setUserName(emp.getUserName());
        empVo.setStatus(emp.getStatus());
        empVo.setRegionId(emp.getRegionId());
        empVo.setRegionName(emp.getRegionName());
        empVo.setImage(emp.getImage());
        return empVo;
    }

}
