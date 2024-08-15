package com.dkd.app.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.dkd.app.domain.TaskStatus;
import com.dkd.app.mapper.TaskStatusMapper;
import com.dkd.app.service.TaskStatusService;
import org.springframework.stereotype.Service;

@Service
public class TaskStatusServiceImpl extends ServiceImpl<TaskStatusMapper, TaskStatus> implements TaskStatusService {
}
