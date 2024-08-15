package com.dkd.app.controller;

import com.dkd.app.domain.TaskDetails;
import com.dkd.app.service.TaskDetailsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/task-service/taskDetails")
public class TaskDetailsController {

    @Autowired
    private TaskDetailsService taskDetailsService;

    // 根据工单id查询补货工单列表
    @GetMapping("/{taskId}")
    public List<TaskDetails> findById(@PathVariable Long taskId) {
        return taskDetailsService.getByTaskId(taskId);
    }

}
