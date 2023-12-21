<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
  <div class="container mt-5 login-box">
    <h1 class="text-center">로그인</h1>
    <hr>

    <form action="/member/login.do" method="post" class="mb-4" onsubmit="return validateForm()">
      <div class="form-group row justify-content-center align-items-center">
        <label for="id" class="col-sm-2 col-form-label">아이디</label>
        <div class="col-sm-10">
          <input type="text" name="id" class="form-control" required>
        </div>
      </div>
      <div class="form-group row justify-content-center align-items-center">
        <label for="password" class="col-sm-2 col-form-label">비밀번호</label>
        <div class="col-sm-10">
          <input type="password" name="passwd" class="form-control" required>
        </div>
      </div>
      <div class="form-group row justify-content-center">
        <div class="col-sm-10 d-flex justify-content-center align-items-end mt-4">
          <input type="submit" value="로그인" class="btn btn-primary">
          <a href="./join.jsp" class="btn btn-success ml-2">회원가입</a>
        </div>
      </div>
    </form>
  </div>
  <%@include file="bottom.jsp" %>

  <!-- 부트스트랩 스크립트 추가 -->
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</body>
<style>
 .login-box {
 		width:70vw;
      margin: auto;
      margin-top: 100px; /* Add top margin to center the login box vertically */

      border: 1px solid #ced4da; /* Lighter border color */
      border-radius: 0.25rem; /* Add a slight border-radius for a softer appearance */
      padding: 20px;
      height: 400px;
    }
</style>
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