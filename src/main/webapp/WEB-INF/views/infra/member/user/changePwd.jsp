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
                                            <button class="pro_a" id="signOutBtn">
                                                <i class="fa-solid fa-power-off me-2"></i>
                                                Sign Out
                                            </button>
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
                                                        <li class="nav-item">
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
                                        <span class="card-title align-middle fw-bold fs-3">비밀번호 변경</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- 검색 -->
                        <div class="card p-3 shadow">
                        	<div class="">
                        		<div class="mb-3 row">
	                        		<label for="inputPassword" class="col-sm-3 offset-sm-2 col-form-label">현재 비밀번호</label>
								    <div class="col-sm-3">
								    	<input type="password" class="form-control" id="inputPassword">
								    </div>
							 	</div>
							 	<div class="mb-3 row">
							 		<label for="inputPassword" class="col-sm-3 offset-sm-2 col-form-label">새로운 비밀번호</label>
								    <div class="col-sm-3">
								      <input type="password" class="form-control" id="inputPassword" name="password">
								    </div>
							 	</div>
							 	<div class="mb-3 row">
							 		<label for="inputPassword" class="col-sm-3 offset-sm-2 col-form-label">새로운 비밀번호 확인</label>
								    <div class="col-sm-3">
								      <input type="password" class="form-control" id="inputPassword">
								    </div>
							 	</div>
	                            <div class="row float-end">
	                                <div class="col-2">
	                                    <button class="btn btn-secondary fw-bold btn-sm shadow" type="submit" id="btnSave">
	                                        <i class="fas fa-duotone fa-registered"></i>
	                                    </button>
	                                </div>
	                            </div>
                        	</div>
                        </div>
                        <!-- 리스트 -->
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
	    $("#signOutBtn").on("click", function() {
			$.ajax({
				type: "POST"
				,url: "logoutProc"
				,data: {}
				,success : function(response) {
					if (response.rt == "success") {
						window.location.href = "/";
					}
				}
			});
		});
		
		var goUrlUpdt = "/pwdUpdt";
		var form = $("#myForm");
		
		$("#btnSave").on("click", function() {
			form.attr("action", goUrlUpdt).submit();
		});
   </script>
</body>

</html>