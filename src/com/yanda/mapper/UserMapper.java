package com.yanda.mapper;

import java.util.Date;

import com.yanda.bean.Token;
import com.yanda.bean.User;

public interface UserMapper {

	public User findByUid(int uid);
	
	public int isTelExist(String tel); //��֤�ֻ����Ƿ����
	
	public void addUser(User u); //�û�ע��
	
	public int checkLoginInfo(String tel, String pwd); //��֤�û���¼

	public User findTelAndPwd(String tel, String pwd);

	public int changePwd(String newpassword, String uname);//�޸�����

	public void addToken(int uid, String autoLoginToken, String tokenType,Date time);

	public Token findTokenByTokenName(String name); //������������ѯ������

	public User findUserByToken(String token);  //ͨ�����Ʋ�ѯ���û���Ϣ

	public int deleteToken(int uid);//ɾ��cookie

	
	
}
