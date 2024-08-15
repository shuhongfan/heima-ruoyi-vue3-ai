package com.sky.merchant.controller;

import java.util.List;
import javax.servlet.http.HttpServletResponse;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.sky.common.annotation.Log;
import com.sky.common.core.controller.BaseController;
import com.sky.common.core.domain.AjaxResult;
import com.sky.common.enums.BusinessType;
import com.sky.merchant.domain.Dish;
import com.sky.merchant.service.IDishService;
import com.sky.common.utils.poi.ExcelUtil;
import com.sky.common.core.page.TableDataInfo;

/**
 * 菜品管理Controller
 * 
 * @author itheima
 * @date 2024-05-07
 */
@RestController
@RequestMapping("/merchant/dish")
public class DishController extends BaseController
{
    @Autowired
    private IDishService dishService;

    /**
     * 查询菜品管理列表
     */
    @PreAuthorize("@ss.hasPermi('merchant:dish:list')")
    @GetMapping("/list")
    public TableDataInfo list(Dish dish)
    {
        startPage();
        List<Dish> list = dishService.selectDishList(dish);
        return getDataTable(list);
    }

    /**
     * 导出菜品管理列表
     */
    @PreAuthorize("@ss.hasPermi('merchant:dish:export')")
    @Log(title = "菜品管理", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, Dish dish)
    {
        List<Dish> list = dishService.selectDishList(dish);
        ExcelUtil<Dish> util = new ExcelUtil<Dish>(Dish.class);
        util.exportExcel(response, list, "菜品管理数据");
    }

    /**
     * 获取菜品管理详细信息
     */
    @PreAuthorize("@ss.hasPermi('merchant:dish:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(dishService.selectDishById(id));
    }

    /**
     * 新增菜品管理
     */
    @PreAuthorize("@ss.hasPermi('merchant:dish:add')")
    @Log(title = "菜品管理", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Dish dish)
    {
        return toAjax(dishService.insertDish(dish));
    }

    /**
     * 修改菜品管理
     */
    @PreAuthorize("@ss.hasPermi('merchant:dish:edit')")
    @Log(title = "菜品管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Dish dish)
    {
        return toAjax(dishService.updateDish(dish));
    }

    /**
     * 删除菜品管理
     */
    @PreAuthorize("@ss.hasPermi('merchant:dish:remove')")
    @Log(title = "菜品管理", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(dishService.deleteDishByIds(ids));
    }
}
