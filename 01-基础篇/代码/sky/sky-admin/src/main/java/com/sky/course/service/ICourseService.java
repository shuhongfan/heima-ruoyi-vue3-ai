package com.sky.course.service;

import com.sky.course.domain.Course;

import java.util.List;

/**
 * 课程管理Service接口
 *
 * @author itheima
 * @date 2024-04-23
 */
public interface ICourseService
{
    /**
     * 查询课程管理
     *
     * @param id 课程管理主键
     * @return 课程管理
     */
    public Course selectCourseById(Long id);

    /**
     * 查询课程管理列表
     *
     * @param course 课程管理
     * @return 课程管理集合
     */
    public List<Course> selectCourseList(Course course);

    /**
     * 新增课程管理
     *
     * @param course 课程管理
     * @return 结果
     */
    public int insertCourse(Course course);

    /**
     * 修改课程管理
     *
     * @param course 课程管理
     * @return 结果
     */
    public int updateCourse(Course course);

    /**
     * 批量删除课程管理
     *
     * @param ids 需要删除的课程管理主键集合
     * @return 结果
     */
    public int deleteCourseByIds(Long[] ids);

    /**
     * 删除课程管理信息
     *
     * @param id 课程管理主键
     * @return 结果
     */
    public int deleteCourseById(Long id);
}
