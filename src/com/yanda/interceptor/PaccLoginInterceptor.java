package com.yanda.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class PaccLoginInterceptor implements HandlerInterceptor {

	public void afterCompletion(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
		// TODO Auto-generated method stub

	}

	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, ModelAndView arg3)
			throws Exception {
		// TODO Auto-generated method stub

	}

	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object arg2) throws Exception {
		// TODO Auto-generated method stub
		//在拦截点执行前拦截，如果返回true则不执行拦截点后的操作（拦截成功）
			//返回false则不执行拦截
		System.out.println("没登录的话，请先登录哦");
		System.out.println(request.getSession().getAttribute("paccInfo"));
			if(request.getSession().getAttribute("paccInfo") == null || request.getSession().getAttribute("paccInfo") == "") {
				//登录失败，跳转到登录页
				response.sendRedirect(request.getContextPath()+"/paccloginInterceptor.jsp");
				return false;
			}else{
				//登陆成功，不拦截
				return true;
			}
	}

}
