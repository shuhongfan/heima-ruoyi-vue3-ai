package com.dkd.app.controller;

import com.dkd.app.common.context.EmpHolder;
import com.dkd.app.domain.Task;
import com.dkd.app.domain.dto.CancelTaskDto;
import com.dkd.app.domain.vo.Pager;
import com.dkd.app.service.TaskService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;
import java.util.HashMap;
import java.util.Map;

// 工单
@RestController
@RequestMapping("/task-service/task")
@Slf4j
public class TaskController{

    @Autowired
    private TaskService taskService;


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
    @GetMapping("/search")
    public Pager<Task> search(
            @RequestParam(value = "pageIndex", required = false, defaultValue = "1") Long pageIndex,
            @RequestParam(value = "pageSize", required = false, defaultValue = "10") Long pageSize,
            @RequestParam(value = "innerCode", required = false, defaultValue = "") String innerCode,
            @RequestParam(value = "userId", required = false, defaultValue = "") Integer userId,
            @RequestParam(value = "taskCode", required = false, defaultValue = "") String taskCode,
            @RequestParam(value = "status", required = false, defaultValue = "") Integer status,
            @RequestParam(value = "isRepair", required = false, defaultValue = "") Boolean isRepair,
            @DateTimeFormat(pattern = "yyyy-MM-dd") LocalDate start,
            @DateTimeFormat(pattern = "yyyy-MM-dd") LocalDate end) {
        return taskService.search(pageIndex, pageSize, innerCode, userId, taskCode, status, isRepair, start, end);
    }

    // 获取用户排名情况
    @GetMapping("/rank/{userId}")
    public Map<String, Object> rank(@PathVariable("userId") Long userId) {
        Map<String, Object> result = new HashMap<>();
        result.put("total", 3);
        result.put("rank", 3);
        return result;
    }


    // 接受工单
    @GetMapping("/accept/{taskId}")
    public Boolean accept(@PathVariable("taskId") Long taskId ){
        // 获取登录人id
        Integer userId = EmpHolder.get();
        // 调用service
        return taskService.accept(taskId,userId);
    }


    // 拒绝/取消工单
    @PostMapping("/cancel/{taskId}")
    public Boolean cancel(@PathVariable("taskId")Long taskId,@RequestBody CancelTaskDto cancelTaskDto){
        // 获取登录人id
        Integer userId = EmpHolder.get();
        // 调用service
        return taskService.cancel(taskId,cancelTaskDto,userId);
    }


    // 完成工单
    @GetMapping("/complete/{taskId}")
    public Boolean complete(@PathVariable("taskId")Long taskId){
        // 获取登录人id
        Integer userId = EmpHolder.get();
        // 调用service
        return taskService.complete(taskId,userId);
    }
}
