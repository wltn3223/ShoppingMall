<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Top JSP</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<style>
body {
	background-color: #000;
}

.navbar {
	background-color: #000;
}

.navbar-brand img {
	height: 30px;
}

.navbar-dark .navbar-toggler-icon {
	background-color: #fff;
}
</style>
</head>
<body>

	<!-- Navigation Bar -->
	<nav class="navbar navbar-expand-lg navbar-dark">
		<div class="container">
			<a class="navbar-brand" href="#"> <img
				src="./resources/img/logo.png" alt="Logo"> <span
				style="color: white">미래 마켓</span>
			</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarNav" aria-controls="navbarNav"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse justify-content-end"
				id="navbarNav">
				<ul class="navbar-nav">
				<c:if test="${memberVO eq null}">
						
					<li class="nav-item"><a class="nav-link" href="./login.jsp"
						style="color: white">로그인</a></li>
					<li class="nav-item"><a class="nav-link" href="./join.jsp"
						style="color: white">회원가입</a></li>
					</c:if>
					
					<c:if test="${memberVO ne null}">
						<li class="nav-item"><a class="nav-link" href="#"
							style="color: white"> ${memberVO.id}님 안녕하세요</a></li>
						<li class="nav-item"><a class="nav-link"
							href="/member/getinfo.do?id=${memberVO.id}" style="color: white">내정보</a>
						</li>
						<li class="nav-item"><a class="nav-link"
							href="/member/logout.do">로그아웃</a></li>
					</c:if>


					<!-- Add more navigation items as needed -->
				</ul>
			</div>
		</div>
	</nav>
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<div class="container">
			<div class="collapse navbar-collapse" id="navbarNav">
				<!-- Left-aligned navigation items -->
				<ul class="navbar-nav">
					<li class="nav-item active"><a class="nav-link" href="#">Home<span
							class="sr-only">(current)</span></a></li>
					<li class="nav-item"><a class="nav-link"
						href="/item/getList.do">현재 판매중인 상품</a></li>
					<c:if test="${memberVO ne null}">
						<li class="nav-item"><a class="nav-link"
							href="../ItemInsert.jsp">상품 등록</a></li>
					</c:if>
					<c:if test="${memberVO eq null}">
						<li class="nav-item"><a class="nav-link" href="../loing.jsp">상품
								등록</a></li>
					</c:if>

				</ul>
			</div>
		</div>
	</nav>


	<div class="container mt-3"></div>

</body>
</html>