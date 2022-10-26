<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="rb" uri="http://www.springframework.org/tags" %>

<!doctype html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge"> 
        <meta name="viewport"
            content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
            integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
        <title>Sign Up</title>
        <link rel="stylesheet" href="/resources/css/xdmin/login/signUp.css">
        <script defer type="text/javascript" src="/resources/js/xdmin/signValidation.js"></script>
        <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
		<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
		<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
		<link rel="stylesheet" href="/resources/demos/style.css">
    </head>
<body>

    <header></header>

    <main>
        <div class="container">
            <form id="form" name="form" method="post">
                <img src="/resources/images/SPOPIA1.png">
                <h1>필수 사항</h1>
                <div class="row">
                    <div class="col-6">
                        <div class="input-control">
                            <label for="id">Id<span style="color: red;">*</span></label>
                            <input type="hidden" id="idAllowedNy" name="idAllowedNy" value="0">
                            <input id="id" name="id" type="text" value="<c:out value="${item.id }"/>" autocomplete="off"> 
                            <div class="msg" id="id_msg" name="id_msg" style="display: none;"></div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col">
                        <div class="input-control">
                            <label for="name">Username<span style="color: red;">*</span></label>
                            <input id="name" name="name" type="text" onfocusout="validationUpdt()" autocomplete="off"> 
                            <div class="msg" id="name_msg" name="name_msg" style="display: none;"></div>
                        </div>
                    </div>
                    <div class="col">
                        <div class="input-control">
                            <label for="email">Email<span style="color: red;">*</span></label>
                            <input id="email" name="email" type="text" onfocusout="validationUpdt()" autocomplete="off">
                            <div class="msg" id="email_msg" name="email_msg" style="display: none;"></div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col">
                        <div class="input-control">
                            <label for="pwd">Password<span style="color: red;">*</span></label>
                            <input id="pwd" name="pwd" type="password" onkeypress="validationUpdt()" onfocusout="validationUpdt()" autocomplete="off">
                            <div class="msg" id="pwd_msg" name="pwd_msg" style="display: none;"></div>
                        </div>
                    </div>
                    <div class="col">
                        <div class="input-control">
                            <label for="pwd2">Password again<span style="color: red;">*</span></label>
                            <input id="pwd2" name="pwd2" type="password" onkeyup="validationUpdt()" onfocusout="validationUpdt()" autocomplete="off">
                            <div class="msg" id="pwd2_msg" name="pwd2_msg" style="display: none;"></div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col">
                        <div class="input-control">
                            <label for="dob">생년월일<span style="color: red;">*</span></label>
                            <input id="dob" name="dob" class="datepicker" type="text" placeholder="1900-01-01" autocomplete="off" onfocusout="validationUpdt()">
                            <div class="msg" id="dob_msg" name="dob_msg" style="display: none;"></div>
                        </div>
                    </div>
                    <div class="col">
                        <div class="input-control">
                            <label for="gender">성별<span style="color: red;">*</span></label>
                            <select id="gender" name="gender" aria-label=".form-select-lg example" onfocusout="validationUpdt()">
                                <option value="" <c:if test="${empty item.gender}">selected</c:if>>선택</option>
                                <option value="5" <c:if test="${item.gender eq 5 }">selected</c:if>>남성</option>
                                <option value="6" <c:if test="${item.gender eq 6 }">selected</c:if>>여성</option>
                            </select>
                            <div class="msg" id="gender_msg" name="gender_msg" style="display: none;"></div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col">
                        <div class="input-control">
                            <label for="radio_operator">통신사<span style="color: red;">*</span></label>
                            <select id="radio_operator" name="radio_operator" aria-label=".form-select-lg example" onfocusout="validationUpdt()">
                            	<option value="" <c:if test="${empty item.radio_operator}">selected</c:if>>선택</option>
                                <option value="1" <c:if test="${item.radio_operator eq 1 }">selected</c:if>>SKT</option>
                                <option value="2" <c:if test="${item.radio_operator eq 2 }">selected</c:if>>KT</option>
                                <option value="3" <c:if test="${item.radio_operator eq 3 }">selected</c:if>>LGT</option>
                                <option value="4" <c:if test="${item.radio_operator eq 4 }">selected</c:if>>알뜰폰</option>
                            </select>
                            <div class="msg" id="radio_operator_msg" name="radio_operator_msg" style="display: none;"></div>
                        </div>
                    </div>
                    <div class="col">
                        <div class="input-control">
                            <label for="phone">전화번호<span style="color: red;">*</span></label>
                            <input id="phone" name="phone" type="tel" placeholder="010-0000-0000" autocomplete="off" onfocusout="validationUpdt()">
                            <div class="msg" id="phone_msg" name="phone_msg" style="display: none;"></div>
                        </div>
                    </div>
                    <div class="col-2">
                        <div class="row">
                            <div class="col">
                                <button type="button" class="btn fw-bold text-white certification"
                                    style="background-color: #03c75a;">인증번호</button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row" hidden>
                    <div class="col-6">
                        <div class="input-control">
                            <label for="tel_certification">인증번호</label>
                            <input id="tel_certification" name="tel_certification" type="text" onfocusout="validationUpdt()"> 
                            <div class="msg" id="tel_certi_msg" name="tel_certi_msg" style="display: none;"></div>
                        </div>
                    </div>
                    <div class="col-2">
                        <div class="row">
                            <div class="col">
                                <button type="button" class="btn fw-bold text-white certification"
                                    style="background-color: #03c75a;">중복확인</button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-6">
                        <div class="input-control">
                            <label for="zip">우편번호<span style="color: red;">*</span></label>
                            <input id="zip" name="zip" type="text" readonly autocomplete="off" onfocusout="validationUpdt()"> 
                            <div class="msg" id="zip_msg" name="zip_msg" style="display: none;"></div>
                        </div>
                    </div>
                    <div class="col-6">
                        <div class="row">
                            <div class="col-4">
                                <button type="button" id="searchBtn" class="btn fw-bold text-white certification"
                                    style="background-color: #03c75a;">주소검색</button>
                            </div>
                            <div class="col-3">
                                <button id="refresh" class="btn btn-danger fw-bold btn-sm shadow" type="button">
                                        <i class="fa-solid fa-arrow-rotate-right"></i>
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col">
                        <div class="input-control">
                            <label for="address">주소<span style="color: red;">*</span></label>
                            <input id="address" name="address" type="text" onfocusout="validationUpdt()" readonly> 
                            <div class="msg" id="address_msg" name="address_msg" style="display: none;"></div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col">
                        <div class="input-control">
                            <label for="address_detail">상세주소<span style="color: red;">*</span></label>
                            <input id="address_detail" name="address_detail" type="text" autocomplete="off" onfocusout="validationUpdt()"> 
                            <div class="msg" id="address_detail_msg" name="address_detail_msg" style="display: none;"></div>
                        </div>
                    </div>
                    <div class="col">
                        <div class="input-control">
                            <label for="extraAddress">참고항목</label>
                            <input id="extraAddress" name="extraAddress" type="text" onfocusout="validationUpdt()" readonly> 
                            <div class="msg" id="extraAddress_msg" name="extraAddress_msg" style="display: none;"></div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col">
                        <div class="input-control">
                            <label for="address_detail">위도</label>
                            <input id="lat" name="lat" value="" type="text" onfocusout="validationUpdt()" readonly> 
                        </div>
                    </div>
                    <div class="col">
                        <div class="input-control">
                            <label for="extraAddress">경도</label>
                            <input id="long" name="long" value="" type="text" onfocusout="validationUpdt()" readonly> 
                        </div>
                    </div>
                </div>
               	<div class="row">
               		<div class="col-6">
                        <div class="input-control">
                            <label for="team">좋아하는 팀<span style="color: red;">*</span></label>
                            <select id="team" name="team" aria-label=".form-select-lg example" onclick="validationUpdt()">
                            	<option value="" <c:if test="${empty item.team}">selected</c:if>>선택</option>
                                <option value="25" <c:if test="${item.team eq 25 }">selected</c:if>>두산 베어스</option>
                                <option value="26" <c:if test="${item.team eq 26 }">selected</c:if>>KIA 타이거즈</option>
                                <option value="27" <c:if test="${item.team eq 27 }">selected</c:if>>SSG 랜더스</option>
                                <option value="28" <c:if test="${item.team eq 28 }">selected</c:if>>삼성 라이온즈</option>
                            </select>
                            <div class="msg" id="team_msg" name="team_msg" style="display: none;"></div>
                        </div>
                    </div>
               	</div>
                <hr>
                <h1>선택 사항</h1>
                <div class="row">
                    <div class="col">
                        <div class="input-control">
                            <label for="job">직업</label>
                            <input id="job" name="job" type="text" autocomplete="off">
                        </div>
                    </div>
                </div>
                <div class="row">
                	<div class="col">
	                	<div class="form-check">
							<input class="form-check-input" type="checkbox" value="" id="flexCheckDefault" style="width: 20px; height: 20px;">
							<label class="form-check-label" for="flexCheckDefault">
							  개인정보 제공에 동의 하시겠습니까?
							</label>
						</div>
                	</div>
                </div>
                <div class="row">
                    <div class="col-2">
                        <button type="button" id="backBtn" style="background: #03c75a;">뒤로</button>
                    </div>
                    <div class="col-2 offset-8">
                        <button class="submit" type="button" id="btnSave">Sign Up</button>
                    </div>
                </div>
            </form>
        </div>
    </main>

    <footer>
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
    </footer>
    <!-- <script src="https://code.jquery.com/jquery-3.6.0.slim.js" integrity="sha256-HwWONEZrpuoh951cQD1ov2HUK5zA5DwJ1DNUXaM6FsY=" crossorigin="anonymous"></script> -->
    <script src="https://code.jquery.com/jquery-3.6.0.js" crossorigin="anonymous"></script>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script src="https://kit.fontawesome.com/15c84217dd.js" crossorigin="anonymous"></script>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ec2655da82c3779d622f0aff959060e6&libraries=services"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script type="text/javascript">
        $('.error').hide();
        validationUpdt = function() {
            if (!id_regex($('input[name=id]'), $('input[name=id]').val(), "아이디를 입력하세요!", $('#id_msg'))) {
            	return false;
            } else if(!name_regex($('input[name=name]'), $('input[name=name]').val(), "이름을 입력하세요!", $('#name_msg'))) {
                return false;
            } else if(!email_regex($('input[name=email]'), $('input[name=email]').val(), "이메일을 입력하세요!", $('#email_msg'))) {
                return false;
            } else if(!pwd_regex($('input[name=pwd]'), $('input[name=pwd]').val(), "비밀번호를 입력하세요!", $('#pwd_msg'))) {
                return false;
            } else if(!pwd2_regex($('input[name=pwd2]'), $('input[name=pwd2]').val(), "비밀번호를 입력하세요!", $('#pwd2_msg'))) {
                return false;
            } else if(!dob_regex($('input[name=dob]'), $('input[name=dob]').val(), "생년월일을 입력하세요!", $('#dob_msg'))) {
                return false;
            } else if(!gender_regex($('#gender'), $('#gender').val(), "성별을 선택하세요!", $('#gender_msg'))) {
                return false;
            } else if(!radio_regex($('#radio_operator'), $('#radio_operator').val(), "통신사를 선택하세요!", $('#radio_operator_msg'))) {
                return false;
            } else if(!tel_regex($('input[name=phone]'), $('input[name=phone]').val(), "전화번호를 입력하세요!", $('#phone_msg'))) {
                return false;
            } else if(!zip_regex($('input[name=zip]'), $('input[name=zip]').val(), "우편번호를 입력하세요!", $('#zip_msg'))) {
                return false;
            } else if(!add_regex($('input[name=address]'), $('input[name=address]').val(), "주소를 입력하세요!", $('#address_msg'))) {
            	return false;
            } else if (!detail_regex($('input[name=address_detail]'), $('input[name=address_detail]').val(), "우편번호를 입력하세요!", $('#address_detail_msg'))) {
            	return false;
            } else if(!team_regex($('#team'), $('#team').val(), "좋아하는 팀을 입력하세요!", $('#team_msg'))) {
            	return false;
            } else {
                return true;
            }
           	alert("회원가입이 완료 되었습니다.");
        };
        
        function daumPostCode() {
            new daum.Postcode({
                oncomplete: function(data) {
                    // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                    // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                    // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                    var addr = ''; // 주소 변수
                    var extraAddr = ''; // 참고항목 변수

                    //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                    if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                        addr = data.roadAddress;
                    } else { // 사용자가 지번 주소를 선택했을 경우(J)
                        addr = data.jibunAddress;
                    }

                    // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                    if(data.userSelectedType === 'R'){
                        // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                        // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                        if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                            extraAddr += data.bname;
                        }
                        // 건물명이 있고, 공동주택일 경우 추가한다.
                        if(data.buildingName !== '' && data.apartment === 'Y'){
                            extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                        }
                        // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                        if(extraAddr !== ''){
                            extraAddr = ' (' + extraAddr + ')';
                        }
                        // 조합된 참고항목을 해당 필드에 넣는다.
                        document.getElementById("extraAddress").value = extraAddr;
                    
                    } else {
                        document.getElementById("extraAddress").value = '';
                    }

                    // 우편번호와 주소 정보를 해당 필드에 넣는다.
                    document.getElementById('zip').value = data.zonecode;
                    document.getElementById("address").value = addr;
                    // 커서를 상세주소 필드로 이동한다.
                    document.getElementById("address_detail").focus();
                    
        			var geocoder = new daum.maps.services.Geocoder();
        			
        			geocoder.addressSearch(addr, function(result, status) {
        				if(status === daum.maps.services.Status.OK) {
        					$("#lat").val(result[0].y);
        					$("#long").val(result[0].x);
        				}
        			});
                }
            }).open();
        };
        
        $("#refresh").on("click", function() {
			$("#zip").val('');
			$("#address").val('');
			$("#extraAddress").val('');
		});
        
        var goUrlLogin = "/userLogin";
        var goUrlInst = "/signUpInst";
        var form = $("form[name=form]");
        
        $("#backBtn").on("click", function() {
			form.attr("action", goUrlLogin).submit();
		})
        
        $("#btnSave").on("click", function() {
        	if (validationUpdt() == false) return false;
        	else swAlert("회원가입", "회원가입을 축하합니다.!!!", "success");
		});
        
        function swAlert(title, text, icon) {
			swal({
				title: title
				,text: text
				,icon: icon
				,buttons: "확인"
			}).then((value) => {
				if (value) {
					location.href = goUrlInst;
				}
			})
		}
        
        $("#searchBtn").on("click", function() {
        	daumPostCode();
		});
        
        errorValidation = function(input, msg, message) {
        	$(msg).parent().removeClass('success');						
		 	$(msg).parent().addClass('error');
	        $(msg).text(message);
	        $(msg).show();
	        $(input).val('');
	        $(input).focus();
		}
        
        successValidation = function(input, msg, message) {
        	$(msg).parent().removeClass('error');
		 	$(msg).parent().addClass('success');
	        $(msg).text(message);
	        $(msg).show();
		}
        
    	$("#id").on("focusout", function(){
    		var id = $("#id").val();
    		
   			$.ajax({
   				async: true 
   				,cache: false
   				,type: "post"
   				/* ,dataType:"json" */
   				,url: "idCheck"
   				/* ,data : $("#formLogin").serialize() */
   				,data : { "id" : id }
   				,success: function(response) {
   					if(response.rt == "success") {
   						if (id.length > 0) {
    						successValidation('#id', '#id_msg', "사용가능한 아이디 입니다.");
    						document.getElementById("idAllowedNy").value = 1;
   						} else {
   							 errorValidation('#id', '#id_msg', "아이디를 입력해주세요!!!");
   							 document.getElementById("idAllowedNy").value = 0;
   						}
   					} else {
   						errorValidation('#id', '#id_msg', "이미 있는 아이디 입니다.");
   						document.getElementById("idAllowedNy").value = 0;
   					}
   				}
   				,error : function(jqXHR, textStatus, errorThrown){
   					alert("ajaxUpdate " + jqXHR.textStatus + " : " + jqXHR.errorThrown);
   				}
   			});
    	});
    </script>
</body>
</html> 