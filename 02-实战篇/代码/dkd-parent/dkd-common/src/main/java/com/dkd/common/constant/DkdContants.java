package com.dkd.common.constant;

/**
 * 帝可得业务常量
 */
public class DkdContants {

    /**
     * 工单类型：投放工单
     */
    public static final Long TASK_TYPE_DEPLOY = 1l;

    /**
     * 工单类型：补货工单
     */
    public static final Long TASK_TYPE_SUPPLY = 2l;

    /**
     * 工单类型：维修工单
     */
    public static final Long TASK_TYPE_REPAIR = 3l;

    /**
     * 工单类型：撤机工单
     */
    public static final Long TASK_TYPE_REVOKE = 4l;

    /**
     * 工单状态：创建(待处理)
     */
    public static final Long TASK_STATUS_CREATE = 1l;
    /**
     * 工单状态：进行
     */
    public static final Long TASK_STATUS_PROGRESS = 2l;
    /**
     * 工单状态：取消
     */
    public static final Long TASK_STATUS_CANCEL = 3l;
    /**
     * 工单状态：完成
     */
    public static final Long TASK_STATUS_FINISH = 4L;

    /**
     * 售货机状态：未投放
     */
    public static final Long VM_STATUS_NODEPLOY = 0l;
    /**
     * 售货机状态：运营
     */
    public static final Long VM_STATUS_RUNNING = 1l;
    /**
     * 售货机状态：撤机
     */
    public static final Long VM_STATUS_REVOKE = 3l;

    /**
     * 员工启用
     */
    public static final Boolean EMP_STATUS_NORMAL = true;

    /**
     * 员工禁用
     */
    public static final Boolean EMP_STATUS_DISABLE = false;

    /**
     * 角色编码：运营员
     */
    public static final String ROLE_CODE_BUSINESS = "1002";

    /**
     * 角色编码：维修员
     */
    public static final String ROLE_CODE_OPERATOR = "1003";

}
