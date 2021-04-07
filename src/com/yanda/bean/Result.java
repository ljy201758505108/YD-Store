package com.yanda.bean;


/**
 * 前后台数据交换对象
 * @author 25815
 *
 */
public class Result {
	/**
	 * 
	 * 1000----成功
	 * 2000----服务器出错
	 * 3000----权限不足
	 */
	private int code;
	
	private String msg;
	
	Object data;

	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public Object getData() {
		return data;
	}

	public void setData(Object data) {
		this.data = data;
	}

	public Result(int code, String msg, Object data) {
		super();
		this.code = code;
		this.msg = msg;
		this.data = data;
	}

	public Result(int code, String msg) {
		super();
		this.code = code;
		this.msg = msg;
	}

	public Result(int code) {
		super();
		this.code = code;
	}

	public Result() {
		super();
	}
	
	
	
	
	
	 
	

}
