<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<c:forEach items="${itemList}" var="itemVO">
    ${itemVO.name}
    ${itemVO.price}
    <img alt="" src="${pageContext.request.contextPath}/resources/img/${itemVO.imgName}" style="width: 50px">
</c:forEach>

</body>
</html>