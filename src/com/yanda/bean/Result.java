package com.yanda.bean;


/**
 * ǰ��̨���ݽ�������
 * @author 25815
 *
 */
public class Result {
	/**
	 * 
	 * 1000----�ɹ�
	 * 2000----����������
	 * 3000----Ȩ�޲���
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
