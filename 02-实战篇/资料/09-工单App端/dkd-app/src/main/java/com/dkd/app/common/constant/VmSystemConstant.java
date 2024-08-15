package com.dkd.app.common.constant;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

public class VmSystemConstant {
    /**
     * 售货机状态：未投放
     */
    public static final Integer VM_STATUS_NODEPLOY = 0;
    /**
     * 售货机状态：运营
     */
    public static final Integer VM_STATUS_RUNNING = 1;
    /**
     * 售货机状态：撤机
     */
    public static final Integer VM_STATUS_REVOKE = 3;

    /**
     * 售货机出货状态session全局锁key前缀
     */
    public static final String VM_LOCK_KEY_PREF = "vm.vendout.status.";

    /**
     * 管理员后台登录
     */
    public static final Integer LOGIN_ADMIN = 0;
    /**
     * 运维/运营人员app登录
     */
    public static final Integer LOGIN_EMP = 1;
    /**
     * 合作商登录
     */
    public static final Integer LOGIN_PARTNER = 2;

    /**
     * 客户端和合作商登录时用来生成jwt token的secret
     */
    public static final String JWT_SECRET = "lkd+login+secret";

    /**
     * 工单状态：创建(待处理)
     */
    public static final Integer TASK_STATUS_CREATE = 1;
    /**
     * 工单状态：进行
     */
    public static final Integer TASK_STATUS_PROGRESS = 2;
    /**
     * 工单状态：取消
     */
    public static final Integer TASK_STATUS_CANCEL = 3;
    /**
     * 工单状态：完成
     */
    public static final Integer TASK_STATUS_FINISH = 4;

    /**
     * 工单类型：投放工单
     */
    public static final Integer TASK_TYPE_DEPLOY = 1;

    /**
     * 工单类型：补货工单
     */
    public static final Integer TASK_TYPE_SUPPLY = 2;

    /**
     * 工单类型：维修工单
     */
    public static final Integer TASK_TYPE_REPAIR= 3;

    /**
     * 工单类型：撤机工单
     */
    public static final Integer TASK_TYPE_REVOKE= 4;

    /**
     * 订单状态：创建
     */
    public static final Integer ORDER_STATUS_CREATE = 0;

    /**
     * 订单状态：支付完成
     */
    public static final  Integer ORDER_STATUS_PAYED = 1;

    /**
     * 订单状态：出货成功
     */
    public static final  Integer ORDER_STATUS_VENDOUT_SUCCESS = 2;
    /**
     * 订单状态：出货失败
     */
    public static final  Integer ORDER_STATUS_VENDOUT_FAIL = 3;

    /**
     * 订单状态：失效
     */
    public static final  Integer ORDER_STATUS_INVALID = 4;

    /**
     * 支付状态：未支付
     */
    public static final Integer PAY_STATUS_NOPAY = 0;
    /**
     * 支付状态：支付完成
     */
    public static final Integer PAY_STATUS_PAYED = 1;

    /**
     * 支付状态：退款中
     */
    public static final Integer PAY_STATUS_REFUNDING = 2;

    /**
     * 支付状态：退款完成
     */
    public static final Integer PAY_STATUS_REFUNDIED = 3;

    /**
     *  区域工单统计前缀
     */
    public static final String REGION_TASK_KEY_PREF = "region.task.";


    /**
     * 售货机状态缓存KEY
     */
    public static final String VM_STATUES_KEY="vm_status";


    // 管理人员角色CODE
    public static final String  USER_ROLE_ADMIN_ODE= "1001";

    // 运营人员角色CODE
    public static final String  USER_ROLE_SUPPLY_ODE= "1002";

    // 运维人员角色CODE
    public static final String  USER_ROLE_REPAIRER_CODE= "1003";


    // 生成key  以固定字符串（前缀）+日期+区域+用户角色编码（运营/运维）
    public static String generateKey(Long regionId, String roleCode) {
        return VmSystemConstant.REGION_TASK_KEY_PREF
                + LocalDate.now().format(DateTimeFormatter.ofPattern("yyyyMMdd"))   //日期
                + ":" + regionId  //区域
                + ":" + roleCode;   //角色code
    }


    // 售货机预库存前缀
    private static final String VM_SKU_INVENTORY_KEY="VM_SKU_INVENTORY:";

    // 获得售货机预库存key
    public static String getSkuInventoryKey(String innerCode,Long skuId){
        return VmSystemConstant.VM_SKU_INVENTORY_KEY + innerCode + ":" + skuId;
    }


}
