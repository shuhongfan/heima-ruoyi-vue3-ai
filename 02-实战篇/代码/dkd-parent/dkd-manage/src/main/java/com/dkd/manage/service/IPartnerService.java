package com.dkd.manage.service;

import com.dkd.manage.domain.Partner;
import com.dkd.manage.domain.vo.PartnerVo;

import java.util.List;

/**
 * 合作商管理Service接口
 *
 * @author itheima
 * @date 2024-06-05
 */
public interface IPartnerService
{
    /**
     * 查询合作商管理
     *
     * @param id 合作商管理主键
     * @return 合作商管理
     */
    public Partner selectPartnerById(Long id);

    /**
     * 查询合作商管理列表
     *
     * @param partner 合作商管理
     * @return 合作商管理集合
     */
    public List<Partner> selectPartnerList(Partner partner);

    /**
     * 新增合作商管理
     *
     * @param partner 合作商管理
     * @return 结果
     */
    public int insertPartner(Partner partner);

    /**
     * 修改合作商管理
     *
     * @param partner 合作商管理
     * @return 结果
     */
    public int updatePartner(Partner partner);

    /**
     * 批量删除合作商管理
     *
     * @param ids 需要删除的合作商管理主键集合
     * @return 结果
     */
    public int deletePartnerByIds(Long[] ids);

    /**
     * 删除合作商管理信息
     *
     * @param id 合作商管理主键
     * @return 结果
     */
    public int deletePartnerById(Long id);

    /**
     * 查询合作商列表
     * @param partner
     * @return PartnerVo集合
     */
    public List<PartnerVo> selectPartnerVoList(Partner partner);
}
