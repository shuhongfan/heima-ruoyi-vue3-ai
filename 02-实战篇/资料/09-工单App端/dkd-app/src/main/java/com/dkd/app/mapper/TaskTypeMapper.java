package com.dkd.app.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.dkd.app.domain.TaskType;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface TaskTypeMapper extends BaseMapper<TaskType> {
}
