package com.sky.course.service.impl;

import com.sky.common.utils.DateUtils;
import com.sky.course.domain.Course;
import com.sky.course.mapper.CourseMapper;
import com.sky.course.service.ICourseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 课程管理Service业务层处理
 *
 * @author itheima
 * @date 2024-04-23
 */
@Service
public class CourseServiceImpl implements ICourseService
{
    @Autowired
    private CourseMapper courseMapper;

    /**
     * 查询课程管理
     *
     * @param id 课程管理主键
     * @return 课程管理
     */
    @Override
    public Course selectCourseById(Long id)
    {
        return courseMapper.selectCourseById(id);
    }

    /**
     * 查询课程管理列表
     *
     * @param course 课程管理
     * @return 课程管理
     */
    @Override
    public List<Course> selectCourseList(Course course)
    {
        return courseMapper.selectCourseList(course);
    }

    /**
     * 新增课程管理
     *
     * @param course 课程管理
     * @return 结果
     */
    @Override
    public int insertCourse(Course course)
    {
        course.setCreateTime(DateUtils.getNowDate());
        return courseMapper.insertCourse(course);
    }

    /**
     * 修改课程管理
     *
     * @param course 课程管理
     * @return 结果
     */
    @Override
    public int updateCourse(Course course)
    {
        course.setUpdateTime(DateUtils.getNowDate());
        return courseMapper.updateCourse(course);
    }

    /**
     * 批量删除课程管理
     *
     * @param ids 需要删除的课程管理主键
     * @return 结果
     */
    @Override
    public int deleteCourseByIds(Long[] ids)
    {
        return courseMapper.deleteCourseByIds(ids);
    }

    /**
     * 删除课程管理信息
     *
     * @param id 课程管理主键
     * @return 结果
     */
    @Override
    public int deleteCourseById(Long id)
    {
        return courseMapper.deleteCourseById(id);
    }
}
