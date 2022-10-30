<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="rb" uri="http://www.springframework.org/tags" %>

<jsp:useBean id="CodeServiceImpl" class="com.spopia.infra.modules.code.CodeServiceImpl"/>

<!doctype html>
<html lang="ko" data-theme="light">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="shortcut icon" href="https://cdn-icons-png.flaticon.com/512/6646/6646786.png" type="image/x-icon">
    <title>Game 등록</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
    <link href="/resources/css/xdmin/gameForm.css" rel="stylesheet" type="text/css">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<script type="text/javascript" src="/resources/js/game/select.js"></script>
</head>

<body>
    <!-- start -->
    <header class="navbar-light fixed-top header-static bg-mode align-items-center">
        <!-- 상단 -->
        <nav class="navbar navbar-expand-lg">
            <div class="container px-3 px-xl-5 pt-1">
                <!-- Logo START -->
                <a class="navbar-brand" href="/sportMain">
                    <img class="light-mode-item navbar-brand-item" src="/resources/images/SPOPIA_white.png" alt="logo"
                        style="width: 90px;">
                </a>
                <!-- Profile START -->
                <div class="dropdown">
                    <ul class="nav flex-nowrap align-items-center ms-sm-3 list-unstyled">
                        <li class="me-2">
                            <a class="p-0" href="#" id="profileDropdown" role="button" data-bs-auto-close="outside"
                                data-bs-display="static" data-bs-toggle="dropdown" aria-expanded="false">
                                <img class="avatar-img rounded-circle" src="/resources/images/diano.jpg" alt="avatar"
                                    style="width: 30px;">
                            </a>
                            <ul class="dropdown-menu dropdown-animation dropdown-menu-end shadow pt-3"
                                aria-labelledby="profileDropdown">
                                <!-- Profile info -->
                                <li class="px-3">
                                    <div class="d-flex align-items-center">
                                        <!-- Avatar -->
                                        <div class="avatar ps-1 pt-2">
                                            <img class="avatar-img rounded-circle shadow" src="/resources/images/diano.jpg"
                                                alt="avatar" style="width: 30px;">
                                        </div>
                                        <div>
                                            <a class="fs-6 fw-bold" href="/member/memberUView?seq=${sessSeq }"><c:out value="${sessName }"/></a>
                                            <p class="small m-0"><c:out value="${sessEmail }"/></p>
                                        </div>
                                    </div>
                                    <hr>
                                </li>
                                <!-- Links -->
                                <li>
                                    <a class="dropdown-item" href="/member/memeberUView?seq=${sessSeq }">
                                        <i class="fa-solid fa-user me-2"></i>
                                        Edit Profile
                                    </a>
                                </li>
                                <!-- <li>
                                    <a class="dropdown-item" href="#">
                                        <i class="fa-solid fa-gear me-2"></i>
                                        Account Settings
                                    </a>
                                </li> -->
                                <li>
                                    <a class="dropdown-item" href="#">
                                        <i class="fa-solid fa-circle-info me-2"></i>
                                        Help
                                    </a>
                                </li>
                                <li>
                                    <a class="dropdown-item bg-danger-soft-hover" href="/">
                                        <i class="fa-solid fa-power-off me-2"></i>
                                        Sign Out
                                    </a>
                                </li>
                                <!-- Dark mode switch START -->
                            </ul>
                        </li>
                    </ul>
                </div>
                <!-- Profile START -->
            </div>
        </nav>
    </header>

    <main>
        <div style="height: 80px;"></div>
        <div class="container">
            <form method="post" id="myForm" name="myForm">
            	<!-- *Vo.jsp s -->
				<%@include file="gameVo.jsp"%>		<!-- #-> -->
				<!-- *Vo.jsp e -->
                <div class="text-center pb-3">
                    <span class="fs-1 fw-bold">경기 기록 등록</span>
                </div>
                <div class="card ps-5 pe-5 pt-4 pb-4 shadow">
                    <div class="row pt-4">
                        <div class="col mb-4">
                        	<c:set var="listCodeAbroad" value="${CodeServiceImpl.selectListCachedCode('4') }" />
                            <label for="gAbroadNy" class="form-label fw-bold">해외여부</label>
                            <select class="form-select" id="gAbroadNy" name="gAbroadNy" onchange="setComboBox1(this)" aria-label=".form-select example">
                                <option value="" >선택</option>
                                <c:choose>
                                	<c:when test="${empty item.gSeq }">
                                		<c:forEach items="${listCodeAbroad}" var="listAbroad" varStatus="statusAborad">
											<option value="${listAbroad.ccSeq }" <c:if test="${item.gAbroadNy eq listAbroad.ccSeq}">selected</c:if>><c:out value="${listAbroad.ifccName }"/></option>
										</c:forEach>
                                	</c:when>
                                	<c:otherwise>
                                		<c:forEach items="${listCodeAbroad}" var="listAborad" varStatus="statusAborad">
											<option value="${item.gAbroadNy }" <c:if test="${item.gAbroadNy eq listAbroad.ccSeq}">selected</c:if>><c:out value="${listAbroad.ifccName }"/></option>
										</c:forEach>
                                	</c:otherwise>
                                </c:choose>
                            </select>
                        </div>
                        <div class="col mb-4">
                        	<c:set var="listCodeEvent" value="${CodeServiceImpl.selectListCachedCode('5') }" />
                            <label for="gEvent" class="form-label fw-bold">종목</label>
                            <select class="form-select" id="gEvent" name="gEvent" onchange="setComboBox2(this)" aria-label=".form-select example">
                                <option value="" >선택</option>
                                <c:choose>
                                	<c:when test="${empty item.gSeq }">
                                		<c:forEach items="${listCodeEvent}" var="listEvent" varStatus="statusEvent">
											<option class="select" value="${listEvent.ccSeq }" <c:if test="${item.gEvent eq listEvent.ccSeq}">selected</c:if>><c:out value="${listEvent.ifccName }"/></option>
										</c:forEach>
                                	</c:when>
                                	<c:otherwise>
                                		<c:forEach items="${listCodeEvent}" var="listEvent" varStatus="statusEvent">
											<option class="select" value="${item.gEvent }" <c:if test="${item.gEvent eq listEvent.ccSeq}">selected</c:if>><c:out value="${listEvent.ifccName }"/></option>
										</c:forEach>
                                	</c:otherwise>
                                </c:choose>
                            </select>
                        </div>
                        <div class="col mb-4">
                        	<c:set var="listCodeLeague" value="${CodeServiceImpl.selectListCachedCode('6') }" />
                            <label for="gLeague" class="form-label fw-bold">리그</label>
                            <select class="form-select" id="gLeague" name="gLeague" onchange="setComboBox3(this)" aria-label=".form-select example">
                                <option value="">선택</option>
                                <c:forEach items="${listCodeLeague}" var="listLeague" varStatus="statusLeague">
									<option class="select1" value="${listLeague.ccSeq }" <c:if test="${item.gLeague eq listLeague.ccSeq}">selected</c:if>><c:out value="${listLeague.ifccName }"/></option>
								</c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="row mb-4">
                    	<div class="col">
                    		<c:set var="listCodeTeam" value="${CodeServiceImpl.selectListCachedCode('7') }" />
                            <label for="team_home" class="form-label fw-bold">홈팀</label>
                            <select class="form-select" id="team_home" name="team_home" onchange="setComboBox4(this)" aria-label=".form-select example">
                                <option value="">선택</option>
                                <c:forEach items="${listCodeTeam}" var="listTeam" varStatus="statusTeam">
									<option class="select2" value="${item.team_home }" <c:if test="${item.team_home eq listTeam.ccSeq}">selected</c:if>><c:out value="${listTeam.ifccName }"/></option>
								</c:forEach>
                            </select>
                        </div>
                        <div class="col">
                        	<c:set var="listCodeTeam" value="${CodeServiceImpl.selectListCachedCode('7') }" />
                            <label for="team_away" class="form-label fw-bold">원정팀</label>
                            <select class="form-select" id="team_away" name="team_away" aria-label=".form-select example">
                                <option value="">선택</option>
                                <c:forEach items="${listCodeTeam}" var="listTeam" varStatus="statusTeam">
									<option class="select2" value="${item.team_away }" <c:if test="${item.team_away eq listTeam.ccSeq}">selected</c:if>><c:out value="${listTeam.ifccName }"/></option>
								</c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="row mb-4">
                        <div class="col">
                            <label for="homeTeamScore" class="form-label fw-bold">홈팀 선발</label>
                            <input type="text" class="form-control" id="player_home" name="player_home" value="<c:out value="${item.player_home }"/>">
                        </div>
                        <div class="col">
                            <label for="awayTeamScore" class="form-label fw-bold">원정팀 선발</label>
                            <input type="text" class="form-control" id="player_away" name="player_away" value="<c:out value="${item.player_away }"/>">
                        </div>
                    </div>
                    <div class="row mb-4">
                        <div class="col">
                            <label for="score_home" class="form-label fw-bold">홈팀 스코어</label>
                            <input type="number" class="form-control" id="score_home" name="score_home" value="<c:out value="${item.score_home }"/>">
                        </div>
                        <div class="col">
                            <label for="score_away" class="form-label fw-bold">원정팀 스코어</label>
                            <input type="number" class="form-control" id="score_away" name="score_away" value="<c:out value="${item.score_away }"/>">
                        </div>
                    </div>
                    <div class="row mb-4">
                        <div class="col">
                        	<c:set var="listCodeStadium" value="${CodeServiceImpl.selectListCachedCode('8') }" />
                            <label for="stadium" class="form-label fw-bold">경기장</label>
                            <select class="form-select" id="stadium" name="stadium" aria-label=".form-select example">
                                <option value="">선택</option>
                            	<c:forEach items="${listCodeStadium}" var="listStadium" varStatus="statusStadium">
									<option class="select3" value="${item.stadium }" <c:if test="${item.stadium eq listStadium.ccSeq}">selected</c:if>><c:out value="${listStadium.ifccName }"/></option>
								</c:forEach>
                            </select>
                        </div>
                        <div class="col">
                            <label for="gameDuration" class="form-label fw-bold">경기 시간</label>
                            <input type="time" class="form-control" id="gameDuration" name="gameDuration" value="<c:out value="${item.gameDuration }"/>">
                        </div>
                    </div>
                    <div class="row mb-4">
                        <div class="col-6">
                            <label for="gameDate" class="form-label fw-bold">경기 일자</label>
                            <input type="text" class="form-control datepicker" id="gameDate" name="gameDate" placeholder="경기 일자" value="<c:out value="${item.gameDate }"/>" autocomplete="off">
                        </div>
                    </div>
                    <div class="row mb-4">
                        <div class="col align-items-center">
                            <img src="" id="preview" width="500px;" class="mb-2">
                            <label for="ex_file"></label>
                            <input type="file" id="ex_file" class="form-control" aria-label="file example" multiple>
                        </div>
                    </div>
                    <!-- 리스트 -->
                    <c:choose>
                    	<c:when test="${empty vo.gSeq }">
                    		<div class="row align-items-center">
		                        <div class="col-1">
		                            <button class="border-0 btn btn-sm bg-secondary shadow" id="btnList" type="button">
		                                <i class="fa-solid fa-bars" style="color: white;"></i>
		                            </button> 
		                        </div>
		                        <div class="col-3 offset-8" align="right">
		                            <button id="btnSave" class="border-0 btn btn-sm bg-success shadow" type="button">
		                                <i class="fa-regular fa-bookmark" style="color: white;"></i>
		                            </button>
		                        </div>
		                    </div>
                    	</c:when>
                    	<c:otherwise>
                    		<div class="row align-items-center">
		                        <div class="col-1">
		                            <button class="border-0 btn btn-sm bg-secondary shadow" id="btnList" type="button">
		                                <i class="fa-solid fa-bars" style="color: white;"></i>
		                            </button> 
		                        </div>
		                        <div class="col-3 offset-8" align="right">
		                            <button id="btnUel" value="Uel" class="border-0 btn btn-sm bg-danger shadow" type="button" data-bs-toggle="modal"
		                                data-bs-target="#deleteModal">
		                                <i class="fa-solid fa-xmark" style="color: white;"></i>
		                            </button>
		                            <div class="modal fade" id="deleteModal" data-bs-backdrop="static" data-bs-keyboard="false"
		                                tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
		                                <div class="modal-dialog">
		                                    <div class="modal-content">
		                                        <div class="modal-header">
		                                            <h5 class="modal-title fw-bold" id="staticBackdropLabel">게시물 삭제</h5>
		                                            <button type="button" class="btn-close" data-bs-dismiss="modal"
		                                                aria-label="Close"></button>
		                                        </div>
		                                        <div class="modal-body fs-6">
		                                       		선택하신 게시물을 정말로 삭제하시겠습니까?
		                                        </div>
		                                        <div class="modal-footer">
		                                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
		                                            <button id="delBtn" type="button" class="btn btn-primary">삭제</button>
		                                        </div>
		                                    </div>
		                                </div>
		                            </div>
		                            <button id="btnDel" value="Del" class="border-0 btn btn-sm bg-danger shadow" type="button" data-bs-toggle="modal"
		                                data-bs-target="#deleteModal">
		                                <i class="fa-solid fa-trash-can" style="color: white;"></i>
		                            </button>
		                            <button id="btnSave" class="border-0 btn btn-sm bg-success shadow" type="button">
		                                <i class="fa-regular fa-bookmark" style="color: white;"></i>
		                            </button>
		                        </div>
		                    </div>
                    	</c:otherwise>
                    </c:choose>
                </div>
            </form>
        </div>
        <form name="formVo" id="formVo" method="post">
		<!-- *Vo.jsp s -->
		<%@include file="gameVo.jsp"%>		<!-- #-> -->
		<!-- *Vo.jsp e -->
		</form>
        <div style="height: 50px;"></div>
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

    <!-- end -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2"
        crossorigin="anonymous"></script>
    <script src="https://kit.fontawesome.com/1d32d56af5.js" crossorigin="anonymous"></script>
    <script type="text/javascript">
        // 이미지 미리보기
		const reader = new FileReader();

        reader.onload = (readerEvent) => {
            document.querySelector("#preview").setAttribute("src", readerEvent.target.result);
        };

        document.querySelector("#ex_file").addEventListener("change", (changeEvent) => {

            const imgFile = changeEvent.target.files[0];
            reader.readAsDataURL(imgFile);
        })
        
        $(function() {
       		 $.datepicker.setDefaults({
                dateFormat: 'yy-mm-dd' //Input Display Format 변경
                ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
                ,showMonthAfterYear:true //년도 먼저 나오고, 뒤에 월 표시
                ,changeYear: true //콤보박스에서 년 선택 가능
                ,changeMonth: true //콤보박스에서 월 선택 가능                
                ,buttonText: "선택" //버튼에 마우스 갖다 댔을 때 표시되는 텍스트                
                ,yearSuffix: "년" //달력의 년도 부분 뒤에 붙는 텍스트
                ,monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'] //달력의 월 부분 텍스트
                ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip 텍스트
                ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 부분 텍스트
                ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 부분 Tooltip 텍스트
                ,minDate: "-1M" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
                ,maxDate: "+1M" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)                    
            });
       		 
	   		$("#gameDate").datepicker({
	   			dateFormat: "yy-mm-dd"
	   			,showMonthAfterYear: true
	   			,showOtherMonths: true
	   		});
	   	})
	   	
	   	var goUrlList = "/game/gameList";
        var goUrlInst = "/game/gameInst";
        var goUrlUpdt = "/game/gameUpdt";
        var goUrlUel = "/game/gameUele";
        var goUrlDel = "/game/gameDele";
        
        var seq = $("input:hidden[name=gSeq]");
        var form = $("#myForm");
        var formVo = $("form[name=formVo]");
        
        $("#btnSave").on("click", function() {
        	if (seq.val() == "0" || seq.val() == "") {
        		form.attr("action", goUrlInst).submit();
        	} else {
        		form.attr("action", goUrlUpdt).submit();
        	}
		});
        
        $("#btnList").on("click", function(){
    		formVo.attr("action", goUrlList).submit();
    	});        

		$("#btnUel").on("click", function() {
			DelValidation("#delBtn", goUrlUel, "선택하신 게시물을 삭제하시겠습니까?");
		})
		
		$("#btnDel").on("click", function() {
			DelValidation("#delBtn", goUrlDel, "선택하신 게시물을 진짜로 삭제하시겠습니까?");		
		})
		
		DelValidation = function(confirm, url, msg) {
			$(".modal-body").html(msg);
			$(confirm).on("click", function() {
				form.attr("action", url).submit();
			})
		}
	 	
		/* select ajax */
		function setComboBox1(o){
			var code = o.value;
			
			$("option").remove(".select");
			$("option").remove(".select1");
			$("option").remove(".select2");
			$("option").remove(".select3");

   			$.ajax({
   				async: true 
   				,cache: false
   				,type: "post"
   				/* ,dataType:"json" */
   				,url: "/game/abroad"
   				/* ,data : $("#formLogin").serialize() */
   				,data : { "gAbroadNy" : code }
   				,success: function(response) {
   					   					
   					<c:set var="listCodeEvent" value="${CodeServiceImpl.selectListCachedCode('5') }" />
					var arr = new Array();
					<c:forEach items="${listCodeEvent}" var="listEvent" varStatus="statusEvent">
						arr.push({
							num : "${listEvent.ccSeq}"
							,name : "${listEvent.ifccName}"
						});
					</c:forEach>
					for(var i=0; i<response.event.length; i++){
						 var list = response.event[i];
						 var num =0;
						 for(var j=0; j<arr.length; j++){
							 if(list.event == arr[j].num){
						 		 list.event = arr[j].name;
						 		 num = arr[j].num
							 }
						 }
						 $("#gEvent").append('<option class="select" value="' + num +'" <c:if test="${'+ list.event +'eq '+ num + ' }">selected</c:if>>'+ list.event+'</option>')
					}                                                                                                                                                                              
   				}
   				,error : function(jqXHR, textStatus, errorThrown){
   					alert("ajaxUpdate " + jqXHR.textStatus + " : " + jqXHR.errorThrown);
   				}
   			});
	 
		}

		function setComboBox2(o){
			var code = o.value;
			var abroadNy = $("#gAbroadNy").val();
			
			$("option").remove(".select1");
			$("option").remove(".select2");
			$("option").remove(".select3");

   			$.ajax({
   				async: true 
   				,cache: false
   				,type: "post"
   				/* ,dataType:"json" */
   				,url: "/game/event"
   				/* ,data : $("#formLogin").serialize() */
   				,data : { "event" : code, "gAbroadNy" : abroadNy }
   				,success: function(response) {
   					
   					<c:set var="listCodeLeague" value="${CodeServiceImpl.selectListCachedCode('6') }" />
					var arr = new Array();
					<c:forEach items="${listCodeLeague}" var="listLeague" varStatus="statusLeague">
						arr.push({
							num : "${listLeague.ccSeq}"
							,name : "${listLeague.ifccName}"
						});
					</c:forEach>
					for(var i=0; i<response.league.length; i++){
						 var list = response.league[i];
						 var num =0;
						 for(var j=0; j<arr.length; j++){
							 if(list.league == arr[j].num){
						 		 list.league = arr[j].name;
						 		 num = arr[j].num
							 }
						 }
						 $("#gLeague").append('<option class="select1" value="' + num +'" <c:if test="${'+ list.league +'eq '+ num + ' }">selected</c:if>>'+ list.league+'</option>')
					}   
   				}
   				,error : function(jqXHR, textStatus, errorThrown){
   					alert("ajaxUpdate " + jqXHR.textStatus + " : " + jqXHR.errorThrown);
   				}
   			});
	 
		}

		function setComboBox3(o){
			var code = o.value;
			var abroadNy = $("#gAbroadNy").val();
			var event = $("#gEvent").val();
			
			$("option").remove(".select3");

			$.ajax({
   				async: true 
   				,cache: false
   				,type: "post"
   				/* ,dataType:"json" */
   				,url: "/game/league"
   				/* ,data : $("#formLogin").serialize() */
   				,data : { "league" : code, "event" : event, "gAbroadNy" : abroadNy  }
   				,success: function(response) {
   					
   					<c:set var="listCodeTeam" value="${CodeServiceImpl.selectListCachedCode('7') }" />
					var arr = new Array();
					<c:forEach items="${listCodeTeam}" var="listTeam" varStatus="statusTeam">
						arr.push({
							num : "${listTeam.ccSeq}"
							,name : "${listTeam.ifccName}"
						});
					</c:forEach>
					for(var i=0; i<response.teamName.length; i++){
						 var list = response.teamName[i];
						 var num =0;
						 for(var j=0; j<arr.length; j++){
							 if(list.teamName == arr[j].num){
						 		 list.teamName = arr[j].name;
						 		 num = arr[j].num
							 }
						 }
						 $("#team_home").append('<option class="select2" value="' + num +'" <c:if test="${'+ list.teamName +'eq '+ num + ' }">selected</c:if>>'+ list.teamName+'</option>')
						 $("#team_away").append('<option class="select2" value="' + num +'" <c:if test="${'+ list.teamName +'eq '+ num + ' }">selected</c:if>>'+ list.teamName+'</option>')
					}  
   				}
   				,error : function(jqXHR, textStatus, errorThrown){
   					alert("ajaxUpdate " + jqXHR.textStatus + " : " + jqXHR.errorThrown);
   				}
   			});
	 
		}

		function setComboBox4(o){
			var code = o.value;
			var abroadNy = $("#gAbroadNy").val();
			var event = $("#gEvent").val();
			var league = $("#gLeague").val();
			
   			$.ajax({
   				async: true 
   				,cache: false
   				,type: "post"
   				/* ,dataType:"json" */
   				,url: "/game/teamName"
   				/* ,data : $("#formLogin").serialize() */
   				,data : {"teamName" : code , "league" : league, "event" : event, "gAbroadNy" : abroadNy  }
   				,success: function(response) {
   					
   					<c:set var="listCodeStadium" value="${CodeServiceImpl.selectListCachedCode('8') }" />
					var arr = new Array();
					<c:forEach items="${listCodeStadium}" var="listStadium" varStatus="statusStadium">
						arr.push({
							num : "${listStadium.ccSeq}"
							,name : "${listStadium.ifccName}"
						});
					</c:forEach>
					for(var i=0; i<response.stadium.length; i++){
						 var list = response.stadium[i];
						 var num =0;
						 for(var j=0; j<arr.length; j++){
							 if(list.stadium == arr[j].num){
						 		 list.stadium = arr[j].name;
						 		 num = arr[j].num
							 }
						 }
						 $("#stadium").append('<option class="select3" value="' + num +'" <c:if test="${'+ list.stadium +'eq '+ num + ' }">selected</c:if>>'+ list.stadium+'</option>')
					}  
   				}
   				,error : function(jqXHR, textStatus, errorThrown){
   					alert("ajaxUpdate " + jqXHR.textStatus + " : " + jqXHR.errorThrown);
   				}
   			});
	 
		}
    </script>
</body>

</html>