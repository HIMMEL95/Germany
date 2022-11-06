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
    <link rel="shortcut icon" href="https://cdn-icons-png.flaticon.com/512/6646/6646786.png" type="image/x-icon">
    <title>memberUMod</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
    <link href="/resources/css/user/memberUMod.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
	<link rel="stylesheet" href="/resources/demos/style.css">
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
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
                            <a class="p-0" onclick="goUrlList(${sessSeq})" id="profileDropdown" role="button"
                                data-bs-auto-close="outside" data-bs-display="static" data-bs-toggle="dropdown"
                                aria-expanded="false">
                                <c:choose>
                               		<c:when test="${empty sessImg }">
	                                	<img class="avatar-img rounded-circle" src="/resources/images/diano.jpg" alt="avatar" style="width: 35px;">
                               		</c:when>
                               		<c:otherwise>
	                                    <img class="avatar-img rounded-circle" src="${sessImg }" alt="avatar" style="width: 35px;">		                                		
                               		</c:otherwise>
                               	</c:choose>
                            </a>
                            <ul class="dropdown-menu dropdown-animation dropdown-menu-end shadow pt-3"
                                aria-labelledby="profileDropdown">
                                <!-- Profile info -->
                                <li class="px-3">
                                    <div class="d-flex align-items-center">
                                        <!-- Avatar -->
                                        <div class="avatar ps-1 me-3">
                                            <c:choose>
                                        		<c:when test="${empty sessImg }">
                                        			<img class="avatar-img rounded-circle" src="/resources/images/diano.jpg" alt="avatar" style="width: 35px;">
                                        		</c:when>
                                        		<c:otherwise>
		                                            <img class="avatar-img rounded-circle shadow" src="${sessImg }" alt="avatar" style="width: 35px;">
                                        		</c:otherwise>
                                        	</c:choose>
                                        </div>
                                        <div>
                                            <a class="fs-6 fw-bold" onclick="goUrlList(${sessSeq})"><c:out value="${sessName }"/></a>
                                            <p class="small m-0"><c:out value="${sessEmail }"/></p>
                                        </div>
                                    </div>
                                    <hr>
                                </li>
                                <!-- Links -->
                                <c:choose>
									<c:when test="${sessUser eq 25}">
										<li class="ms-3">
                                            <a class="dropdown-item" role="button" id="editBtn" onclick="goForm(${sessSeq })" style="cursor: pointer;">
                                                <i class="fa-solid fa-user me-2"></i>
                                                Edit Profile
                                            </a>
                                        </li>
                                        <!-- <li class="ms-3">
                                            <a class="dropdown-item" href="#">
                                                <i class="fa-solid fa-circle-info me-2"></i>
                                                Help
                                            </a>
                                        </li> -->
                                        <li class="ms-3">
                                            <button class="dropdown-item" id="signOutBtn">
                                                <i class="fa-solid fa-power-off me-2"></i>
                                                Sign Out
                                            </button>
                                        </li>
									</c:when>
									<c:otherwise>
										<li>
		                                    <a class="pro_a dropdown-item" role="button" id="editBtn" onclick="goForm(${sessSeq })" style="cursor: pointer;">
                                                <i class="fa-solid fa-user me-2"></i>
                                                Edit Profile
                                            </a>
		                                </li>
		                                <li>
		                                    <a class="dropdown-item" href="/member/memberList">
		                                        <i class="fa-solid fa-gear me-2"></i>
		                                        Admin Settings
		                                    </a>
		                                </li>
		                               <!--  <li>
		                                    <a class="dropdown-item" href="#">
		                                        <i class="fa-solid fa-circle-info me-2"></i>
		                                        Help
		                                    </a>
		                                </li> -->
		                                <li>
		                                    <button class="dropdown-item bg-danger-soft-hover" id="signOutBtn">
		                                        <i class="fa-solid fa-power-off me-2"></i>
		                                        Sign Out
		                                    </button>
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
				<input type="hidden" name="seq" value='<c:out value="${sessSeq}"></c:out>'>
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
                                                        <a onclick="goUrlList(${sessSeq})"><img class="avatar-img rounded border border-white border-3"
                                                                src="/resources/images/diano.jpg" style="width: 50px;" alt=""></a>
                                                    </div>
                                                    <div class="mt-2 mb-4">
                                                        <span class="mb-0"><a onclick="goUrlList(${sessSeq})"><c:out value="${sessName }"/></a></span>
                                                        <small><c:out value="${sessId }"/></small><br>
                                                        <small><c:out value="${sessEmail }"/></small>
                                                    </div>
                                                    <hr>
                                                    <ul class="nav nav-link-secondary flex-column fw-bold gap-2">
                                                        <li class="nav-item">
                                                            <a class="nav-link" onclick="goForm(${sessSeq})">
                                                                <i class="fa-solid fa-chart-line pe-3"></i>
                                                                <span>계정 정보 상세</span>
                                                            </a>
                                                        </li>
                                                        <li class="nav-item">
                                                            <a class="nav-link" onclick="goComment(${sessSeq})">
                                                                <i class="fa-solid fa-users pe-3"></i>
                                                                <span>작성 글</span>
                                                            </a>
                                                        </li>
                                                        <!-- <li class="nav-item">
                                                            <a class="nav-link" href="/comment/userCommentList">
                                                                <i class="fa-solid fa-users pe-3"></i>
                                                                <span>비밀번호 변경</span>
                                                            </a>
                                                        </li>
                                                        <li class="nav-item">
                                                            <a class="nav-link" href="/comment/userCommentList">
                                                                <i class="fa-solid fa-users pe-3"></i>
                                                                <span>탈퇴하기</span>
                                                            </a>
                                                        </li> -->
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
                                            </a>
                                        </p>
                                    </div>
                                </div>
                            </nav>
                        </nav>
                    </div>
                    <!-- 중앙 메인 영역 -->
                    <div class="col-md-8 col-lg-9 vstack gap-4">
                        <span class="fs-1 fw-bold text-center">회원 정보 ${sessId }</span>
                        <div class="row mb-4">
                            <div class="col-12 shadow rounded pt-3 ps-4" style="height: 100px; background-color: #f7f7fc;">
                            	<div class="row" style="align-items: center; margin: auto 0;">
                            		<div class="col-2">
                            			<c:choose>
		                            		<c:when test="${empty sessImg }">
				                                <img src="/resources/images/diano.jpg" class="rounded-circle avatar-img shadow" style="width: 60px;">
		                            		</c:when>
		                            		<c:otherwise>
				                                <img src="${sessImg }" class="rounded-circle avatar-img shadow" style="width: 60px;">
		                            		</c:otherwise>
		                            	</c:choose>
		                                <div class="form-attachment-btn btn btn-primary btn-sm ms-3" hidden>
		                                    <i class="fa-solid fa-arrows-rotate me-2"></i>Upload photo
		                                    <input type="file" class="js-file-attach form-attachment-btn-label" id="avatarUploader">
		                                </div>
                            		</div>
                            	</div>
                            </div>
                        </div>
                        <div class="card ps-5 pe-5 pt-4 pb-4 shadow" style="background-color: #f7f7fc;"">
                                        <div class=" row mb-4">
                            <div class="col">
                                <label for="name" class="form-label fw-bold">이름</label>
                                <input type="text" class="form-control bg-white" id="name" name="name" value="<c:out value="${item.name }"/>">
                            </div>
                            <div class="col">
                                <c:choose>
                                	<c:when test="${sessSns eq 0 }">
		                                <label for="id" class="form-label fw-bold">아이디</label>
		                                <input type="text" class="form-control bg-white" id="id" name="id" value="<c:out value="${item.id }"/>" readonly>
                                	</c:when>
                                	<c:otherwise>
                                		<c:choose>
	                                		<c:when test="${sessId == '네이버로그인' or sessId == '카카오로그인' }">
				                                <div class="input-control">
						                            <label for="id" class="form-label fw-bold">아이디</label>
						                            <input type="hidden" id="idAllowedNy" name="idAllowedNy" value="0">
						                            <input id="id" name="id" type="text" class="form-control bg-white" value="<c:out value="${item.id }"/>" autocomplete="off"> 
						                            <div class="msg" id="id_msg" name="id_msg" style="display: none;"></div>
						                        </div>
	                                		</c:when>
	                                		<c:otherwise>
				                                <label for="id" class="form-label fw-bold">아이디</label>
				                                <input type="text" class="form-control bg-white" id="id" name="id" value="<c:out value="${item.id }"/>" readonly>
	                                		</c:otherwise>
                                		</c:choose>
                                	</c:otherwise>
                                </c:choose>
                            </div>
                        </div>
                        <div class="row mb-4">
                            <div class="col">
                                <label for="dob" class="form-label fw-bold">생년월일</label>
                                <input type="text" class="form-control bg-white datepicker" id="dob" name="dob" value="<c:out value="${item.dob }"/>">
                            </div>
                            <div class="col">
                                <label for="email" class="form-label fw-bold">이메일</label>
                                <input type="email" class="form-control bg-white" id="email" name="email" value="<c:out value="${item.email }"/>">
                            </div>
                        </div>
                        <div class="row mb-4">
                            <div class="col">
                                <label for="tel" class="form-label fw-bold">전화번호</label>
                                <input type="tel" class="form-control bg-white" id="tel" name="phone" value="<c:out value="${item.phone }"/>">
                            </div>
                            <div class="col">
                                <label for="gender" class="form-label fw-bold">성별</label>
                                <c:set var="listCodeGender" value="${CodeServiceImpl.selectListCachedCode('2') }" />
                                <select class="form-select form-select-lg fs-6 bg-white" id="gender" name="gender" aria-label=".form-select-lg example">
                                    <c:forEach items="${listCodeGender}" var="listGender" varStatus="statusGender">
                                    	<option value="${listGender.ccSeq }" <c:if test="${item.gender eq listGender.ccSeq}">selected</c:if>><c:out value="${listGender.ifccName }"/></option>
									</c:forEach>
                                </select>
                            </div>
                        </div>
                        <div class="row mb-4">
                            <div class="col-6">
                                <label for="job" class="form-label fw-bold">직업</label>
                                <input type="text" class="form-control bg-white" id="job" name="job" value="<c:out value="${item.job }"/>">
                            </div>
                        </div>
                        <div class="row">
		               		<h3 class="text-bold mb-3">좋아하는 팀 <span style="color: red;">*</span></h3>
		               		<div class="col-6">
		                        <div class="input-control">
		                        	<c:set var="listCodeAbroad" value="${CodeServiceImpl.selectListCachedCode('4') }" />
		                            <label for="gAbroadNy" class="form-label fw-bold">해외여부</label>
		                            <select class="form-select" id="gAbroadNy" name="gAbroadNy" onchange="setComboBox1(this)" aria-label=".form-select example">
		                                <option value="" >선택</option>
		                                <c:choose>
		                                	<c:when test="${empty gItem.seq }">
		                                		<c:forEach items="${listCodeAbroad}" var="listAbroad" varStatus="statusAborad">
													<option value="${listAbroad.ccSeq }" <c:if test="${gItem.abroadNy eq listAbroad.ccSeq}">selected</c:if>><c:out value="${listAbroad.ifccName }"/></option>
												</c:forEach>
		                                	</c:when>
		                                	<c:otherwise>
		                                		<c:forEach items="${listCodeAbroad}" var="listAborad" varStatus="statusAborad">
													<option value="${gItem.abroadNy }" <c:if test="${gItem.abroadNy eq listAbroad.ccSeq}">selected</c:if>><c:out value="${listAbroad.ifccName }"/></option>
												</c:forEach>
		                                	</c:otherwise>
		                                </c:choose>
		                            </select>
		                            <div class="msg" id="gAbroadNy_msg" name="gAbroadNy_msg" style="display: none;"></div>
		                        </div>
		                    </div>
		               		<div class="col-6">
		                        <div class="input-control">
		                        	<c:set var="listCodeEvent" value="${CodeServiceImpl.selectListCachedCode('5') }" />
		                            <label for="gEvent" class="form-label fw-bold">종목</label>
		                            <select class="form-select" id="gEvent" name="gEvent" onchange="setComboBox2(this)" aria-label=".form-select example">
		                                <option value="" >선택</option>
		                                <c:choose>
		                                	<c:when test="${empty gItem.gSeq }">
		                                		<c:forEach items="${listCodeEvent}" var="listEvent" varStatus="statusEvent">
													<option class="select" value="${listEvent.ccSeq }" <c:if test="${gItem.gEvent eq listEvent.ccSeq}">selected</c:if>><c:out value="${listEvent.ifccName }"/></option>
												</c:forEach>
		                                	</c:when>
		                                	<c:otherwise>
		                                		<c:forEach items="${listCodeEvent}" var="listEvent" varStatus="statusEvent">
													<option class="select" value="${gItem.gEvent }" <c:if test="${gItem.gEvent eq listEvent.ccSeq}">selected</c:if>><c:out value="${listEvent.ifccName }"/></option>
												</c:forEach>
		                                	</c:otherwise>
		                                </c:choose>
		                            </select>
		                            <div class="msg" id="gEvent_msg" name="gEvent_msg" style="display: none;"></div>
		                        </div>
		                    </div>
		               	</div>
		               	<div class="row mt-4">
		               		<div class="col-6">
		                        <div class="input-control">
		                        	<c:set var="listCodeLeague" value="${CodeServiceImpl.selectListCachedCode('6') }" />
		                            <label for="gLeague" class="form-label fw-bold">리그</label>
		                            <select class="form-select" id="gLeague" name="gLeague" onchange="setComboBox3(this)" aria-label=".form-select example">
		                                <option value="">선택</option>
		                                <c:forEach items="${listCodeLeague}" var="listLeague" varStatus="statusLeague">
											<option class="select1" value="${listLeague.ccSeq }" <c:if test="${gItem.gLeague eq listLeague.ccSeq}">selected</c:if>><c:out value="${listLeague.ifccName }"/></option>
										</c:forEach>
		                            </select>
		                            <div class="msg" id="gLeague_msg" name="gLeague_msg" style="display: none;"></div>
		                        </div>
		                    </div>
		               		<div class="col-6">
		                        <div class="input-control">
		                        	<c:set var="listCodeTeam" value="${CodeServiceImpl.selectListCachedCode('7') }" />
		                            <label for="team_home" class="form-label fw-bold">팀</label>
		                            <select class="form-select" id="team" name="team" onchange="setComboBox4(this)" aria-label=".form-select example">
		                                <option value="">선택</option>
		                                <c:forEach items="${listCodeTeam}" var="listTeam" varStatus="statusTeam">
											<option class="select2" value="${gItem.team }" <c:if test="${gItem.team eq listTeam.ccSeq}">selected</c:if>><c:out value="${listTeam.ifccName }"/></option>
										</c:forEach>
		                            </select>
		                            <div class="msg" id="team_msg" name="team_msg" style="display: none;"></div>
		                        </div>
		                    </div>
		               	</div>
                        <hr>
                        <div class="row mb-4">
                            <div class="col-6">
                                <label for="zip" class="form-label fw-bold">우편번호</label>
                                <input type="text" class="form-control bg-white" id="zip" name="zip" value="<c:out value="${item.zip }"/>">
                            </div>
                            <div class="col-6">
		                        <div class="row">
		                        	<div style="height: 21px;"></div>
		                            <div class="col-6">
		                                <button type="button" id="searchBtn" class="btn fw-bold text-white certification"
		                                    style="background-color: #03c75a;">주소검색</button>
		                                <button id="refresh" class="btn btn-danger fw-bold btn-sm shadow" type="button">
		                                        <i class="fa-solid fa-arrow-rotate-right"></i>
		                                </button>
		                            </div>
		                        </div>
		                    </div>
                        </div>
                        <div class="row mb-4">
                            <div class="col">
                                <label for="address" class="form-label fw-bold">주소</label>
                                <input type="text" class="form-control bg-white" id="address" name="address" value="<c:out value="${item.address }"/>">
                            </div>
                        </div>
                        <div class="row mb-4">
                            <div class="col">
                                <label for="addressDetail" class="form-label fw-bold">상세주소</label>
                                <input type="text" class="form-control bg-white" id="address_detail" name="address_detail" value="<c:out value="${item.address_detail }"/>">
                            </div>
                            <div class="col">
                                <label for="extraAddress" class="form-label fw-bold">참고항목</label>
                                <input type="text" class="form-control bg-white" id="extraAddress" name="extraAddress" value="<c:out value="${item.address_detail }"/>">
                            </div>
                        </div>
                        <div class="row">
		                	<div class="col">
		                		<div id="wrap" style="display:none;border:1px solid;width:500px;height:300px;margin:5px 0;position:relative">
									<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnFoldWrap" style="cursor:pointer;position:absolute;right:0px;top:-1px;z-index:1;width: 20px;" onclick="foldDaumPostcode()" alt="접기 버튼">
								</div>
		                	</div>
		                </div>
                        <div class="row">
                            <div class="col-2">
                                <button class="btn btn-primary text-white fw-bold btn-sm shadow" id="btnList" type="button">뒤로</button>
                            </div>
                            <div class="col-2 offset-8" align="right">
                                <button class="btn btn-primary text-white fw-bold btn-sm shadow" id="btnSave" type="button">등록</a>
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
    <!-- kakao zip s -->
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <!-- <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ec2655da82c3779d622f0aff959060e6&libraries=services"></script> -->
    <!-- kakao zip e -->
    <script type="text/javascript">
    	var goUrlList = "/member/memberUView";
    	var goUrlUpdt = "/member/memberUpdt";
    	var goUrlComment = "/comment/userCommentList";
    	var form = $("#myForm");
    	
    	goForm = function(keyValue) {
			form.attr("action", goUrlList).submit();
		}
    	
    	goComment = function(keyValue) {
			form.attr("action", goUrlComment).submit();
		}
    	$("#btnSave").on("click", function() {
			form.attr("action", goUrlUpdt).submit();
		});
    	
    	$("#btnList").on("click", function() {
			window.history.back();
		});
    	
    	$("#signOutBtn").on("click", function() {
			$.ajax({
				type: "POST"
				,url: "/logoutProc"
				,data: {}
				,success : function(response) {
					if (response.rt == "success") {
						window.location.href = "/";
					} else {
						localStorage.clear();
						window.location.href = "/";
						/* window.location.href = "/naverLogout"; */
					}
				}
			});
		});
    	
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
						 $("#team").append('<option class="select2" value="' + num +'" <c:if test="${'+ list.teamName +'eq '+ num + ' }">selected</c:if>>'+ list.teamName+'</option>')
					}  
   				}
   				,error : function(jqXHR, textStatus, errorThrown){
   					alert("ajaxUpdate " + jqXHR.textStatus + " : " + jqXHR.errorThrown);
   				}
   			});
		}
		
		/* kakao zipCode s */
		var element_wrap = document.getElementById('wrap');
        
        function foldDaumPostcode() {
            // iframe을 넣은 element를 안보이게 한다.
            element_wrap.style.display = 'none';
        }
        
        function daumPostCode() {
        	var currentScroll = Math.max(document.body.scrollTop, document.documentElement.scrollTop);
            new daum.Postcode({
                oncomplete: function(data) {
                    // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

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
                    
        			/* var geocoder = new daum.maps.services.Geocoder();
        			
        			geocoder.addressSearch(addr, function(result, status) {
        				if(status === daum.maps.services.Status.OK) {
        					$("#lat").val(result[0].y);
        					$("#long").val(result[0].x);
        				}
        			}); */

                    // iframe을 넣은 element를 안보이게 한다.
                    // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
                    element_wrap.style.display = 'none';

                    // 우편번호 찾기 화면이 보이기 이전으로 scroll 위치를 되돌린다.
                    document.body.scrollTop = currentScroll;
                },
                // 우편번호 찾기 화면 크기가 조정되었을때 실행할 코드를 작성하는 부분. iframe을 넣은 element의 높이값을 조정한다.
                onresize : function(size) {
                    element_wrap.style.height = size.height+'px';
                },
                width : '100%',
                height : '100%'
            }).embed(element_wrap);

            // iframe을 넣은 element를 보이게 한다.
            element_wrap.style.display = 'block';
        	
        };
        
        $("#searchBtn").on("click", function() {
        	daumPostCode();
		});
        
        $("#refresh").on("click", function() {
			$("#zip").val('');
			$("#address").val('');
			$("#extraAddress").val('');
		});
		/* kakao zipCode e */
		
		$(function() {
	   		$("#dob").datepicker({
	   			dateFormat: "yy-mm-dd"
	   			,showMonthAfterYear: true
	   			,showOtherMonths: true
	   		});
	   	});
		
		$("#id").on("focusout", function(){
    		var id = $("#id").val();
    		
   			$.ajax({
   				async: true 
   				,cache: false
   				,type: "post"
   				/* ,dataType:"json" */
   				,url: "/idCheck"
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
		errorValidation = function(input, msg, message) {
        	$(msg).parent().removeClass('success');						
		 	$(msg).parent().addClass('error');
	        $(msg).text(message);
	        $(msg).show();
	        $(input).val('');
	        $(input).focus();
		};
        
        successValidation = function(input, msg, message) {
        	$(msg).parent().removeClass('error');
		 	$(msg).parent().addClass('success');
	        $(msg).text(message);
	        $(msg).show();
		};
    </script>
</body>

</html>