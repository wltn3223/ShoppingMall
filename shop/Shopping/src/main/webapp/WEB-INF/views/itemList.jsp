<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@include file="top.jsp" %>
<div class="container">
<div class="d-block"><h1>현재 판매중인 상품</h1><hr></div>
<div class="row mt-3">
			<c:forEach items="${itemList}" var="itemVO" begin="0" end="23">
				<div class="col-md-2 mb-3">
					<!-- Adjusted column size to fit 5 cards per row -->
					<div class="card h-50">
						<!-- Reduced card height -->
						<a href="/item/getInfo.do?no=${itemVO.no}"> <img class="card-img-top"
							src="${pageContext.request.contextPath}/resources/img/${itemVO.imgName}"
							alt="Card image">
						</a>
						<div class="card-body">
							<h5 class="card-title text-truncate">${itemVO.name}</h5>
							<p class="card-text">${itemVO.price}</p>
							<!-- Add more item details as needed -->
						</div>
					</div>
				</div>
				
			</c:forEach>
		</div>

	</div>
 <%@include file="bottom.jsp" %>
</body>
</html>