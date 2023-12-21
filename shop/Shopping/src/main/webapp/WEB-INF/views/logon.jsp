<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>로그인</title>
  <!-- 부트스트랩 CDN 추가 -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
</head>
<body class="bg-light">
<%@include file="top.jsp" %>
  <div class="container mt-3">

  <!-- Slideshow -->
  <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
    <ol class="carousel-indicators">
      <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
      <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
      <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
    </ol>
    <div class="carousel-inner">
      <div class="carousel-item active">
        <img class="d-block w-100" src="../resources/img/ad1.png" alt="First slide">
      </div>
      <div class="carousel-item">
        <img class="d-block w-100" src="../resources/img/ad1.png" alt="Second slide">
      </div>
      <div class="carousel-item">
        <img class="d-block w-100" src="../resources/img/ad1.png" alt="Third slide">
      </div>
    </div>
    <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
      <span class="carousel-control-prev-icon" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
      <span class="carousel-control-next-icon" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>

</div>
<c:forEach items="${itemList}" var="itemVO">
    ${itemVO.memberId}
    ${itemVO.name}
    ${itemVO.price}
    <img alt="" src="${pageContext.request.contextPath}/resources/img/${itemVO.imgName}" style="width: 50px">
</c:forEach>

  <%@include file="bottom.jsp" %>

  <!-- 부트스트랩 스크립트 추가 -->
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</body>
<script>
  function validateForm() {
    var id = document.getElementsByName("id")[0].value;
    var password = document.getElementsByName("password")[0].value;

    // Check if the values contain only spaces
    if (id.trim() === "" || password.trim() === "") {
      alert("아이디와 비밀번호를 입력하세요.");
      return false; // Prevent form submission
    }

    // If not, the form will be submitted
    return true;
  }
</script>
</html>