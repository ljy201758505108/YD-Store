package com.yanda.service.impl;

import java.util.Calendar;
import java.util.Date;

import com.yanda.util.MD5JIaMi;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yanda.bean.Token;
import com.yanda.bean.User;
import com.yanda.mapper.UserMapper;
import com.yanda.service.UserService;

@Service
public class UserServiceImpl implements UserService{

	@Autowired
	UserMapper userMapper;
	
	public User findByUid(int uid) {
		// TODO Auto-generated method stub
		return userMapper.findByUid(uid);
	}

	public void register(User u) {
		// TODO Auto-generated method stub
		//设置默认昵称yd_年份_手机号后四位
		String uname = "yd_";
		
		Calendar c= Calendar.getInstance();
		
		uname += c.get(Calendar.YEAR)+"_";
		
		uname += u.getTel().substring(7);
		
		u.setUname(uname);
		
		u.setPwd(MD5JIaMi.MD5(u.getPwd()));
		
		userMapper.addUser(u);
	}
	
	
	
	//验证手机号是否存在
	/*
	 * 不存在就返回0   存在返回1  手机号格式不对就返回2
	 */
	public int isTelExist(String tel) {
		// TODO Auto-generated method stub
		return userMapper.isTelExist(tel);
	}
	
	/**
	 * 验证登录信息是否正确
	 * 
	 * 如果手机号、密码均符合，则返回1  任意一个不符合则返回0
	 * 
	 * 
	 */
	public int checkLoginInfo(String tel, String pwd) {
		// TODO Auto-generated method stub
		return userMapper.checkLoginInfo(tel,pwd);
	}

	public User login(String tel, String pwd) {
		// TODO Auto-generated method stub
		return userMapper.findTelAndPwd(tel, pwd);
	}
	
	
	/*
	 * 修改密码
	 */
	/*
	 * public void changePwd(Integer uid, String pwd) { // TODO Auto-generated
	 * method stub userMapper.changePwd(uid,pwd); }
	 */
	


//	public void changePwd(Integer uid, String pwd) {
//		// TODO Auto-generated method stub
//		
//	}
	



	public int modifyPassword(String newpassword, String uname) {
		// TODO Auto-generated method stub
		return userMapper.changePwd(MD5JIaMi.MD5(newpassword),uname);
		
	}
	
	//给用户添加令牌
	public void addToken(int uid, String autoLoginToken, String TokenType,Date time) {
		// TODO Auto-generated method stub
		userMapper.addToken(uid,autoLoginToken,TokenType,time);
	}
	
	//根据令牌名查询到令牌
	public Token findTokenByTokenName(String name) {
		// TODO Auto-generated method stub
		return userMapper.findTokenByTokenName(name);
	}
	
	//通过令牌查询到用户信息
	public User findUserByToken(String token) {
		// TODO Auto-generated method stub
		return userMapper.findUserByToken(token);
	}
	
	//删除cookie
	public int deleteToken(int uid) {
		// TODO Auto-generated method stub
		return userMapper.deleteToken(uid);
	}



	
}
