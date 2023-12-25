package com.mire.shop.exception;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

@RestControllerAdvice
public class AllExceptionHandler {
	
	@ExceptionHandler({ApiException.class})
	public ResponseEntity<ResponseDTO> handleApiException(ApiException e){
		ExceptionCode exceptionCode = e.getExceptionCode();
		
		ResponseDTO response = new ResponseDTO(
				exceptionCode.getStatus().value(), 
				exceptionCode.getErrorCode(), 
				exceptionCode.getMessage()
				);
		
		
		return ResponseEntity.status(exceptionCode.getStatus()).body(response);
		
		
	}
	
}
