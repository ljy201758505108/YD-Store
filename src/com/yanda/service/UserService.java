package com.yanda.service;

import java.util.Date;

import com.yanda.bean.Token;
import com.yanda.bean.User;

public interface UserService {

	public User findByUid(int uid);
	
	public int isTelExist(String tel); //验证手机号是否存在
	
	public void register(User u);//用户注册
	
	public int checkLoginInfo(String tel, String pwd); //验证登录信息

	public User login(String tel, String pwd);

	/* public void changePwd(Integer uid, String pwd); */

	

	int modifyPassword(String newpassword, String uname);

	public void addToken(int uid, String autoLoginToken, String string, Date time); //后台保存令牌

	public Token findTokenByTokenName(String name);

	public User findUserByToken(String token);

	public int deleteToken(int uid);  //删除令牌

	



	

	
	
}
