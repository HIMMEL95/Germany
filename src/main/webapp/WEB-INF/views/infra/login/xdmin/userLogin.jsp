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
    <link rel="shortcut icon" href="https://cdn-icons-png.flaticon.com/512/6646/6646786.png" type="image/x-icon">
    <meta property="og:type" content="website">
    <meta property="og:title" content="[네이버: 로그인]">
    <meta property="og:description" content="안전한 로그인을 위해 주소창의 URL과 자물쇠 마크를 확인하세요!">
    <meta property="og:image" content="https://ssl.pstatic.net/sstatic/search/common/og_v3.png">
    <meta property="og:image:type" content="image/png">
    <!-- google login s -->
    <meta name="google-signin-client_id" content="402814991050-lmirn43sog26rhj93ekee2h31dlvlncu.apps.googleusercontent.com">
    <!-- google login e -->
    <title>SPOPIA : 로그인</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
    <link href="/resources/css/user/login.css" rel="stylesheet" type="text/css">
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
</head>

<body>
    <div id="wrap" class="wrap">
        <div id="container" class="container">
            <div class="header_inner text-center pt-5 mt-5" style="height: 200px;">
                <a href="/" class="logo">
                    <img src="/resources/images/SPOPIA1.png" style="width: 150px;">
                </a>
            </div>
            <!-- content -->
            <div class="content">
                <div class="login_wrap">
                    <ul class="menu_wrap" role="tablist">
                        <li class="menu_item" role="presentation">
                            <!--[주] 탭메뉴 활성화시(=선택시) "on"을 추가해주세요. 접근성: aria-selected는 탭 선택시 true, 미선택시 false로 적용-->
                            <!--[주:접근성] 탭메뉴의 id 값과 탭내용의 aria-controls를 연결하고 있습니다. -->
                            <a href="/userLogin" id="loinid" class="menu_id on" role="tab" aria-selected="true">
                                <span class="menu_text"><span class="text">ID 로그인</span></span>
                            </a>
                        </li>
                    </ul>
                    <form id="frmNIDLogin" name="frmNIDLogin" target="_top" autocomplete="off" method="POST">
                        <ul class="panel_wrap">
                            <li class="panel_item" style="display: block;">
                                <div class="panel_inner" role="tabpanel" aria-controls="loinid">
                                    <div class="id_pw_wrap">
                                        <div class="input_row" id="id_line">
                                            <div class="icon_cell" id="id_cell">
                                                <span class="icon_id">
                                                    <span class="blind">아이디</span>
                                                </span>
                                            </div>
                                            <input type="text" id="id" name="id" placeholder="아이디" title="아이디"
                                                class="input_text" maxlength="41" value="himmel">
                                            <span role="button" class="btn_delete" id="id_clear" style="display: none;">
                                                <span class="icon_delete">
                                                    <span class="blind">삭제</span>
                                                </span>
                                            </span>
                                        </div>
                                        <div class="input_row" id="pw_line">
                                            <div class="icon_cell" id="pw_cell">
                                                <span class="icon_pw">
                                                    <span class="blind">비밀번호</span>
                                                </span>
                                            </div>
                                            <input type="password" id="pwd" name="pwd" placeholder="비밀번호" title="비밀번호"
                                                class="input_text" maxlength="16" value="123456789">
                                            <span role="button" class="btn_delete" id="pw_clear" style="display: none;">
                                                <span class="icon_delete">
                                                    <span class="blind">삭제</span>
                                                </span>
                                            </span>
                                        </div>
                                    </div>
                                    <div class="login_keep_wrap" id="login_keep_wrap">
                                        <div class="keep_check">
                                            <div class="form-check" style="margin-left: -20px;">
											  	<input class="form-check-input" type="checkbox" value="" id="flexCheckIndeterminate">
											  	<label class="form-check-label" for="flexCheckIndeterminate" style="color: #777777;">
												    로그인 상태 유지
											  	</label>
											</div>
                                        </div>
                                        <div class="ip_check">
                                            <span class="switch">
                                                <div class="form-check form-switch form-check-reverse keep_check mt-2">
													<input class="form-check-input" type="checkbox" id="flexSwitchCheckReverse">
												  	<label class="form-check-label keep_text" for="flexSwitchCheckReverse" style="display: inline-block; width: 70px;">IP보안</label>
												</div>
                                            </span>
                                        </div>
                                    </div>

                                    <div class="login_error_wrap" id="err_capslock" style="display: none;">
                                        <div class="error_message">
                                            <strong>CapsLock</strong>이 켜져 있습니다.
                                        </div>
                                    </div>

                                    <div class="login_error_wrap" id="err_empty_id" style="display: none;">
                                        <div class="error_message">
                                            <strong>아이디</strong>를 입력해 주세요.
                                        </div>
                                    </div>

                                    <div class="login_error_wrap" id="err_empty_pw" style="display: none;">
                                        <div class="error_message">
                                            <strong>비밀번호</strong>를 입력해 주세요.
                                        </div>
                                    </div>
                                    <div class="btn_login_wrap text-center">
                                        <button type="button" class="btn_login" id="loginBtn" href="/sportMain">
                                            <span class="btn_text">로그인</span>
                                        </button>
                                        <div class="btn_login_wrap">
                                            <button type="button" class="btn_login" id="kakaoBtn" style="background-color: #fceb00;">
                                                <span class="btn_text text-black">
                                                	<img src="/resources/images/user/kakao.png" style="width: 25px;" class="me-3">
                                               			카카오 로그인
                                           		</span>
                                            </button>
                                        </div>
                                        <!-- <div class="btn_login_wrap">
											<div id="naverIdLogin"></div>
                                        </div> -->
                                        <div class="a col-3 btn_login_wrap">
											<button class='btn btn-success' type="button" name="naverIdLogin" id="naverIdLogin" onclick="naverLogic()">네이버 로그인</button>
										</div>
                                        <!-- <div class="btn_login_wrap">
                                        	<div id="my-signin2"></div>
	                                        <div class="g-signin2" data-onsuccess="onSignIn"></div>
                                        </div> -->
                                        <!-- <div class="btn_login_wrap">
                                            <button type="button" class="btn_login" id="log.login"
                                                style="background-color: #304e9c;">
                                                <span class="btn_text">
                                                	<i class="fa-brands fa-square-facebook text-white pe-3 fa-lg"></i>
                                                			페이스북 로그인
                                                </span>
                                            </button>
                                        </div> -->
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </form>
                </div>
                <ul class="find_wrap" id="find_wrap">
                    <li><a target="_self" href="/findId" class="find_text">아이디 및 비밀번호 찾기</a></li>
                    <li><a target="_self" href="/signUp" class="find_text">회원가입</a></li>
                </ul>
            </div>
        </div>
        <form name="form">
			<input type="hidden" name="gender"/>
			<input type="hidden" name="naver"/>
		</form>

        <!-- footer -->
        <div class="footer">
            <div class="footer_inner">
                <!--[주]고객센터,제휴문의,서비스안내-->
                <ul class="footer_link" id="footer_link">
                    <li><a target="_blank" class="footer_item" href="http://www.naver.com/rules/service.html"
                            id="fot.agreement"><span class="text">이용약관</span></a></li>
                    <li><a target="_blank" class="footer_item" href="http://www.naver.com/rules/privacy.html"
                            id="fot.privacy"><span class="text"><strong>개인정보처리방침</strong></span></a></li>
                    <li><a target="_blank" class="footer_item" href="http://www.naver.com/rules/disclaimer.html"
                            id="fot.disclaimer"><span class="text">책임의 한계와 법적고지</span></a></li>
                    <li><a target="_blank" class="footer_item"
                            href="https://help.naver.com/support/service/main.nhn?serviceNo=532" id="fot.help"><span
                                class="text">회원정보 고객센터</span></a></li>
                </ul>
                <div class="footer_copy">
                    <a id="fot.naver" target="_blank" href="https://www.navercorp.com">
                        <img src="/resources/images/SPOPIA1.png" alt="logo" style="width: 45px;">
                    </a>
                    <span class="text">Copyright</span>
                    <span class="corp">© SPOPIA Corp.</span>
                    <span class="text">All Rights Reserved.</span>
                </div>
            </div>
        </div>
    </div>
    <script src="https://code.jquery.com/jquery-3.6.0.js" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://kit.fontawesome.com/15c84217dd.js" crossorigin="anonymous"></script>
    <!-- kakao login s -->
    <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
    <!-- <script src="https://t1.kakaocdn.net/kakao_js_sdk/2.0.0/kakao.min.js" integrity="sha384-PFHeU/4gvSH8kpvhrigAPfZGBDPs372JceJq3jAXce11bVA6rMvGWzvP4fMQuBGL" crossorigin="anonymous"></script> -->
    <!-- kakao login e -->
    <!-- naver login s -->
    <!-- <script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script> -->
    <script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script>
    <!-- naver login e -->
    <!-- google login s  -->
    <!-- <script src="https://apis.google.com/js/platform.js" async defer></script> -->
    <script src="https://apis.google.com/js/platform.js?onload=renderButton" async defer></script>
    <!-- google login e  -->
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
						window.location.href = "/sportMain";
					}
				},
				error : function(jqXHR, status, error) {
					alert("알 수 없는 에러 [ " + error + " ]");
				}
			});
		});

    	<!-- 네이버아디디로로그인 초기화 Script -->
		/* var naver_id_login = new naver_id_login("z69jjnmkMQ88W2owra4t", "http://localhost:8080/member/naverCallback");
		var state = naver_id_login.getUniqState();
		naver_id_login.setButton("green", 3, 70);
		naver_id_login.setDomain("http://localhost:8080");
		naver_id_login.setState(state);
		naver_id_login.init_naver_id_login(); */
		<!-- //네이버아디디로로그인 초기화 Script -->
    	
    	/* kakao login s */
     	/* Kakao.init('6875fc67f5a6c9e3660d59324e27052a'); // test 용
    	console.log(Kakao.isInitialized()); */
     	Kakao.init('ec2655da82c3779d622f0aff959060e6');
    	console.log(Kakao.isInitialized());
    	
    	$("#kakaoBtn").on("click", function() {
    		/* Kakao.Auth.authorize({
   		      redirectUri: 'http://localhost:8080/member/kakaoCallback',
   		    }); */
    		
    		Kakao.Auth.login({
   		      success: function (response) {
   		        Kakao.API.request({
   		          url: '/v2/user/me',
   		          success: function (response) {
   		        	  
   		        	  var accessToken = Kakao.Auth.getAccessToken();
   		        	  Kakao.Auth.setAccessToken(accessToken);

   		        	  var account = response.kakao_account;
   		        	  
	  	        	  if (account.gender === "male") {
	  	        		  $("input[name=gender]").val(5);
	          		  } else {
	          			  $("input[name=gender]").val(6);
         			  } 
	  	        	  
	  	        	 /*  $("form[name=form]").attr("action", "/member/kakaoLoginProc").submit(); */
	  	        	  $.ajax({
						async: true
						,cache: false
						,type:"POST"
						,url: "/member/kakaoLoginProc"
						,data: {"name": account.profile.nickname, "snsId": "카카오로그인", "phone": account.profile.phone_number, "email": account.email, "gender": $("input[name=gender]").val(), "dob": account.birthday.substring(0,2) + "-" + account.birthday.substring(2,account.birthday.length), "snsImg": account.profile.thumbnail_image_url}
						,success : function(response) {
							if (response.rt == "fail") {
								alert("아이디와 비밀번호를 다시 확인 후 시도해 주세요.");
								return false;
							} else {
								window.location.href = "/sportMain";
							}
						},
						error : function(jqXHR, status, error) {
							alert("알 수 없는 에러 [ " + error + " ]");
						}
					});
   		          },
   		          fail: function (error) {
   		            console.log(error)
   		          },
   		        })
   		      },
   		      fail: function (error) {
   		        console.log(error)
   		      },
   		    })
		});
    	/* kakao login e */
    	
    	
    	/* naver login test s */
   		
    	/* naver login test e */
    	
    	/* google Login s */
    	/* google Login e */
    </script>
    <script type="text/javascript">
   		var naverLogin = new naver.LoginWithNaverId(
			{
				clientId: "b8EhDTV3tvvAE_gRRBoJ",
				callbackUrl: "http://localhost:8080/userLogin",
				isPopup: false,
				loginButton: {color: "green", type: 3, height: 70} 
			}
		); 
   		/* var naverLogin = new naver.LoginWithNaverId(
			{
				clientId: "z69jjnmkMQ88W2owra4t",
				callbackUrl: "http://www.spopia.pe.kr/userLogin",
				isPopup: false,
				callbackHandle: true,
			}
		); */

    	/* naverLogin.init(); */
		/* window.addEventListener('load', function () {
   			naverLogin.getLoginStatus(function (status) {
   				if (status) {
   					setLoginStatus();
   				}
   			});
   		}); */
   		
   		if ($("input[name=gender]").val() == null || $("input[name=gender]").val() == "") {
   			$("input[name=naver]").val("0");
   		}
   		
   		naverLogic = function() {
   			naverLogin.getLoginStatus(function (status) {
   				if (status) {
   					setLoginStatus();
   				}
   			});
   			$("input[name=naver]").val("1");
		}
		
   		naverLogin.getLoginStatus(function (status) {
			if(status && $("input[name=naver]").val() == 1) {
				window.addEventListener('load', function () {
		   			naverLogin.getLoginStatus(function (status) {
		   				if (status) {
		   					setLoginStatus();
		   				}
		   			});
		   		});
			}
		})
   		
		naverLogin.init();
		$("#naverIdLogin").on("click", function() {
			$.ajax({
				async: true
				,cache: false
				,type:"POST"
				,url: "/member/load"
				,data: {}
				,success : function(response) {
					if (response.rt == "fail") {
						alert("로그인을 재시도 해주세요!!");
						return false;
					} else {
						window.addEventListener('load', function () {
				   			naverLogin.getLoginStatus(function (status) {
				   				if (status) {
				   					setLoginStatus();
				   				}
				   			});
				   		});
					}
				},
				error : function(jqXHR, status, error) {
					alert("알 수 없는 에러 [ " + error + " ]");
				}
			});
		})
    	
   		function setLoginStatus() {
			if (naverLogin.user.gender == 'M'){
				$("input[name=gender]").val(5);
			} else {
				$("input[name=gender]").val(6);
			}
			
			$.ajax({
				async: true
				,cache: false
				,type:"POST"
				,url: "/member/naverLoginProc"
				,data: {"name": naverLogin.user.name, "snsId": "네이버로그인", "phone": naverLogin.user.mobile, "email": naverLogin.user.email, "gender": $("input[name=gender]").val(), "dob": naverLogin.user.birthyear+"-"+naverLogin.user.birthday, "snsImg": naverLogin.user.profile_image}
				,success : function(response) {
					if (response.rt == "fail") {
						alert("아이디와 비밀번호를 다시 확인 후 시도해 주세요.");
						return false;
					} else {
						window.location.href = "/sportMain";
					}
				},
				error : function(jqXHR, status, error) {
					alert("알 수 없는 에러 [ " + error + " ]");
				}
			});
		}
    </script>
    <script type="text/javascript">

		function onSuccess(googleUser) {
			console.log('Logged in as: ' + googleUser.getBasicProfile().getName());
		}
		function onFailure(error) {
			console.log(error);
		}
		function renderButton() {
			gapi.signin2.render('my-signin2', {
				'scope': 'profile email',
				'width': 240,
				'height': 50,
				'longtitle': true,
				'theme': 'dark',
				'onsuccess': onSuccess,
				'onfailure': onFailure
			});
		}
    </script>
</body>

</html>