package com.yanda.mapper;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.yanda.bean.PlatformAccount;

public interface PlatformAccountMapper {

	public PlatformAccount findByAccNameAndPwd(String accName, String pwd);

	public void updateDjTimeByAccName(String account, Date date);
	
	public List findPagePlatform(int i, int everyPageNum);
	public int platformCount();
	public int fuzzyFindInt(@Param("accname")String accname,@Param("name")String name,@Param("status")String status);
	public List fuzzyFind(@Param("accname")String accname,@Param("name")String name,@Param("status")String status,@Param("currentPage")int currentPage,@Param("everyPageNum") int everyPageNum);
	public void updateStatus(String status,String accname,String name);
	public void updateName(String newName,String accname,String name);
	public void deletePlatform(String accname,String name);

	public List findPageBusiness(int i, int everyPageNum);

	public int fuzzyFindBusinessInt(String tel, String bname);

	public List fuzzyFindBusiness(String tel, String bname, int i, int everyPageNum);

	public int businessCount();

	public int addAdmin(PlatformAccount pacc);

}
