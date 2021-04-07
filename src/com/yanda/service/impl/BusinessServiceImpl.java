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
	
	
	//验证手机号是否存在
	/*
	 * 不存在就返回0   存在返回1  手机号格式不对就返回2
	 */
	public int isTelExist(String tel) {
		return businessMapper.isTelExist(tel);
	}

	
	//商家注册
	public void register(Business b) {
		b.setPwd(MD5JIaMi.MD5(b.getPwd()));  //对商家输入的密码进行加密
		businessMapper.addBusiness(b);
	}

	//验证手机号是否存在
	/*
	 * 不存在就返回0   存在返回1  手机号格式不对就返回2
	 */
	public int isIDCardExist(String idcard) {
		// TODO 自动生成的方法存根
		return businessMapper.isIDCardExist(idcard);
	}

	//验证手机号是否存在
	/*
	 * 不存在就返回0   存在返回1  手机号格式不对就返回2
	 */
	public int isEmailExist(String email) {
		// TODO 自动生成的方法存根
		return businessMapper.isEmailExist(email);
	}

	//实现商家登录
	public Business login(String tel, String email, String pwd) {
		// TODO 自动生成的方法存根
		return businessMapper.findTelAndEmailAndPwd(tel,email,pwd);
	}


	public int addPath(String[] str) {
		// TODO 自动生成的方法存根
		return businessMapper.addPath(str[0],str[1],str[2]);
	}

	//保存身份证正面照
	public int addFacePath(String path) {
		// TODO 自动生成的方法存根
		return businessMapper.addFacePath(path);
	}

	//保存身份证背面照
	public int addBackPath(String path2) {
		// TODO 自动生成的方法存根
		return businessMapper.addBackPath(path2);
	}


	public int addPersonPath(String path3) {
		// TODO 自动生成的方法存根
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
