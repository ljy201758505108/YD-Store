package com.yanda.service;

import java.util.Date;
import com.yanda.bean.Page;
import com.yanda.bean.PlatformAccount;

public interface PlatformAccountService {

	public PlatformAccount login(String account,String pwd);
	
	public void djAcc(String account, Date date);
	
	public Page findPagePlatform(int currentPage, int everyPageNum);
	
	public Page fuzzyFind(String accname,String name,String status,int currentPage, int everyPageNum);
	public int fuzzyFind(String accname,String name,String status);
	public void updateStatus(String status,String accname,String name);
	public void updateName(String newName,String accname,String name);
	public void deletePlatform(String accname,String name);

	public int createAdmin(PlatformAccount pacc);

	public Page fuzzyFindBusiness(String tel, String bname, int currentPage, int everyPageNum);

	public Page findBusinessByPage(int currentPage, int everyPageNum);

}
