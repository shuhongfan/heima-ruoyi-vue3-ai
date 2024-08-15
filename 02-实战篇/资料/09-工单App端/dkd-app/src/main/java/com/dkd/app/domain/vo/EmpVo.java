package com.dkd.app.domain.vo;

import lombok.Data;

import java.io.Serializable;

@Data
public class EmpVo implements Serializable {
    /**
     * 用户Id
     */
    private Integer userId;
    /**
     * 用户名
     */
    private String userName;
    /**
     * 登录账号
     */
    private String loginName;
    /**
     * 角色Id
     */
    private int roleId;

    /**
     * 角色名
     */
    private String roleName;
    /**
     * 角色code
     */
    private String roleCode;
    /**
     * 手机号
     */
    private String mobile;

    /**
     * 所属区域Id
     */
    private Long regionId;
    /**
     * 所属区域名称
     */
    private String regionName;

    /**
     * 是否启用
     */
    private Boolean status;
    /**
     * 用户头像
     */
    private String image;

}
