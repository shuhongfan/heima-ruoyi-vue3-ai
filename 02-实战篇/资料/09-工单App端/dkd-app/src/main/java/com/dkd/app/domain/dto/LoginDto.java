package com.dkd.app.domain.dto;
import lombok.Data;

@Data
public class LoginDto {

    /**
     * 手机号(运维运营平台使用)
     */
    private String mobile;
    /**
     *  验证码
     */
    private String code;
    /**
     * 登录类型 0：后台；1：运营运维端；2：合作商后台
     */
    private Integer loginType;
}
