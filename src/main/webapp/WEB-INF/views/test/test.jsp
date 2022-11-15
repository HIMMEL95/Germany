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
            <div class="header_inner text-center pt-5 mt-5" style="height: 250px;">
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
                                            <div class="input-control">
					                            <label for="id">아이디</label>
					                            <input id="id" name="id" type="text" onfocusout="validationUpdt()" autocomplete="off"> 
					                            <div class="msg" id="id_msg" name="id_msg" style="display: none;"></div>
					                        </div>
                                        </div>
                                        <div class="input_row" id="pw_line">
                                            <div class="icon_cell" id="pw_cell">
                                                <span class="icon_pw">
                                                    <span class="blind">비밀번호</span>
                                                </span>
                                            </div>
                                            <div class="input-control">
					                            <label for="pwd">비밀번호</label>
					                            <input id="pwd" name="pwd" type="text" onfocusout="validationUpdt()" autocomplete="off"> 
					                            <div class="msg" id="pwd_msg" name="pwd_msg" style="display: none;"></div>
					                        </div>
                                        </div>
                                    </div>
                                    <div class="btn_login_wrap text-center">
                                        <button type="button" class="btn_login" id="loginBtn" href="/sportMain">
                                            <span class="btn_text">로그인</span>
                                        </button>
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </form>
                </div>
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
						window.location.href = "/testMain";
					}
				},
				error : function(jqXHR, status, error) {
					alert("알 수 없는 에러 [ " + error + " ]");
				}
			});
		});
    	

    </script>
    <script type="text/javascript">
    
    	id_regex = function(obj, value, message, hide) {
    	    const re = /^[a-zA-z]$/g;
    	    if (!checkNull(obj, value)) {
    	        hide.parent().addClass('error')
    	        $(hide).text(message)
    	        $(hide).show();
    	        obj.focus();
    	        return false;
    	    } else if (!(re.test($.trim($(obj).val())))) {
    			hide.parent().addClass('error');
    	        $(hide).text(message)
    	        $(hide).show();
    	        obj.focus();
    	        return false;
    		} else if(!(($.trim($(obj).val()).length > 2) && ($.trim($(obj).val()).length < 21))) {
    	        $(hide).text('4~20자 사이의 아이디를 작성하시오')
    	        hide.parent().addClass('error')
    	        $(hide).show();
    	        obj.focus();
    	        return false;
    	    } else {
    	        hide.parent().removeClass('error')
    	        hide.parent().addClass('success')
    	        $(hide).text("사용가능한 아이디 입니다.")
    	        $(hide).show()
    	        return true;
    	    }
    	}
    	
    	pwd_regex = function(obj, value, message, hide) {
    		const re = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$/g;
    	    if (!checkNull(obj, value)) {
    	        hide.parent().addClass('error')
    	        $(hide).text(message)
    	        $(hide).show()
    	        return false;
    	    } else if (re.test($.trim($(obj).val()))) {
    			hide.parent().addClass('error')
    	        $(hide).text("최소 8자, 하나 이상의 대문자, 소문자, 숫자 및 하나의 특수 문자 입력하시오")
    	        $(hide).show()
    	        return false;
    		} else if(!(($.trim($(obj).val()).length > 7))) {
    	        $(hide).text('8자 이상의 비밀번호를 작성하시오')
    	        hide.parent().addClass('error')
    	        $(hide).show()
    	        return false;
    	    } else {
    	        hide.parent().removeClass('error')
    	        hide.parent().addClass('success')
    	        $(hide).hide()
    	        return true;
    	    }
    	}
    	
    	validationUpdt = function() {
	        if (!id_regex($('input[name=id]'), $('input[name=id]').val(), "아이디를 입력하세요!", $('#id_msg'))) {
	        	return false;
	        } else if(!pwd_regex($('input[name=pwd]'), $('input[name=pwd]').val(), "비밀번호를 입력하세요!", $('#pwd_msg'))) {
	            return false;
	        } else {
	            return true;
	        }
	    };
    </script>
    	
    	
</body>

</html>