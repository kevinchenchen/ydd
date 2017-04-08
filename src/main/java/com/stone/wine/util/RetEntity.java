package com.stone.wine.util;

/**
 * 返回结果实体
 * 
 * @author stone
 *
 */
public class RetEntity {
	/**
	 * 
	 */
	private int retCode;
	private String retMsg;
	private Object retData;

	public RetEntity() {
	}

	public RetEntity(int code) {
		this.retCode = code;
	}

	public RetEntity(int code, String msg) {
		this.retCode = code;
		this.retMsg = msg;
	}

	public RetEntity(int code, String msg, Object data) {
		this.retCode = code;
		this.retMsg = msg;
		this.retData = data;
	}

	public int getRetCode() {
		return retCode;
	}

	public void setRetCode(int retCode) {
		this.retCode = retCode;
	}

	public String getRetMsg() {
		return retMsg;
	}

	public void setRetMsg(String retMsg) {
		this.retMsg = retMsg;
	}

	public Object getRetData() {
		return retData;
	}

	public void setRetData(Object retData) {
		this.retData = retData;
	}

}
