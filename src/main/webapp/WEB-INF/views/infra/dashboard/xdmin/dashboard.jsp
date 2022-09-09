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
    <title>Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
    <link href="/resources/css/xdmin/dashboard.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/charts.css/dist/charts.min.css">
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
                                        <div class="avatar mt-2">
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
            <form method="get">
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
                                                            <a class="nav-link" href="/comment">
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
                        <div class="row">
                            <span class="fs-1 fw-bold">Dashboard</span>
                            <div class="col card m-2 shadow">
                                <div class="card-body">
                                    <p class="card-title fw-bold">일 평균 접속자 수</p>
                                    <p class="card-subtitle mb-2 text-muted">Card subtitle</p>
                                </div>
                            </div>
                            <div class="col card m-2 shadow">
                                <div class="card-body">
                                    <p class="card-title fw-bold">PageViews</p>
                                    <p class="card-subtitle mb-2 text-muted">Card subtitle</p>
                                </div>
                            </div>
                            <div class="col card m-2 shadow">
                                <div class="card-body">
                                    <p class="card-title fw-bold">게시글</p>
                                    <p class="card-subtitle mb-2 text-muted">Card subtitle</p>
                                </div>
                            </div>
                        </div>
                
                        <!-- 통계 자료 -->
                        <div class="row">
                            <div class="card col-12 mb-4 shadow">
                                <div class="card-header bg-white">
                                    <div class="row pt-2">
                                        <div class="col-3">
                                            <span class="fw-bold fs-5 col-3">
                                                접속자 수
                                            </span>
                                        </div>
                                        <div class="col-2 offset-7">
                                            <select class="form-select form-select-sm fw-bold" aria-label=".form-select-sm example">
                                                <option value="" selected>선택</option>
                                                <option value="Jan">1월</option>
                                                <option value="Feb">2월</option>
                                                <option value="Mar">3월</option>
                                                <option value="Apr">4월</option>
                                                <option value="May">5월</option>
                                                <option value="Jun">6월</option>
                                                <option value="Jul">7월</option>
                                                <option value="Aug">8월</option>
                                                <option value="Sep">9월</option>
                                                <option value="Oct">10월</option>
                                                <option value="Nov">11월</option>
                                                <option value="Dec">12월</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="card-body">
                                    <table class="charts-css line show-4-secondary-axes show-labels" id="my-chart">
                                        <tbody>
                                            <tr>
                                                <th scope="row">1</th>
                                                <td style="--start: 0.0; --size: 0.4"> <span class="data"> $ 40K </span> </td>
                                            </tr>
                                            <tr>
                                                <th scope="row">2</th>
                                                <td style="--start: 0.4; --size: 0.2"> <span class="data"> $ 20K </span> </td>
                                            </tr>
                                            <tr>
                                                <th scope="row">3</th>
                                                <td style="--start: 0.2; --size: 0.6"> <span class="data"> $ 60K </span> </td>
                                            </tr>
                                            <tr>
                                                <th scope="row">4</th>
                                                <td style="--start: 0.6; --size: 0.4"> <span class="data"> $ 40K </span> </td>
                                            </tr>
                                            <tr>
                                                <th scope="row">5</th>
                                                <td style="--start: 0.4; --size: 0.8"> <span class="data"> $ 80K </span> </td>
                                            </tr>
                                            <tr>
                                                <th scope="row">6</th>
                                                <td style="--start: 0.8; --size: 0.6"> <span class="data"> $ 60K </span> </td>
                                            </tr>
                                            <tr>
                                                <th scope="row">7</th>
                                                <td style="--start: 0.6; --size: 1.0"> <span class="data"> $ 100K </span> </td>
                                            </tr>
                                            <tr>
                                                <th scope="row">8</th>
                                                <td style="--start: 1.0; --size: 0.6"> <span class="data"> $ 100K </span> </td>
                                            </tr>
                                            <tr>
                                                <th scope="row">9</th>
                                                <td style="--start: 0.6; --size: 1.0"> <span class="data"> $ 100K </span> </td>
                                            </tr>
                                            <tr>
                                                <th scope="row">10</th>
                                                <td style="--start: 1.0; --size: 0.8"> <span class="data"> $ 100K </span> </td>
                                            </tr>
                                            <tr>
                                                <th scope="row">11</th>
                                                <td style="--start: 0.8; --size: 0.9"> <span class="data"> $ 100K </span> </td>
                                            </tr>
                                            <tr>
                                                <th scope="row">12</th>
                                                <td style="--start: 0.9; --size: 1.0"> <span class="data"> $ 100K </span> </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <div class="card col-12 mb-4 shadow">
                                <div class="card-header bg-white">
                                    <div class="row pt-2">
                                        <div class="col-3">
                                            <span class="fw-bold fs-5 col-3">
                                                신규 가입자 수
                                            </span>
                                        </div>
                                        <div class="col-2 offset-7">
                                            <select class="form-select form-select-sm fw-bold" aria-label=".form-select-sm example">
                                                <option value="" selected>선택</option>
                                                <option value="Jan">1월</option>
                                                <option value="Feb">2월</option>
                                                <option value="Mar">3월</option>
                                                <option value="Apr">4월</option>
                                                <option value="May">5월</option>
                                                <option value="Jun">6월</option>
                                                <option value="Jul">7월</option>
                                                <option value="Aug">8월</option>
                                                <option value="Sep">9월</option>
                                                <option value="Oct">10월</option>
                                                <option value="Nov">11월</option>
                                                <option value="Dec">12월</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="card-body">
                                    <canvas id="myChart" height="300"></canvas>
                                </div>
                            </div>
                            <div class="card col m-2 shadow">
                                <span class="card-header fw-bold fs-5 bg-white">연령 별 가입자 수</span>
                                <div class="card-body">
                                    <canvas id="myChart1"></canvas>
                                </div>
                                <div class="card-footer text-center text-dark bg-white">
                                    <button class="bg-success border shadow rounded" style="width: 20px; height: 20px;"></button>
                                    <span class="fw-bold">10 ~ 29세</span>
                                    <button class="border shadow rounded"
                                        style="width: 20px; height: 20px; background-color: #638df4;"></button>
                                    <span class="fw-bold">30세</span>
                                    <button class=" border shadow rounded"
                                        style="width: 20px; height: 20px; background-color: #2565d0;"></button>
                                    <span class="fw-bold">40세</span>
                                    <button class="border shadow rounded"
                                        style="width: 20px; height: 20px; background-color: #c9e80a;"></button>
                                    <span class="fw-bold">50세</span>
                                    <button class="border shadow rounded"
                                        style="width: 20px; height: 20px; background-color: #ccf7e5;"></button>
                                    <span class="fw-bold">60대 이상</span>
                                </div>
                            </div>
                            <div class="card col m-2 shadow">
                                <span class="card-header fw-bold fs-5 bg-white">성별 가입자 수</span>
                                <div class="card-body">
                                    <canvas id="myChart1"></canvas>
                                </div>
                                <div class="card-footer text-center text-dark bg-white">
                                    <button class="bg-primary border shadow rounded" style="width: 20px; height: 20px;"></button>
                                    <span class="fw-bold">남성</span>
                                    <button class="bg-danger border shadow rounded" style="width: 20px; height: 20px;"></button>
                                    <span class="fw-bold">여성</span>
                                </div>
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
</body>

</html>