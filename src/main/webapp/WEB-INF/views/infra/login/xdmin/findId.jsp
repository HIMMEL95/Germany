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
    <title>FindId</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
    <link href="/resources/css/user/findId.css" rel="stylesheet" type="text/css">
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
                            <a class="p-0" href="../member/memberView.html" id="profileDropdown" role="button"
                                data-bs-auto-close="outside" data-bs-display="static" data-bs-toggle="dropdown"
                                aria-expanded="false">
                                <img class="avatar-img rounded-circle" src="/resources/images/diano.jpg" alt="avatar"
                                    style="width: 30px;">
                            </a>
                            <ul class="dropdown-menu dropdown-animation dropdown-menu-end shadow pt-3"
                                aria-labelledby="profileDropdown">
                                <!-- Profile info -->
                                <li class="px-3">
                                    <div class="d-flex align-items-center">
                                        <!-- Avatar -->
                                        <div class="avatar mt-2">
                                            <img class="avatar-img rounded-circle shadow" src="/resources/images/diano.jpg"
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
                                <li><a class="dropdown-item" href="../member/memberView.html"><i
                                            class="fa-solid fa-user me-2"></i>Edit
                                        Profile</a></li>
                                <li><a class="dropdown-item" href="#"><i class="fa-solid fa-gear me-2"></i>Account
                                        Settings</a></li>
                                <li><a class="dropdown-item" href="#"><i
                                            class="fa-solid fa-circle-info me-2"></i>Help</a></li>
                                <li><a class="dropdown-item bg-danger-soft-hover" href="../member/main_page.html"><i
                                            class="fa-solid fa-power-off me-2"></i>Sign Out</a></li>
                                <li>
                                    <hr class="dropdown-divider">
                                </li>
                                <li>
                                    <a class="dropdown-item" href="../login/loginForm.html"><i
                                            class="fa-solid fa-arrow-right-to-bracket me-2"></i>Sign In</a>
                                </li>
                                <li>
                                    <a class="dropdown-item" href="../login/singUpForm.html"><i
                                            class="fa-solid fa-user-plus me-2"></i>Sign Up</a>
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
        <form method="post" id="myForm" name="myForm">
            <div style="height: 100px;"></div>
            <div class="container container1">
                <p class="fs-2 fw-bold">계정 정보 찾기</p>
                <div class="card shadow ps-5 pt-5 pe-5 pb-2">
                    <ul class="nav nav-tabs" id="myTab" role="tablist">
                        <li class="nav-item" role="presentation">
                            <button class="nav-link active fw-bold" id="home-tab" data-bs-toggle="tab"
                                data-bs-target="#home-tab-pane" type="button" role="tab" aria-controls="home-tab-pane"
                                aria-selected="true">아이디 찾기</button>
                        </li>
                        <li class="nav-item" role="presentation">
                            <button class="nav-link fw-bold" id="profile-tab" data-bs-toggle="tab"
                                data-bs-target="#profile-tab-pane" type="button" role="tab" aria-controls="profile-tab-pane"
                                aria-selected="false">비밀번호 찾기</button>
                        </li>
                    </ul>
                    <div class="tab-content pt-4 ps-4" id="myTabContent">
                        <!-- 아이디 찾기 영역 -->
                        <div class="tab-pane fade show active" id="home-tab-pane" role="tabpanel" aria-labelledby="home-tab"
                            tabindex="0">
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio1"
                                    value="option1">
                                <label class="form-check-label fw-bold" for="inlineRadio1">본인확인 후 찾기</label>
                            </div>
                            <div class="form-check form-check-inline mb-4">
                                <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio2"
                                    value="option2">
                                <label class="form-check-label fw-bold" for="inlineRadio2">등록된 휴대폰 번호로 찾기</label>
                            </div>
                            <div class="row border rounded align-items-center" style="height: 350px;">
                                <div class="col-5 col-lg-3 offset-4 offset-lg-4">
                                    <div class="row mb-3 fw-bold text-center">
                                        <a class="btn btn-primary text-white shadow fw-bold mb-3" href="#" role="button">
                                            본인명의 휴대폰으로 인증
                                        </a>
                                        <span class="fs-6">회원님의 명의로 등록된<br>휴대폰으로 본인확인을 진행합니다.</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- 비밀번호 찾기 영역 -->
                        <div class="tab-pane fade" id="profile-tab-pane" role="tabpanel" aria-labelledby="profile-tab"
                            tabindex="0">
                            <div class="border rounded p-3">
                                <span><i class="fa-solid fa-check"></i> 비밀번호의 경우 <strong>암호화</strong> 저장되어 분실 시 찾아드릴 수
                                    없는 정보입니다.</span><br>
                                <span><i class="fa-solid fa-check"></i><strong> 본인 확인</strong> 을 통해 비밀번호를 재설정 하실 수
                                    있습니다.</span>
                            </div>
                            <div class="mt-4 table-responsive">
                                <table class="table text-center align-middle">
                                    <tr>
                                        <td>
                                            <label for="name" class="form-label fs-4 fw-bolds">이 름</label>
                                        </td>
                                        <td>
                                            <input type="text" class="form-control" id="name" value="" required>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <label for="id" class="form-label fs-4 fw-bolds">아이디</label>
                                        </td>
                                        <td>
                                            <input type="text" class="form-control" id="id" value="" required>
                                            <span class="fs-6s"><strong>SPOPIA</strong>에 가입된 계정 아이디를 정확히 기입해주시길
                                                바랍니다.</span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">
                                            <span class="fs-6"><i class="fa-solid fa-exclamation"></i> 비밀번호 찾기 방법을
                                                선택해주세요.</span><br>
                                            <div class="form-check form-check-inline fs-6">
                                                <input class="form-check-input" type="radio" name="inlineRadioOptions"
                                                    id="emailAddress" value="option1">
                                                <label class="form-check-label fw-bold" for="emailAddress">email
                                                    주소</label>
                                            </div>
                                            <div class="form-check form-check-inline fs-6">
                                                <input class="form-check-input" type="radio" name="inlineRadioOptions"
                                                    id="tel" value="option2">
                                                <label class="form-check-label fw-bold" for="tel">등록된
                                                    휴대폰</label>
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                                <div class="text-center">
                                    <button class="btn btn-primary" type="submit">비밀번호 찾기</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="mt-3 ms-3">
                        <button class="btn btn-primary text-white shadow fw-bold mb-3" type="button" id="backBtn">
                            뒤로
                        </button>
                    </div>
                </div>
            </div>
            <div style="height: 50px;"></div>
        </form>
        
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
    <script src="https://code.jquery.com/jquery-3.6.0.js" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script type="text/javascript">
    	var goUrlBack = "/userLogin";
    	var form = $("#myForm");
    	
    	$("#backBtn").on("click", function() {
			form.attr("action", goUrlBack).submit();
		})
    </script>
</body>

</html>