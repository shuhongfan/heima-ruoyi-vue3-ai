package com.dkd.app.service.impl;

import cn.hutool.core.util.ObjectUtil;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.dkd.app.common.constant.TaskTypeConstant;
import com.dkd.app.common.constant.VmStatusConstant;
import com.dkd.app.common.constant.VmSystemConstant;
import com.dkd.app.common.exception.LogicException;
import com.dkd.app.domain.Task;
import com.dkd.app.domain.TaskDetails;
import com.dkd.app.domain.TaskStatus;
import com.dkd.app.domain.TaskType;
import com.dkd.app.domain.dto.CancelTaskDto;
import com.dkd.app.domain.vo.Pager;
import com.dkd.app.mapper.TaskMapper;
import com.dkd.app.service.*;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Service
@Slf4j
public class TaskServiceImpl extends ServiceImpl<TaskMapper, Task> implements TaskService {

    @Autowired
    private TaskStatusService taskStatusService;
    @Autowired
    private TaskTypeService taskTypeService;

    @Autowired
    private VendingMachineService vendingMachineService;

    @Autowired
    private TaskDetailsService taskDetailsService;


    /**
     * 搜索工单
     *
     * @param pageIndex
     * @param pageSize
     * @param innerCode 设备编号
     * @param userId    工单所属人Id
     * @param taskCode  工单编号
     * @param status    工单状态
     * @param isRepair  是否是维修工单
     * @return
     */
    @Override
    public Pager<Task> search(Long pageIndex, Long pageSize, String innerCode, Integer userId, String taskCode, Integer status, Boolean isRepair, LocalDate start, LocalDate end) {
        // 初始化分页参数
        Page<Task> page = new Page<>(pageIndex, pageSize);
        // 创建任务查询条件
        LambdaQueryWrapper<Task> qw = new LambdaQueryWrapper<>();
        // 根据设备编号查询
        if (StrUtil.isNotBlank(innerCode)) {
            qw.eq(Task::getInnerCode, innerCode);
        }
        // 根据用户ID查询
        if (userId != null && userId > 0) {
            qw.eq(Task::getUserId, userId);
        }
        // 根据工单编码查询
        if (StrUtil.isNotBlank(taskCode)) {
            qw.like(Task::getTaskCode, taskCode);
        }
        // 根据工单状态查询
        if (status != null && status > 0) {
            qw.eq(Task::getTaskStatus, status);
        }
        // 根据是否是补货工单查询
        if (isRepair != null) {
            if (isRepair) {
                qw.ne(Task::getProductTypeId, TaskTypeConstant.TASK_TYPE_SUPPLY);
            } else {
                qw.eq(Task::getProductTypeId, TaskTypeConstant.TASK_TYPE_SUPPLY);
            }
        }
        // 根据创建时间查询
        if (ObjectUtil.isNotEmpty(start) && ObjectUtil.isNotEmpty(end)) {
            // 转换为日期时间对象以用于查询
            // 转为日期时间对象
            LocalDateTime minTime = start.atTime(LocalTime.MIN);// 2020-01-01 00:00:01
            LocalDateTime maxTime = end.atTime(LocalTime.MAX); // 2020-12-31 23:59:59
            qw.between(Task::getCreateTime, minTime, maxTime);
        }
        // 按更新时间倒序排序
        // 根据最后更新时间倒序排序
        qw.orderByDesc(Task::getUpdateTime);
        // 执行分页查询
        Page<Task> taskPage = this.page(page, qw);
        // 读取工单类型和工单状态
        readAll(taskPage.getRecords());
        // 构建并返回分页响应
        return Pager.build(taskPage);
    }

    // 读取工单类型和工单状态
    private void readAll(List<Task> taskList) {
        List<TaskType> typeList = taskTypeService.list();
        List<TaskStatus> statusList = new ArrayList<>();
        statusList.add(new TaskStatus(1,"待办"));
        statusList.add(new TaskStatus(2,"进行"));
        statusList.add(new TaskStatus(3,"取消"));
        statusList.add(new TaskStatus(4,"完成"));
        taskList.forEach(task -> {
            //工单类型
            Optional<TaskType> type = typeList.stream().filter(taskTypeEntity -> taskTypeEntity.getTypeId().equals(task.getProductTypeId())).findFirst();
            if (type.isPresent()) {
                task.setTaskType(type.get());
            }
            //工单状态
            Optional<TaskStatus> status = statusList.stream().filter(taskStatusTypeEntity -> taskStatusTypeEntity.getStatusId().equals(task.getTaskStatus())).findFirst();
            if (status.isPresent()) {
                task.setTaskStatusTypeEntity(status.get());
            }
        });

    }

