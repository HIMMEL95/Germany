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
    <meta property="og:type" content="website">
    <meta property="og:title" content="[네이버: 로그인]">
    <meta property="og:description" content="안전한 로그인을 위해 주소창의 URL과 자물쇠 마크를 확인하세요!">
    <meta property="og:image" content="https://ssl.pstatic.net/sstatic/search/common/og_v3.png">
    <meta property="og:image:type" content="image/png">
    <title>SPOPIA : 로그인</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
    <link href="/resources/css/user/login.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" type="text/css" href="/login/css/global/desktop/w_20220216.css?20210812">

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
                            <a href="./loginForm.html" id="loinid" class="menu_id on" role="tab" aria-selected="true">
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
                                            <a type="button" class="btn_login" id="naverIdLogin_loginButton" href="javascript:void(0)" style="background-color: #03c75a;">
                                                <span class="btn_text">
                                                	<!-- <img src="/resources/images/user/naver.png" style="width: 25px;" class="me-3"> -->
                                               			네이버 로그인
                                           		</span>
                                            </a>
                                        </div>
                                        <div class="btn_login_wrap">
                                            <button type="button" class="btn_login" id="kakaoBtn" style="background-color: #fceb00;">
                                                <span class="btn_text text-black">
                                                	<img src="/resources/images/user/kakao.png" style="width: 25px;" class="me-3">
                                               			카카오 로그인
                                           		</span>
                                            </button>
                                        </div>
                                        <div class="btn_login_wrap">
                                            <button type="button" class="btn_login" id="log.login"
                                                style="background-color: #dc462f;">
                                                <span class="btn_text">
                                                	<i class="fa-brands fa-google text-white pe-3 fa-lg"></i>
                                                			구글 로그인
                                                </span>
                                            </button>
                                        </div>
                                        <div class="btn_login_wrap">
                                            <button type="button" class="btn_login" id="log.login"
                                                style="background-color: #304e9c;">
                                                <span class="btn_text">
                                                	<i class="fa-brands fa-square-facebook text-white pe-3 fa-lg"></i>
                                                			페이스북 로그인
                                                </span>
                                            </button>
                                        </div>
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
    <input type="hidden" name="naverId" value="1253">
    <input type="hidden" name="name" value="">
    <input type="hidden" name="email" value="">
    <script type="text/javascript" async="" src="https://ssl.pstatic.net/tveta/libs/glad/prod/gfp-core.js"></script>
    <script type="text/javascript" src="/login/js/v2/default/common_202201.js?v=20220322"></script>
    <script type="text/javascript" src="/login/js/v2/default/default_202105.js?v=20210910"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.js" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://kit.fontawesome.com/15c84217dd.js" crossorigin="anonymous"></script>
    <!-- kakao login s -->
    <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
    <!-- kakao login e -->
    <!-- Naver login s -->
    <script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script>
    <!-- Naver login e -->
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
    	    	
    	var goUrlMain = "/sportMain";
    	var form = $("#frmNIDLogin");
    	
    	/* kakao login s */
    	Kakao.init('ec2655da82c3779d622f0aff959060e6');
    	console.log(Kakao.isInitialized());
    	$("#kakaoBtn").on("click", function() {
    		Kakao.Auth.login({
   		      success: function (response) {
   		        Kakao.API.request({
   		          url: 'kakaoLogin',
   		          success: function (response) {
   		        	  console.log(response);
   		        	  form.attr("action", goUrlMain).submit();
   		          },
   		          fail: function (error) {
   		            console.log(error);
   		          },
   		        })
   		      },
   		      fail: function (error) {
   		        console.log(error)
   		      },
   		    })
		});
    	/* kakao login e */
    	
   		naverLogin = function() {
			
    		var naverLoginNy = 0;
    		
			/* naver login s */
        	var naverLogin = new naver.LoginWithNaverId(
        			{
        				clientId: "uzhH9KK0z5vHprqIybHE", //내 애플리케이션 정보에 cliendId를 입력해줍니다.
        				callbackUrl: "http://localhost:8080/userLogin", // 내 애플리케이션 API설정의 Callback URL 을 입력해줍니다.
        				isPopup: false,
        				callbackHandle: true
        			}
        		);	

        	naverLogin.init();

       		naverLogin.getLoginStatus(function (status) {
       			alert("test1")
       			if (status) {
	       			alert("test2")
   					naverLoginNy = 1;
       				var email = naverLogin.user.getEmail(); // 필수로 설정할것을 받아와 아래처럼 조건문을 줍니다.
       	    		
       				console.log(naverLogin.user); 
       				
       				$("input[name=name]").val(naverLogin.user.name);
       				$("input[name=naverId]").val(naverLogin.user.id);
       				$("input[name=email]").val(naverLogin.user.email);
       	    		
       	            if( email == undefined || email == null) {
       					alert("이메일은 필수정보입니다. 정보제공을 동의해주세요.");
       					naverLogin.reprompt();
       					return true;
       				}
       			} else {
       				alert("test3")
       				return false;
       				console.log("callback 처리에 실패하였습니다.");
       			}
       		});
       		
       		alert("naverLoginNy : " + naverLoginNy);
       		
       		if (naverLoginNy == 1) {
       			if ($("input[name=name]").val() != null && $("input[name=name]").val() != "") {
        			console.log("test3");
    	    		alert("test3");
        			var name = $("input[name=name]").val()
        			var email = $("input[name=email]").val()
        			var id = $("input[name=naverId]").val()
        			alert("test4")
        			
        			console.log(name)
        			console.log(email)
        			console.log(id)
        			
        			
        			return false;
        			$.ajax({
        				async: true
        				,cache: false
        				,type:"POST"
        				,url: "naverLogin"
        				,data: {"name": name, "email" : email, "id" : id}
        				,success : function(response) {
        					if (response.rt == "fail") {
        						alert("아이디와 비밀번호를 다시 확인 후 시도해 주세요.");
        						return false;
        					} else {
        						window.location.href = "/sportMain";
        						alert("네이버 로그인 시도중");
        					}
        				},
        				error : function(jqXHR, status, error) {
        					alert("알 수 없는 에러 [ " + error + " ]");
        				}
        			});
        		}
       		} else {
       			return false;
       		}
  		}
       		
        	var testPopUp;
        	function openPopUp() {
        	    testPopUp= window.open("https://nid.naver.com/nidlogin.logout", "_blank", "toolbar=yes,scrollbars=yes,resizable=yes,width=1,height=1");
        	}
        	
        	function closePopUp(){
        	    testPopUp.close();
        	}

        	function naverLogout() {
        		openPopUp();
        		setTimeout(function() {
        			closePopUp();
        			}, 1000);
        	}
        	/* naver login e */
    	
    	$("#naverIdLogin_loginButton").on("click", function() {
    		naverLogin();
    		
    		/* alert("test1");
			naverLogin();
    		alert("test2");
    		
    		console.log($("input[name=name]").val());
    		
    		if ($("input[name=name]").val() != null && $("input[name=name]").val() != "") {
    			console.log("test3");
	    		alert("test3");
    			var name = $("input[name=name]").val()
    			var email = $("input[name=email]").val()
    			var id = $("input[name=naverId]").val()
    			alert("test4")
    			
    			console.log(name)
    			console.log(email)
    			console.log(id)
    			
    			$.ajax({
    				async: true
    				,cache: false
    				,type:"POST"
    				,url: "naverLogin"
    				,data: {"name": name, "email" : email, "id" : id}
    				,success : function(response) {
    					if (response.rt == "fail") {
    						alert("아이디와 비밀번호를 다시 확인 후 시도해 주세요.");
    						return false;
    					} else {
    						window.location.href = "/sportMain";
    						alert("네이버 로그인 시도중");
    					}
    				},
    				error : function(jqXHR, status, error) {
    					alert("알 수 없는 에러 [ " + error + " ]");
    				}
    			});
    		} */

		})
    	</script>
    </script>
</body>

</html>