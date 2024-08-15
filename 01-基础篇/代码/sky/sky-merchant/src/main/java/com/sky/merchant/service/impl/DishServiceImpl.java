package com.sky.merchant.service.impl;

import com.sky.common.utils.DateUtils;
import com.sky.common.utils.StringUtils;
import com.sky.merchant.domain.Dish;
import com.sky.merchant.domain.DishFlavor;
import com.sky.merchant.mapper.DishMapper;
import com.sky.merchant.service.IDishService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

/**
 * 菜品管理Service业务层处理
 *
 * @author itheima
 * @date 2024-05-07
 */
@Service
public class DishServiceImpl implements IDishService
{
    @Autowired
    private DishMapper dishMapper;

    /**
     * 查询菜品管理
     *
     * @param id 菜品管理主键
     * @return 菜品管理
     */
    @Override
    public Dish selectDishById(Long id)
    {
        return dishMapper.selectDishById(id);
    }

    /**
     * 查询菜品管理列表
     *
     * @param dish 菜品管理
     * @return 菜品管理
     */
    @Override
    public List<Dish> selectDishList(Dish dish)
    {
        return dishMapper.selectDishList(dish);
    }

    /**
     * 新增菜品管理
     *
     * @param dish 菜品管理
     * @return 结果
     */
    @Transactional
    @Override
    public int insertDish(Dish dish)
    {
        dish.setCreateTime(DateUtils.getNowDate());
        int rows = dishMapper.insertDish(dish);
        insertDishFlavor(dish);
        return rows;
    }

    /**
     * 修改菜品管理
     *
     * @param dish 菜品管理
     * @return 结果
     */
    @Transactional
    @Override
    public int updateDish(Dish dish)
    {
        dish.setUpdateTime(DateUtils.getNowDate());
        dishMapper.deleteDishFlavorByDishId(dish.getId());
        insertDishFlavor(dish);
        return dishMapper.updateDish(dish);
    }

    /**
     * 批量删除菜品管理
     *
     * @param ids 需要删除的菜品管理主键
     * @return 结果
     */
    @Transactional
    @Override
    public int deleteDishByIds(Long[] ids)
    {
        dishMapper.deleteDishFlavorByDishIds(ids);
        return dishMapper.deleteDishByIds(ids);
    }

    /**
     * 删除菜品管理信息
     *
     * @param id 菜品管理主键
     * @return 结果
     */
    @Transactional
    @Override
    public int deleteDishById(Long id)
    {
        dishMapper.deleteDishFlavorByDishId(id);
        return dishMapper.deleteDishById(id);
    }

    /**
     * 新增菜品口味关系信息
     *
     * @param dish 菜品管理对象
     */
    public void insertDishFlavor(Dish dish)
    {
        List<DishFlavor> dishFlavorList = dish.getDishFlavorList();
        Long id = dish.getId();
        if (StringUtils.isNotNull(dishFlavorList))
        {
            List<DishFlavor> list = new ArrayList<DishFlavor>();
            for (DishFlavor dishFlavor : dishFlavorList)
            {
                dishFlavor.setDishId(id);
                list.add(dishFlavor);
            }
            if (list.size() > 0)
            {
                dishMapper.batchDishFlavor(list);
            }
        }
    }
}
