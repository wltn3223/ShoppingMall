package com.mire.shop.exception;

public class ApiException extends RuntimeException {
	
	private final ExceptionCode exceptionCode;

	public ApiException(ExceptionCode exceptionCode) {
		super(exceptionCode.getMessage());
		this.exceptionCode = exceptionCode;
	}

	public ExceptionCode getExceptionCode() {
		return exceptionCode;
	}
	
	
	
	

}
