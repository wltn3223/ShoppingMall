<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>상품 목록</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
          rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
          crossorigin="anonymous">
</head>
<body>

<%@include file="../../top.jsp"%>
<div class="container">
    <div class="d-block">
        <h1>현재 판매중인 상품</h1>
        <hr>
    </div>
    <div class="row mt-3">
        <c:forEach items="${itemList}" var="itemVO">
            <div class="col-md-2 mb-3">
                <div class="card h-50">
                    <a href="/item/getInfo.do?no=${itemVO.no}">
                        <img class="card-img-top"
                             src="${pageContext.request.contextPath}/resources/img/${itemVO.imgName}"
                             alt="Card image">
                    </a>
                    <div class="card-body">
                        <h5 class="card-title text-truncate">${itemVO.name}</h5>
                        <p class="card-text">${itemVO.price}</p>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
    
    <!-- 페이징 처리 -->
   <div id="pagingDiv">
        <c:if test="${paging.prev}">
            <a href="?pageNum=${paging.startPage - 1}">이전</a>
        </c:if>
        <c:forEach var="num" begin="${paging.startPage}" end="${paging.endPage}">
            &nbsp;<a href="?pageNum=${num}">${num}</a>&nbsp;
        </c:forEach>
        <c:if test="${paging.next}">
            <a href="?pageNum=${paging.endPage + 1}">다음</a>
        </c:if>
    </div>
</div>

<%@include file="../../bottom.jsp"%>
</body>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script type="text/javascript">
    $(document).ready(function(){
        
        //페이지 번호 이동
        $('#pagingDiv a').click(function(e){
            e.preventDefault();
            window.location.href = $(this).attr("href");
        });
        
        //게시글에 pageNum 넘기기 (assuming you have a form with id="pagingFrm")
        $('table a').click(function(e){
            e.preventDefault();
            var html = "<input type='hidden' name='idx' value='"+$(this).attr("href")+"'>";
            $('#pagingFrm').append(html);
            $('#pagingFrm').attr("action","get.do");
            $('#pagingFrm').submit();
        });
    });
</script>
</html>