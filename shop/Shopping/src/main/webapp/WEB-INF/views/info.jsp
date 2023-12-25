<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Member Information</title>
<!-- Include Bootstrap CSS -->

</head>
<body style="position: relative;">
	<%@include file="../../top.jsp"%>
	<ul class="nav flex-column nav" style="position: absolute;">
		<li class="nav-item"><a class="nav-link active"
			aria-current="page"
			href="/item/getMyItemList.do?memberId=${memberVO.id}">내가 판매중인 상품</a>
		</li>
		<li class="nav-item"><a class="nav-link" href="#">내 주문 내역</a></li>
	</ul>
	<div class="container my-4">
		<h2>회원 정보</h2>
			<div class="form-group">
				<label for="memberId">Member ID:</label> <input type="text"
					class="form-control" id="memberId" value="${member.id}" name="id"
					readonly>
			</div>
			<div class="form-group">
				<label for="fullName">이름:</label> <input type="text" name="name"
					class="form-control" id="fullName" value="${member.name}">
			</div>
			<div class="form-group">
				<label for="phoneNumber">전화 번호:</label> <input type="text"
					name="phone" class="form-control" id="phoneNumber"
					value="${member.phone}">
			</div>
			<div class="form-group">
				<label for="registrationDate">가입일:</label> <input type="text"
					class="form-control" id="registrationDate"
					value="${member.regDate}" readonly>
			</div>
			<div class="form-group mt-3">
				<a href="/member/updateForm">
					<button class="btn btn-primary ml-2" type="button">수정</button>
				</a>

				<button class="btn btn-danger ml-2" type="button"
					onclick="deleteMember()">회원탈퇴</button>
				<a class="btn btn-danger ml-2" href="/index.jsp">뒤로가기</a>
			</div>
	</div>

	<%@include file="../../bottom.jsp"%>

</body>

<!-- Include Bootstrap JS and Popper.js -->
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


<style>
.nav {
	top: 250px;
}

.nav>li {
	height: 60px;
	width: 250px;
	font-size: 20px;
	border: 1px solid gray;
	border-collapse: collapse;
	text-align: center;
}
</style>
<script>
	function deleteMember() {
		let passwd = prompt('비밀번호를 입력하세요');
		let id = "${member.id}";

		$.ajax({
			url : "/member",
			type : "DELETE",
			data : JSON.stringify({
				"id" : id,
				"passwd" : passwd
			}),
			dataType : "json",
			contentType : 'application/json',
			success : function(result) {
				if (result === undefined) {
			        // 성공적으로 회원탈퇴된 경우
			        alert("회원탈퇴 성공");
			        location.href = "/index.jsp";
			    } 
			},
			error : function(xhr,status,error) {
				 var errorCode = xhr.responseJSON.errorCode;
			     var errorMessage = xhr.responseJSON.message;
				
			     alert("회원탈퇴:" + errorCode + " - " + errorMessage);
			}
		});

	}
</script>
</html>