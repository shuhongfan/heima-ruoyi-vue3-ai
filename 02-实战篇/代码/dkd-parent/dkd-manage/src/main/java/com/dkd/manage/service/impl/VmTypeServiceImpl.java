package com.dkd.manage.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.dkd.manage.mapper.VmTypeMapper;
import com.dkd.manage.domain.VmType;
import com.dkd.manage.service.IVmTypeService;

/**
 * 设备类型管理Service业务层处理
 * 
 * @author itheima
 * @date 2024-06-21
 */
@Service
public class VmTypeServiceImpl implements IVmTypeService 
{
    @Autowired
    private VmTypeMapper vmTypeMapper;

    /**
     * 查询设备类型管理
     * 
     * @param id 设备类型管理主键
     * @return 设备类型管理
     */
    @Override
    public VmType selectVmTypeById(Long id)
    {
        return vmTypeMapper.selectVmTypeById(id);
    }

    /**
     * 查询设备类型管理列表
     * 
     * @param vmType 设备类型管理
     * @return 设备类型管理
     */
    @Override
    public List<VmType> selectVmTypeList(VmType vmType)
    {
        return vmTypeMapper.selectVmTypeList(vmType);
    }

    /**
     * 新增设备类型管理
     * 
     * @param vmType 设备类型管理
     * @return 结果
     */
    @Override
    public int insertVmType(VmType vmType)
    {
        return vmTypeMapper.insertVmType(vmType);
    }

    /**
     * 修改设备类型管理
     * 
     * @param vmType 设备类型管理
     * @return 结果
     */
    @Override
    public int updateVmType(VmType vmType)
    {
        return vmTypeMapper.updateVmType(vmType);
    }

    /**
     * 批量删除设备类型管理
     * 
     * @param ids 需要删除的设备类型管理主键
     * @return 结果
     */
    @Override
    public int deleteVmTypeByIds(Long[] ids)
    {
        return vmTypeMapper.deleteVmTypeByIds(ids);
    }

    /**
     * 删除设备类型管理信息
     * 
     * @param id 设备类型管理主键
     * @return 结果
     */
    @Override
    public int deleteVmTypeById(Long id)
    {
        return vmTypeMapper.deleteVmTypeById(id);
    }
}
