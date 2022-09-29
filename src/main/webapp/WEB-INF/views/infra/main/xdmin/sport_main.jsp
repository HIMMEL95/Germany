<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="rb" uri="http://www.springframework.org/tags" %>

<jsp:useBean id="CodeServiceImpl" class="com.spopia.infra.modules.code.CodeServiceImpl"/>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>userTest</title>
    <link rel="stylesheet" href="/resources/css/user/sportMain.css">
    <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.css"/>
	<script src="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.js"></script>
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
    	<form method="post" id="myForm" name="myform">
    		<input type="hidden" name="thisPage" value="<c:out value="${vo.thisPage }" default="1"/>">
           	<input type="hidden" name="rowNumToShow" value="<c:out value="${vo.rowNumToShow }"/>">
           	<input type="hidden" name="gSeq" value='<c:out value="${vo.gSeq }"></c:out>'>
           	<input type="hidden" name="aSeq" value='<c:out value="${vo.aSeq }"></c:out>'>
           	<input type="hidden" name="seq" value='<c:out value="${vo.seq }"></c:out>'>
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
	                    	<c:choose>
	                    		<c:when test="${empty sessSeq }">
	                    			<li class="nav_li">
			                            <a class="login" href="/userLogin">
			                                <i class="fa-solid fa-right-to-bracket"></i>
			                            </a>
			                        </li>
	                    		</c:when>	
	                    		<c:otherwise>
	                    			<li class="nav_li">
			                            <div class="action">
			                                <div class="profile" onclick="menuToggle();">
			                                    <img class="pro_img" src="/resources/images/diano.jpg" width="35">
			                                </div>
			                                <div class="menu">
			                                    <h3>
			                                    	<c:out value="${sessId }"/>
			                                        <br>
			                                        <a href="#" style="text-transform: none;"><c:out value="${sessEmail }"/><br></a>
			                                    </h3>
			                                    <ul class="pro_ul">
				                                    <c:choose>
														<c:when test="${empty sessUser}">
															<li class="pro_li">
					                                            <a class="pro_a" id="signOutBtn" href="/userLogin">
					                                                <i class="fa-solid fa-power-off me-2"></i>
					                                                Sign In
					                                            </a>
					                                        </li>
															<li class="pro_li">
					                                            <a class="pro_a" id="signOutBtn" href="/signUp">
					                                                <i class="fa-solid fa-power-off me-2"></i>
					                                                Sign Up
					                                            </a>
					                                        </li>
														</c:when>
														<c:when test="${sessUser eq 25}">
															<li class="pro_li">
					                                            <a class="pro_a" role="button" id="editBtn" href="/member/memberUView?seq=${sessSeq }" style="cursor: pointer;">
					                                                <i class="fa-solid fa-user me-2"></i>
					                                                Edit Profile
					                                            </a>
					                                        </li>
					                                        <li class="pro_li">
					                                            <a class="pro_a" href="#">
					                                                <i class="fa-solid fa-circle-info me-2"></i>
					                                                Help
					                                            </a>
					                                        </li>
					                                        <li class="pro_li">
					                                            <a class="pro_a" id="signOutBtn" href="/userLogin">
					                                                <i class="fa-solid fa-power-off me-2"></i>
					                                                Sign Out
					                                            </a>
					                                        </li>
														</c:when>
														<c:otherwise>
															<li class="pro_li">
					                                            <a class="pro_a" role="button" id="editBtn" href="/member/memberUView?seq=${sessSeq }" style="cursor: pointer;">
					                                                <i class="fa-solid fa-user me-2"></i>
					                                                Edit Profile
					                                            </a>
					                                        </li>
					                                        <li class="pro_li">
					                                            <a class="pro_a" href="/dashboard">
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
					                                            <a class="pro_a" id="signOutBtn" href="/userLogin">
					                                                <i class="fa-solid fa-power-off me-2"></i>
					                                                Sign Out
					                                            </a>
					                                        </li>
														</c:otherwise>
													</c:choose>
			                                    </ul>
			                                </div>
			                            </div>
			                        </li>
	                    		</c:otherwise>                    	
	                    	</c:choose>
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
	            	 <div class="swiper game_list swiper-container-initialized swiper-container-horizontal" id="game_list" style="display: block;">
                        <div class="swiper-wrapper" style="transform: translate3d(0px, 0px, 0px);">
                        	<div class="swiper-slide">
                        		<c:set var="listCodeEvent" value="${CodeServiceImpl.selectListCachedCode('5') }" />
				                <c:set var="listCodeLeague" value="${CodeServiceImpl.selectListCachedCode('6') }" />
				                <c:set var="listCodeTeam" value="${CodeServiceImpl.selectListCachedCode('7') }" />
				                <c:choose>
			                  		<c:when test="${fn:length(gList) eq 0}">
		                  				<div class="text-center">There is no data!</div>
			                  		</c:when>
			                   		<c:otherwise>
			                       		<c:forEach items="${gList}" var="gList" varStatus="status">
											<a class="game_card" href="/member/memberUView?seq=${gList.gSeq }" style="cursor: pointer;">
							                    <div class="head">
							                        <span class="event">
							                        	<c:forEach items="${listCodeEvent}" var="listEvent" varStatus="statusEvent">
															<c:if test="${gList.gEvent eq listEvent.ccSeq}"><c:out value="${listEvent.ifccName }"/></c:if>
														</c:forEach>
							                        </span>
							                        <span class="league">
							                        	<c:forEach items="${listCodeLeague}" var="listLeague" varStatus="statusLeague">
															<c:if test="${gList.gLeague eq listLeague.ccSeq}"><c:out value="${listLeague.ifccName }"/></c:if>
														</c:forEach>
							                        </span>
							                    </div>
							                    <div class="game_content">
							                        <div class="away game">
							                            <img class="away_img" src="https://sports-phinf.pstatic.net/team/kbo/default/OB.png"
							                                width="30" height="30">
							                            <br>
							                            <span>
							                            	<c:forEach items="${listCodeTeam}" var="listTeam" varStatus="statusTeam">
																<c:if test="${gList.team_home eq listTeam.ccSeq}"><c:out value="${listTeam.ifccName }"/></c:if>
															</c:forEach>
							                            </span>
							                        </div>
							                        <div class="info game">
							                            <span>VS</span>
							                            <br>
							                            <span>${gList.gameDuration} 예정</span>
							                        </div>
							                        <div class="home game">
							                            <img class="home_img" src="https://sports-phinf.pstatic.net/team/kbo/default/HT.png"
							                                width="30" height="30">
							                            <br>
							                            <span>
							                            	<c:forEach items="${listCodeTeam}" var="listTeam" varStatus="statusTeam">
																<c:if test="${gList.team_away eq listTeam.ccSeq}"><c:out value="${listTeam.ifccName }"/></c:if>
															</c:forEach>
							                            </span>
							                        </div>
							                    </div>
							                </a>
										</c:forEach>
			                   		</c:otherwise>
			                   	</c:choose>
                        	</div>
                        </div>
                        <div class="swiper-button-next" tabindex="0" role="button" aria-label="다음 슬라이드" aria-disabled="true" id="right-btn"></div>
                        <div class="swiper-button-prev" tabindex="0" role="button" aria-label="이전 슬라이드" aria-disabled="false" id="left-btn"></div>
                    	<span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span>
                   	</div>
	            </div>
	            <!-- article 영역 -->
	            <div id="article">
	            	<c:set var="listCodeLeague" value="${CodeServiceImpl.selectListCachedCode('6') }" />
	            	<c:choose>
                  		<c:when test="${fn:length(aList) eq 0}">
              				<div class="text-center">There is no data!</div>
                  		</c:when>
                   		<c:otherwise>
                       		<c:forEach items="${aList}" var="aList" varStatus="status">
								<a class="article_card" href="/article/articleView?seq=${aList.aSeq }">
				                    <div class="article_img">
				                        <img class="article_img" src="/resources/images/user/baseball.jpg">
				                    </div>
				                    <div class="article_content">
				                        <div class="article_title">
				                        ${aList.aSeq }
				                            ${aList.title }
				                        </div>
				                        <div class="article_context">
				                            ${aList.content }
				                        </div>
				                        <div class="article_info">
				                            <span class="newspaper">${aList.newspaper }</span>
				                            <span class="league">
				                            	<c:forEach items="${listCodeLeague}" var="listLeague" varStatus="statusLeague">
													<c:if test="${aList.aLeague eq listLeague.ccSeq}"><c:out value="${listLeague.ifccName }"/></c:if>
												</c:forEach>
				                            </span>
				                        </div>
				                    </div>
				                </a>		
							</c:forEach>
                   		</c:otherwise>
                   	</c:choose>
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
        </form>
    </div>

    <script src="https://kit.fontawesome.com/1d32d56af5.js" crossorigin="anonymous"></script>
     <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
	<script type="text/javascript">
        function menuToggle() {
            const toggleMenu = document.querySelector('.menu');
            toggleMenu.classList.toggle('active')
        }
        
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
        
        var seq = $("input:hidden[name=seq]");
        var goUrlView = "/member/memberUView";
        var form = $("#myForm");
      
       	goForm = function(keyValue) {
	    	/* if(keyValue != 0) seq.val(btoa(keyValue)); */
	    	seq.val(keyValue);
			form.attr("action", goUrlView).submit();
		};
		
		var swiper = new Swiper(".game_list", {
	        spaceBetween: 35,
	        slidesPerView: 4,
	        slidesPerGroup : 4,
	        loopFillGroupWithBlank : true,
	        direction: 'horizontal',
	        autoplay:  false,
	        navigation: {
	          nextEl: ".swiper-button-next",
	          prevEl: ".swiper-button-prev",
	        },
	      });
		
		var goUrlArticle = "/article/articleView";
		var goUrlGame = "/game/GameView";
		
		var aSeq = $("input:hidden[name=aSeq]");
		var gSeq = $("input:hidden[name=gSeq]");
		
		goArticle = function(keyValue) {
			aSeq.val(keyValue);
			form.attr("action", goUrlArticle).submit();
		}
		
		goGame = function(keyValue) {
			gSeq.val(keyValue);
			form.attr("action", goUrlGame).submit();
		}
		
	</script>
</body>

</html>