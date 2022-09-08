<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="rb" uri="http://www.springframework.org/tags" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>userTest</title>
    <link rel="stylesheet" href="/resources/css/user/sportMain.css">
    <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
    <script>
        $(document).ready(function () {
            $('#icon').click(function () {
                $('ul').toggleClass('show');
            })
        })
    </script>
</head>

<body>
    <div class="container">
        <!-- header 영역 -->
        <header>
            <div class="nav">
                <div class="logo">
                    <a href="/sportMain">
                        <img src="resources/images/SPOPIA_white.png" class="logo_img">
                    </a>
                </div>
                <div class="navigation">
                    <ul class="nav_ul">
                        <li class="nav_li">
                            <a class="login" href="../login/loginForm.html">
                                <i class="fa-solid fa-right-to-bracket"></i>
                            </a>
                        </li>
                        <li class="nav_li">
                            <div class="action">
                                <div class="profile" onclick="menuToggle();">
                                    <img class="pro_img" src="/resources/images/diano.jpg" width="35">
                                </div>
                                <div class="menu">
                                    <h3>
                                        Himmel
                                        <br>
                                        <a href="#" style="text-transform: none;">himmel@gmail.com</a>
                                    </h3>
                                    <ul class="pro_ul">
                                        <li class="pro_li">
                                            <a class="pro_a" href="../member/memberView.html">
                                                <i class="fa-solid fa-user me-2"></i>
                                                Edit Profile
                                            </a>
                                        </li>
                                        <li class="pro_li">
                                            <a class="pro_a" href="../../dmin/Dashboard/Dashboard.html">
                                                <i class="fa-solid fa-gear me-2"></i>
                                                Admin Page
                                            </a>
                                        </li>
                                        <li class="pro_li">
                                            <a class="pro_a" href="#">
                                                <i class="fa-solid fa-circle-info me-2"></i>
                                                Help
                                            </a>
                                        </li>
                                        <li class="pro_li">
                                            <a class="pro_a" href="/">
                                                <i class="fa-solid fa-power-off me-2"></i>
                                                Sign Out
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
            <div id="topbar" role="menubar">
                <nav class="menuBar">
                    <label id="icon">
                        <i class="fas fa-bars"></i>
                    </label>
                    <ul>
                        <li><a class="menu_link" href="/sportMain">스포츠 홈</a></li>
                        <li><a class="menu_link" href="#">야구</a></li>
                        <li><a class="menu_link" href="#">해외야구</a></li>
                        <li><a class="menu_link" href="#">축구</a></li>
                        <li><a class="menu_link" href="#">해외축구</a></li>
                    </ul>
                    <div class="animation start-home"></div>
                </nav>
            </div>
        </header>
        <!-- main 영역 -->
        <main>
            <!-- game 영역 -->
            <div id="game">
                <div class="game_pagination">
                    <a href="#"><i class="fa-solid fa-circle-chevron-left"></i></a>
                </div>
                <a class="game_live" href="../member/gameView.html" hidden>
                    <div class="image_area">
                        <span class="game_preivew">
                            <img src="/resources/images/user/baseball.jpg" alt="game_preview">
                        </span>
                        <div class="live_info">
                            <span class="live_tag">
                                <span class="blind">LIVE</span>
                            </span>
                            <span class="live_viewer">
                                <span class="number">1,569</span>
                                시청
                            </span>
                        </div>
                    </div>
                    <div class="general_info">
                        <div class="match_title">2022 프로야구</div>
                        <div class="match_press">
                            <span class="league">야구</span>
                        </div>
                    </div>
                </a>
                <a class="game_card" href="">
                    <div class="head">
                        <span class="event">야구</span>
                        <span class="league">KBO</span>
                    </div>
                    <div class="game_content">
                        <div class="away game">
                            <img class="away_img" src="https://sports-phinf.pstatic.net/team/kbo/default/OB.png"
                                width="30" height="30">
                            <br>
                            <span>두산</span>
                        </div>
                        <div class="info game">
                            <span>VS</span>
                            <br>
                            <span>18:00 예정</span>
                        </div>
                        <div class="home game">
                            <img class="home_img" src="https://sports-phinf.pstatic.net/team/kbo/default/HT.png"
                                width="30" height="30">
                            <br>
                            <span>KIA</span>
                        </div>
                    </div>
                </a>
                <a class="game_card" href="#">
                    <div class="head">
                        <span class="event">야구</span>
                        <span class="league">KBO</span>
                    </div>
                    <div class="game_content">
                        <div class="away game">
                            <img class="away_img" src="https://sports-phinf.pstatic.net/team/kbo/default/SS.png"
                                width="30" height="30">
                            <br>
                            <span>삼성</span>
                        </div>
                        <div class="info game">
                            <span>VS</span>
                            <br>
                            <span>18:00 예정</span>
                        </div>
                        <div class="home game">
                            <img class="home_img" src="https://sports-phinf.pstatic.net/team/kbo/default/SK.png"
                                width="30" height="30">
                            <br>
                            <span>SSG</span>
                        </div>
                    </div>
                </a>
                <a class="game_card" href="#">
                    <div class="head">
                        <span class="event">축구</span>
                        <span class="league">K리그 1</span>
                    </div>
                    <div class="game_content">
                        <div class="away game">
                            <img class="away_img" src="https://sports-phinf.pstatic.net/team/kleague/default/17.png"
                                width="30" height="30">
                            <br>
                            <span>대구</span>
                        </div>
                        <div class="info game">
                            <span>VS</span>
                            <br>
                            <span>19:30 예정</span>
                        </div>
                        <div class="home game">
                            <img class="home_img" src="https://sports-phinf.pstatic.net/team/kleague/default/29.png"
                                width="30" height="30">
                            <br>
                            <span>수원FC</span>
                        </div>
                    </div>
                </a>
                <a class="game_card" href="#">
                    <div class="head">
                        <span class="event">축구</span>
                        <span class="league">K리그 1</span>
                    </div>
                    <div class="game_content">
                        <div class="away game">
                            <img class="away_img"
                                src="https://sports-phinf.pstatic.net/team/kleague/default/01.png?type=f108_108"
                                width="30" height="30">
                            <br>
                            <span>울산</span>
                        </div>
                        <div class="info game">
                            <span>VS</span>
                            <br>
                            <span>19:30 예정</span>
                        </div>
                        <div class="home game">
                            <img class="home_img" src="https://sports-phinf.pstatic.net/team/kleague/default/05.png"
                                width="30" height="30">
                            <br>
                            <span>전북</span>
                        </div>
                    </div>
                </a>
                <div class="game_pagination">
                    <a href="#"><i class="fa-solid fa-circle-chevron-right"></i></a>
                </div>
            </div>
            <!-- article 영역 -->
            <div id="article">
                <a class="article_card" href="article/articleView">
                    <div class="article_img">
                        <img class="article_img" src="/resources/images/user/baseball.jpg">
                    </div>
                    <div class="article_content">
                        <div class="article_title">
                            '폭우 속 혈투' 수원FC, 강원 3:2로 꺾고 6위 사수
                        </div>
                        <div class="article_context">
                            라스(수원FC). 한국프로축구연맹 제공수원FC가 수중전으로 치러진 강원FC 원정 경기에서 승리를 따냈다.15일 강원도 춘천에 위치한 춘천송암스포츠타운에서 하..."
                        </div>
                        <div class="article_info">
                            <span class="newspaper">풋볼리스트</span>
                            <span class="league">K리그</span>
                        </div>
                    </div>
                </a>
                <a class="article_card">
                    <div class="article_img">
                        <img class="article_img" src="/resources/images/user/baseball.jpg">
                    </div>
                    <div class="article_content">
                        <div class="article_title">
                            '폭우 속 혈투' 수원FC, 강원 3:2로 꺾고 6위 사수
                        </div>
                        <div class="article_context">
                            라스(수원FC). 한국프로축구연맹 제공수원FC가 수중전으로 치러진 강원FC 원정 경기에서 승리를 따냈다.15일 강원도 춘천에 위치한 춘천송암스포츠타운에서 하..."
                        </div>
                        <div class="article_info">
                            <span class="newspaper">풋볼리스트</span>
                            <span class="league">K리그</span>
                        </div>
                    </div>
                </a>
                <a class="article_card">
                    <div class="article_img">
                        <img class="article_img" src="/resources/images/user/baseball.jpg">
                    </div>
                    <div class="article_content">
                        <div class="article_title">
                            '폭우 속 혈투' 수원FC, 강원 3:2로 꺾고 6위 사수
                        </div>
                        <div class="article_context">
                            라스(수원FC). 한국프로축구연맹 제공수원FC가 수중전으로 치러진 강원FC 원정 경기에서 승리를 따냈다.15일 강원도 춘천에 위치한 춘천송암스포츠타운에서 하..."
                        </div>
                        <div class="article_info">
                            <span class="newspaper">풋볼리스트</span>
                            <span class="league">K리그</span>
                        </div>
                    </div>
                </a>
                <a class="article_card">
                    <div class="article_img">
                        <img class="article_img" src="/resources/images/user/baseball.jpg">
                    </div>
                    <div class="article_content">
                        <div class="article_title">
                            '폭우 속 혈투' 수원FC, 강원 3:2로 꺾고 6위 사수
                        </div>
                        <div class="article_context">
                            라스(수원FC). 한국프로축구연맹 제공수원FC가 수중전으로 치러진 강원FC 원정 경기에서 승리를 따냈다.15일 강원도 춘천에 위치한 춘천송암스포츠타운에서 하..."
                        </div>
                        <div class="article_info">
                            <span class="newspaper">풋볼리스트</span>
                            <span class="league">K리그</span>
                        </div>
                    </div>
                </a>
                <a class="article_card">
                    <div class="article_img">
                        <img class="article_img" src="/resources/images/user/baseball.jpg">
                    </div>
                    <div class="article_content">
                        <div class="article_title">
                            '폭우 속 혈투' 수원FC, 강원 3:2로 꺾고 6위 사수
                        </div>
                        <div class="article_context">
                            라스(수원FC). 한국프로축구연맹 제공수원FC가 수중전으로 치러진 강원FC 원정 경기에서 승리를 따냈다.15일 강원도 춘천에 위치한 춘천송암스포츠타운에서 하..."
                        </div>
                        <div class="article_info">
                            <span class="newspaper">풋볼리스트</span>
                            <span class="league">K리그</span>
                        </div>
                    </div>
                </a>
                <a class="article_card">
                    <div class="article_img">
                        <img class="article_img" src="/resources/images/user/baseball.jpg">
                    </div>
                    <div class="article_content">
                        <div class="article_title">
                            '폭우 속 혈투' 수원FC, 강원 3:2로 꺾고 6위 사수
                        </div>
                        <div class="article_context">
                            라스(수원FC). 한국프로축구연맹 제공수원FC가 수중전으로 치러진 강원FC 원정 경기에서 승리를 따냈다.15일 강원도 춘천에 위치한 춘천송암스포츠타운에서 하..."
                        </div>
                        <div class="article_info">
                            <span class="newspaper">풋볼리스트</span>
                            <span class="league">K리그</span>
                        </div>
                    </div>
                </a>
            </div>
            <div id="content">
                <div class="content_header">
                    <h3>스포츠 창작자 영상</h3>
                    <div class="content_pagination">
                        <a href="#"><i class="fa-solid fa-circle-chevron-left"></i></a>
                        <a href="#"><i class="fa-solid fa-circle-chevron-right"></i></a>
                    </div>
                </div>
                <div class="contents">
                    <a class="contents_card">
                        <div>
                            <img class="contents_img" src="/resources/images/user/baseball.jpg">
                        </div>
                        <div class="contents_content">
                            <div class="contents_title">
                                17 골스 vs 01 레이커스, 승자는 누구?
                            </div>
                            <div class="contents_info">
                                <span class="count">조회 906</span>
                                <span class="channel">루키 더 바스켓</span>
                            </div>
                        </div>
                    </a>
                    <a class="contents_card">
                        <div>
                            <img class="contents_img" src="/resources/images/user/baseball.jpg">
                        </div>
                        <div class="contents_content">
                            <div class="contents_title">
                                17 골스 vs 01 레이커스, 승자는 누구?
                            </div>
                            <div class="contents_info">
                                <span class="count">조회 906</span>
                                <span class="channel">루키 더 바스켓</span>
                            </div>
                        </div>
                    </a>
                    <a class="contents_card">
                        <div>
                            <img class="contents_img" src="/resources/images/user/baseball.jpg">
                        </div>
                        <div class="contents_content">
                            <div class="contents_title">
                                17 골스 vs 01 레이커스, 승자는 누구?
                            </div>
                            <div class="contents_info">
                                <span class="count">조회 906</span>
                                <span class="channel">루키 더 바스켓</span>
                            </div>
                        </div>
                    </a>
                    <a class="contents_card">
                        <div>
                            <img class="contents_img" src="/resources/images/user/baseball.jpg">
                        </div>
                        <div class="contents_content">
                            <div class="contents_title">
                                17 골스 vs 01 레이커스, 승자는 누구?
                            </div>
                            <div class="contents_info">
                                <span class="count">조회 906</span>
                                <span class="channel">루키 더 바스켓</span>
                            </div>
                        </div>
                    </a>
                    <a class="contents_card">
                        <div>
                            <img class="contents_img" src="/resources/images/user/baseball.jpg">
                        </div>
                        <div class="contents_content">
                            <div class="contents_title">
                                17 골스 vs 01 레이커스, 승자는 누구?
                            </div>
                            <div class="contents_info">
                                <span class="count">조회 906</span>
                                <span class="channel">루키 더 바스켓</span>
                            </div>
                        </div>
                    </a>
                    <a class="contents_card">
                        <div>
                            <img class="contents_img" src="/resources/images/user/baseball.jpg">
                        </div>
                        <div class="contents_content">
                            <div class="contents_title">
                                17 골스 vs 01 레이커스, 승자는 누구?
                            </div>
                            <div class="contents_info">
                                <span class="count">조회 906</span>
                                <span class="channel">루키 더 바스켓</span>
                            </div>
                        </div>
                    </a>
                    <a class="contents_card">
                        <div>
                            <img class="contents_img" src="/resources/images/user/baseball.jpg">
                        </div>
                        <div class="contents_content">
                            <div class="contents_title">
                                17 골스 vs 01 레이커스, 승자는 누구?
                            </div>
                            <div class="contents_info">
                                <span class="count">조회 906</span>
                                <span class="channel">루키 더 바스켓</span>
                            </div>
                        </div>
                    </a>
                </div>
            </div>
            <div id="vod">
                <div class="vod_title">
                    <a href="#">
                        <span>많이 본 영상</span>
                        <i class="fa-solid fa-chevron-right"></i>
                    </a>
                </div>
                <div class="vod_content">
                    <a class="vods" href="#">
                        <div class="video">
                            <img class="vods_img" src="/resources/images/user/baseball.jpg">
                            <span class="vod_rank">1</span>
                            <span class="vod_time">13:54</span>
                        </div>
                        <div class="vod_info">
                            <span>[전체HL] '사자 사냥꾼' LG, 삼성 상대 6연승</span>
                        </div>
                    </a>
                    <a class="vods" href="#">
                        <div class="video">
                            <img class="vods_img" src="/resources/images/user/baseball.jpg">
                            <span class="vod_rank">2</span>
                            <span class="vod_time">13:54</span>
                        </div>
                        <div class="vod_info">
                            <span>[전체HL] '사자 사냥꾼' LG, 삼성 상대 6연승</span>
                        </div>
                    </a>
                    <a class="vods" href="#">
                        <div class="video">
                            <img class="vods_img" src="/resources/images/user/baseball.jpg">
                            <span class="vod_rank">3</span>
                            <span class="vod_time">13:54</span>
                        </div>
                        <div class="vod_info">
                            <span>[전체HL] '사자 사냥꾼' LG, 삼성 상대 6연승</span>
                        </div>
                    </a>
                    <a class="vods" href="#">
                        <div class="video">
                            <img class="vods_img" src="/resources/images/user/baseball.jpg">
                            <span class="vod_rank">4</span>
                            <span class="vod_time">13:54</span>
                        </div>
                        <div class="vod_info">
                            <span>[전체HL] '사자 사냥꾼' LG, 삼성 상대 6연승</span>
                        </div>
                    </a>
                    <a class="vods" href="#">
                        <div class="video">
                            <img class="vods_img" src="/resources/images/user/baseball.jpg">
                            <span class="vod_rank">5</span>
                            <span class="vod_time">13:54</span>
                        </div>
                        <div class="vod_info">
                            <span>[전체HL] '사자 사냥꾼' LG, 삼성 상대 6연승</span>
                        </div>
                    </a>
                    <a class="vods" href="#">
                        <div class="video">
                            <img class="vods_img" src="/resources/images/user/baseball.jpg">
                            <span class="vod_rank">6</span>
                            <span class="vod_time">13:54</span>
                        </div>
                        <div class="vod_info">
                            <span>[전체HL] '사자 사냥꾼' LG, 삼성 상대 6연승</span>
                        </div>
                    </a>
                    <a class="vods" href="#">
                        <div class="video">
                            <img class="vods_img" src="/resources/images/user/baseball.jpg">
                            <span class="vod_rank">7</span>
                            <span class="vod_time">13:54</span>
                        </div>
                        <div class="vod_info">
                            <span>[전체HL] '사자 사냥꾼' LG, 삼성 상대 6연승</span>
                        </div>
                    </a>
                    <a class="vods" href="#">
                        <div class="video">
                            <img class="vods_img" src="/resources/images/user/baseball.jpg">
                            <span class="vod_rank">8</span>
                            <span class="vod_time">13:54</span>
                        </div>
                        <div class="vod_info">
                            <span>[전체HL] '사자 사냥꾼' LG, 삼성 상대 6연승</span>
                        </div>
                    </a>
                    <a class="vods" href="#">
                        <div class="video">
                            <img class="vods_img" src="/resources/images/user/baseball.jpg">
                            <span class="vod_rank">9</span>
                            <span class="vod_time">13:54</span>
                        </div>
                        <div class="vod_info">
                            <span>[전체HL] '사자 사냥꾼' LG, 삼성 상대 6연승</span>
                        </div>
                    </a>
                    <a class="vods" href="#">
                        <div class="video">
                            <img class="vods_img" src="/resources/images/user/baseball.jpg">
                            <span class="vod_rank">10</span>
                            <span class="vod_time">13:54</span>
                        </div>
                        <div class="vod_info">
                            <span>[전체HL] '사자 사냥꾼' LG, 삼성 상대 6연승</span>
                        </div>
                    </a>
                </div>
                <div class="moreBtn">
                    <button type="button" class="more">
                        11위~20위 영상 더보기
                        <i class="fa-solid fa-chevron-down"></i>
                    </button>
                </div>
            </div>
            <div id="recommend_art">
                <div class="recommend_title">
                    <a href="#">
                        <span>추천뉴스</span>
                    </a>
                </div>
                <div class="recommend_info">
                    <a class="rc" href="#">
                        <div>
                            <img src="/resources/images/user/baseball.jpg">
                        </div>
                        <div class="rc_info">
                            <p class="rc_content">“월드컵 우승 유럽 유리” 뭔 소리야...“남미 난이도 훨씬 높아”</p>
                            <p class="rc_newspaper">뉴시스</p>
                        </div>
                    </a>
                    <a class="rc" href="#">
                        <div>
                            <img src="/resources/images/user/baseball.jpg">
                        </div>
                        <div>
                            <p class="rc_content">“월드컵 우승 유럽 유리” 뭔 소리야...“남미 난이도 훨씬 높아”</p>
                            <p class="rc_newspaper">뉴시스</p>
                        </div>
                    </a>
                    <a class="rc" href="#">
                        <div>
                            <img src="/resources/images/user/baseball.jpg">
                        </div>
                        <div>
                            <p class="rc_content">“월드컵 우승 유럽 유리” 뭔 소리야...“남미 난이도 훨씬 높아”</p>
                            <p class="rc_newspaper">뉴시스</p>
                        </div>
                    </a>
                    <a class="rc" href="#">
                        <div>
                            <img src="/resources/images/user/baseball.jpg">
                        </div>
                        <div>
                            <p class="rc_content">“월드컵 우승 유럽 유리” 뭔 소리야...“남미 난이도 훨씬 높아”</p>
                            <p class="rc_newspaper">뉴시스</p>
                        </div>
                    </a>
                    <a class="rc" href="#">
                        <div>
                            <img src="/resources/images/user/baseball.jpg">
                        </div>
                        <div>
                            <p class="rc_content">“월드컵 우승 유럽 유리” 뭔 소리야...“남미 난이도 훨씬 높아”</p>
                            <p class="rc_newspaper">뉴시스</p>
                        </div>
                    </a>
                    <a class="rc" href="#">
                        <div>
                            <img src="/resources/images/user/baseball.jpg">
                        </div>
                        <div>
                            <p class="rc_content">“월드컵 우승 유럽 유리” 뭔 소리야...“남미 난이도 훨씬 높아”</p>
                            <p class="rc_newspaper">뉴시스</p>
                        </div>
                    </a>
                    <a class="rc" href="#">
                        <div>
                            <img src="/resources/images/user/baseball.jpg">
                        </div>
                        <div>
                            <p class="rc_content">“월드컵 우승 유럽 유리” 뭔 소리야...“남미 난이도 훨씬 높아”</p>
                            <p class="rc_newspaper">뉴시스</p>
                        </div>
                    </a>
                    <a class="rc" href="#">
                        <div>
                            <img src="/resources/images/user/baseball.jpg">
                        </div>
                        <div>
                            <p class="rc_content">“월드컵 우승 유럽 유리” 뭔 소리야...“남미 난이도 훨씬 높아”</p>
                            <p class="rc_newspaper">뉴시스</p>
                        </div>
                    </a>
                    <a class="rc" href="#">
                        <div>
                            <img src="/resources/images/user/baseball.jpg">
                        </div>
                        <div>
                            <p class="rc_content">“월드컵 우승 유럽 유리” 뭔 소리야...“남미 난이도 훨씬 높아”</p>
                            <p class="rc_newspaper">뉴시스</p>
                        </div>
                    </a>
                </div>
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
    </div>

    <script>
        function menuToggle() {
            const toggleMenu = document.querySelector('.menu');
            toggleMenu.classList.toggle('active')
        }
    </script>
    <script src="https://kit.fontawesome.com/1d32d56af5.js" crossorigin="anonymous"></script>
</body>

</html>