package com.yanda.service;

import com.yanda.bean.Business;
import com.yanda.bean.Shop;

public interface BusinessService {

	int isTelExist(String tel); //商家注册时判断手机号是否已经被注册过

	void register(Business b);  //商家注册

	int isIDCardExist(String idcard); //商家注册时判断身份证号是否已经被注册过

	int isEmailExist(String email); //商家注册时判断邮箱是否已经被注册过

	Business login(String tel, String email, String pwd); //实现商家登录功能

	int addPath(String[] str);

	int addFacePath(String path);

	int addBackPath(String path2);

	int addPersonPath(String path3);

	void shopRegister(Shop shop); //商家店铺注册

	int addShopLogoPath(String path); //店铺logo保存

 

}
