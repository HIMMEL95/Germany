<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="rb" uri="http://www.springframework.org/tags" %>

<!doctype html>
<html lang="ko">
<head>
	<link rel="shortcut icon" href="https://cdn-icons-png.flaticon.com/512/6646/6646786.png" type="image/x-icon">
	<script src="https://kit.fontawesome.com/15c84217dd.js" crossorigin="anonymous"></script>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
    <!-- <link href="/resources/xdmin/css/bootstrap/sidebars.css" rel="stylesheet"> -->
    <!-- user css -->
    <link rel="stylesheet" href="/resources/css/xdmin/cc.css" />
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<!-- datepicker s -->
	<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
	<!-- datepicker e -->
	<title>CodeList</title>
</head>
<body>
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
                                        <div class="avatar1 me-3">
                                            <img class="avatar-img rounded-circle shadow" src="/resources/images/diano.jpg"
                                                alt="avatar" style="width: 30px;">
                                        </div>
                                        <div>
                                            <a class="fs-6 fw-bold" href="#"><c:out value="${sessName }"/></a>
                                            <p class="small m-0"><c:out value="${sessEmail }"/> </p>
                                        </div>
                                    </div>
                                    <hr>
                                </li>
                                <!-- Links -->
                                <li>
                                    <a class="dropdown-item" href="/member/memberUView?seq=${sessSeq }">
                                        <i class="fa-solid fa-user me-2"></i>
                                        Edit Profile
                                    </a>
                                </li>
                               <!--  <li>
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
                                    <a class="dropdown-item bg-danger-soft-hover" id="signOutBtn" >
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
        <div style="height: 100px;"></div>
        <div class="container">
            <form method="post" id="myForm" name="myForm">
             	<input type="hidden" name="thisPage" value="<c:out value="${vo.thisPage }" default="1"/>">
             	<input type="hidden" name="rowNumToShow" value="<c:out value="${vo.rowNumToShow }"/>">
             	<input type="hidden" name="ccSeq" value='<c:out value="${vo.ccSeq }"></c:out>'>
             	<input type="hidden" name="checkboxSeqArray">
             	<input type="hidden" name="pageSeqArray">
                <div class="row g-4">
                    <!-- 좌측 목록 탭 -->
                    <div class="col-lg-3">
                        <!-- Advanced filter responsive toggler START -->
                        <nav class="navbar navbar-expand-lg mx-0">
                            <div class="d-flex align-items-center d-lg-none">
                                <button class="border-0 bg-transparent" type="button" data-bs-toggle="offcanvas"
                                    data-bs-target="#offcanvasSideNavbar" aria-controls="offcanvasSideNavbar">
                                    <i class="btn btn-primary fw-bold fa-solid fa-sliders-h"></i>
                                    <span class="h6 mb-0 fw-bold d-lg-none ms-2">항목</span>
                                </button>
                            </div>
                
                            <nav class="navbar navbar-expand-lg mx-0">
                                <div class="offcanvas offcanvas-start" tabindex="-1" id="offcanvasSideNavbar"
                                    style="visibility: visible; width:250px;" aria-modal="true" role="dialog">
                                    <div class="offcanvas-header">
                                        <button type="button" class="btn-close text-reset ms-auto" data-bs-dismiss="offcanvas"
                                            aria-label="Close"></button>
                                    </div>
                
                                    <div class="offcanvas-body d-block px-2 px-lg-0">
                                        <div class="card overflow-hidden">
                                            <img src="/resources/images/mountains.png" class="card-img-top" alt="background"
                                                style="height: 50px; background-position: center; background-size: cover; background-repeat: no-repeat;">
                                            <div class="card-body pt-0">
                                                <div class="text-center">
                                                    <div class="avatar avatar-lg mt-n5 mb-3">
                                                        <a href="#"><img class="avatar-img rounded border border-white border-3"
                                                                src="/resources/images/diano.jpg" style="width: 50px;" alt=""></a>
                                                    </div>
                                                    <div class="mt-2 mb-4">
                                                        <span class="mb-0"><a href="/member/memberUView"><c:out value="${sessName }"/></a></span>
                                                        <small><c:out value="${sessId }"/></small><br>
                                                        <small><c:out value="${sessEmail }"/></small>
                                                    </div>
                                                    <hr>
                                                    <ul class="nav nav-link-secondary flex-column fw-bold gap-2">
                                                        <!-- <li class="nav-item">
                                                            <a class="nav-link" href="/dashboard">
                                                                <i class="fa-solid fa-chart-line pe-3"></i>
                                                                <span>Dashboard</span>
                                                            </a>
                                                        </li> -->
                                                        <li class="nav-item">
                                                            <a class="nav-link" href="/member/memberList">
                                                                <i class="fa-solid fa-users pe-3"></i>
                                                                <span>회원관리</span>
                                                            </a>
                                                        </li>
                                                        <li class="nav-item">
                                                            <a class="nav-link" href="/article/articleList">
                                                                <i class="fas fa-light fa-newspaper pe-3"></i>
                                                                <span>게시물 관리</span>
                                                            </a>
                                                        </li>
                                                        <li class="nav-item">
                                                            <a class="nav-link" href="/comment/commentList">
                                                                <i class="fas fa-light fa-comments pe-3"></i>
                                                                <span>댓글 리스트</span>
                                                            </a>
                                                        </li>
                                                        <li class="nav-item">
                                                            <a class="nav-link" href="/game/gameList">
                                                                <i class="fas fa-duotone fa-trophy pe-3"></i>
                                                                <span>경기 기록 관리</span>
                                                            </a>
                                                        </li>
                                                        <li class="nav-item">
                                                            <a class="nav-link" href="/code/codeAjaxList">
                                                                <i class="fas fa-light fa-comments pe-3"></i>
                                                                <span>Code</span>
                                                            </a>
                                                        </li>
                                                        <li class="nav-item">
                                                            <a class="nav-link" href="/codeGroup/codeGroupList">
                                                                <i class="fas fa-duotone fa-trophy pe-3"></i>
                                                                <span>CodeGroup</span>
                                                            </a>
                                                        </li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                        <ul class="nav small mt-4 justify-content-center lh-1">
                                            <li class="nav-item">
                                                <a class="nav-link" href="my-profile-about.html">About</a>
                                            </li>
                                            <li class="nav-item">
                                                <a class="nav-link" href="settings.html">Settings</a>
                                            </li>
                                            <li class="nav-item">
                                                <a class="nav-link" target="_blank" href="https://support.webestica.com/login">Support
                                                </a>
                                            </li>
                                            <li class="nav-item">
                                                <a class="nav-link" target="_blank" href="docs/index.html">Docs </a>
                                            </li>
                                            <li class="nav-item">
                                                <a class="nav-link" href="help.html">Help</a>
                                            </li>
                                            <li class="nav-item">
                                                <a class="nav-link" href="privacy-and-terms.html">Privacy &amp; terms</a>
                                            </li>
                                        </ul>
                                        <p class="small text-center mt-1">©2022 <a class="text-body" target="_blank" href="#"> SPOPIA
                                            </a></p>
                                    </div>
                                </div>
                            </nav>
                        </nav>
                    </div>
                    <!-- 중앙 메인 영역 -->
                    <div class="col-md-8 col-lg-9 vstack gap-4">
                        <h1 style="font-weight: 800;">코드 관리</h1>
                        <!-- 검색 -->
                        <div class="card p-3 shadow">
                            <div class="row align-items-center pb-2">
                                <div class="col-2">
                                    <select class="form-select form-select-sm fw-bold" id="shDelNy" name="shDelNy" aria-label=".form-select-sm example">
                                       	<option value="" <c:if test="${empty vo.shDelNy }">selected</c:if>>선택</option>
                                        <option value="0" <c:if test="${vo.shDelNy eq 0 }">selected</c:if>>N</option>
                                        <option value="1" <c:if test="${vo.shDelNy eq 1 }">selected</c:if>>Y</option>
                                    </select>
                                </div>
                                <div class="col-2">
                                    <select class="form-select form-select-sm fw-bold" id="shDate" name="shDate" aria-label=".form-select-sm example">
                                        <option value="" <c:if test="${empty vo.shDate }">selected</c:if>>선택</option>
                                        <option value="1" <c:if test="${vo.shDate eq 1 }">selected</c:if>>등록일</option>
                                        <option value="2" <c:if test="${vo.shDate eq 2 }">selected</c:if>>수정일</option>
                                    </select>
                                </div>
                                <div class="col-2">
                                    <input type="text" class="form-control" id="startDate" name="startDate" value="<c:out value="${vo.startDate }"/>" placeholder="2022-01-01" autocomplete="off">
                                </div>
                                <div class="col-2">
                                    <input type="text" class="form-control" id="endDate" name="endDate" value="<c:out value="${vo.endDate }"/>" placeholder="2022-12-31" autocomplete="off">
                                </div>
                            </div>
                            <div class="row align-items-center">
                                <div class="col-2">
	                                <select class="form-select form-select-sm fw-bold" id="shOption" name="shOption" aria-label=".form-select-sm example">
                                        <option value="" <c:if test="${empty vo.shOption }">selected</c:if>>선택</option>
                                        <option value="1" <c:if test="${vo.shOption eq 1 }">selected</c:if>>번호</option>
                                        <option value="2" <c:if test="${vo.shOption eq 2 }">selected</c:if>>이름</option>
                                        <option value="3" <c:if test="${vo.shOption eq 3 }">selected</c:if>>CG번호</option>
                                    </select>
                                </div>
                                <div class="col-2">
                                    <input type="text" class="form-control" id="shValue" name="shValue" value="<c:out value="${vo.shValue }"/>" autocomplete="off">
                                </div>
                                <div class="col-2">
                                    <button class="btn btn-warning fw-bold btn-sm shadow" type="submit">
                                        <i class="fa-solid fa-magnifying-glass"></i>
                                    </button>
                                    <button id="refresh" class="btn btn-danger fw-bold btn-sm shadow" type="button">
                                        <i class="fa-solid fa-arrow-rotate-right"></i>
                                    </button>
                                </div>
                            </div>
                        </div>
                        <!-- 리스트 -->
                        <div id="lita"></div>
                        <%-- <span style="margin: 0; padding: 0; font-weight: 800;">Total : ${vo.totalRows }</span>
                        <div class="card ps-3 pt-3 pe-3 shadow">
                            <table class="table text-center align-middle">
                                <thead>
                                    <tr>
                                        <th style="font-size: small;">
                                        	<input class="form-check-input" type="checkbox" value="" id="checkboxAll">
                                        </th>
                                        <th>#</th>
                                        <th>코드그룹 코드</th>
                                        <th>코드그룹 이름(한글)</th>
                                        <th>코드</th>
                                        <th>대체 코드</th>
                                        <th>코드 이름(한글)</th>
                                        <th>코드 이름(영문)</th>
                                        <th>사용</th>
                                        <th>순서</th>
                                        <th>등록일</th>
                                        <th>수정일</th>
                                    </tr>
                                </thead>
                                <tbody onclick="newPage()">
                                	<c:choose>
                                		<c:when test="${fn:length(list) eq 0}">
                                			<tr>
                                				<td class="text-center" colspan="12">There is no data!</td>
                                			</tr>
                                		</c:when>
                                		<c:otherwise>
                                			<c:forEach items="${list}" var="list" varStatus="status">
												<tr onclick="goForm(<c:out value="${list.ccSeq }"/>)" style="cursor: pointer;">
			                                        <td onclick="event.cancelBubble=true">
			                                        	<input class="form-check-input" type="checkbox" value="${list.ccSeq }" id="checkboxSeq" name="checkboxSeq">
			                                        </td>
			                                        <td><c:out value="${vo.totalRows - ((vo.thisPage - 1) * vo.rowNumToShow + status.index) }"/></td>
			                                        <td>${list.ccgSeq}</td>
			                                        <td>${list.ifcgName}</td>
			                                        <td>${list.ccSeq }</td>
			                                        <td>${list.ifccAnother }</td>
			                                        <td>${list.ifccName}</td>
			                                        <td>${list.ifccNameEng }</td>
			                                        <td>${list.ifccUseNy}</td>
			                                        <td>${list.ifccOrder}</td>
			                                        <td>${list.createdAt }</td>
			                                        <td>${list.modifiedAt }</td>
			                                    </tr>		
											</c:forEach>
                                		</c:otherwise>
                                	</c:choose>
                                </tbody>
                            </table>
                            <%@include file="../../common/xdmin/includeV1/pagination.jsp" %>
                        </div> --%>
                        <div class="row align-items-center">
                            <div class="col-2">
                                <button id="btnUel" value="" class="border-0 btn btn-sm bg-danger shadow" type="button" data-bs-toggle="modal"
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
                            </div>
                            <div class="col-2 offset-8" align="right">
                                <button class="border-0 btn btn-sm bg-success shadow" type="button" id="excelBtn">
                                    <i class="fa-regular fa-file-excel" style="color: white;"></i>
                                </button>
                                <a class="border-0 btn btn-sm shadow bg-primary" role="button" href="/code/codeForm">
                                    <i class="fa-regular fa-plus fa-1x" style="color: white;"></i>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
        <div style="height: 50px;">
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
                        <img src="../../resources/images/SPOPIA1.png" alt="logo" style="width: 45px;">
                    </a>
                    <span class="text">Copyright</span>
                    <span class="corp">© SPOPIA Corp.</span>
                    <span class="text">All Rights Reserved.</span>
                </div>
            </div>
        </div>
    </footer>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2"
        crossorigin="anonymous"></script>
    <script src="https://kit.fontawesome.com/1d32d56af5.js" crossorigin="anonymous"></script>
    <script type="text/javascript">
    
    	$(document).ready(function() {
    		setLita();
		});
    	
    	var goUrlForm = "/code/codeForm";
	    var goUrlList = "/code/codeAjaxList";
	    var goUrlLita = "/code/codeAjaxLita";
	    var goUrlMultiUele = "/code/codeMultiUele";
	    var goUrlMultiDele = "/code/codeMultiDele";
	    var excelUri = "/code/excelDownload";
	    
	    var form = $("form[name=myForm]");
		
		$("#refresh").on("click", function() {
			$(location).attr("href", goUrlList);
		});
		
		$(function() {
	   		$("#startDate, #endDate").datepicker({
	   			dateFormat: "yy-mm-dd"
	   			,showMonthAfterYear: true
	   			,showOtherMonths: true
	   		});
	   	})
	   	
	   	goList = function(thisPage) {
			$("input:hidden[name=thisPage]").val(thisPage);
			form.attr("action", goUrlList).submit();			
		}
		
		var seq = $("input:hidden[name=ccSeq]");
		
		$('#btnForm').on("click", function() {
			goForm(0);
		})
		
		goForm = function(keyValue) {
			seq.val(keyValue);
			form.attr("action", goUrlForm).submit();
		}
		
		$("#excelBtn").on("click", function() {
			form.attr("action", excelUri).submit();
		});
		
		$("#btnUel").on("click", function() {
			if ($("input[name=checkboxSeq]:checked").length > 0) {
				DelValidation("#delBtn", goUrlMultiUele, "선택하신 게시물을 삭제하시겠습니까?");
			} else {
				DelValidation("#delBtn", goUrlMultiUele, "데이터를 선택해 주세요!!");
				$("#delBtn").hide();
			}
		})
		
		$("#btnDel").on("click", function() {
			if ($("input[name=checkboxSeq]:checked").length > 0) {
				DelValidation("#delBtn", goUrlMultiDele, "선택하신 게시물을 진짜로 삭제하시겠습니까?");	
			} else {
				DelValidation("#delBtn", goUrlMultiDele, "데이터를 선택해 주세요!!");
				$("#delBtn").hide();
			}
		})
		
		DelValidation = function(confirm, url, msg) {
			$(".modal-body").html(msg);
			$(confirm).on("click", function() {
				$("input[name=checkboxSeq]:checked").each(function() { 
					checkboxSeqArray.push($(this).val());
				});
				
				$("input:hidden[name=checkboxSeqArray]").val(checkboxSeqArray);
				
				form.attr("action", url).submit();
			})
		}
		
		/* checkbox delete s */
		var checkboxSeqArray = [];
		
		$("#checkboxAll").click(function() {
			if($("#checkboxAll").is(":checked")) $("input[name=checkboxSeq]").prop("checked", true);
			else $("input[name=checkboxSeq]").prop("checked", false);
		});
		
		$("input[name=checkboxSeq]").click(function() {
			var total = $("input[name=checkboxSeq]").length;
			var checked = $("input[name=checkboxSeq]:checked").length;
			
			if(total != checked) $("#checkboxAll").prop("checked", false);
			else $("#checkboxAll").prop("checked", true); 
		});
		/* checkbox delete e */
		
		/* lita ajax s */
		var pageSeqArray = ['1'];
		
		function setLita() {
			$.ajax({
				async: true 
				,cache: false
				,type: "post"
				/* ,dataType:"json" */
				,url: goUrlLita
				,data : $("#myForm").serialize()
				/* ,data : {  } */
				,success: function(response) {
					$("#lita").empty();
					$("#lita").append(response);
					/* window.location.hash = '#page' + page;
					page++; */
					/* window.history.back() */
		
					$(".page-item").on("click", function() {
						console.log("text : "+$(this).text())
						console.log("thisPage : "+$("input[name=thisPage]").val())
						pageSeqArray.push($(this).text())
						console.log(pageSeqArray);
					})
					
				 	window.history.pushState(null, '', location.href);
 
					window.onpopstate = function() {
						if (pageSeqArray.length > 0) {
							alert(pageSeqArray[pageSeqArray.length -2])
							goList(pageSeqArray[pageSeqArray.length -2])
							console.log(pageSeqArray);
							pageSeqArray.push(pageSeqArray[pageSeqArray.length -2])
						} else {
							window.history.back()
						}
					}
					
					
					/* window.onpopstate = function(event) {  //뒤로가기 이벤트를 캐치합니다.
						alert("sdasdasda");
						if (pageSeqArray.length > 0) {
							console.log(pageSeqArray[pageSeqArray.length -1])
							goList(pageSeqArray[pageSeqArray.length -1]);
						} else {
							window.history.back()
						}
					}; */

					/* window.onpageshow = function(event) {
						if (event.persisted) {
							alert(window.history.length);
							console.log(window.history);
							console.log(document.referrer);
							
						}
					} */
	
				}
				,error : function(jqXHR, textStatus, errorThrown){
					alert("ajaxUpdate " + jqXHR.textStatus + " : " + jqXHR.errorThrown);
				}
			});
		}
		
		/* lita ajax e */
   </script>
</body>
</html>