<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Product Details</title>
    <link rel="stylesheet"
        href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
</head>
<body>
    <%@include file="top.jsp"%>
    <div class="container">
        <div class="mb-5 mx-3 d-flex justify-content-start">
            <div class="col-md-6" style="height: 600px; display: flex; align-items: center;">
                <img src="${pageContext.request.contextPath}/resources/img/${itemVO.imgName}" alt="Product image" style="height: 100%; display: inline-block; margin: auto;">
            </div>
            <div class="col-md-6" style="height: 600px; display: flex; align-items: center; flex-direction: column;">
                <h3>${itemVO.name}</h3>
                <p><strong>가격:</strong> ${itemVO.price}</p>
                <p><strong>갯수</strong> <button type="button" onclick="count('plus')" class="mx-2">+</button><span id="result">1</span><button type="button" onclick="count('minus')" class="mx-3">-</button></p>
                <p><strong>종류:</strong> ${itemVO.type}</p>
                <p><strong>설명:</strong> ${itemVO.detail}</p>
                
                <div class="mt-3">
                    <button type="button" class="btn btn-primary mr-2">주문하기</button>
                    <button type="button" class="btn btn-success">장바구니에 담기</button>
                </div>
            </div>
        </div>
    </div>
    <%@include file="bottom.jsp"%>
</body>
<script type="text/javascript">
function count(type)  {
	  // 결과를 표시할 element
	  const resultElement = document.getElementById('result');
	  
	  // 현재 화면에 표시된 값
	  let number = resultElement.innerText;
	  
	  // 더하기/빼기
	  if(type === 'plus') {
	    number = parseInt(number) + 1;
	  }else if(type === 'minus' && number >1)  {
	    number = parseInt(number) - 1;
	  }
	  
	  // 결과 출력
	  resultElement.innerText = number;
	}</script>
</html>