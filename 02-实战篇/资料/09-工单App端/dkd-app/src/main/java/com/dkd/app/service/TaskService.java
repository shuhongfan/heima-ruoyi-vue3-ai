package com.dkd.app.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.dkd.app.domain.Task;
import com.dkd.app.domain.dto.CancelTaskDto;
import com.dkd.app.domain.vo.Pager;

import java.time.LocalDate;

/**
 * 工单业务逻辑
 */
public interface TaskService extends IService<Task> {

    // 通过条件搜索工单列表
    Pager<Task> search(Long pageIndex, Long pageSize, String innerCode, Integer userId, String taskCode, Integer status, Boolean isRepair, LocalDate start, LocalDate end);

    // 接受工单
    Boolean accept(Long taskId, Integer userId);

    // 拒绝/取消工单
    Boolean cancel(Long taskId, CancelTaskDto cancelTaskDto, Integer userId);

    // 完成工单
    Boolean complete(Long taskId, Integer userId);
}
