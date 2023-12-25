<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회원가입 폼</title>
<!-- 부트스트랩 CDN 추가 -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
	integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
	crossorigin="anonymous"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
	integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
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
	let idCheckDone = false;

	function checkId() {
	    var memberId = $('#id').val();

	    if (memberId === '') {
	        alert("ID를 입력하세요.");
	        return;
	    }

	    $.ajax({
	        url: "/member/login-check",
	        type: "get",
	        data: {
	            memberId: memberId
	        },
	        dataType: 'json',
	        success: function (result) {
	        	if (result === "1") {
	        		idCheckDone = true;
			        alert("사용 가능한 id입니다");
			    } else{
			    	idCheckDone = false;
			    	alert("사용할 수 없는 아이디입니다.");
			    }
	        },
	        error: function (xhr, status, error) {
	        	idCheckDone = false;
	            handleError(xhr);
	        }
	    });
	}



	function handleError(xhr) {
	    if (xhr.responseJSON) {
	        var errorMessage = xhr.responseJSON.message;
	        alert("회원가입:" + errorMessage);
	    } else {
	        console.error('An unexpected error occurred:', xhr);
	    }
	}

	function join() {
		// Check if ID check has been performed
		if (!idCheckDone) {
			alert("ID 중복 체크를 먼저 진행해주세요.");
			return;
		}

		// Proceed with registration logic
		let data = {
			id : $('#id').val(),
			passwd : $('#passwd').val(),
			name : $('#name').val(),
			phone : $('#phone').val()
		};

		$.ajax({
			url : "/member/join",
			type : "post",
			data : JSON.stringify(data),
			dataType : "json",
			contentType : 'application/json',
			success : function(result) {
				if (result === "1") {
			        // 성공적으로 회원가입된 경우
			        alert("회원가입 성공");
			        location.href = "/index.jsp";
			    } else{
			    	alert("회원가입 실패");
			    }
			},
			error : function(xhr,status,error) {
				 var errorCode = xhr.responseJSON.errorCode;
			     var errorMessage = xhr.responseJSON.message;
				
			     alert("회원가입:" + errorCode + " - " + errorMessage);
			}
		});
	}
</script>
</html>