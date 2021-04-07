package com.yanda.tag;

import java.io.IOException;
import java.io.StringWriter;
import java.util.List;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.PageContext;
import javax.servlet.jsp.tagext.SimpleTagSupport;

import com.yanda.bean.User;

public class AuthorityTag extends SimpleTagSupport {

	String authName;
	
	
	@Override
	public void doTag() throws JspException, IOException {
		JspWriter out = getJspContext().getOut();
		
		PageContext p = (PageContext)getJspContext();
		
		User u = (User)p.getSession().getAttribute("userInfo");
		
		if (u != null)
		{
			List authList = u.getAuthorityList();
			
			if (authList.contains(authName))
			{
				StringWriter sw = new StringWriter();
				getJspBody().invoke(sw);
				out.write(sw.toString());
			}
		}
	}


	public String getAuthName() {
		return authName;
	}


	public void setAuthName(String authName) {
		this.authName = authName;
	}

	
}
