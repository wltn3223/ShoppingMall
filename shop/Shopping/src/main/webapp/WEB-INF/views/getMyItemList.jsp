<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내가 판매중인 아이템 목록</title>
</head>
<body>
	<%@include file="top.jsp"%>
	<div class="container mt-3">
		<div class="d-block">
			<h1>내가 판매중인 상품</h1>
			<hr>
		</div>
		<table class="table">
			<thead>
				<tr>
					<th scope="col">상품번호</th>
					<th scope="col">상품이미지</th>
					<th scope="col">상품이름</th>
					<th scope="col">가격</th>
					<th scope="col">등록일</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${itemList}" var="itemVO">
					<tr>

						<td>${itemVO.no}</td>
						<td><a href="/item/getInfo.do?no=${itemVO.no}"> <img
								src="${pageContext.request.contextPath}/resources/img/${itemVO.imgName}"
								alt="Card image" style="height: 50px">
						</a></td>
						<td><a href="/item/getInfo.do?no=${itemVO.no}"
							style="color: black;"> ${itemVO.name}</a></td>
						<td>${itemVO.price}</td>
						<td>${itemVO.regdate}</td>

						<td class="action-buttons">
							<a href="#"><button>수정</button></a>
							<a href="/item/deleteItem.do?no=${itemVO.no}&memberId=${itemVO.memberId}&imgName=${itemVO.imgName}"><button>삭제</button></a>
						</td>

					</tr>
				</c:forEach>
		</table>


	</div>
	<%@include file="bottom.jsp"%>

</body>
    <style>
        .action-buttons {
            display: flex;
            flex-direction: column;
        }

        .action-buttons button {
            background-color: white;
            border: 1px solid black;
            padding: 5px 10px;
            margin-bottom: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .action-buttons button:hover {
            background-color: #e0e0e0; /* Change this to the desired hover color */
        }
        </style>
        <script>
        
        
        </script>
</html>