package com.training.interceptors;


import com.training.model.domain.User;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CheckUserInterceptor extends HandlerInterceptorAdapter {

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
        super.postHandle(request, response, handler, modelAndView);
        if (request.getRequestURI().contains("check-user")) {
            User user = (User) modelAndView.getModel().get("user");
            if (user == null ) {
                response.sendRedirect(request.getContextPath() + "/failed");
            }

        }
    }
}
