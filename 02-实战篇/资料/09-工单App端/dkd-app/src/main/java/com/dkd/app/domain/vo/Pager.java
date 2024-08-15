package com.dkd.app.domain.vo;

import cn.hutool.core.collection.ListUtil;
import lombok.Data;

import java.io.Serializable;
import java.util.List;

@Data
public class Pager<T> implements Serializable {

    /**
     * 当前页码
     */
    private long pageIndex;
    /**
     * 每页数量
     */
    private long pageSize;
    /**
     * 总页数
     */
    private long totalPage;
    /**
     * 总数据数量
     */
    private long totalCount;
    /**
     * 当前页数据
     */
    private List<T> currentPageRecords;

    public long getTotalPage() {
        if (pageSize == 0) return 0;
        totalPage = totalCount % pageSize == 0 ? (totalCount / pageSize) : (totalCount / pageSize) + 1;

        return totalPage;
    }

    public static <T> Pager<T> build(com.baomidou.mybatisplus.extension.plugins.pagination.Page<T> page) {
        Pager<T> pageResult = new Pager<>();
        pageResult.setCurrentPageRecords(page.getRecords());
        pageResult.setPageIndex(page.getCurrent());
        pageResult.setPageSize(page.getSize());
        pageResult.setTotalCount(page.getTotal());

        return pageResult;
    }

    /**
     * 构建空数据
     *
     * @param <T>
     * @return
     */
    public static <T> Pager<T> buildEmpty() {
        Pager<T> pageResult = new Pager<>();
        pageResult.setCurrentPageRecords(ListUtil.empty());
        pageResult.setPageIndex(0);
        pageResult.setPageSize(0);
        pageResult.setTotalCount(0);

        return pageResult;
    }

    /**
     * 重新构建
     *
     * @param <T>
     * @return
     */
    public static <T> Pager<T> build(Pager pager, List<T> list) {
        Pager<T> pageResult = new Pager<>();
        pageResult.setCurrentPageRecords(list);
        pageResult.setPageIndex(pager.getPageIndex());
        pageResult.setPageSize(pager.getPageSize());
        pageResult.setTotalCount(pager.getTotalCount());

        return pageResult;
    }

}