    // 接受工单
    @Override
    public Boolean accept(Long taskId, Integer userId) {
        // 1.判断工单是否存在
        Task task = this.getById(taskId);
        if (ObjectUtil.isEmpty(task)) {
            throw new LogicException("工单不存在");
        }
        // 2.判断工单状态是否为刚创建（待处理）
        if (task.getTaskStatus() != VmSystemConstant.TASK_STATUS_CREATE) {
            throw new LogicException("此工单状态不是待处理，无法接受");
        }
        // 3.判断登录人是否有权接受工单
        if (!userId.equals(task.getUserId())) {
            throw new LogicException("此登录人无权接受工单");
        }
        // 4.修改工单状态
        task.setTaskStatus(VmSystemConstant.TASK_STATUS_PROGRESS);
        // 5.返回结果
        return this.updateById(task);
    }

    // 拒绝/取消工单
    @Override
    public Boolean cancel(Long taskId, CancelTaskDto cancelTaskDto, Integer userId) {
        // 1.判断工单是否存在
        Task tassk = this.getById(taskId);
        if (ObjectUtil.isEmpty(tassk)) {
            throw new LogicException("工单不存在");
        }
        // 2.判断工单状态是否为刚创建（待处理）
        if (tassk.getTaskStatus() == VmSystemConstant.TASK_STATUS_FINISH ||
                tassk.getTaskStatus() == VmSystemConstant.TASK_STATUS_CANCEL) {
            throw new LogicException("此工单状态不是待处理或进行中，无法取消");
        }
        // 3.判断登录人是否有权取消工单
        if (!userId.equals(tassk.getUserId())) {
            throw new LogicException("此登录人无权取消/拒绝工单");
        }
        // 4.修改工单状态
        tassk.setTaskStatus(VmSystemConstant.TASK_STATUS_CANCEL);
        tassk.setDesc(cancelTaskDto.getDesc());
        boolean b = this.updateById(tassk);

        // 5.返回结果
        return b;
    }

    // 完成工单
    @Transactional
    @Override
    public Boolean complete(Long taskId, Integer userId) {
        // 1.判断工单是否存在
        Task task = this.getById(taskId);
        if (ObjectUtil.isEmpty(task)) {
            throw new LogicException("工单不存在");
        }
        // 2.判断工单状态
        if (task.getTaskStatus() == VmSystemConstant.TASK_STATUS_FINISH ||
                task.getTaskStatus() == VmSystemConstant.TASK_STATUS_CANCEL ||
                task.getTaskStatus() == VmSystemConstant.TASK_STATUS_CREATE) {
            throw new LogicException("此工单状态不是进行中，无法完成");
        }
        // 3.判断登录人是否有权完成工单
        if (!userId.equals(task.getUserId())) {
            throw new LogicException("此登录人无权完成工单");
        }
        // 4.修改工单状态
        task.setTaskStatus(VmSystemConstant.TASK_STATUS_FINISH);
        boolean b = this.updateById(task);
        if (!b) {
            return b;
        }
        // 5. 更新设备状态
        //判断工单类型  如果是投放工单，则修改为运行中状态
        if (task.getProductTypeId().equals(TaskTypeConstant.TASK_TYPE_DEPLOY)) {
            b = vendingMachineService.updateStatus(task.getInnerCode(), VmStatusConstant.VM_STATUS_RUNNING);
        }
        //判断工单类型  如果是撤机工单，则修改为撤机状态
        if (task.getProductTypeId().equals(TaskTypeConstant.TASK_TYPE_REVOKE)) {
            b = vendingMachineService.updateStatus(task.getInnerCode(), VmStatusConstant.VM_STATUS_REVOKE);
        }
        //判断如果是补货工单
        if (task.getProductTypeId().equals(TaskTypeConstant.TASK_TYPE_SUPPLY)) {
            // 查询工单明细
            List<TaskDetails> details = taskDetailsService.getByTaskId(task.getTaskId());
            // 更新货道库存
            b = vendingMachineService.supply(task.getInnerCode(), details);
        }
        // 6.返回结果
        return b;
    }
}
