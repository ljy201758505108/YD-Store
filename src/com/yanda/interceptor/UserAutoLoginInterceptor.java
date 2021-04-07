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
	
	
	//ִ����controller��ִ�еķ���
	public void afterCompletion(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
		// TODO Auto-generated method stub

	}
	
	
	//controllerִ���굫��û�з���ModelAndViewʱִ�еķ���
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, ModelAndView arg3)
			throws Exception {
		// TODO Auto-generated method stub

	}
	
	
	//ִ��controller֮ǰ��ִ�еķ���������false��ִ�У�����true�����ִ��controller
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object arg2) throws Exception {
		// TODO Auto-generated method stub
		
		System.out.println("------�Զ���¼---------");
		//��ȡ������
		Cookie c = CookieUtil.getCookieByCookieName(request.getCookies(), "altoken");
		
		if(c != null) {
			//�ж�����
			Token altoken = userService.findTokenByTokenName(c.getValue());
			
			//û�в�ѯ��������
			//�����Ƿ���Ч
			Boolean f = (altoken==null)
					||(altoken.getTime().getTime()<new Date().getTime())
					||!altoken.getTokenType().equals("autoLogin");
			if( f ) {
				return  true;
			}
			
			//�������ƻ�ȡ�û���Ϣ
			User userInfo = userService.findUserByToken(altoken.getToken());
			
			
			//���û���Ϣ����session
			request.getSession().setAttribute("userInfo", userInfo);
			
		}
		
		
		return true;
	}

}
