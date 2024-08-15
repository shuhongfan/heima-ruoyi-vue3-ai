package com.dkd.app.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.dkd.app.domain.TaskDetails;
import com.dkd.app.mapper.TaskDetailsMapper;
import com.dkd.app.service.TaskDetailsService;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TaskDetailsServiceImpl extends ServiceImpl<TaskDetailsMapper, TaskDetails> implements TaskDetailsService {

    @Override
    public List<TaskDetails> getByTaskId(Long taskId) {
        QueryWrapper<TaskDetails> qw = new QueryWrapper<>();
        qw.lambda()
                .eq(TaskDetails::getTaskId, taskId);

        return this.list(qw);
    }
}
