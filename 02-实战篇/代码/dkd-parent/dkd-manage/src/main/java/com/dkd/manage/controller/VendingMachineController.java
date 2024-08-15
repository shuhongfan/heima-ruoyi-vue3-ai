package com.dkd.manage.controller;

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
import com.dkd.common.annotation.Log;
import com.dkd.common.core.controller.BaseController;
import com.dkd.common.core.domain.AjaxResult;
import com.dkd.common.enums.BusinessType;
import com.dkd.manage.domain.VendingMachine;
import com.dkd.manage.service.IVendingMachineService;
import com.dkd.common.utils.poi.ExcelUtil;
import com.dkd.common.core.page.TableDataInfo;

/**
 * 设备管理Controller
 * 
 * @author itheima
 * @date 2024-06-21
 */
@RestController
@RequestMapping("/manage/vm")
public class VendingMachineController extends BaseController
{
    @Autowired
    private IVendingMachineService vendingMachineService;

    /**
     * 查询设备管理列表
     */
    @PreAuthorize("@ss.hasPermi('manage:vm:list')")
    @GetMapping("/list")
    public TableDataInfo list(VendingMachine vendingMachine)
    {
        startPage();
        List<VendingMachine> list = vendingMachineService.selectVendingMachineList(vendingMachine);
        return getDataTable(list);
    }

    /**
     * 导出设备管理列表
     */
    @PreAuthorize("@ss.hasPermi('manage:vm:export')")
    @Log(title = "设备管理", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, VendingMachine vendingMachine)
    {
        List<VendingMachine> list = vendingMachineService.selectVendingMachineList(vendingMachine);
        ExcelUtil<VendingMachine> util = new ExcelUtil<VendingMachine>(VendingMachine.class);
        util.exportExcel(response, list, "设备管理数据");
    }

    /**
     * 获取设备管理详细信息
     */
    @PreAuthorize("@ss.hasPermi('manage:vm:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(vendingMachineService.selectVendingMachineById(id));
    }

    /**
     * 新增设备管理
     */
    @PreAuthorize("@ss.hasPermi('manage:vm:add')")
    @Log(title = "设备管理", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody VendingMachine vendingMachine)
    {
        return toAjax(vendingMachineService.insertVendingMachine(vendingMachine));
    }

    /**
     * 修改设备管理
     */
    @PreAuthorize("@ss.hasPermi('manage:vm:edit')")
    @Log(title = "设备管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody VendingMachine vendingMachine)
    {
        return toAjax(vendingMachineService.updateVendingMachine(vendingMachine));
    }

    /**
     * 删除设备管理
     */
    @PreAuthorize("@ss.hasPermi('manage:vm:remove')")
    @Log(title = "设备管理", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(vendingMachineService.deleteVendingMachineByIds(ids));
    }
}
