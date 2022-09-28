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
    <title>memberView</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
    <link href="/resources/css/xdmin/dashboard.css" rel="stylesheet" type="text/css">
</head>

<body>
    <header class="navbar-light fixed-top header-static bg-mode align-items-center">
        <!-- 상단 -->
        <nav class="navbar navbar-expand-lg">
            <div class="container px-3 px-xl-5 pt-1">
                <!-- Logo START -->
                <a class="navbar-brand" href="/sportMain">
                    <img class="light-mode-item navbar-brand-item" src="../../resources/images/SPOPIA_white.png" alt="logo"
                        style="width: 90px;">
                </a>
                <!-- Profile START -->
                <div class="dropdown">
                    <ul class="nav flex-nowrap align-items-center ms-sm-3 list-unstyled">
                        <li class="me-2">
                            <a class="p-0" href="/member/memberView" id="profileDropdown" role="button"
                                data-bs-auto-close="outside" data-bs-display="static" data-bs-toggle="dropdown"
                                aria-expanded="false">
                                <img class="avatar-img rounded-circle" src="../../resources/images/diano.jpg" alt="avatar"
                                    style="width: 30px;">
                            </a>
                            <ul class="dropdown-menu dropdown-animation dropdown-menu-end shadow pt-3"
                                aria-labelledby="profileDropdown">
                                <!-- Profile info -->
                                <li class="px-3">
                                    <div class="d-flex align-items-center">
                                        <!-- Avatar -->
                                        <div class="avatar ps-1 pt-2">
                                            <img class="avatar-img rounded-circle shadow" src="../../resources/images/diano.jpg"
                                                alt="avatar" style="width: 30px;">
                                        </div>
                                        <div>
                                            <a class="fs-6 fw-bold" href="../member/memberView.html">이하늘</a>
                                            <p class="small m-0">himmel@gmail.com</p>
                                        </div>
                                    </div>
                                    <hr>
                                </li>
                                <!-- Links -->
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
        <div style="height: 100px;"></div>
        <div class="container">
            <form method="post" id="myForm" name="myForm">
            	<!-- *Vo.jsp s -->
				<%@include file="memberVo.jsp"%>		<!-- #-> -->
				<!-- *Vo.jsp e -->
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
                                                        <span class="mb-0"><a href="#">이하늘</a></span>
                                                        <small>Himmel</small><br>
                                                        <small>himmel@gmail.com</small>
                                                    </div>
                                                    <hr>
                                                    <ul class="nav nav-link-secondary flex-column fw-bold gap-2">
                                                        <li class="nav-item">
                                                            <a class="nav-link" href="/dashboard">
                                                                <i class="fa-solid fa-chart-line pe-3"></i>
                                                                <span>Dashboard</span>
                                                            </a>
                                                        </li>
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
                        <span class="fs-1 fw-bold text-center">회원 정보</span>
                        <div class="row mb-4">
                            <div class="col-12 shadow rounded pt-3 ps-4" style="height: 100px; background-color: #f7f7fc;">
                            	<div class="row" style="align-items: center;">
                            		<div class="col-2">
                            			<img src="/resources/images/diano.jpg" class="rounded-circle avatar-img shadow" style="width: 60px;">
		                                <div class="form-attachment-btn btn btn-primary btn-sm ms-3" hidden>
		                                    <i class="fa-solid fa-arrows-rotate me-2"></i>Upload photo
		                                    <input type="file" class="js-file-attach form-attachment-btn-label" id="avatarUploader">
		                                </div>
                            		</div>
                            		<div class="col-2 offset-7">
                            			<div style="width: 150px;">
		                                	<select class="form-select form-select-sm fw-bold" id="user_div" name="user_div" aria-label=".form-select-sm example">
			                                    <option value="24" <c:if test="${item.user_div eq 24 }">selected</c:if>>관리자</option>
			                                    <option value="25" <c:if test="${item.user_div eq 25}">selected</c:if>>일반</option>
			                                </select>
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
                                <label for="id" class="form-label fw-bold">아이디</label>
                                <input type="text" class="form-control bg-white" id="id" name="id" value="<c:out value="${item.id }"/>">
                            </div>
                        </div>
                        <div class="row mb-4">
                            <div class="col">
                                <label for="dob" class="form-label fw-bold">생년월일</label>
                                <input type="text" class="form-control bg-white" id="dob" name="dob" value="<c:out value="${item.dob }"/>">
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
                                <select class="form-select form-select-lg fs-6 bg-white" id="gender" name="gender" aria-label=".form-select-lg example">
                                    <option value="5" <c:if test="${item.gender eq 5 }">selected</c:if>>남성</option>
                                    <option value="6" <c:if test="${item.gender eq 6 }">selected</c:if>>여성</option>
                                </select>
                            </div>
                        </div>
                        <div class="row mb-4">
                            <div class="col">
                                <label for="job" class="form-label fw-bold">직업</label>
                                <input type="text" class="form-control bg-white" id="job" name="job" value="<c:out value="${item.job }"/>">
                            </div>
                            <div class="col">
                            	<c:set var="listCodeTeam" value="${CodeServiceImpl.selectOneCachedCode(10) }" />
                                <label for="team" class="form-label fw-bold">좋아하는 팀</label>
                                <input type="text" class="form-control bg-white" id="team" name="team" value="<c:out value="${listCodeTeam }"/>">
                            </div>
                        </div>
                        <div class="row mb-4" hidden>
                            <div class="col">
                                <label for="password" class="form-label fw-bold">비밀번호</label>
                                <input type="password" class="form-control bg-white" id="password" value="">
                            </div>
                            <div class="col">
                                <label for="password_confirm" class="form-label fw-bold">비밀번호 확인</label>
                                <input type="password" class="form-control bg-white" id="password_confirm" value="">
                            </div>
                        </div>
                        <hr>
                        <div class="row mb-4">
                            <div class="col-6">
                                <label for="zip" class="form-label fw-bold">우편번호</label>
                                <input type="text" class="form-control bg-white" id="zip" name="zip" value="<c:out value="${item.zip }"/>">
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
                                <input type="text" class="form-control bg-white" id="addressDetail" name="address_detail" value="<c:out value="${item.address_detail }"/>">
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
    <script src="https://code.jquery.com/jquery-3.6.0.slim.js" integrity="sha256-HwWONEZrpuoh951cQD1ov2HUK5zA5DwJ1DNUXaM6FsY=" crossorigin="anonymous"></script>
    <script type="text/javascript">
    	var goUrlList = "/member/memberList";
    	var goUrlUpdt = "/member/memberUpdt";
    	var form = $("#myForm");
    	
    	$("#btnSave").on("click", function() {
			form.attr("action", goUrlUpdt).submit();
		});
    	
    	$("#btnList").on("click", function() {
			form.attr("action", goUrlList).submit();
		});
    </script>
</body>

</html>