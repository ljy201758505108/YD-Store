package com.yanda.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yanda.bean.Business;
import com.yanda.bean.Shop;
import com.yanda.mapper.BusinessMapper;
import com.yanda.service.BusinessService;
import com.yanda.util.MD5JIaMi;

@Service
public class BusinessServiceImpl implements BusinessService {
	@Autowired
	BusinessMapper businessMapper;
	
	
	//��֤�ֻ����Ƿ����
	/*
	 * �����ھͷ���0   ���ڷ���1  �ֻ��Ÿ�ʽ���Ծͷ���2
	 */
	public int isTelExist(String tel) {
		return businessMapper.isTelExist(tel);
	}

	
	//�̼�ע��
	public void register(Business b) {
		b.setPwd(MD5JIaMi.MD5(b.getPwd()));  //���̼������������м���
		businessMapper.addBusiness(b);
	}

	//��֤�ֻ����Ƿ����
	/*
	 * �����ھͷ���0   ���ڷ���1  �ֻ��Ÿ�ʽ���Ծͷ���2
	 */
	public int isIDCardExist(String idcard) {
		// TODO �Զ����ɵķ������
		return businessMapper.isIDCardExist(idcard);
	}

	//��֤�ֻ����Ƿ����
	/*
	 * �����ھͷ���0   ���ڷ���1  �ֻ��Ÿ�ʽ���Ծͷ���2
	 */
	public int isEmailExist(String email) {
		// TODO �Զ����ɵķ������
		return businessMapper.isEmailExist(email);
	}

	//ʵ���̼ҵ�¼
	public Business login(String tel, String email, String pwd) {
		// TODO �Զ����ɵķ������
		return businessMapper.findTelAndEmailAndPwd(tel,email,pwd);
	}


	public int addPath(String[] str) {
		// TODO �Զ����ɵķ������
		return businessMapper.addPath(str[0],str[1],str[2]);
	}

	//�������֤������
	public int addFacePath(String path) {
		// TODO �Զ����ɵķ������
		return businessMapper.addFacePath(path);
	}

	//�������֤������
	public int addBackPath(String path2) {
		// TODO �Զ����ɵķ������
		return businessMapper.addBackPath(path2);
	}


	public int addPersonPath(String path3) {
		// TODO �Զ����ɵķ������
		return businessMapper.addPersonPath(path3);
	}


	
	public void shopRegister(Shop shop) {
		// TODO Auto-generated method stub
		businessMapper.addShop(shop);
	}


	
	public int addShopLogoPath(String path) {
		// TODO Auto-generated method stub
		return businessMapper.addShopLogoPath(path);
	}



}
