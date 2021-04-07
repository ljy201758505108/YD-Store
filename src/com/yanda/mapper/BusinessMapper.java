package com.yanda.mapper;

import com.yanda.bean.Business;
import com.yanda.bean.Shop;

public interface BusinessMapper {

	public int isTelExist(String tel);
		

	public void addBusiness(Business b);


	public int isIDCardExist(String idcard);


	public int isEmailExist(String email);


	public Business findTelAndEmailAndPwd(String tel, String email, String pwd);


	public int addPath(String path,String path2,String path3);


	public int addFacePath(String path);


	public int addBackPath(String path2);


	public int addPersonPath(String path3);


	public void addShop(Shop shop);


	public int addShopLogoPath(String path);


		
	

	

}
