package com.dkd.app.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.dkd.app.domain.Task;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface TaskMapper extends BaseMapper<Task> {

}
