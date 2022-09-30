<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="rb" uri="http://www.springframework.org/tags" %>

<jsp:useBean id="CodeServiceImpl" class="com.spopia.infra.modules.code.CodeServiceImpl"/>

<!doctype html>
<html lang="ko">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>ArticleComment List</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
    <link href="/resources/css/xdmin/commentList.css" rel="stylesheet" type="text/css">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
</head>

<body>
	<%String id = (String) session.getAttribute("id");%>
	<%String email = (String) session.getAttribute("email");%>
	<%String seq = (String) session.getAttribute("seq"); %>
	<%String name = (String) session.getAttribute("name"); %>
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
                                            <a class="fs-6 fw-bold" href="#"><c:out value="${sessName }"/><br></a>
                                            <p class="small m-0"><c:out value="${sessEmail }"/><br></p>
                                        </div>
                                    </div>
                                    <hr>
                                </li>
                                <!-- Links -->
                                <c:choose>
									<c:when test="${empty sessUser}">
										<li>
		                                    <a class="dropdown-item bg-danger-soft-hover" id="signOutBtn" href="/">
		                                        <i class="fa-solid fa-power-off me-2"></i>
		                                        Sign in
		                                    </a>
		                                </li>
										<li>
		                                    <a class="dropdown-item bg-danger-soft-hover" id="signOutBtn" href="/">
		                                        <i class="fa-solid fa-power-off me-2"></i>
		                                        Sign up
		                                    </a>
		                                </li>
									</c:when>
									<c:when test="${sessUser eq 25}">
										<li class="ms-3">
                                            <a class="pro_a" role="button" id="editBtn" onclick="goForm(<c:out value="${sessSeq }"/>)" style="cursor: pointer;">
                                                <i class="fa-solid fa-user me-2"></i>
                                                Edit Profile
                                            </a>
                                        </li>
                                        <li class="ms-3">
                                            <a class="pro_a" href="#">
                                                <i class="fa-solid fa-circle-info me-2"></i>
                                                Help
                                            </a>
                                        </li>
                                        <li class="ms-3">
                                            <a class="pro_a" id="signOutBtn" href="/">
                                                <i class="fa-solid fa-power-off me-2"></i>
                                                Sign Out
                                            </a>
                                        </li>
									</c:when>
									<c:otherwise>
										<li>
		                                    <a class="dropdown-item" href="#">
		                                        <i class="fa-solid fa-user me-2"></i>
		                                        Edit Profile
		                                    </a>
		                                </li>
		                                <li>
		                                    <a class="dropdown-item" href="#">
		                                        <i class="fa-solid fa-gear me-2"></i>
		                                        Account Settings
		                                    </a>
		                                </li>
		                                <li>
		                                    <a class="dropdown-item" href="#">
		                                        <i class="fa-solid fa-circle-info me-2"></i>
		                                        Help
		                                    </a>
		                                </li>
		                                <li>
		                                    <a class="dropdown-item bg-danger-soft-hover" id="signOutBtn" href="/">
		                                        <i class="fa-solid fa-power-off me-2"></i>
		                                        Sign Out
		                                    </a>
		                                </li>
									</c:otherwise>
								</c:choose>
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
               	<input type="hidden" name="seq" value="<c:out value="${vo.seq }"/><br>">
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
                                                        <span class="mb-0"><a href="#"><c:out value="${sessName }"/><br></a></span>
                                                        <small><c:out value="${sessId }"/><br></small>
                                                        <small><c:out value="${sessEmail }"/><br></small>
                                                    </div>
                                                    <hr>
                                                    <ul class="nav nav-link-secondary flex-column fw-bold gap-2">
                                                        <li class="nav-item">
                                                            <a class="nav-link" href="/member/memberUView">
                                                                <i class="fa-solid fa-chart-line pe-3"></i>
                                                                <span>계정 정보 상세</span>
                                                            </a>
                                                        </li>
                                                        <li class="nav-item">
                                                            <a class="nav-link" href="/comment/userCommentList">
                                                                <i class="fa-solid fa-users pe-3"></i>
                                                                <span>작성 글</span>
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
                        <!-- 게시물 사진 -->
                        <div class="row">
                            <div class="col-12 ">
                                <div class="card text-white position-relative shadow-lg">
                                    <img src="/resources/images/xdmin/listBack.jpg" class="card-img" style="height: 200px;"
                                        alt="...">
                                    <div class="card-img-overlay text-center p-4 position-absoulte top-50 start-50 translate-middle">
                                        <span class="card-title align-middle fw-bold fs-3">댓글 관리</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- 검색 -->
                        <div class="card p-3 shadow">
                            <div class="row align-items-center pb-2">
                            	<div class="col-2">
                                    <select class="form-select form-select-sm fw-bold" id="shDelNy" name="shDelNy" aria-label=".form-select-sm example">
                                        <option value="0" <c:if test="${vo.shDelNy eq 0 }">selected</c:if>>N</option>
                                        <option value="1" <c:if test="${vo.shDelNy eq 1 }">selected</c:if>>Y</option>
                                    </select>
                                </div>
                                <div class="col-2">
                                    <select class="form-select form-select-sm fw-bold" id="shDate" name="shDate" aria-label=".form-select-sm example">
                                        <option value="" <c:if test="${empty vo.shDate }">selected</c:if> selected>선택</option>
                                        <option value="1" <c:if test="${vo.shDate eq 1 }">selected</c:if>>등록일</option>
                                        <option value="2" <c:if test="${vo.shDate eq 2 }">selected</c:if>>수정일</option>
                                    </select>
                                </div>
                                <div class="col-3">
                                    <input type="text" class="form-control datepicker" id="startDate" name="startDate" value="<c:out value="${vo.startDate }"/>" placeholder="시작일" autocomplete="off">
                                </div>
                                <div class="col-3">
                                    <input type="text" class="form-control datepicker" id="endDate" name="endDate" value="<c:out value="${vo.endDate }"/>" placeholder="종료일" autocomplete="off"s>
                                </div>
                            </div>
                            <div class="row align-items-center">
                                <div class="col-2">
                                    <select class="form-select form-select-sm fw-bold" name="shOption" aria-label=".form-select-sm example">
                                        <option value="" <c:if test="${empty vo.shOption }"> selected</c:if>>선택</option>
                                        <option value="1" <c:if test="${vo.shOption eq 1}"> selected</c:if>>이름</option>
                                        <option value="2" <c:if test="${vo.shOption eq 2}"> selected</c:if>>아이디</option>
                                    </select>
                                </div>
                                <div class="col-2">
                                    <input type="text" class="form-control" id="validationCustom01" name="shValue" value="<c:out value="${vo.shValue }"/>" autocomplete="off">
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
                        <span style="margin: 0; padding: 0; font-weight: 800;">Total : ${vo.totalRows }</span>
                        <div class="card ps-3 pt-3 pe-3 shadow">
                            <table class="table text-center align-middle">
                                <thead>
                                    <tr>
                                        <th style="font-size: small;"><input class="form-check-input" type="checkbox" value=""
                                                id="flexCheckDefault"></th>
                                        <th>번호</th>
                                        <th>이름</th>
                                        <th>성별</th>
                                        <th>아이디</th>
                                        <th>내용</th>
                                        <th>등록일</th>
                                        <th>수정일</th>
                                    </tr>
                                </thead>
                                <tbody>
                                	<c:set var="listCodeGender" value="${CodeServiceImpl.selectListCachedCode('2') }" />
                                	<c:choose>
                                		<c:when test="${fn:length(list) eq 0}">
                                			<tr>
                                				<td class="text-center" colspan="8">There is no data!</td>
                                			</tr>
                                		</c:when>
                                		<c:otherwise>
	                                		<c:forEach items="${list}" var="list" varStatus="status">
												<tr>
			                                        <td onclick="event.cancelBubble=true"><input class="form-check-input" type="checkbox" value=""
                                                id="flexCheckDefault">
			                                        </td>
			                                        <td><c:out value="${vo.totalRows - ((vo.thisPage - 1) * vo.rowNumToShow + status.index) }"/></td>
			                                        <td><a href="/article/articleXdminView?seq=<c:out value="${list.seq }"/>">${list.name }</a></td>
			                                        <td>
			                                        	<c:forEach items="${listCodeGender}" var="listGender" varStatus="statusGender">
															<c:if test="${list.gender eq listGender.ccSeq}"><c:out value="${listGender.ifccName }"/></c:if>
														</c:forEach>
			                                        </td>
			                                        <td>${list.id }</td>
			                                        <td>${list.comment }</td>
			                                        <td>${list.createdAt }</td>
			                                        <td>${list.modifiedAt }</td>
			                                    </tr>		
											</c:forEach>
                                		</c:otherwise>
                                	</c:choose>
                                </tbody>
                            </table>
                            <%@include file="../../common/xdmin/includeV1/pagination.jsp" %>
                        </div>
                        <div class="row align-items-center">
                            <div class="col-1">
                                <button class="border-0 btn btn-sm shadow" type="button" data-bs-toggle="modal"
                                    data-bs-target="#deleteModal">
                                    <i class="fa-solid fa-trash fa-lg text-danger"></i>
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
                                                <button type="button" class="btn btn-primary">삭제</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
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
                        <img src="/resources/images/SPOPIA1.png" alt="logo" style="width: 45px;">
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
	   	var goUrlList = "/comment/userCommentList";
	    var form = $("form[name=myForm]");
		
		$("#refresh").on("click", function() {
			$(location).attr("href", goUrlList);
		});
		
		$(function() {
	   		$("#startDate").datepicker({
	   			dateFormat: "yy-mm-dd"
	   			,showMonthAfterYear: true
	   			,showOtherMonths: true
	   		});
	   		$("#endDate").datepicker({
	   			dateFormat: "yy-mm-dd"
	      			,showMonthAfterYear: true
	      			,showOtherMonths: true
	      		});
	   	});
	   	
	   	goList = function(thisPage) {
			$("input:hidden[name=thisPage]").val(thisPage);
			form.attr("action", goUrlList).submit();			
		};
		
		$("button[name=signOutBtn]").on("click", function() {
			$.ajax({
				type: "POST"
				,url: "logout"
				,data: {}
				,success : function(response) {
					location.reload();
				}
			});
		});
		
   </script>
</body>

</html>