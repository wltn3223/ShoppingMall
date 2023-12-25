package com.mire.shop.exception;

import org.springframework.http.HttpStatus;

public enum ExceptionCode {
	MEMBER_NOT_FOUND(HttpStatus.NOT_FOUND,"member-001","���� ȸ���Դϴ�."),
	MEMBER_PASSWD_NOT_FOUND(HttpStatus.BAD_REQUEST,"member-002","�߸��� ��й�ȣ �Դϴ�."),
	MEMBER_ID_DUPLICATE(HttpStatus.BAD_REQUEST,"member-003","�ߺ��� ���̵��Դϴ�.");

    private final HttpStatus status;
    private final String errorCode;
    private final String message;

	
	ExceptionCode(HttpStatus status, String errorCode, String message) {
	this.status = status;
	this.errorCode = errorCode;
	this.message = message;
	
	}


	public HttpStatus getStatus() {
		return status;
	}


	public String getErrorCode() {
		return errorCode;
	}


	public String getMessage() {
		return message;
	}	
}
