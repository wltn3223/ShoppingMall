<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>회원가입 폼</title>
  <!-- 부트스트랩 CDN 추가 -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbs5nQXaTozP7zrBIBJo3NLaRfjPmUATK7IpxebXl5K9c83Lp1DE5T5stwEAg4HQ" crossorigin="anonymous">
  <!-- 사용자 정의 스타일 시트 -->
</head>
<body>
<%@include file="top.jsp" %>

<div class="container">
  <h2 class="mb-4">회원가입</h2>
  <!-- 회원가입 폼 -->
  <form id="signupForm" action="/member/insert.do" method="post" onsubmit="validateForm()">
    <div class="mb-3">
      <label for="id" class="form-label">ID</label>
      <input type="text" class="form-control" id="id" name="id" required>
    </div>
    <div class="mb-3">
      <label for="passwd" class="form-label">비밀번호</label>
      <input type="password" class="form-control" id="passwd" name="passwd" required>
    </div>
    <div class="mb-3">
      <label for="name" class="form-label">이름</label>
      <input type="text" class="form-control" id="name" name="name" required>
    </div>
    <div class="mb-3">
      <label for="phone" class="form-label">전화번호</label>
      <input type="tel" class="form-control" id="phone" name="phone" required>
    </div>
    <button type="submit" class="btn btn-primary">가입하기</button>
  </form>
</div>

<%@include file="bottom.jsp" %>

</body>

<!-- 부트스트랩 및 팝퍼 및 제이쿼리 스크립트 추가 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-eVQlVOk68/j6ZOck8pLwS/Y9iS8PCe+fYUqN7e5vtxI1aL/AgwX+rqgI6HC3/Q1" crossorigin="anonymous"></script>
<!-- 사용자 정의 스크립트 -->
<script>
  // 폼 제출 이벤트 핸들러
  function validateForm() {
    // 각 입력 필드의 값을 가져오기
    var idValue = document.getElementById('id').value;
    var passwdValue = document.getElementById('passwd').value;
    var nameValue = document.getElementById('name').value;
    var phoneValue = document.getElementById('phone').value;

    // 만약 어떤 입력 필드라도 공백이라면 제출을 중단하고 경고창을 띄움
    if (idValue.trim() === '' || passwdValue.trim() === '' || nameValue.trim() === '' || phoneValue.trim() === '') {
      alert('입력 필드를 모두 채워주세요.');
      return false; // Prevent form submission
    }
    alert('회원가입이 완료되었습니다.');
    return true; // Allow form submission
  }
</script>
</html>