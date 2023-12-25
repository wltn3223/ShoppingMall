<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>로그인</title>
    <!-- 부트스트랩 CDN 추가 -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" 
integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
</head>
<body class="bg-light">
    <%@include file="top.jsp"%>
    <div class="container mt-3">
        <!-- Your existing code here -->

        <div class="row mt-3">
        </div>

        <%@include file="bottom.jsp"%>

        <!-- 부트스트랩 스크립트 추가 -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    </div>

    <script>
    $(document).ready(function(){
        $.ajax({
            url: "/item/getList.do",
            type: "GET",
            dataType: "json",
            success: function(data) {
                // Assuming data is an array of items
                for (var i = 0; i < 24; i++) {
                    var itemVO = data[i];
                    // Append the card layout for each item to the row
                    $(".row").append(
                        '<div class="col-md-2 mb-3">' +
                            '<div class="card h-50">' +
                                '<img class="card-img-top" src="' + "${pageContext.request.contextPath}/resources/img/" +
                                    itemVO.imgName + '" alt="Card image">' +
                                '<div class="card-body">' +
                                    '<h5 class="card-title text-truncate">' + 
                                        itemVO.name + '</h5>' +
                                    '<p class="card-text">' + 
                                        itemVO.price + '</p>' +
                                '</div>' +
                            '</div>' +
                        '</div>'
                    );
                }
            },
            error: function(xhr, status, error) {
                console.error("Error fetching data: " + error);
            }
        });
    });
    </script>

</body>
</html>