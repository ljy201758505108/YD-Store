package com.yanda.util;

import javax.servlet.http.Cookie;

/**
 * 根据Coookie名获取到Cookie
 * @author 25815
 *
 */

public class CookieUtil {
	
	public static Cookie getCookieByCookieName(Cookie[] cs, String cookieName) {
		
		if(cs == null || cookieName == null) {
			return null;
		}
		
		for(Cookie c:cs) {
			if(c.getName().equals(cookieName)) {
				return c;
				
			}
			
		}
		return null;
		
	}

}
