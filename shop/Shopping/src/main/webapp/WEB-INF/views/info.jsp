<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Member Information</title>
    <!-- Include Bootstrap CSS -->
    <link rel="stylesheet"
        href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
        integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
        crossorigin="anonymous">
</head>
<body>
    <%@include file="top.jsp"%>

    <div class="container mt-4">
        <h2>회원 정보</h2>
        <form action="/member/update.do" method="post" onsubmit="return checkPassword('수정')">
            <div class="form-group">
                <label for="memberId">Member ID:</label>
                <input type="text" class="form-control" id="memberId" value="${memberVO.id}" name ="id" readonly>
            </div>
            <div class="form-group">
                <label for="password">Password:</label>
                <input type="password" name="passwd" class="form-control" id="password" value="${memberVO.passwd}">
            </div>
            <div class="form-group">
                <label for="fullName">이름:</label>
                <input type="text" name="name" class="form-control" id="fullName" value="${memberVO.name}">
            </div>
            <div class="form-group">
                <label for="phoneNumber">전화 번호:</label>
                <input type="text" name="phone" class="form-control" id="phoneNumber" value="${memberVO.phone}">
            </div>
            <div class="form-group">
                <label for="registrationDate">가입일:</label>
                <input type="text" class="form-control" id="registrationDate" value="${memberVO.regDate}" readonly>
            </div>
            <div class="form-group mt-3">
                <button class="btn btn-primary ml-2">수정</button>
                <a class="btn btn-danger ml-2" onclick="checkPassword('탈퇴')">회원탈퇴</a>
                <a class="btn btn-danger ml-2" href="/member/login.do">뒤로가기</a>
            </div>
        </form>
    </div>

    <%@include file="bottom.jsp"%>

    <!-- Include Bootstrap JS and Popper.js -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
        integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
        crossorigin="anonymous"></script>
    <script
        src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
        integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
        crossorigin="anonymous"></script>
    <script
        src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
        integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
        crossorigin="anonymous"></script>
</body>
<script>
    function checkPassword(type) {
        let inputPassWd = prompt('비밀번호를 입력하세요');
        let passwd = "${memberVO.passwd}"; // Added quotes around ${memberVO.passwd}
        let id = "${memberVO.id}";
        if (type === '탈퇴') {

            if (inputPassWd === passwd) {
                alert(type + "가 완료되었습니다.");
                location.replace("/member/delete.do?id=" + id);
            } else {
                alert("비밀번호가 틀렸습니다.");
            }
        } else {
            if (inputPassWd === passwd) {
                alert(type + "이 완료되었습니다.");
                return true;
            } else {
                alert("비밀번호가 틀렸습니다.");
                return false;
            }
        }
    }
</script>
</html>