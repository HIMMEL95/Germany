<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="rb" uri="http://www.springframework.org/tags" %>

<!doctype html>
<html lang="ko">
<head>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
</head>
<body>

	<input type="hidden" name="naverId" value="">
    <input type="hidden" name="name" value="">
    <input type="hidden" name="nickName" value="">
	<input type="hidden" name="profileImg" value="">
    <input type="hidden" name="email" value="">
    <input type="hidden" name="dob" value="">
	<input type="hidden" name="age" value="">
    <input type="hidden" name="gender" value="">
    <input type="hidden" name="birthyear" value="">
    <input type="hidden" name="mobile" value="">
	
	<script type="text/javascript">
	
		var naverLogin = new naver.LoginWithNaverId(
	        {
	            clientId: "uzhH9KK0z5vHprqIybHE", // 내꺼
	            callbackUrl: "http://localhost:8080/callback",
	            /* callback 페이지가 분리되었을 경우에 callback 페이지에서는 callback처리를 해줄수 있도록 설정합니다. */
	        }
	    );

	    /* (3) 네아로 로그인 정보를 초기화하기 위하여 init을 호출 */
		naverLogin.init();

	    /* (4) Callback의 처리. 정상적으로 Callback 처리가 완료될 경우 main page로 redirect(또는 Popup close) */
        naverLogin.getLoginStatus(function (status) {
	      if (status) {
	    	  alert("adsad");
	          const nickName=naverLogin.user.getNickName();
	          const age=naverLogin.user.getAge();
	          const birthday=naverLogin.user.getBirthday();
	          
	          alert(nickName)
	          alert(age)
	          alert(birthday)
	
	        //닉네임을 선택하지 않으면 선택창으로 돌아갑니다.
	          if(nickName===null||nickName===undefined ){ 
	            alert("별명이 필요합니다. 정보제공을 동의해주세요.");
	            naverLogin.reprompt(); 
	            return ;  
	         }else{
	          setLoginStatus(); //모든 필수 정보 제공 동의하면 실행하는 함수
	         }
	      }
	    });

		/* alert("1");
		var naver_id_login = new naver_id_login("uzhH9KK0z5vHprqIybHE", "http://localhost:8080/callback");
		// 접근 토큰 값 출력
		alert("2");
		
		window.addEventListener('load', function() {
			alert("asdnlnl");
			naver_id_login.getState(function(status) {
				alert(status)
				if (status) {
					// 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
				  	function naverSignInCallback() {
				  		
				  		alert(naver_id_login.getProfileData("name"));
				  		alert(naver_id_login.getProfileData("nickname"));
					    
					    $("input[name=naverId]").val(naver_id_login.getProfileData('id'));
					    $("input[name=name]").val(naver_id_login.getProfileData('name'));
					    $("input[name=nickName]").val(naver_id_login.getProfileData('nickname'));
					    $("input[name=profileImg]").val(naver_id_login.getProfileData('profile_image'));
					    $("input[name=email]").val(naver_id_login.getProfileData('email'));
					    $("input[name=dob]").val(naver_id_login.getProfileData('birthday'));
					    $("input[name=age]").val(naver_id_login.getProfileData('age'));
					    $("input[name=gender]").val(naver_id_login.getProfileData('gender'));
					    $("input[name=birthyear]").val(naver_id_login.getProfileData('birthyear'));
					    $("input[name=mobile]").val(naver_id_login.getProfileData('mobile'));
				  	}
					// 네이버 사용자 프로필 조회
					naver_id_login.get_naver_userprofile("naverSignInCallback()");
				}
			})
		}) */
	
		/* alert("1");
		naver_id_login = new naver_id_login("uzhH9KK0z5vHprqIybHE", "http://localhost:8080/callback");
		// 접근 토큰 값 출력
		alert("2");
		naver_id_login.init_naver_id_login();
		
		window.addEventListener('load', function() {
			alert("3");
		  	// 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
		  	function naverSignInCallback() {
		  		
		  		alert(naver_id_login.getProfileData("name"));
		  		alert(naver_id_login.getProfileData("nickname"));
			    
			    $("input[name=naverId]").val(naver_id_login.getProfileData('id'));
			    $("input[name=name]").val(naver_id_login.getProfileData('name'));
			    $("input[name=nickName]").val(naver_id_login.getProfileData('nickname'));
			    $("input[name=profileImg]").val(naver_id_login.getProfileData('profile_image'));
			    $("input[name=email]").val(naver_id_login.getProfileData('email'));
			    $("input[name=dob]").val(naver_id_login.getProfileData('birthday'));
			    $("input[name=age]").val(naver_id_login.getProfileData('age'));
			    $("input[name=gender]").val(naver_id_login.getProfileData('gender'));
			    $("input[name=birthyear]").val(naver_id_login.getProfileData('birthyear'));
			    $("input[name=mobile]").val(naver_id_login.getProfileData('mobile'));
		  	}
			// 네이버 사용자 프로필 조회
			naver_id_login.get_naver_userprofile("naverSignInCallback()");
		}) */
	
	/* alert("1");
	naver_id_login = new naver_id_login("uzhH9KK0z5vHprqIybHE", "http://localhost:8080/callback");
	// 접근 토큰 값 출력
alert("2");
	// 네이버 사용자 프로필 조회
	naver_id_login.get_naver_userprofile("naverSignInCallback()");
alert("3");
  	// 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
  	function naverSignInCallback() {
  		
  		alert(naver_id_login.getProfileData("name"));
  		alert(naver_id_login.getProfileData("nickname"));
	    
	    $("input[name=naverId]").val(naver_id_login.getProfileData('id'));
	    $("input[name=name]").val(naver_id_login.getProfileData('name'));
	    $("input[name=nickName]").val(naver_id_login.getProfileData('nickname'));
	    $("input[name=profileImg]").val(naver_id_login.getProfileData('profile_image'));
	    $("input[name=email]").val(naver_id_login.getProfileData('email'));
	    $("input[name=dob]").val(naver_id_login.getProfileData('birthday'));
	    $("input[name=age]").val(naver_id_login.getProfileData('age'));
	    $("input[name=gender]").val(naver_id_login.getProfileData('gender'));
	    $("input[name=birthyear]").val(naver_id_login.getProfileData('birthyear'));
	    $("input[name=mobile]").val(naver_id_login.getProfileData('mobile'));
  	}
	
	alert("4"); */
	
	</script>
</body>
</html>
