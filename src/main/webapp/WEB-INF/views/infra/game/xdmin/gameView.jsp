<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="rb" uri="http://www.springframework.org/tags" %>

<!doctype html>
<html lang="ko" data-theme="light">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no">
    <title>네이버 스포츠</title>
    <script>"Microsoft Internet Explorer" === navigator.appName && (window.onload = function () { "false" !== window.sessionStorage.getItem("gameCenterIeAlert") && (window.sessionStorage.setItem("gameCenterIeAlert", "false"), alert("Internet Explorer 10 이하 버전의 유저에게는 일부 서비스가 정상 작동하지 않을 수 있습니다. 원활한 서비스를 위해 상위 버전으로 업그레이드 후 이용해 주시기를 권해드립니다.")) })</script>
    <link
        href="https://ssl.pstatic.net/static.sports/resources/web-ui/game/220804-183157/static/css/main.5632a96e.chunk.css"
        rel="stylesheet">
    <script type="text/javascript" src="https://ssl.pstatic.net/static.sports/resources/web-ui/nclk_nos.js"
        id="_nclk_js"></script>
    <script type="text/javascript" src="https://ssl.pstatic.net/spi/js/release/ko_KR/splugin.m.js?20220807"
        async=""></script>
    <link rel="stylesheet" type="text/css"
        href="https://ssl.pstatic.net/static.sports/resources/web-ui/game/220804-183157/static/css/14.ec71709b.chunk.css">
    <script charset="utf-8"
        src="https://ssl.pstatic.net/static.sports/resources/web-ui/game/220804-183157/static/js/14.956e9981.chunk.js"></script>
    <script src="https://ssl.pstatic.net/static.sports/resources/web-ui/lcslog.js" async=""></script>
    <link id="naver-splugin-css" rel="stylesheet" type="text/css"
        href="https://ssl.pstatic.net/spi/css/20210531/spi_standard_m_https.css">
    <script src="https://ssl.pstatic.net/static.sports/resources/web-ui/lcslog.js" async=""></script>
    <script type="text/javascript" charset="utf-8"
        src="https://ssl.pstatic.net/static.cbox/js/cbox.core.js?v=1383187"></script>
    <style type="text/css" id="_cbox_default_style_"></style>
    <script type="text/javascript" src="https://ssl.pstatic.net/static.cbox/20220804143236/js/cbox.all.js"
        charset="utf-8"></script>
    <link type="text/css" rel="stylesheet"
        href="https://ssl.pstatic.net/static.cbox/20220804143236/css/comment_sports_talk.css" charset="utf-8">

    <title>Game View</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
    <link href="/resources/css/xdmin/game/gameView.css" rel="stylesheet" type="text/css">
</head>

