package com.yanda.bean;

import java.util.List;

public class User {

	int uid;
	
	String uname;
	
	String addr;
	

	String pwd;
	
	String tel;
	
	List<String> authorityList;


	public List<String> getAuthorityList() {
		return authorityList;
	}

	public void setAuthorityList(List<String> authorityList) {
		this.authorityList = authorityList;
	}

	public int getUid() {
		return uid;
	}

	public void setUid(int uid) {
		this.uid = uid;
	}

	public String getUname() {
		return uname;
	}

	public void setUname(String uname) {
		this.uname = uname;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	
	

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	@Override
	public String toString() {
		return "User [uid=" + uid + ", uname=" + uname + ", addr=" + addr + ", pwd=" + pwd + ", tel=" + tel + "]";
	}

	
	
	
}
