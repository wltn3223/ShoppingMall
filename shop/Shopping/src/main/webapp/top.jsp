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
<style>
body {
	background-color: #000;
}

.navbar {
	background-color: #000;
}

.navbar-brand img {
	height: 30px; /* Adjust the height as needed */
}

.navbar-dark .navbar-toggler-icon {
	background-color: #fff;
}

.navbar-nav {
	margin-left: auto; /* Move the navigation items to the right */
}

.navbar-nav .nav-item {
	margin-left: 10px; /* Adjust the spacing between navigation items */
}
</style>
</head>
<body>

	<!-- Navigation Bar -->
	<nav class="navbar navbar-expand-lg navbar-dark">
		<div class="container">
			<a class="navbar-brand" href="#"> <img src="/resources/img/logo.png" alt="Logo"> <span
				style="color: white">미래 마켓</span>
			</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarNav" aria-controls="navbarNav"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarNav">
				<ul class="navbar-nav">
					<c:if test="${memberId ne null}">
						<li class="nav-item"><a class="nav-link" href="#"
							style="color: white"> ${memberId}님 안녕하세요</a></li>
						<li class="nav-item"><a class="nav-link"
							href="/member/${memberId}" style="color: white">내정보</a>
						</li>
						<li class="nav-item" style="color: white"><a onclick="logout()" class="nav-link">
						로그아웃</a></li>
					</c:if>
					<c:if test="${memberId eq null}">
						<li class="nav-item"><a class="nav-link" href="../login.jsp"
							style="color: white"> 로그인</a></li>
						<li class="nav-item"><a class="nav-link" href="../join.jsp"
							style="color: white">회원가입</a></li>
					</c:if>

				</ul>
			</div>
		</div>
	</nav>
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<div class="container">
			<!-- Added container class -->
			<div class="collapse navbar-collapse" id="navbarNav">
				<!-- Left-aligned navigation items -->
				<ul class="navbar-nav">
					<li class="nav-item active"><a class="nav-link" href="/index.jsp">Home<span
							class="sr-only"></span></a></li>
					<li class="nav-item"><a class="nav-link"
						href="/item/getList.do?num=1">현재 판매중인 상품</a></li>
					<c:if test="${memberId ne null}">
						<li class="nav-item"><a class="nav-link"
							href="/item/insert.do">상품 등록</a></li>
					</c:if>
					<c:if test="${memberId eq null}">
						<li class="nav-item"><a class="nav-link" href="../login.jsp">상품
								등록</a></li>
					</c:if>

				</ul>
			</div>
		</div>
	</nav>


	<div class="search-box justify-content-center d-flex my-3">
		<form class="form-inline">
			<div class="form-group m-0">
				<input class="form-control mr-2" type="search" placeholder="Search"
					aria-label="Search" style="width: 600px;">
			</div>
			<div class="form-group search-options m-0">
				<select class="form-control" id="searchType">
					<option value="content">제목</option>
					<option value="title">내용</option>
				</select>
			</div>
			<button class="btn btn-outline-success my-2 my-sm-0" type="submit">검색</button>
		</form>
	</div>


</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" 
integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

<script>
function logout() {
    $.ajax({
        url: "/member/logout",
        type: "post",
        success: function (result) {
            if (result.trim() === "1") {
                location.href = "index.jsp";
            } else {
                alert("로그아웃 실패");
            }
        },
        error: function () {
            alert("로그아웃 에러 발생");
        }
    });
}

</script>
</html>