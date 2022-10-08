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
    <title>Code</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
    <link rel="stylesheet" href="/resources/css/xdmin/cc.css" />
    <script defer type="text/javascript" src="/resources/js/validation.js"></script>
    <!-- <script defer src="/resources/js/xdmin/commonXdmin.js"></script> -->
    <script src="/resources/js/xdmin/constantsXdmin.js"></script>
    <script defer src="/resources/common/js/common.js"></script>
    <style type="text/css">
    	.addScroll{
			overflow-y:auto;
			height: 200px;
			background-color:#E9ECEF;
			padding-top:5px; 
			padding-left:5px;
		}
    
    	.input-file-button{
			padding: 4px 25px;
			background-color:#FF6600;
			border-radius: 4px;
			color: white;
			cursor: pointer;
		}
    </style>
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
                                            <p class="small m-0"><c:out value="${sessEmail }"/></p>
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
        <div class="nav-scroller py-1 mb-2 bg-info">
            <div class="container bg-info">
                <ul class="nav">
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="#">Navbar</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">회원관리</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link disabled" href="#">서비스관리</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link disabled" href="#">사이트관리</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link disabled" href="#">로그관리</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link disabled" href="#">시스템관리</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link disabled" href="#">시스템관리</a>
                    </li>
                </ul>
            </div>
        </div>
    </header>

    <main>
        <div class="top_space"></div>
        <div class="container">
            <form method="post" id="myForm"> <!-- enctype="multipart/form-data" -->
                <div class="row g-4">
	                <!-- *Vo.jsp s -->
					<%@include file="codeVo.jsp"%>		<!-- #-> -->
					<!-- *Vo.jsp e -->
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
                                                        <span class="mb-0"><a href="#"><c:out value="${sessName }"/></a></span>
                                                        <small><c:out value="${sessId }"/> </small><br>
                                                        <small><c:out value="${sessEmail }"/> </small>
                                                    </div>
                                                    <hr>
                                                    <ul class="nav nav-link-secondary flex-column fw-bold gap-2">
                                                        <li class="nav-item">
                                                            <a class="nav-link" href="../Dashboard/Dashboard.html">
                                                                <i class="fa-solid fa-chart-line pe-3"></i>
                                                                <span>Home</span>
                                                            </a>
                                                        </li>
                                                        <li class="nav-item">
                                                            <a class="nav-link" href="../user/userList.html">
                                                                <i class="fa-solid fa-users pe-3"></i>
                                                                <span>Dashboard</span>
                                                            </a>
                                                        </li>
                                                        <li class="nav-item">
                                                            <a class="nav-link" href="../article/articleList.html">
                                                                <i class="fas fa-light fa-newspaper pe-3"></i>
                                                                <span>Orders</span>
                                                            </a>
                                                        </li>
                                                        <hr>
                                                        <li class="nav-item">
                                                            <a class="nav-link" href="../articleComment/articleCommentList.html">
                                                                <i class="fas fa-light fa-comments pe-3"></i>
                                                                <span>Account</span>
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
                        <h1 style="font-weight: 800;">코드 관리</h1>
                        <div class="row">
                            <div class="col-6">
                                <label for=ccgSeq class="form-label">코드그룹</label>
                                <select class="form-select" id="ccgSeq" name="ccgSeq">
                                    <c:forEach items="${list}" var="list" varStatus="status">
	                     				<option value="<c:out value="${list.ccgSeq }"/>">${list.ifcgName } </option>
									</c:forEach>
                                </select>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <label for="ccSeq" class="form-label">코드</label>
                                <input type="text" class="form-control" id="ccSeq" name="ccSeq" value="<c:out value="${item.ccSeq }"/>" disabled>
                            </div>
                            <div class="col">
                                <label for="ifccAnother" class="form-label">코드 (Another)</label>
                                <input type="text" class="form-control" id="ifccAnother" name="ifccAnother" value="<c:out value="${item.ifccAnother }"/>" placeholder="">
                                <div class="msg" id="ifccAnother_msg" name="ifccAnother_msg" style="display: none;"></div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <label for="ifccName" class="form-label">코드 이름 (한글)</label>
                                <input type="text" class="form-control" id="ifccName" name="ifccName" value="<c:out value="${item.ifccName }"/>" placeholder="">
                                <div class="msg" id="ifccName_msg" name="ifccName_msg" style="display: none;"></div>
                            </div>
                            <div class="col">
                                <label for="ifccNameEng" class="form-label">코드 이름 (영문)</label>
                                <input type="text" class="form-control" id="ifccNameEng" name="ifccNameEng" value="<c:out value="${item.ifccNameEng }"/>" placeholder="">
                                <div class="msg" id="ifccNameEng_msg" name="ifccNameEng_msg" style="display: none;"></div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <label for="ifccUseNy" class="form-label">사용여부</label>
                                <select class="form-select" id="ifccUseNy" name="ifccUseNy">
                                    <option value="0" <c:if test="${item.ifccUseNy eq 0 }">selected</c:if>>N</option>
                                    <option value="1" <c:if test="${item.ifccUseNy eq 1 }">selected</c:if>>Y</option>
                                </select>
                            </div>
                            <div class="col">
                                <label for="ifccOrder" class="form-label">순서</label>
                                <input type="text" class="form-control" id="ifccOrder" name="ifccOrder" value="<c:out value="${item.ifccOrder }"/>" placeholder="숫자">
                                <div class="msg" id="ifccOrder_msg" name="ifccOrder_msg" style="display: none;"></div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <label for="ifccExplanation" class="form-label">설명</label>
                                <textarea class="form-control" id="ifccExplanation" name="ifccExplanation" placeholder=""></textarea>
                                <div class="msg" id="ifccExplanation_msg" name="ifccExplanation_msg" style="display: none;"></div>
                            </div>
                            <div class="col">
                                <label for="ifccDelNy" class="form-label">삭제여부</label>
                                <select class="form-select" id="ifccDelNy" name="ifccDelNy">
	                                <option value="0" <c:if test="${item.ifccDelNy eq 0 }">selected</c:if>>N</option>
	                                <option value="1" <c:if test="${item.ifccDelNy eq 1 }">selected</c:if>>Y</option>
	                            </select>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <label for="referenceV1" class="form-label">예비1 (varchar type)</label>
                                <input type="text" class="form-control" id="referenceV1" name="referenceV1" value="<c:out value="${item.referenceV1 }"/>" placeholder="영문(대소문자), 숫자">
                            	<div class="msg" id="referenceV1_msg" name="referenceV1_msg" style="display: none;"></div>
                            </div>
                            <div class="col">
                                <label for="referenceV2" class="form-label">예비2 (varchar type)</label>
                                <input type="text" class="form-control" id="referenceV2" name="referenceV2" value="<c:out value="${item.referenceV2 }"/>" placeholder="영문(대소문자), 숫자">
                                <div class="msg" id="referenceV2_msg" name="referenceV2_msg" style="display: none;"></div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-6">
                                <label for="referenceV3" class="form-label">예비3 (varchar type)</label>
                                <input type="text" class="form-control" id="referenceV3" name="referenceV3"  value="<c:out value="${item.referenceV3 }"/>" placeholder="영문(대소문자), 숫자">
                                <div class="msg" id="referenceV3_msg" name="referenceV3_msg" style="display: none;"></div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <label for="referenceI1" class="form-label">예비1 (int type)</label>
                                <input type="text" class="form-control" id="referenceI1" name="referenceI1" value="<c:out value="${item.referenceI1 }"/>" placeholder="숫자">
                                <div class="msg" id="referenceI1_msg" name="referenceI1_msg" style="display: none;"></div>
                            </div>
                            <div class="col">
                                <label for="referenceI2" class="form-label">예비2 (int type)</label>
                                <input type="text" class="form-control" id="referenceI2" name="referenceI2" value="<c:out value="${item.referenceI2 }"/>" placeholder="숫자">
                                <div class="msg" id="referenceI2_msg" name="referenceI2_msg" style="display: none;"></div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-6">
                                <label for="referenceI3" class="form-label">예비3 (int type)</label>
                                <input type="text" class="form-control" id="referenceI3" name="referenceI3" value="<c:out value="${item.referenceI3 }"/>" placeholder="숫자">
                                <div class="msg" id="referenceI3_msg" name="referenceI3_msg" style="display: none;"></div>
                            </div>
                        </div>
                        <div class="row mt-sm-4">
					        <div class="col-sm-6 mt-3 mt-sm-0">
					            <label for="ifmmUploadedImage" class="form-label input-file-button">이미지첨부</label>
					 			<input class="form-control form-control-sm" id="ifmmUploadedImage" name="ifmmUploadedImage" type="file" multiple="multiple" style="display: none;" onChange="upload('ifmmUploadedImage', 1, 0, 1, 0, 0, 1);">
								<div class="addScroll">
									<ul id="ulFile1" class="list-group">
									</ul>
								</div>
					        </div>
					        <div class="col-sm-6 mt-3 mt-sm-0">
								<label for="ifmmUploadedFile" class="form-label input-file-button">파일첨부</label>
								<input class="form-control form-control-sm" id="ifmmUploadedFile" name="ifmmUploadedFile" type="file" multiple="multiple" style="display: none;" onChange="upload('ifmmUploadedFile', 2, 0, 2, 0, 0, 2);" >
								<div class="addScroll">
									<ul id="ulFile2" class="list-group">
									</ul>
								</div>
					        </div>
					    </div>
                        <!-- 리스트 -->
                        <div class="row align-items-center">
                            <div class="col-1">
                                <button class="border-0 btn btn-sm bg-secondary shadow" type="button" id="btnList">
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
                                <button id="btnSave1" class="border-0 btn btn-sm bg-danger shadow" type="button">
                                    <i class="fa-regular fa-bookmark" style="color: white;"></i>
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
        <form name="formVo" id="formVo" method="post">
			<!-- *Vo.jsp s -->
			<%@include file="codeVo.jsp"%>		<!-- #-> -->
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
    <script src="https://code.jquery.com/jquery-3.6.0.slim.js" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script type="text/javascript">
	    validation = function() { 
	    	if(!checkOnlyKorEngNum('cg_code', 2, 0, "한글, 영문(대소문자), 숫자만 입력 가능합니다.", "cg_code_msg")) return false;         
	    	if(!checkOnlyEngNum('seqAnother', 2, 1, "영문(대소문자), 숫자만 입력 가능합니다.", "seqAnother_msg")) return false;         
	    	if(!checkOnlyKorNum('groupName', 2, 0, "한글, 숫자만 입력 가능합니다.", "groupName_msg")) return false;      
	    	if(!checkOnlyEngNum('eng', 2, 1, "영문(대소문자), 숫자만 입력 가능합니다.", "eng_msg")) return false; 
	    	if(!checkOnlyNum('orderBY', 2, 0, 0, 255, "순서는 0~255 사이의 숫자만 입력 가능합니다.", "orderBY_msg")) return false;
	    	if(!checkOnlyKorEngNum('ex', 2, 1, "설명을 입력 하세요.", "ex_msg")) return false;         
	
	    	document.getElementById('myForm').submit();
	    };
	    
	    var goUrlList = "/code/codeList";
	    var goUrlInst = "/code/codeInst";
        var goUrlUpdt = "/code/codeUpdt";
        var goUrlUel = "/code/codeUele";
        var goUrlDel = "/code/codeDele";
        
        var seq = $("input:hidden[name=ccSeq]");
        var form = $("#myForm");
        var formVo = $("form[name=formVo]");
        
        $("#btnSave").on("click", function() {
        	if (seq.val() == "0" || seq.val() == "") {
        		form.attr("action", goUrlInst).submit();
        	} else {
        		form.attr("action", goUrlUpdt).submit();
        	}
		});
        
        $("#btnSave1").on("click", function() {
        	upload('ifmmUploadedImage', 1, 0, 1, 0, 0, 1);
		})
        
        $("#btnList").on("click", function() {
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
		
		upload = function(objName, seq, allowedMaxTotalFileNumber, allowedExtdiv, allowedEachFileSize, allowedTotalFileSize, uiType) {

			const MAX_EACH_FILE_SIZE = 5 * 1024 * 1024;		//	5M
			const MAX_TOTAL_FILE_SIZE = 25 * 1024 * 1024;	//	25M
			const MAX_TOTAL_FILE_NUMBER = 5;				//	5

			function kbToMb(bytes) {
			    var e = Math.floor(Math.log(bytes)/Math.log(1024));

			    if(e == "-Infinity") return 0;
			    else return (bytes/Math.pow(1024, Math.floor(e))).toFixed(2).slice(0, -3);
			}
			
			checkUploadedTotalFileNumber = function(obj, allowedMaxTotalFileNumber, fileCount) {
				if(allowedMaxTotalFileNumber < fileCount){
					alert("전체 파일 갯수는 "+ allowedMaxTotalFileNumber +"개 까지 허용됩니다.");
//					$("#file"+seq).val("");
//					obj.val("");
					return false;
				}
			}


			checkUploadedExt = function(objName, seq, div) {
				var ext = objName.split('.').pop().toLowerCase();
				var extArray = eval("extArray" + div);
				
				if(extArray.indexOf(ext) == -1) {
					alert("허용된 확장자가 아닙니다.");
//					$("#file"+seq).val("");
					return false;
				}
			}


			checkUploadedEachFileSize = function(obj, seq, allowedEachFileSize) {

				if(obj.size > allowedEachFileSize){
					alert("각 첨부 파일 사이즈는 "+kbToMb(allowedEachFileSize)+"MB 이내로 등록 가능합니다.");
					$("#file"+seq).val("");
					return false;
				}
			}


			checkUploadedTotalFileSize = function(seq, totalSize, allowedTotalFileSize) {
				if(totalSize > allowedTotalFileSize){
					alert("전체 용량은 "+kbToMb(allowedTotalFileSize)+"M를 넘을 수 없습니다.");
					$("#file"+seq).val("");
					return false;
				}
			}

//			objName 과 seq 는 jsp 내에서 유일 하여야 함.
//			memberProfileImage: 1
//			memberImage: 2
//			memberFile : 3
			
			var extArray1 = new Array();
			extArray1 = ["jpg","gif","png","jpeg","bmp","tif","jfif"];
			
			var extArray2 = new Array();
			extArray2 = ["txt","pdf","hwp","doc","docx","xls","xlsx","ppt","pptx","html"];
			
			var totalFileSize = 0;
			var obj = $("#" + objName +"")[0].files;	
			var fileCount = obj.length;
			
			allowedMaxTotalFileNumber = allowedMaxTotalFileNumber == 0 ? MAX_TOTAL_FILE_NUMBER : allowedMaxTotalFileNumber;
			allowedEachFileSize = allowedEachFileSize == 0 ? MAX_EACH_FILE_SIZE : allowedEachFileSize;
			allowedTotalFileSize = allowedTotalFileSize == 0 ? MAX_TOTAL_FILE_SIZE : allowedTotalFileSize;
			
			if(checkUploadedTotalFileNumber(obj, allowedMaxTotalFileNumber, fileCount) == false) { return false; } 
			alert("총 " + fileCount + "개 파일을 선택하셨습니다.")

			for (var i = 0 ; i < fileCount ; i++) {
				if(checkUploadedExt($("#" + objName +"")[0].files[i].name, seq, allowedExtdiv) == false) { return false; }
				if(checkUploadedEachFileSize($("#" + objName +"")[0].files[i], seq, allowedEachFileSize) == false) { return false; }

				totalFileSize += $("#" + objName +"")[0].files[i].size;
			}

			if(checkUploadedTotalFileSize(seq, totalFileSize, allowedTotalFileSize) == false) { return false; }
			
			if (uiType == 1) {
				$("#ulFile" + seq).children().remove();
				
				for (var i = 0 ; i < fileCount ; i++) {
					addUploadLi(seq, i, $("#" + objName +"")[0].files[i].name);
				}
			} else if(uiType == 2) {
				$("#ulFile" + seq).children().remove();
				
				for (var i = 0 ; i < fileCount ; i++) {
					addUploadLi(seq, i, $("#" + objName +"")[0].files[i].name);
				}
			} else if (uiType == 3) {
				var fileReader = new FileReader();
				 fileReader.readAsDataURL($("#" + objName +"")[0].files[0]);
				
				 fileReader.onload = function () {
					 $("#imgProfile").attr("src", fileReader.result);		
				 }		
			} else {
				return false;
			}
			return false;
		}
		
		addUploadLi = function (seq, index, name){
			
			var ul_list = $("#ulFile0");
			
			li = '<li id="li_'+seq+'_'+index+'" class="list-group-item d-flex justify-content-between align-items-center">';
			li = li + name;
			li = li + '<span class="badge bg-danger rounded-pill" onClick="delLi('+ seq +','+ index +')"><i class="fa-solid fa-x" style="cursor: pointer;"></i></span>';
			li = li + '</li>';
			
			$("#ulFile"+seq).append(li);
		}
		
		delLi = function(seq, index) {
			$("#li_"+seq+"_"+index).remove();
		}
    </script>
</body>
</html>