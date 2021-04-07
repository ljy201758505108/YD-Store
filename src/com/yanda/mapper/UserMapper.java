package com.yanda.mapper;

import java.util.Date;

import com.yanda.bean.Token;
import com.yanda.bean.User;

public interface UserMapper {

	public User findByUid(int uid);
	
	public int isTelExist(String tel); //验证手机号是否存在
	
	public void addUser(User u); //用户注册
	
	public int checkLoginInfo(String tel, String pwd); //验证用户登录

	public User findTelAndPwd(String tel, String pwd);

	public int changePwd(String newpassword, String uname);//修改密码

	public void addToken(int uid, String autoLoginToken, String tokenType,Date time);

	public Token findTokenByTokenName(String name); //根据令牌名查询到令牌

	public User findUserByToken(String token);  //通过令牌查询到用户信息

	public int deleteToken(int uid);//删除cookie

	
	
}
