package com.sky.common.utils;

import com.github.pagehelper.PageHelper;
import com.sky.common.core.page.PageDomain;
import com.sky.common.core.page.TableSupport;
import com.sky.common.utils.sql.SqlUtil;

/**
 * 分页工具类
 *
 * @author ruoyi
 */
public class PageUtils extends PageHelper
{
    /**
     * 设置请求分页数据
     */
    public static void startPage()
    {
        //1. 创建一个PageDomain对象，用于接收前端分页的参数；
        PageDomain pageDomain = TableSupport.buildPageRequest();
        //2. 从PageDomain对象中提取出当前页码、每页大小、排序条件；
        Integer pageNum = pageDomain.getPageNum(); // 获取当前页码
        Integer pageSize = pageDomain.getPageSize();// 获取每页大小
        //3. 对排序条件进行转义处理，防止SQL注入；
        String orderBy = SqlUtil.escapeOrderBySql(pageDomain.getOrderBy());
        Boolean reasonable = pageDomain.getReasonable(); // 获取是否合理分页
        //4. 使用PageHelper开启分页，设置页码、每页大小、排序条件和是否合理分页。
        PageHelper.startPage(pageNum, pageSize, orderBy).setReasonable(reasonable);
    }

    /**
     * 清理分页的线程变量
     */
    public static void clearPage()
    {
        PageHelper.clearPage();
    }
}
