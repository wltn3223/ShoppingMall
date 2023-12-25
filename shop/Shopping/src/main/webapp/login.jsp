<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>로그인</title>
  <!-- 부트스트랩 CDN 추가 -->
</head>
<body class="bg-light">
<%@include file="top.jsp" %>
  <div class="container mt-5 login-box">
    <h1 class="text-center">로그인</h1>
    <hr>

      <div class="form-group row justify-content-center align-items-center">
        <label for="id" class="col-sm-2 col-form-label">아이디</label>
        <div class="col-sm-10">
          <input type="text" name="id" id="id" class="form-control" required>
        </div>
      </div>
      <div class="form-group row justify-content-center align-items-center">
        <label for="password" class="col-sm-2 col-form-label">비밀번호</label>
        <div class="col-sm-10">
          <input type="password" name="passwd" id ="passwd" class="form-control" required>
        </div>
      </div>
      <div class="form-group row justify-content-center">
        <div class="col-sm-10 d-flex justify-content-center align-items-end mt-4">
          <input type="button" value="로그인" class="btn btn-primary" onclick="login()">
          <a href="./join.jsp" class="btn btn-success ml-2">회원가입</a>
        </div>
      </div>
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
function login() {
    let id = document.getElementById("id").value;
    let passwd = document.getElementById("passwd").value;

    // Check if the values contain only spaces
    if (id.trim() === "" || passwd.trim() === "") {
        alert("아이디와 비밀번호를 입력하세요.");
        return; // Prevent form submission
    }

    $.ajax({
        url: "/member/login",
        type: "post",
        data: JSON.stringify({
            "id": id,
            "passwd": passwd
        }),
        dataType: "json",
        contentType: 'application/json',
        success: function (data) {
            if (data === "1") {
                location.href = "/index.jsp";
            } else {
                alert("로그인 실패");
            }
        },
        error: function (xhr, status, error) {
            var errorCode = xhr.responseJSON.errorCode;
            var errorMessage = xhr.responseJSON.message;

            alert("로그인실패:" + errorCode + " - " + errorMessage);
        }
    });
}
</script>
</html>