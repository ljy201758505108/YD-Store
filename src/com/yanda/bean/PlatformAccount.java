package com.yanda.bean;

import java.util.Date;

public class PlatformAccount {
	
	int accid;
	
	String accname;
	
	String pwd;
	
	String status;
	
	
	Date djTime;
	
	String name;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Date getDjTime() {
		return djTime;
	}

	public void setDjTime(Date djTime) {
		this.djTime = djTime;
	}

	public int getAccid() {
		return accid;
	}

	public void setAccid(int accid) {
		this.accid = accid;
	}

	public String getAccname() {
		return accname;
	}

	public void setAccname(String accname) {
		this.accname = accname;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "PlatFormAccount [accid=" + accid + ", accname=" + accname + ", pwd=" + pwd + ", status=" + status + "]";
	}
	
	

}
