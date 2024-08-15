package com.dkd.app.common.context;

public class EmpHolder {

    public static ThreadLocal<Integer> threadLocal = new ThreadLocal<>();

    public static void set(Integer id) {
        threadLocal.set(id);
    }

    public static Integer get() {
        return threadLocal.get();
    }

    public static void remove() {
        threadLocal.remove();
    }
}
