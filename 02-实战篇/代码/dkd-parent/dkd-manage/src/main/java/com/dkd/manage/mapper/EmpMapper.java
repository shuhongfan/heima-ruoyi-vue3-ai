package com.dkd.manage.mapper;

import com.dkd.manage.domain.Emp;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Update;

import java.util.List;

/**
 * 人员列表Mapper接口
 *
 * @author itheima
 * @date 2024-06-15
 */
public interface EmpMapper
{
    /**
     * 查询人员列表
     *
     * @param id 人员列表主键
     * @return 人员列表
     */
    public Emp selectEmpById(Long id);

    /**
     * 查询人员列表列表
     *
     * @param emp 人员列表
     * @return 人员列表集合
     */
    public List<Emp> selectEmpList(Emp emp);

    /**
     * 新增人员列表
     *
     * @param emp 人员列表
     * @return 结果
     */
    public int insertEmp(Emp emp);

    /**
     * 修改人员列表
     *
     * @param emp 人员列表
     * @return 结果
     */
    public int updateEmp(Emp emp);

    /**
     * 删除人员列表
     *
     * @param id 人员列表主键
     * @return 结果
     */
    public int deleteEmpById(Long id);

    /**
     * 批量删除人员列表
     *
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteEmpByIds(Long[] ids);

    /**
     *  根据区域id修改区域名称
     * @param regionName
     * @param regionId
     * @return 结果
     */
    @Update("update tb_emp set region_name=#{regionName} where region_id=#{regionId}")
    public int updateByRegionId(@Param("regionName") String regionName,@Param("regionId") Long regionId);
}
