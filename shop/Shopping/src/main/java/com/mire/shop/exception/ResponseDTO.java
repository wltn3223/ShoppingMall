package com.mire.shop.exception;

public class ResponseDTO {
	 private int status;
	 private String code;
	 private String message;
	 
	 
	public ResponseDTO(int status, String code, String message) {
		super();
		this.status = status;
		this.code = code;
		this.message = message;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public String getErrorCode() {
		return code;
	}
	public void setErrorCode(String errorCode) {
		this.code = errorCode;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
}
