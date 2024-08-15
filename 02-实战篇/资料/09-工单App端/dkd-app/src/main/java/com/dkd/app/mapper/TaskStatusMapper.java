package com.dkd.app.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.dkd.app.domain.TaskStatus;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface TaskStatusMapper extends BaseMapper<TaskStatus> {
}
