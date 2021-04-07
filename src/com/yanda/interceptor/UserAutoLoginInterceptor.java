package com.yanda.interceptor;

import java.util.Date;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.yanda.bean.Token;
import com.yanda.bean.User;
import com.yanda.service.UserService;
import com.yanda.util.CookieUtil;

public class UserAutoLoginInterceptor implements HandlerInterceptor {
	@Autowired
	UserService userService;
	
	
	//执行完controller后执行的方法
	public void afterCompletion(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
		// TODO Auto-generated method stub

	}
	
	
	//controller执行完但是没有返回ModelAndView时执行的方法
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, ModelAndView arg3)
			throws Exception {
		// TODO Auto-generated method stub

	}
	
	
	//执行controller之前会执行的方法，返回false则不执行，返回true则继续执行controller
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object arg2) throws Exception {
		// TODO Auto-generated method stub
		
		System.out.println("------自动登录---------");
		//获取到令牌
		Cookie c = CookieUtil.getCookieByCookieName(request.getCookies(), "altoken");
		
		if(c != null) {
			//判断令牌
			Token altoken = userService.findTokenByTokenName(c.getValue());
			
			//没有查询到该令牌
			//令牌是否有效
			Boolean f = (altoken==null)
					||(altoken.getTime().getTime()<new Date().getTime())
					||!altoken.getTokenType().equals("autoLogin");
			if( f ) {
				return  true;
			}
			
			//根据令牌获取用户信息
			User userInfo = userService.findUserByToken(altoken.getToken());
			
			
			//将用户信息放入session
			request.getSession().setAttribute("userInfo", userInfo);
			
		}
		
		
		return true;
	}

}
