<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회원가입 폼</title>
<!-- 부트스트랩 CDN 추가 -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet" crossorigin="anonymous">

<script src="https://code.jquery.com/jquery-3.5.1.min.js"
	crossorigin="anonymous"></script>
<!-- 사용자 정의 스타일 시트 -->
</head>
<body>
	<%@include file="top.jsp"%>

	<div class="container">
		<h2 class="mb-4">회원가입</h2>
		<!-- 회원가입 폼 -->
		<form id="signupForm">
			<div class="mb-3">
				<label for="id" class="form-label">ID</label> <input type="text"
					class="form-control" id="id" name="id" required>
				<div id="checkId"></div>
				<button class="btn btn-light" type="button" onclick="checkId()">아이디
					중복체크</button>
			</div>
			<div class="mb-3">
				<label for="passwd" class="form-label">비밀번호</label> <input
					type="password" class="form-control" id="passwd" name="passwd"
					required>
			</div>
			<div class="mb-3">
				<label for="name" class="form-label">이름</label> <input type="text"
					class="form-control" id="name" name="name" required>
			</div>
			<div class="mb-3">
				<label for="phone" class="form-label">전화번호</label> <input type="tel"
					class="form-control" id="phone" name="phone" required>
			</div>
			<button type="button" onclick="join()" class="btn btn-primary">가입하기</button>
		</form>
	</div>

	<%@include file="bottom.jsp"%>

</body>

<!-- 부트스트랩 및 팝퍼 및 제이쿼리 스크립트 추가 -->
<!-- 사용자 정의 스크립트 -->
<script>

function checkId() {
    let memberId = $('#id').val(); // id에 입력되는값
    if (memberId === '') {
        alert("id에 아무것도 입력하지 않으셨습니다.");
        return;
    }

    $.ajax({
        url: "/member/login-check.do",
        type: "get",
        data: {"memberId": memberId},
        dataType: 'json',
        success: function (result) {
            var checkIdElement = $("#checkId");
            if (result === 0) {
            	alert('사용할 수 있는 id입니다.');
            } else {
            	alert('사용할 수 없는 id입니다.');
            }
        },
        error: function () {
            alert("서버 요청 실패");
        }
    });
}




  // 폼 제출 이벤트 핸들러
 function join() {
    // 각 입력 필드의 값을 가져오기
    let data = {
        id: $('#id').val(),
        passwd: $('#passwd').val(), // Corrected selector
        name: $('#name').val(),
        phone: $('#phone').val()
    };

    $.ajax({
        url: "/member/insert.do",
        type: "post",
        data: JSON.stringify(data),
        dataType: "json",
        contentType: 'application/json',
        success: function (result) {
            if (result === "1") {
                alert("회원가입 성공");
            } else {
                alert("회원가입 실패");
            }
        },
        error: function () {
            alert("회원가입 에러 발생");
        }
    });
}
  
</script>
</html>