<body>
    <!-- start -->
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
                                <li class="px-3 mb-2 border-bottom">
                                    <div class="d-flex align-items-center pb-2">
                                        <!-- Avatar -->
                                        <div class="avatar ps-1 pt-2">
                                            <img class="avatar-img rounded-circle shadow" src="../../resources/images/diano.jpg"
                                                alt="avatar" style="width: 30px;">
                                        </div>
                                        <div>
                                            <a class="fs-6 fw-bold" href="#">이하늘</a>
                                            <p class="small m-0">himmel@gmail.com</p>
                                        </div>
                                    </div>
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
        <div class="container" style="max-width: 1000px;">
            <div class="card shadow p-3 mb-3">
                <div class="fs-3 text-center mb-2 fw-bold">
                    <span>메인페이지 경기 기록 미리보기</span>
                </div>
                <div class="col-4 offset-3 card text-white" style="width: 50%;">
                    <img src="../../resources/images/user/baseball.jpg" class="card-img shadow" alt="..." style="height: 250px;">
                    <div class="card-img-overlay">
                        <span class="card-title fs-3 text-center">야구</span>
                        <span class="card-title fs-3 ms-3 text-center">KBO 리그</span>
                        <div class="row text-center mt-5">
                            <div class="col">
                                <p class="emblem mb-2">
                                    <img src="https://sports-phinf.pstatic.net/team/kbo/default/OB.png" width="40" height="40"
                                        alt="두산" onerror="imageOnError(this);">
                                </p>
                                <span class="card-text fs-6">두산</span>
                            </div>
                            <div class="col p-2">
                                <p class="card-text mb-2 fs-6">VS</p>
                                <span class="card-text fs-6">18:00 예정</span>
                            </div>
                            <div class="col">
                                <p class="emblem mb-2">
                                    <img src="https://sports-phinf.pstatic.net/team/kbo/default/HT.png" width="40" height="40"
                                        alt="" onerror="imageOnError(this);">
                                </p>
                                <span class="card-text fs-6">KIA</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="card shadow p-3">
                <div class="fs-3 mt-3 text-center mb-2 fw-bold">
                    <span>경기 상세 페이지 미리보기</span>
                </div>
                <div class="card shadow">
                    <!-- <img class="card-img" src="../../image/background.jpg" alt="background" style="height: 300px;"> -->
                    <img src="https://ssl.pstatic.net/static/sports/common/livecenter/new/bg_live_baseball.jpg"
                        class="LiveGuide_cover_image__3dPRt card shadow alt="">
                                <div class=" card-img-overlay align-bottom text-white">
                    <span class="blind">남은 시간</span>
                    <div class="position-absolute top-50 start-50 translate-middle text-center">
                        <time datetime="03:43:02">03:43:02</time>
                        <p class="LiveGuide_text__sQNRi ">라이브가 곧 시작됩니다.</p>
                    </div>
                </div>
                </div>
                <div class="mb-3 rounded shadow MatchBox_comp_match_box__1oRmr MatchBox_type_ready__2Q2dm">
                    <div class="MatchBox_info__2l4DE">
                        <span class="MatchBox_state__2AzL_">경기전</span>
                        <span class="MatchBox_date__1bJ9G mb-2">08.06<span class="MatchBox_time__2z_nB">18:00</span></span>
                        <span class="MatchBox_stadium__17mQ4">광주</span>
                    </div>
                    <div class="MatchBox_home__MPL6D pt-2">
                        <div class="MatchBox_team_area__a9Jet">
                            <div class="MatchBox_image__3CcVt"><img
                                    src="https://sports-phinf.pstatic.net/team/kbo/default/OB.png?type=f108_108" alt="" width="72"
                                    height="72"></div>
                            <div class="MatchBox_text__22e-R text-center">
                                <em class="MatchBox_name__11AyG">두산</em>
                                <p class="MatchBox_pitcher__2Krgp">선-스탁</p>
                            </div>
                        </div>
                    </div>
                    <div class="MatchBox_away__1rDsC pt-2">
                        <div class="MatchBox_team_area__a9Jet">
                            <div class="MatchBox_image__3CcVt"><img
                                    src="https://sports-phinf.pstatic.net/team/kbo/default/HT.png?type=f108_108" alt="" width="72"
                                    height="72"></div>
                            <div class="MatchBox_text__22e-R text-center">
                                <em class="MatchBox_name__11AyG">
                                    <i class="MatchBox_badge__p5jYW">홈</i>KIA</em>
                                <p class="MatchBox_pitcher__2Krgp">선-임기영</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row mt-3">
                <div class="col">
                    <a role="button" class="btn btn-primary" href="/game/gameList">
                        <span style="color: white; font-weight: 800;">뒤로</span>
                    </a>
                </div>
                <div class="col offset-9" align="right">
                    <a role="button" class="btn btn-primary" href="/game/gameModForm">
                        <span style="color: white; font-weight: 800;">수정</span>
                    </a>
                </div>
            </div>
        </div>
        <div style="height: 40px;"></div>
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

    <!-- end -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2"
        crossorigin="anonymous"></script>
    <script src="https://kit.fontawesome.com/1d32d56af5.js" crossorigin="anonymous"></script>
</body>

</html>