package com.dkd.manage.controller;

import com.dkd.common.annotation.Log;
import com.dkd.common.core.controller.BaseController;
import com.dkd.common.core.domain.AjaxResult;
import com.dkd.common.core.page.TableDataInfo;
import com.dkd.common.enums.BusinessType;
import com.dkd.common.utils.poi.ExcelUtil;
import com.dkd.manage.domain.Node;
import com.dkd.manage.domain.vo.NodeVo;
import com.dkd.manage.service.INodeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * 点位管理Controller
 *
 * @author itheima
 * @date 2024-06-05
 */
@RestController
@RequestMapping("/manage/node")
public class NodeController extends BaseController
{
    @Autowired
    private INodeService nodeService;

    /**
     * 查询点位管理列表
     */
    @PreAuthorize("@ss.hasPermi('manage:node:list')")
    @GetMapping("/list")
    public TableDataInfo list(Node node)
    {
        startPage();
        List<NodeVo> voList = nodeService.selectNodeVoList(node);
        return getDataTable(voList);
    }

    /**
     * 导出点位管理列表
     */
    @PreAuthorize("@ss.hasPermi('manage:node:export')")
    @Log(title = "点位管理", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, Node node)
    {
        List<Node> list = nodeService.selectNodeList(node);
        ExcelUtil<Node> util = new ExcelUtil<Node>(Node.class);
        util.exportExcel(response, list, "点位管理数据");
    }

    /**
     * 获取点位管理详细信息
     */
    @PreAuthorize("@ss.hasPermi('manage:node:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(nodeService.selectNodeById(id));
    }

    /**
     * 新增点位管理
     */
    @PreAuthorize("@ss.hasPermi('manage:node:add')")
    @Log(title = "点位管理", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Node node)
    {
        return toAjax(nodeService.insertNode(node));
    }

    /**
     * 修改点位管理
     */
    @PreAuthorize("@ss.hasPermi('manage:node:edit')")
    @Log(title = "点位管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Node node)
    {
        return toAjax(nodeService.updateNode(node));
    }

    /**
     * 删除点位管理
     */
    @PreAuthorize("@ss.hasPermi('manage:node:remove')")
    @Log(title = "点位管理", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(nodeService.deleteNodeByIds(ids));
    }
}
