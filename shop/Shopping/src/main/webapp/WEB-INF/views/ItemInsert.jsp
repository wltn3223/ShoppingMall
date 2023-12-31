<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>아이템 등록 폼</title>
    <!-- 부트스트랩 링크 추가 -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js"
	crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet" crossorigin="anonymous"/>

</head>
<body>
<%@include file="../../top.jsp" %>

<div class="container mt-5">
    <h2>상품 판매</h2>

    <form action="/item/insert.do" method="post" enctype="multipart/form-data">
    	<div class="form-group">
    	<input type="text" name="memberId" value="${memberId}" class="form-control" readonly="readonly"/>
    	</div>
        <div class="form-group">
            <label for="itemName">상품 이름:</label>
            <input type="text" class="form-control" id="itemName" name="name" required>
        </div>

        <div class="form-group">
            <label for="itemPrice">상품 가격:</label>
            <input type="number" class="form-control" id="itemPrice" name="price" required>
        </div>

        <div class="form-group">
            <label for="type">상품 종류:</label>
            <select class="form-control" id="itemType" name="type" required>
                <option value="electronic">전자제품</option>
                <option value="clothing">의류</option>
                <option value="food">식품</option>
            </select>
        </div>

        <div class="form-group">
            <label for="itemDescription">상품 설명:</label>
            <textarea class="form-control" id="itemDescription" name="detail" rows="4" required></textarea>
        </div>

        <div class="form-group">
            <label for="itemImage">상품 이미지 업로드:</label>
            <input type="file" class="form-control-file" id="itemImage" name="file" accept="image/*">
        </div>

        <button type="submit" class="btn btn-primary">등록</button>
    </form>
</div>
<%@include file="../../bottom.jsp" %>



</body>
</html>