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
import com.dkd.manage.domain.Emp;
import com.dkd.manage.service.IEmpService;
import com.dkd.common.utils.poi.ExcelUtil;
import com.dkd.common.core.page.TableDataInfo;

/**
 * 人员列表Controller
 * 
 * @author itheima
 * @date 2024-06-15
 */
@RestController
@RequestMapping("/manage/emp")
public class EmpController extends BaseController
{
    @Autowired
    private IEmpService empService;

    /**
     * 查询人员列表列表
     */
    @PreAuthorize("@ss.hasPermi('manage:emp:list')")
    @GetMapping("/list")
    public TableDataInfo list(Emp emp)
    {
        startPage();
        List<Emp> list = empService.selectEmpList(emp);
        return getDataTable(list);
    }

    /**
     * 导出人员列表列表
     */
    @PreAuthorize("@ss.hasPermi('manage:emp:export')")
    @Log(title = "人员列表", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, Emp emp)
    {
        List<Emp> list = empService.selectEmpList(emp);
        ExcelUtil<Emp> util = new ExcelUtil<Emp>(Emp.class);
        util.exportExcel(response, list, "人员列表数据");
    }

    /**
     * 获取人员列表详细信息
     */
    @PreAuthorize("@ss.hasPermi('manage:emp:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(empService.selectEmpById(id));
    }

    /**
     * 新增人员列表
     */
    @PreAuthorize("@ss.hasPermi('manage:emp:add')")
    @Log(title = "人员列表", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Emp emp)
    {
        return toAjax(empService.insertEmp(emp));
    }

    /**
     * 修改人员列表
     */
    @PreAuthorize("@ss.hasPermi('manage:emp:edit')")
    @Log(title = "人员列表", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Emp emp)
    {
        return toAjax(empService.updateEmp(emp));
    }

    /**
     * 删除人员列表
     */
    @PreAuthorize("@ss.hasPermi('manage:emp:remove')")
    @Log(title = "人员列表", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(empService.deleteEmpByIds(ids));
    }
}
