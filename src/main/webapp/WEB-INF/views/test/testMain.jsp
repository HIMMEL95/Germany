<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="rb" uri="http://www.springframework.org/tags" %>

<!doctype html>
<html lang="ko">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>SPOPIA : 로그인</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
    <link href="/resources/css/user/login.css" rel="stylesheet" type="text/css">
</head>

<body>
    <div id="wrap" class="wrap">
        <div id="container" class="container">
            <!-- content -->
            <div class="content text-center">
            	<h1>로그인 성공!!!</h1>
            </div>
        </div>

    </div>
    <script src="https://code.jquery.com/jquery-3.6.0.js" crossorigin="anonymous"></script>
    <script src="https://kit.fontawesome.com/15c84217dd.js" crossorigin="anonymous"></script>
    <script type="text/javascript">
    
    	$("#loginBtn").on("click", function() {
    		var id = $("#id").val();
			var pwd = $("#pwd").val();
			
			$.ajax({
				async: true
				,cache: false
				,type:"POST"
				,url: "loginCheck"
				,data: {"id": id, "pwd": pwd}
				,success : function(response) {
					if (response.rt == "fail") {
						alert("아이디와 비밀번호를 다시 확인 후 시도해 주세요.");
						return false;
					} else {
						window.location.href = "/main";
					}
				},
				error : function(jqXHR, status, error) {
					alert("알 수 없는 에러 [ " + error + " ]");
				}
			});
		});

    </script>
</body>

</html>