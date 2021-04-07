package com.yanda.service;

import java.util.Date;

import com.yanda.bean.Token;
import com.yanda.bean.User;

public interface UserService {

	public User findByUid(int uid);
	
	public int isTelExist(String tel); //��֤�ֻ����Ƿ����
	
	public void register(User u);//�û�ע��
	
	public int checkLoginInfo(String tel, String pwd); //��֤��¼��Ϣ

	public User login(String tel, String pwd);

	/* public void changePwd(Integer uid, String pwd); */

	

	int modifyPassword(String newpassword, String uname);

	public void addToken(int uid, String autoLoginToken, String string, Date time); //��̨��������

	public Token findTokenByTokenName(String name);

	public User findUserByToken(String token);

	public int deleteToken(int uid);  //ɾ������

	



	

	
	
}
