package com.yanda.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yanda.bean.Page;
import com.yanda.bean.PlatformAccount;
import com.yanda.mapper.PlatformAccountMapper;
import com.yanda.service.PlatformAccountService;

@Service
public class PlatformAccountImpl implements PlatformAccountService {
	@Autowired
	PlatformAccountMapper platformAccountMapper;
	
	public PlatformAccount login(String acc, String pwd) {
		// TODO Auto-generated method stub
		
		return platformAccountMapper.findByAccNameAndPwd(acc, pwd);
	}

	public void djAcc(String account, Date date) {
		// TODO Auto-generated method stub
		platformAccountMapper.updateDjTimeByAccName(account,date);
	}
	
	
	public Page findPagePlatform(int currentPage, int everyPageNum) {
			
			Page page = new Page();
			
			int dataNum = platformAccountMapper.platformCount();
			
			page.setCurrentPage(currentPage);
			page.setDataNum(dataNum);
			
			page.setAllPage(dataNum%everyPageNum==0?dataNum/everyPageNum:dataNum/everyPageNum+1);
			List pList = platformAccountMapper.findPagePlatform(currentPage*everyPageNum,everyPageNum);
			page.setData(pList);
			return page;
		}
	
	
	
	public Page fuzzyFind(String accname, String name, String status,int currentPage, int everyPageNum) {
		// TODO Auto-generated method stub
		Page page=new Page();
		int dataNum=platformAccountMapper.fuzzyFindInt(accname, name, status);
		page.setCurrentPage(currentPage);
		page.setDataNum(dataNum);
		page.setAllPage(dataNum%everyPageNum==0?dataNum/everyPageNum:dataNum/everyPageNum+1);
		List pList=platformAccountMapper.fuzzyFind(accname, name, status,currentPage*everyPageNum, everyPageNum);
		page.setData(pList);
		return page;
	}
	
	
	public int fuzzyFind(String accname, String name, String status) {
		// TODO Auto-generated method stub
		return platformAccountMapper.fuzzyFindInt(accname, name, status);
	}
	
	
	public void updateStatus(String status, String accname, String name) {
		// TODO Auto-generated method stub
		platformAccountMapper.updateStatus(status, accname, name);
	}
	
	
	public void updateName(String newName,String accname, String name) {
		// TODO Auto-generated method stub
		platformAccountMapper.updateName(newName,accname, name);
	}
	
	
	public void deletePlatform(String accname, String name) {
		// TODO Auto-generated method stub
		platformAccountMapper.deletePlatform(accname, name);
	}

	public Page findBusinessByPage(int currentPage, int everyPageNum) {
		// TODO Auto-generated method stub
		Page page = new Page();
		
		int dataNum = platformAccountMapper.businessCount();
		
		page.setCurrentPage(currentPage);
		page.setDataNum(dataNum);
		
		page.setAllPage(dataNum%everyPageNum==0?dataNum/everyPageNum:dataNum/everyPageNum+1);
		
		List bList = platformAccountMapper.findPageBusiness(currentPage*everyPageNum,everyPageNum);
		
		page.setData(bList);
		
		return page;
	}

	public Page fuzzyFindBusiness(String tel, String bname, int currentPage, int everyPageNum) {
		// TODO Auto-generated method stub
		Page page=new Page();
		int dataNum=platformAccountMapper.fuzzyFindBusinessInt(tel, bname);
		page.setCurrentPage(currentPage);
		page.setDataNum(dataNum);
		page.setAllPage(dataNum%everyPageNum==0?dataNum/everyPageNum:dataNum/everyPageNum+1);
		List bList=platformAccountMapper.fuzzyFindBusiness(tel, bname,currentPage*everyPageNum, everyPageNum);
		page.setData(bList);
		return page;
	}

	public int createAdmin(PlatformAccount pacc) {
		// TODO Auto-generated method stub
		return platformAccountMapper.addAdmin(pacc);
	}

	
}
