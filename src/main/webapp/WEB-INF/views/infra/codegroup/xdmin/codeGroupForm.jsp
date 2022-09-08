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
    <link rel="stylesheet" href="/resources/css/cc.css" />
    <script defer type="text/javascript" src="/resources/js/validation.js"></script>
</head>

<body>

    <header class="navbar-light fixed-top header-static bg-mode align-items-center">
        <!-- 상단 -->
        <nav class="navbar navbar-expand-lg">
            <div class="container px-3 px-xl-5 pt-1">
                <!-- Logo START -->
                <a class="navbar-brand" href="../../user/member/main_page.html">
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
                                    <a class="dropdown-item bg-danger-soft-hover" href="../../seperate/html/seperatePage.html">
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
            <form id="myForm" method="post" action="/codeGroup/codeGroupInst">
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
                        <h1 style="font-weight: 800;">코드그룹 관리</h1>
                        <div class="row">
                            <div class="col">
                                <div class="input-control">
                                    <label for="cg_code">코드그룹 코드<span style="color: red;">*</span></label>
                                    <input type="text" id="cg_code" name="cg_code" value="" placeholder="영문(대문자),숫자">
                                    <div class="msg" id="cg_code_msg" name="cg_code_msg" style="display: none;"></div>
                                </div>
                            </div>
                            <div class="col">
                                <div class="input-control">
                                    <label for="seqAnother">코드그룹 코드 (Another)<span style="color: red;">*</span></label>
                                    <input type="text" id="seqAnother" name="seqAnother" value="" placeholder="영문(대문자),숫자">
                                    <div class="msg" id="seqAnother_msg" name="seqAnother_msg" style="display: none;"></div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <div class="input-control">
                                    <label for="groupName">코드그룹 이름 (한글)<span style="color: red;">*</span></label>
                                    <input type="text" id="groupName" name="groupName" value="" placeholder="한글,숫자">
                                    <div class="msg" id="groupName_msg" name="groupName_msg" style="display: none;"></div>
                                </div>
                            </div>
                            <div class="col">
                                <div class="input-control">
                                    <label for="eng">코드그룹 이름 (영문)<span style="color: red;">*</span></label>
                                    <input type="text" id="eng" name="eng" value="" placeholder="영문(대소문자),숫자">
                                    <div class="msg" id="eng_msg" name="eng_msg" style="display: none;"></div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <div class="input-control">
                                    <label for="useNY">사용여부<span style="color: red;">*</span></label>
                                    <select class="form-select" id="useNY">
                                        <option selected value="">Choose...</option>
                                        <option value="0">N</option>
                                        <option value="1" >Y</option>
                                    </select>
                                    <div class="msg" id="useNY_msg" name="useNY_msg" style="display: none;"></div>
                                </div>
                            </div>
                            <div class="col">
                                <div class="input-control">
                                    <label for="orderBY">순서<span style="color: red;">*</span></label>
                                    <input type="text" id="orderBY" name="orderBY" value="" placeholder="숫자">
                                    <div class="msg" id="orderBY_msg" name="orderBY_msg" style="display: none;"></div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <div class="input-control">
                                    <label for="ex">설명<span style="color: red;">*</span></label>
                                    <textarea id="ex" name="ex" placeholder=""></textarea>
                                    <div class="msg" id="ex_msg" name="ex_msg" style="display: none;"></div>
                                </div>
                            </div>
                            <div class="col">
                                <div class="input-control">
                                    <label for="deleteNY">삭제여부<span style="color: red;">*</span></label>
                                    <select class="form-select" id="deleteNY" name="deleteNY">
                                        <option selected value="">Choose...</option>
                                        <option value="0">N</option>
                                        <option value="1">Y</option>
                                    </select>
                                    <div class="msg" id="deleteNY_msg" name="deleteNY_msg" style="display: none;"></div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <div class="input-control">
                                    <label for="referenceV1">예비1 (varchar type)</label>
                                    <input type="text" id="referenceV1" name="referenceV1" value="" placeholder="영문(대소문자), 숫자">
                                    <div class="msg" id="referenceV1_msg" name="referenceV1_msg" style="display: none;"></div>
                                </div>
                            </div>
                            <div class="col">
                                <div class="input-control">
                                    <label for="referenceV2">예비2 (varchar type)</label>
                                    <input type="text" id="referenceV2" name="referenceV2" value="" placeholder="영문(대소문자), 숫자">
                                    <div class="msg" id="referenceV2_msg" name="referenceV2_msg" style="display: none;"></div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-6">
                                <div class="input-control">
                                    <label for="referenceV3">예비3 (varchar type)</label>
                                    <input type="text" id="referenceV3" name="referenceV3" value="" placeholder="영문(대소문자), 숫자">
                                    <div class="msg" id="referenceV3_msg" name="referenceV3_msg" style="display: none;"></div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <div class="input-control">
                                    <label for="referenceI1">예비1 (int type)</label>
                                    <input type="text" id="referenceI1" name="referenceI1" value="" placeholder="영문(대소문자), 숫자">
                                    <div class="msg" id="referenceI1_msg" name="referenceI1_msg" style="display: none;"></div>
                                </div>
                            </div>
                            <div class="col">
                                <div class="input-control">
                                    <label for="referenceI2">예비2 (int type)</label>
                                    <input type="text" id="referenceI2" name="referenceI2" value="" placeholder="영문(대소문자), 숫자">
                                    <div class="msg" id="referenceI2_msg" name="referenceI2_msg" style="display: none;"></div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-6">
                                <div class="input-control">
                                    <label for="referenceI3">예비3 (int type)</label>
                                    <input type="text" id="referenceI3" name="referenceI3" value="" placeholder="영문(대소문자), 숫자">
                                    <div class="msg" id="referenceI3_msg" name="referenceI3_msg" style="display: none;"></div>
                                </div>
                            </div>
                        </div>
                        <!-- 리스트 -->
                        <div class="row align-items-center">
                            <div class="col-1">
                                <a class="border-0 btn btn-sm bg-secondary shadow" type="button" href="codeGroupList">
                                    <i class="fa-solid fa-bars" style="color: white;"></i>
                                </a>
                            </div>
                            <div class="col-3 offset-8" align="right">
                                <button class="border-0 btn btn-sm bg-danger shadow" type="button" data-bs-toggle="modal"
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
                                                <button type="button" class="btn btn-primary">삭제</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <button class="border-0 btn btn-sm bg-danger shadow" type="button" data-bs-toggle="modal"
                                    data-bs-target="#deleteModal">
                                    <i class="fa-solid fa-trash-can" style="color: white;"></i>
                                </button>
                                <button class="border-0 btn btn-sm bg-success shadow" type="button" onclick="validation()">
                                    <i class="fa-regular fa-bookmark" style="color: white;"></i>
                                </button>
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
    <script src="https://code.jquery.com/jquery-3.6.0.slim.js" integrity="sha256-HwWONEZrpuoh951cQD1ov2HUK5zA5DwJ1DNUXaM6FsY=" crossorigin="anonymous"></script>
    <script type="text/javascript">
        validation = function() {
        	if(!checkOnlyKorEngNum('cg_code', 2, 0, "한글, 영문(대소문자), 숫자만 입력 가능합니다.", "cg_code_msg")) return false;         
        	if(!checkOnlyEngNum('seqAnother', 2, 1, "영문(대소문자), 숫자만 입력 가능합니다.", "seqAnother_msg")) return false;         
        	if(!checkOnlyKorNum('groupName', 2, 0, "한글, 숫자만 입력 가능합니다.", "groupName_msg")) return false;      
        	if(!checkOnlyEngNum('eng', 2, 1, "영문(대소문자), 숫자만 입력 가능합니다.", "eng_msg")) return false; 
        	if(!checkOnlyNum('orderBY', 2, 0, 0, 255, "순서는 0~255 사이의 숫자만 입력 가능합니다.", "orderBY_msg")) return false;
        	if(!checkOnlyKorEngNum('ex', 2, 1, "설명을 입력 하세요.", "ex_msg")) return false;     
        	if(!checkOnlyEng('referenceV1', 2, 1, "영문(대소문자)만 입력 가능합니다.", "referenceV1_msg")) return false;    
        	if(!checkOnlyEng('referenceV2', 2, 1, "영문(대소문자)만 입력 가능합니다.", "referenceV2_msg")) return false;    
        	if(!checkOnlyEng('referenceV3', 2, 1, "영문(대소문자만 입력 가능합니다.", "referenceV3_msg")) return false;    
        	if(!checkOnlyNum('referenceI1', 2, 1, -128, 127, "순서는 -128~127 사이의 숫자만 입력 가능합니다.", "referenceI1_msg")) return false;  
        	if(!checkOnlyNum('referenceI2', 2, 1, -128, 127, "숫자만 입력 가능합니다.", "referenceI2_msg")) return false;    
        	if(!checkOnlyNum('referenceI3', 2, 1, -128, 127, "숫자만 입력 가능합니다.", "referenceI3_msg")) return false;    

        	document.getElementById('myForm').submit();
        };
        /* test = function() {
        	
        	// radio
        	if($('input:radio[name=codeGroup_Gender]').is(':checked') == false) {
				alert("성별을 선택하세요");
			} 
        	
        	if (document.querySelector('input[name=codeGroup_Gender]:checked') == null) {
 				alert("성별을 선택하세요");
 			} else {
 				alert(document.querySelector('input[name=codeGroup_Gender]').value);
 			}
        	
        	// checkbox
        	if (document.querySelector("input[name='check']:checked") == null) {
        		alert("약관에 동의하십니까?");
        	}
		}; */
    </script>
</body>
</html>