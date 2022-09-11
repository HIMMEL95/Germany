<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="rb" uri="http://www.springframework.org/tags" %>

<!doctype html>
<html lang="ko" data-theme="light">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Game Mod Form</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
    <link href="/resources/css/xdmin/game/gameModForm.css" rel="stylesheet" type="text/css">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
</head>

<body>
    <!-- start -->
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
        <div style="height: 80px;"></div>
        <div class="container">
            <form>  
                <div class="text-center pb-3">
                    <span class="fs-1 fw-bold">경기 기록 수정</span>
                </div>
                <div class="card ps-5 pe-5 pt-4 pb-4 shadow">
                    <div class="row pt-4">
                        <div class="col mb-4">
                            <label for="abroadNy" class="form-label fw-bold">해외여부</label>
                            <select class="form-select form-select" id="abroadNy" name="abroadNy" aria-label=".form-select example">
                                <option value="">선택</option>
                                <option value="1" selected>국내</option>
                                <option value="2">해외</option>
                            </select>
                        </div>
                        <div class="col mb-4">
                            <label for="event" class="form-label fw-bold">종목</label>
                            <select class="form-select form-select" id="event" name="event" aria-label=".form-select example">
                                <option value="">선택</option>
                                <option value="1" selected>야구</option>
                                <option value="2">축구</option>
                            </select>
                        </div>
                        <div class="col mb-4">
                            <label for="league" class="form-label fw-bold">리그</label>
                            <input class="form-control" list="league" id="league" name="league" placeholder="Type to search...">
                            <datalist id="league">
                                <option value="KBO" selected>KBO</option>
                                <option value="메이저리그">메이저리그</option>
                                <option value="아메리칸리그">아메리칸리그</option>
                                <option value="센트럴리그">센트럴리그</option>
                                <option value="퍼시픽리그">퍼시픽리그</option>
                                <option value="K리그 1">K리그 1</option>
                                <option value="K리그 2">K리그 2</option>
                                <option value="프리미어리그">프리미어리그</option>
                                <option value="라리가">라리가</option>
                                <option value="분데스리가">분데스리가</option>
                                <option value="세리에 A">세리에 A</option>
                                <option value="리그 1">리그 1</option>
                            </datalist>
                        </div>
                    </div>
                    <div class="row mb-4">
                        <div class="col">
                            <label for="team_home" class="form-label fw-bold">홈팀</label>
                            <select class="form-select form-select" id="team_home" name="team_home" aria-label=".form-select example">
                                <option value="">선택</option>
                                <option value="1" selected>두산 베어스</option>
                                <option value="2">KIA 타이거즈</option>
                                <option value="3">SSG 랜더스</option>
                                <option value="4">삼성 라이온즈</option>
                            </select>
                        </div>
                        <div class="col">
                            <label for="team_away" class="form-label fw-bold">원정팀</label>
                            <select class="form-select form-select" id="team_away" name="team_away" value="" aria-label=".form-select example">
                                <option value="">선택</option>
                                <option value="1">두산 베어스</option>
                                <option value="2" selected>KIA 타이거즈</option>
                                <option value="3">SSG 랜더스</option>
                                <option value="4">삼성 라이온즈</option>
                            </select>
                        </div>
                    </div>
                    <div class="row mb-4">
                        <div class="col">
                            <label for="player_home" class="form-label fw-bold">홈팀 선발</label>
                            <input type="text" class="form-control" id="player_home" name="player_home" value="<c:out value="${item.player_home }"/>" required>
                        </div>
                        <div class="col">
                            <label for="awayTeamScore" class="form-label fw-bold">원정팀 선발</label>
                            <input type="text" class="form-control" id="player_away" value="<c:out value="${item.player_away }"/>" required>
                        </div>
                    </div>
                    <div class="row mb-4">
                        <div class="col">
                            <label for="score_home" class="form-label fw-bold">홈팀 스코어</label>
                            <input type="number" class="form-control" id="score_home" name="score_home" value="<c:out value="${item.score_home }"/>" required>
                        </div>
                        <div class="col">
                            <label for="score_away" class="form-label fw-bold">원정팀 스코어</label>
                            <input type="number" class="form-control" id="score_away" name="score_away" value="<c:out value="${item.score_away }"/>" required>
                        </div>
                    </div>
                    <div class="row mb-4">
                        <div class="col">
                            <label for="stadium" class="form-label fw-bold">경기장</label>
                            <select class="form-select form-select" id="stadium" name="stadium" aria-label=".form-select example">
                                <option selected>선택</option>
                                <option value="1">서울</option>
                                <option value="2" selected>광주</option>
                                <option value="3">인천</option>
                                <option value="4">대구</option>
                            </select>
                        </div>
                        <div class="col">
                            <label for="gameDuration" class="form-label fw-bold">경기 시간</label>
                            <input type="time" class="form-control" id="gameDuration" name="gameDuration" value="<c:out value="${item.gameDuration }"/>" required>
                        </div>
                    </div>
                    <div class="row mb-4">
                        <div class="col-6">
                            <label for="gameDates" class="form-label fw-bold">경기 일자</label>
                            <input type="text" class="form-control datepicker" id="gameDate" name="gameDate" value="<c:out value="${item.gameDate }"/>" required>
                        </div>
                    </div>
                    <div class="row mb-4">
                        <div class="col align-items-center">
                            <img src="" id="preview" width="500px;" class="mb-2">
                            <label for="ex_file"></label>
                            <input type="file" id="ex_file" class="form-control" aria-label="file example">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-2">
                            <a class="btn btn-primary text-white fw-bold btn-sm shadow" href="../game/gameList.html"
                                role="button">취소</a>
                        </div>
                        <div class="col-2 offset-8" align="right">
                            <a class="btn btn-primary text-white fw-bold btn-sm shadow" href="../game/gameList.html"
                                role="button">등록</a>
                        </div>
                    </div>
                </div>
            </form>
        </div>
        <div style="height: 50px;"></div>
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

    <!-- end -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2"
        crossorigin="anonymous"></script>
    <script src="https://kit.fontawesome.com/1d32d56af5.js" crossorigin="anonymous"></script>
    <script type="text/javascript">
        // 이미지 미리보기
		const reader = new FileReader();

        reader.onload = (readerEvent) => {
            document.querySelector("#preview").setAttribute("src", readerEvent.target.result);
        };

        document.querySelector("#ex_file").addEventListener("change", (changeEvent) => {

            const imgFile = changeEvent.target.files[0];
            reader.readAsDataURL(imgFile);
            document.getElementById("text").innerHTML = " ";
        })
        
        $(function() {
	   		$("#gameDate").datepicker({
	   			dateFormat: "yy-mm-dd"
	   			,showMonthAfterYear: true
	   			,showOtherMonths: true
	   		});
	   	})
    </script>
</body>

</html>