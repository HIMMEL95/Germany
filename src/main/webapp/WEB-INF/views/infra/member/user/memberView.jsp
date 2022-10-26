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
    <title>회원정보</title>
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
                    <img class="light-mode-item navbar-brand-item" src="/resources/images/SPOPIA_white.png" alt="logo"
                        style="width: 90px;">
                </a>
                <!-- Profile START -->
                <div class="dropdown">
                    <ul class="nav flex-nowrap align-items-center ms-sm-3 list-unstyled">
                        <li class="me-2">
                            <a class="p-0" href="/member/memberView" id="profileDropdown" role="button"
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
                                        <div class="avatar ps-1 pt-2">
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
                                            <a class="fs-6 fw-bold" href="/member/memberUView"><c:out value="${sessName }"/><br></a>
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
                                            <a class="dropdown-item" role="button" id="editBtn" onclick="goForm(<c:out value="${sessSeq }"/>)" style="cursor: pointer;">
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
		                                    <a class="pro_a dropdown-item" role="button" id="editBtn" onclick="goForm(<c:out value="${sessSeq }"/>)" style="cursor: pointer;">
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
				<input type="hidden" name="seq" value="<c:out value="${sessSeq}"/>"/>
				<c:set var="listCodeTeam" value="${CodeServiceImpl.selectOneCachedCode(30) }" />
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
                                                        <a href="#">
                                                        	<c:choose>
				                                        		<c:when test="${empty sessImg }">
		                                                        	<img class="avatar-img rounded border border-white border-3" src="/resources/images/diano.jpg" style="width: 50px;" alt="">
				                                        		</c:when>
				                                        		<c:otherwise>
		                                                        	<img class="avatar-img rounded border border-white border-3" src="${sessImg }" style="width: 50px;" alt="">
				                                        		</c:otherwise>
				                                        	</c:choose>
                                                        </a>
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
                                                        <!-- <li class="nav-item">
                                                            <a class="nav-link" href="/changePw">
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
                        <span class="fs-1 fw-bold text-center">회원 정보</span>
                        <div class="row mb-4">
                            <div class="col-12 shadow rounded pt-3 ps-4" style="height: 100px; background-color: #f7f7fc;">
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
                        <div class="card ps-5 pe-5 pt-4 pb-4 shadow" style="background-color: #f7f7fc;"">
                                        <div class=" row mb-4">
                            <div class="col">
                                <label for="name" class="form-label fw-bold">이름</label>
                                <p>${item.name }</p>
                            </div>
                            <div class="col">
                                <label for="id" class="form-label fw-bold">아이디</label>
                                <p>${item.id }</p>
                            </div>
                        </div>
                        <div class="row mb-4">
                            <div class="col">
                                <label for="dob" class="form-label fw-bold">생년월일</label>
                                <p>${item.dob }</p>
                            </div>
                            <div class="col">
                                <label for="email" class="form-label fw-bold">이메일</label>
                                <p>${item.email }</p>
                            </div>
                        </div>
                        <div class="row mb-4">
                            <div class="col">
                                <label for="tel" class="form-label fw-bold">전화번호</label>
                                <p>${item.phone }</p>
                            </div>
                            <div class="col">
                                <label for="gender" class="form-label fw-bold">성별</label>
                                <p>
                                	<c:set var="listCodeGender" value="${CodeServiceImpl.selectListCachedCode('2') }" />
                                	<c:forEach items="${listCodeGender}" var="listGender" varStatus="statusGender">
										<c:if test="${item.gender eq listGender.ccSeq}"><c:out value="${listGender.ifccName }"/></c:if>
									</c:forEach>
                                </p>
                            </div>
                        </div>
                        <div class="row mb-4">
                            <div class="col">
                                <label for="job" class="form-label fw-bold">직업</label>
                                <p>${item.job }</p>
                            </div>
                            <div class="col">
                            	<c:set var="listCodeTeam" value="${CodeServiceImpl.selectListCachedCode('7') }" />
                                <label for="team" class="form-label fw-bold">좋아하는 팀</label>
                                <p>
                                	<c:forEach items="${listCodeTeam}" var="listTeam" varStatus="statusTeam">
										<c:if test="${item.team eq listTeam.ccSeq}"><c:out value="${listTeam.ifccName }"/></c:if>
									</c:forEach>
                                </p>
                            </div>
                        </div>
                        <div class="row mb-4" hidden>
                            <div class="col">
                                <label for="password" class="form-label fw-bold">비밀번호</label>
                                <input type="password" class="form-control bg-white" id="password" value="" readonly>
                            </div>
                            <div class="col">
                                <label for="password_confirm" class="form-label fw-bold">비밀번호 확인</label>
                                <input type="password" class="form-control bg-white" id="password_confirm" value="" readonly>
                            </div> 
                        </div>
                        <div class="row mb-4">
                            <div class="col-6">
                                <label for="zip" class="form-label fw-bold">우편번호</label>
                                <p>${item.zip }</p>
                            </div>
                        </div>
                        <div class="row mb-4">
                            <div class="col">
                                <label for="address" class="form-label fw-bold">주소</label>
                                <p>${item.address }</p>
                            </div>
                        </div>
                        <div class="row mb-4">
                            <div class="col">
                                <label for="addressDetail" class="form-label fw-bold">상세주소</label>
                                <p>${item.address_detail }</p>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-2 offset-10" align="right">
                                <button class="btn btn-primary text-white fw-bold btn-sm shadow" id="btnMod" type="button" onclick="goView()">수정</button>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
        <form name="formVo" id="formVo" method="post">
		<!-- *Vo.jsp s -->
		<%@include file="memberVo.jsp"%>		<!-- #-> -->
		<!-- *Vo.jsp e -->
		</form>
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
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script type="text/javascript">
    	
    	var goUrlList = "/member/memberList";
    	var goUrlMod = "/member/memberUMod";
    	
    	var form = $("form[name=myForm]");
    	var formVo = $("form[name=formVo]");
    	
    	$("#btnList").on("click", function() {
			formVo.attr("action", goUrlList).submit();
		})
		
		goView = function() {
			form.attr("action", goUrlMod).submit();
		}
		
		$("#signOutBtn").on("click", function() {
			$.ajax({
				type: "POST"
				,url: "/logoutProc"
				,data: {}
				,success : function(response) {
					if (response.rt == "success") {
						window.location.href = "/";
					}
				}
			});
		});
    </script>
</body>

</html>