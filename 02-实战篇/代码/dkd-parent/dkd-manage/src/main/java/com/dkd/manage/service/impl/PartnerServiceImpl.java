package com.dkd.manage.service.impl;

import com.dkd.common.utils.DateUtils;
import com.dkd.common.utils.SecurityUtils;
import com.dkd.manage.domain.Partner;
import com.dkd.manage.domain.vo.PartnerVo;
import com.dkd.manage.mapper.PartnerMapper;
import com.dkd.manage.service.IPartnerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 合作商管理Service业务层处理
 *
 * @author itheima
 * @date 2024-06-05
 */
@Service
public class PartnerServiceImpl implements IPartnerService
{
    @Autowired
    private PartnerMapper partnerMapper;

    /**
     * 查询合作商管理
     *
     * @param id 合作商管理主键
     * @return 合作商管理
     */
    @Override
    public Partner selectPartnerById(Long id)
    {
        return partnerMapper.selectPartnerById(id);
    }

    /**
     * 查询合作商管理列表
     *
     * @param partner 合作商管理
     * @return 合作商管理
     */
    @Override
    public List<Partner> selectPartnerList(Partner partner)
    {
        return partnerMapper.selectPartnerList(partner);
    }

    /**
     * 新增合作商管理
     *
     * @param partner 合作商管理
     * @return 结果
     */
    @Override
    public int insertPartner(Partner partner)
    {
        // 使用springSecurity工具类，对前端传入的密码进行加密
        partner.setPassword(SecurityUtils.encryptPassword(partner.getPassword()));
        partner.setCreateTime(DateUtils.getNowDate());
        return partnerMapper.insertPartner(partner);
    }

    /**
     * 修改合作商管理
     *
     * @param partner 合作商管理
     * @return 结果
     */
    @Override
    public int updatePartner(Partner partner)
    {
        partner.setUpdateTime(DateUtils.getNowDate());
        return partnerMapper.updatePartner(partner);
    }

    /**
     * 批量删除合作商管理
     *
     * @param ids 需要删除的合作商管理主键
     * @return 结果
     */
    @Override
    public int deletePartnerByIds(Long[] ids)
    {
        return partnerMapper.deletePartnerByIds(ids);
    }

    /**
     * 删除合作商管理信息
     *
     * @param id 合作商管理主键
     * @return 结果
     */
    @Override
    public int deletePartnerById(Long id)
    {
        return partnerMapper.deletePartnerById(id);
    }

    /**
     * 查询合作商列表
     * @param partner
     * @return PartnerVo集合
     */
    @Override
    public List<PartnerVo> selectPartnerVoList(Partner partner) {
        return partnerMapper.selectPartnerVoList(partner);
    }
}
