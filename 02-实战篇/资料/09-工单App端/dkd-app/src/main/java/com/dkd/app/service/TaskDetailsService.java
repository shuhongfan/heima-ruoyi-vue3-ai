package com.dkd.app.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.dkd.app.domain.TaskDetails;

import java.util.List;

public interface TaskDetailsService extends IService<TaskDetails> {

    // 根据工单id查询工单详情
    List<TaskDetails> getByTaskId(Long taskId);
}
