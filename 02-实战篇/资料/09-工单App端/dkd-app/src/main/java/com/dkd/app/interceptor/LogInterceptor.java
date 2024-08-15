package com.dkd.app.interceptor;

import com.dkd.app.common.context.EmpHolder;
import com.dkd.app.common.util.JWTUtil;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// 登录拦截器
@Component
public class LogInterceptor implements HandlerInterceptor {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        System.out.println(request.getRequestURL());

        //1.  从请求头获取token
        String token = request.getHeader("Authorization");
        Integer userId = null;
        try {
             userId = JWTUtil.decode(token);
        } catch (Exception e) {
            e.printStackTrace();
            //2. token解析失败，未授权
            response.setContentType("application/json;charset=utf-8");
            response.setStatus(401);
            return false;
        }
        //3. 登录成功放行
        EmpHolder.set(userId);

        return true;
    }
}
