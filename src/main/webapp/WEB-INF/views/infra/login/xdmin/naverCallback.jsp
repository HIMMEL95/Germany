<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="rb" uri="http://www.springframework.org/tags" %>

<!doctype html>
<html lang="ko">
<head>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
</head>
<body>

	<form id="myForm" name="myForm">
	    <input type="hidden" name="name">
	    <input type="hidden" name="id">
	    <input type="hidden" name="email">
	    <input type="hidden" name="dob">
	    <input type="hidden" name="gender">
	    <input type="hidden" name="phone">
	</form>
	
	<script type="text/javascript">
	
		var naver_id_login = new naver_id_login("z69jjnmkMQ88W2owra4t", "http://localhost:8080/member/naverCallback");
		// 접근 토큰 값 출력
		// 네이버 사용자 프로필 조회
		naver_id_login.get_naver_userprofile("naverSignInCallback()");
	  	// 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
	  	function naverSignInCallback() {
	  		/* alert(naver_id_login.getProfileData("name"));
	  		alert(naver_id_login.getProfileData("nickname")); */
		    
		    $("input[name=name]").val(naver_id_login.getProfileData('name'));
		    $("input[name=id]").val(naver_id_login.getProfileData('id'));
		    $("input[name=email]").val(naver_id_login.getProfileData('email'));
		    $("input[name=dob]").val(naver_id_login.getProfileData('birthday'));
		    $("input[name=gender]").val(naver_id_login.getProfileData('gender'));
		    $("input[name=phone]").val(naver_id_login.getProfileData('mobile'));
		    
		    /* console.log($("input[name=name]").val());
		    console.log($("input[name=id]").val());
		    console.log($("input[name=email]").val());
		    console.log($("input[name=dob]").val());
		    console.log($("input[name=gender]").val());
		    console.log($("input[name=phone]").val()); */
	  	}
	  	$("#myForm").attr("action", "/member/naverLoginProc").submit();
		
	  	/* var naverLogin = new naver.LoginWithNaverId(
				{
					clientId: "z69jjnmkMQ88W2owra4t", //내 애플리케이션 정보에 cliendId를 입력해줍니다.
					callbackUrl: "http://localhost:8080/callback", // 내 애플리케이션 API설정의 Callback URL 을 입력해줍니다.
					isPopup: false,
					callbackHandle: true
				}
			);	
	
		naverLogin.init();
	
		window.addEventListener('load', function () {
			naverLogin.getLoginStatus(function (status) {
				if (status) {
					var email = naverLogin.user.getEmail(); // 필수로 설정할것을 받아와 아래처럼 조건문을 줍니다.
		    		
					alert(naverLogin.user); 
		    		
		            if( email == undefined || email == null) {
						alert("이메일은 필수정보입니다. 정보제공을 동의해주세요.");
						naverLogin.reprompt();
						return;
					}
				} else {
					console.log("callback 처리에 실패하였습니다.");
				}
			});
		}); */
	</script>
</body>
</html>
