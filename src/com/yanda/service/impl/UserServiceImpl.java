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
		//����Ĭ���ǳ�yd_���_�ֻ��ź���λ
		String uname = "yd_";
		
		Calendar c= Calendar.getInstance();
		
		uname += c.get(Calendar.YEAR)+"_";
		
		uname += u.getTel().substring(7);
		
		u.setUname(uname);
		
		u.setPwd(MD5JIaMi.MD5(u.getPwd()));
		
		userMapper.addUser(u);
	}
	
	
	
	//��֤�ֻ����Ƿ����
	/*
	 * �����ھͷ���0   ���ڷ���1  �ֻ��Ÿ�ʽ���Ծͷ���2
	 */
	public int isTelExist(String tel) {
		// TODO Auto-generated method stub
		return userMapper.isTelExist(tel);
	}
	
	/**
	 * ��֤��¼��Ϣ�Ƿ���ȷ
	 * 
	 * ����ֻ��š���������ϣ��򷵻�1  ����һ���������򷵻�0
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
	 * �޸�����
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
	
	//���û��������
	public void addToken(int uid, String autoLoginToken, String TokenType,Date time) {
		// TODO Auto-generated method stub
		userMapper.addToken(uid,autoLoginToken,TokenType,time);
	}
	
	//������������ѯ������
	public Token findTokenByTokenName(String name) {
		// TODO Auto-generated method stub
		return userMapper.findTokenByTokenName(name);
	}
	
	//ͨ�����Ʋ�ѯ���û���Ϣ
	public User findUserByToken(String token) {
		// TODO Auto-generated method stub
		return userMapper.findUserByToken(token);
	}
	
	//ɾ��cookie
	public int deleteToken(int uid) {
		// TODO Auto-generated method stub
		return userMapper.deleteToken(uid);
	}



	
}
