package com.dkd.app.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.dkd.app.domain.TaskType;
import com.dkd.app.mapper.TaskTypeMapper;
import com.dkd.app.service.TaskTypeService;
import org.springframework.stereotype.Service;

@Service
public class TaskTypeServiceImpl extends ServiceImpl<TaskTypeMapper, TaskType> implements TaskTypeService {
}
