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
		//�����ص�ִ��ǰ���أ��������true��ִ�����ص��Ĳ��������سɹ���
			//����false��ִ������
		System.out.println("û��¼�Ļ������ȵ�¼Ŷ");
		System.out.println(request.getSession().getAttribute("paccInfo"));
			if(request.getSession().getAttribute("paccInfo") == null || request.getSession().getAttribute("paccInfo") == "") {
				//��¼ʧ�ܣ���ת����¼ҳ
				response.sendRedirect(request.getContextPath()+"/paccloginInterceptor.jsp");
				return false;
			}else{
				//��½�ɹ���������
				return true;
			}
	}

}
