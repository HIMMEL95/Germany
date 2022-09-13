<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="rb" uri="http://www.springframework.org/tags" %>

<!doctype html>
<html lang="ko">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Article List</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
    <link href="/resources/css/xdmin/article/articleList.css" rel="stylesheet" type="text/css">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
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
                            <a class="p-0" href="#" id="profileDropdown" role="button" data-bs-auto-close="outside"
                                data-bs-display="static" data-bs-toggle="dropdown" aria-expanded="false">
                                <img class="avatar-img rounded-circle" src="../../resources/images/diano.jpg" alt="avatar"
                                    style="width: 30px;">
                            </a>
                            <ul class="dropdown-menu dropdown-animation dropdown-menu-end shadow pt-3"
                                aria-labelledby="profileDropdown">
                                <!-- Profile info -->
                                <li class="px-3">
                                    <div class="d-flex align-items-center">
                                        <!-- Avatar -->
                                        <div class="avatar1 me-3">
                                            <img class="avatar-img rounded-circle shadow" src="../../resources/images/diano.jpg"
                                                alt="avatar" style="width: 30px;">
                                        </div>
                                        <div>
                                            <a class="fs-6 fw-bold" href="#">이하늘</a>
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
            <form method="post" action="/article/articleList">
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
                                            <img src="../../resources/images/mountains.png" class="card-img-top" alt="background"
                                                style="height: 50px; background-position: center; background-size: cover; background-repeat: no-repeat;">
                                            <div class="card-body pt-0">
                                                <div class="text-center">
                                                    <div class="avatar avatar-lg mt-n5 mb-3">
                                                        <a href="#"><img class="avatar-img rounded border border-white border-3"
                                                                src="../../resources/images/diano.jpg" style="width: 50px;" alt=""></a>
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
                                                            <a class="nav-link" href="/commentList">
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
                                            </a>
                                        </p>
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
                                    <img src="../../resources/images/xdmin/listBack.jpg" class="card-img" style="height: 200px;"
                                        alt="...">
                                    <div class="card-img-overlay text-center p-4 position-absoulte top-50 start-50 translate-middle">
                                        <span class="card-title align-middle fw-bold fs-3">게시물 관리</span>
                                    </div>
                                </div>
                            </div>
                        </div>
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
                                        <option value="" <c:if test="${empty vo.shDate }">selected</c:if> selected>선택</option>
                                        <option value="1" <c:if test="${vo.shDate eq 1 }">selected</c:if>>등록일</option>
                                        <option value="2" <c:if test="${vo.shDate eq 2 }">selected</c:if>>수정일</option>
                                    </select>
                                </div>
                                <div class="col-3">
                                    <input type="text" class="form-control datepicker" id="date_st" name="startDate" placeholder="시작일" autocomplete="off">
                                </div>
                                <div class="col-3">
                                    <input type="text" class="form-control datepicker" id="date_end" name="endDate" placeholder="종료일" autocomplete="off">
                                </div>
                            </div>
                            <div class="row align-items-center">
                                <div class="col-2">
                                    <select class="form-select form-select-sm fw-bold" name="shOption" aria-label=".form-select-sm example">
                                        <option value="" <c:if test="${empty vo.shOption }"> selected</c:if>>선택</option>
                                        <option value="1" <c:if test="${vo.shOption eq 1}"> selected</c:if>>기자</option>
                                        <option value="2" <c:if test="${vo.shOption eq 2}"> selected</c:if>>신문사</option>
                                        <option value="3" <c:if test="${vo.shOption eq 3}"> selected</c:if>>종목</option>
                                    </select>
                                </div>
                                <div class="col-3">
                                    <input type="text" class="form-control" id="validationCustom01" name="shValue" value="" autocomplete="off">
                                </div>
                                <div class="col-3">
                                    <button class="btn btn-primary fw-bold btn-sm shadow" type="submit">검색</button>
                                </div>
                            </div>
                        </div>
                        <!-- 리스트 -->
                        <div class="card ps-3 pt-3 pe-3 shadow">
                            <table class="table text-center align-middle">
                                <thead>
                                    <tr>
                                        <th style="font-size: small;"><input class="form-check-input" type="checkbox" value=""
                                                id="flexCheckDefault"></th>
                                        <th>번호</th>
                                        <th class="w-25">제목</th>
                                        <th>기자</th>
                                        <th>종목</th>
                                        <th>신문사</th>
                                        <th>등록일</th>
                                        <th>수정일</th>
                                    </tr>
                                </thead>
                                <tbody>
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
			                                        <td>${list.seq }</td>
			                                        <td><a href="/article/articleXdminView?seq=<c:out value="${list.seq }"/>">${list.title }</a></td>
			                                        <td>${list.reporter }</td>
			                                        <td>${list.event }</td>
			                                        <td>${list.newspaper }</td>
			                                        <td>${list.createdAt }</td>
			                                        <td>${list.modifiedAt }</td>
			                                    </tr>		
											</c:forEach>
                                		</c:otherwise>
                                	</c:choose>
                                </tbody>
                            </table>
                            <nav aria-label="Page navigation">
                                <ul class=" pagination pagination-sm col-3 offset-5">
                                    <li class="page-item">
                                        <a class="page-link" href="#" aria-label="Previous">
                                            <span aria-hidden="true">&laquo;</span>
                                        </a>
                                    </li>
                                    <li class="page-item"><a class="page-link" href="#">1</a></li>
                                    <li class="page-item"><a class="page-link" href="#">2</a></li>
                                    <li class="page-item"><a class="page-link" href="#">3</a></li>
                                    <li class="page-item">
                                        <a class="page-link" href="#" aria-label="Next">
                                            <span aria-hidden="true">&raquo;</span>
                                        </a>
                                    </li>
                                </ul>
                            </nav>
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
                            <div class="col-1 offset-10" align="right">
                                <a class="border-0 btn btn-sm shadow role="button" href="/article/articleForm">
                                    <i class="fa-solid fa-id-card fa-lg"></i>
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
	   	$(function() {
	   		$("#date_st").datepicker({
	   			dateFormat: "yy-mm-dd"
	   			,showMonthAfterYear: true
	   			,showOtherMonths: true
	   		});
	   		$("#date_end").datepicker({
	   			dateFormat: "yy-mm-dd"
	      			,showMonthAfterYear: true
	      			,showOtherMonths: true
	      		});
	   	})
   </script>
</body>

</html>