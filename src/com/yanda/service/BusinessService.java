package com.yanda.service;

import com.yanda.bean.Business;
import com.yanda.bean.Shop;

public interface BusinessService {

	int isTelExist(String tel); //�̼�ע��ʱ�ж��ֻ����Ƿ��Ѿ���ע���

	void register(Business b);  //�̼�ע��

	int isIDCardExist(String idcard); //�̼�ע��ʱ�ж����֤���Ƿ��Ѿ���ע���

	int isEmailExist(String email); //�̼�ע��ʱ�ж������Ƿ��Ѿ���ע���

	Business login(String tel, String email, String pwd); //ʵ���̼ҵ�¼����

	int addPath(String[] str);

	int addFacePath(String path);

	int addBackPath(String path2);

	int addPersonPath(String path3);

	void shopRegister(Shop shop); //�̼ҵ���ע��

	int addShopLogoPath(String path); //����logo����

 

}
