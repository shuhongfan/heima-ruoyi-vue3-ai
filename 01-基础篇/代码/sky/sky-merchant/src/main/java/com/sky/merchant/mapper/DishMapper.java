package com.sky.merchant.mapper;

import java.util.List;
import com.sky.merchant.domain.Dish;
import com.sky.merchant.domain.DishFlavor;

/**
 * 菜品管理Mapper接口
 * 
 * @author itheima
 * @date 2024-05-07
 */
public interface DishMapper 
{
    /**
     * 查询菜品管理
     * 
     * @param id 菜品管理主键
     * @return 菜品管理
     */
    public Dish selectDishById(Long id);

    /**
     * 查询菜品管理列表
     * 
     * @param dish 菜品管理
     * @return 菜品管理集合
     */
    public List<Dish> selectDishList(Dish dish);

    /**
     * 新增菜品管理
     * 
     * @param dish 菜品管理
     * @return 结果
     */
    public int insertDish(Dish dish);

    /**
     * 修改菜品管理
     * 
     * @param dish 菜品管理
     * @return 结果
     */
    public int updateDish(Dish dish);

    /**
     * 删除菜品管理
     * 
     * @param id 菜品管理主键
     * @return 结果
     */
    public int deleteDishById(Long id);

    /**
     * 批量删除菜品管理
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteDishByIds(Long[] ids);

    /**
     * 批量删除菜品口味关系
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteDishFlavorByDishIds(Long[] ids);
    
    /**
     * 批量新增菜品口味关系
     * 
     * @param dishFlavorList 菜品口味关系列表
     * @return 结果
     */
    public int batchDishFlavor(List<DishFlavor> dishFlavorList);
    

    /**
     * 通过菜品管理主键删除菜品口味关系信息
     * 
     * @param id 菜品管理ID
     * @return 结果
     */
    public int deleteDishFlavorByDishId(Long id);
}
