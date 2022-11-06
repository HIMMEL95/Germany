<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="rb" uri="http://www.springframework.org/tags"%>

<jsp:useBean id="CodeServiceImpl" class="com.spopia.infra.modules.code.CodeServiceImpl" />

<!DOCTYPE html>
<html lang="ko" data-useragent="Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/105.0.0.0 Safari/537.36">
<head>
<script async="" type="text/javascript" src="https://ssl.pstatic.net/tveta/libs/glad/prod/gfp-core.js"></script>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta http-equiv="X-UA-Compatible" content="requiresActiveX=true">
<meta name="viewport"
	content="width=1080px,maximum-scale=2.0,minimum-scale=0.4,user-scalable=yes">
<meta property="og:image"
	content="https://imgsports.pstatic.net/images/mobile/common/NAVERsports.png">
<meta property="og:title" content="스포츠홈 : spopia 스포츠">
<meta property="og:description" content="스포츠의 시작과 끝!">
<meta name="description" content="스포츠의 모든 것, spopia 스포츠와 함께 하세요">

<title>SPOPIA</title>

<link rel="stylesheet" type="text/css" href="/resources/css/user/nsportsCss.css">
<link rel="stylesheet" type="text/css" href="/resources/css/user/nsportsHome.css">
<link rel="stylesheet" type="text/css" href="/resources/css/user/naver.css">
<link rel="stylesheet" href="/resources/css/user/sportMain.css">

<link rel="shortcut icon"
	href="https://cdn-icons-png.flaticon.com/512/6646/6646786.png" type="image/x-icon">
<script type="text/javascript"
	src="https://ssl.pstatic.net/static.sports/resources/pc/2022/09/29/130734/js/generated/baseJsTop.js"
	charset="UTF-8"></script>

<script type="text/javascript"
	src="https://ssl.pstatic.net/static.sports/resources/pc/2022/09/29/130734/js/lib/iscroll/iscroll.js"
	charset="UTF-8"></script>

<script>
	try {
		var deployPhase = 'release';
		if (deployPhase === 'release') {
			JEagleEyeClient.attachOnError();

		} else if (deployPhase === 'dev') {
			JEagleEyeClient.setDebugOnly(true);
			JEagleEyeClient.attachOnError();

		} else {
			// local
			JEagleEyeClient.attachOnError();
		}
	} catch (e) {
		console.log(e);
	}
</script>

<script type="text/javascript"
	src="https://ssl.pstatic.net/static.sports/resources/pc/2022/09/29/130734/js/generated/sectionHomeJs.js"
	charset="UTF-8"></script>

<script>
	window.displaySspAd = window.displaySspAd
			|| new naver.sports.common.DisplayGladAd({
				sportsAdConfig : [ {
					serviceUnitId : 'p_sports_home',
					calpParameter : ''
				} ],
				enablePersist : true
			});
</script>

<script>
	var nsc = "sports.home";
</script>
<script type="text/javascript"
	src="https://ssl.pstatic.net/tveta/libs/glad/prod/2.4.1/gfp-sdk.js"
	async="" charset="utf-8"></script>
<script type="text/javascript"
	src="https://ssl.pstatic.net/tveta/libs/glad/prod/2.4.1/gfp-sentry-bundle-1.0.1.js"
	async="" charset="utf-8"></script>
<script type="text/javascript"
	src="https://ssl.pstatic.net/tveta/libs/glad/prod/2.4.1/gfp-ext-nda.js"
	async="" charset="utf-8"></script>
<script type="text/javascript" id="undefined"
	src="https://ssl.pstatic.net/static/common/js/cs_ops_webncc.js"></script>
<script type="text/javascript" id="undefined"
	src="https://ssl.pstatic.net/static.sports/resources/pc/2022/09/29/130734/js/generated/baseJsBottomLazy.js"></script>
<script src="https://ssl.pstatic.net/static.gn/js/clickcrD.js"
	id="gnb_clickcrD" charset="utf-8"></script>

<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
	
</head>

<body class="sports_home">
	<form name="form">
		<input type="hidden" name="name"/>
		<input type="hidden" name="id"/>
		<input type="hidden" name="phone"/>
		<input type="hidden" name="email"/>
		<input type="hidden" name="gender"/>
		<input type="hidden" name="dob"/>
		<input type="hidden" name="snsImg"/>
		<input type="hidden" name="token"/>
	</form>
	<form method="post" id="myForm" name="myForm">
		<input type="hidden" name="thisPage" value='<c:out value="${mVo.thisPage }" default="1"/>'> 
		<input type="hidden" name="rowNumToShow" value='<c:out value="${mVo.rowNumToShow }"/>'> 
		<input type="hidden" name="gSeq" value='<c:out value="${gVo.gSeq }"></c:out>'>
		<input type="hidden" name="aSeq" value='<c:out value="${aVo.aSeq }"></c:out>'>
		<input type="hidden" name="seq" value='<c:out value="${sessSeq }"></c:out>'>
		<!-- 사이드 광고 -->
		<div id="veta_skin_left" data-veta-preview="p_sports_dpl"></div>
		<div id="veta_skin_right" data-veta-preview="p_sports_dpl"></div>

		<div id="wrap">
			<div id="header" class="header">
				<div class="sports_header" role="banner">
					<div class="snb_area">
						<a href="/sportMain">
							<img class="logo" alt="" src="/resources/images/SPOPIA_white.png">
							<%-- sessSeq : ${sessSeq } 
							sessName : ${sessName }
							sessSns : ${sessSns } --%>
						</a> 
					</div>
					<div class="navigation">
	                    <ul class="nav_ul">
	                    	<c:choose>
	                    		<c:when test="${empty sessSeq }">
	                    			<li class="nav_li">
	                    				<div class="login_po">
				                            <a class="login" href="/userLogin">
				                                <i class="fa-solid fa-right-to-bracket"></i>
				                            </a>	                    					
	                    				</div>
			                        </li>
	                    		</c:when>	
	                    		<c:otherwise>
	                    			<li class="nav_li">
			                            <div class="action">
			                                <div class="profile" onclick="menuToggle();">
			                                	<c:choose>
			                                		<c:when test="${empty sessImg }">
					                                    <img class="pro_img" src="/resources/images/diano.jpg" width="35">
			                                		</c:when>
			                                		<c:otherwise>
					                                    <img class="pro_img" src="${sessImg }" width="35">			                                		
			                                		</c:otherwise>
			                                	</c:choose>
			                                </div>
			                                <div class="menu">
			                                	<div>
				                                    <h3>
				                                    	<c:out value="${sessName }"/><br>
				                                    </h3>			                                	
			                                        <p href="/member/memberUView?seq=${sessSeq }" style="text-transform: none;"><c:out value="${sessEmail }"/></p>
			                                	</div>
			                                    <ul class="pro_ul">
				                                    <c:choose>
														<c:when test="${sessUser eq 25}">
															<li class="pro_li">
					                                            <button class="pro_a" type="button" id="editBtn" style="cursor: pointer; background: none;" onclick="goView(${sessSeq})">
					                                                <i class="fa-solid fa-user me-2"></i>
					                                                Edit Profile
					                                            </button>
					                                        </li>
					                                        <!-- <li class="pro_li">
					                                            <a class="pro_a" href="#">
					                                                <i class="fa-solid fa-circle-info me-2"></i>
					                                                Help
					                                            </a>
					                                        </li> -->
					                                        <li class="pro_li">
					                                            <button class="pro_a" id="signOutBtn" style="background: none;">
					                                                <i class="fa-solid fa-power-off me-2"></i>
					                                                Sign Out
					                                            </button>
					                                        </li>
														</c:when>
														<c:otherwise>
															<li class="pro_li">
					                                            <button class="pro_a" type="button" id="editBtn" style="cursor: pointer; background: none" onclick="goView(${sessSeq})">
					                                                <i class="fa-solid fa-user me-2"></i>
					                                                Edit Profile
					                                            </button>
					                                        </li>
					                                        <li class="pro_li">
					                                            <button class="pro_a" style="background: none;" onclick="goXdmin()">
					                                                <i class="fa-solid fa-gear me-2"></i>
					                                                Admin Page
					                                            </button>
					                                        </li>
					                                        <!-- <li class="pro_li">
					                                            <a class="pro_a" href="#">
					                                                <i class="fa-solid fa-circle-info me-2"></i>
					                                                Help
					                                            </a>
					                                        </li> -->
					                                        <li class="pro_li">
					                                            <button class="pro_a" id="signOutBtn" style="background: none;">
					                                                <i class="fa-solid fa-power-off me-2"></i>
					                                                Sign Out
					                                            </button>
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
				<div class="sports_menu" role="navigation" id="_sports_lnb_menu">
					<div class="menu_area">
						<h2 class="blind">메인 메뉴</h2>
						<ul class="main_menu_list" role="menubar">

							<li class="main_menu_item" role="presentation"><a
								href="/sportMain" class="link_main_menu" role="menuitem"
								aria-current="page"
								onclick="clickcr(this,
																														'LNB.sportshome',
																														'sportshome', '',
																														event);">스포츠홈</a>
								<ul class="sub_menu_list" role="menubar">
								</ul></li>

							<!-- <li class="main_menu_item" role="presentation"><a
								href="#" class="link_main_menu" role="menuitem"
								onclick="clickcr(this,
																														'LNB.baseball',
																														'baseball', '',
																														event);">야구</a>
								<ul class="sub_menu_list" role="menubar">
									<li class="sub_menu_item " role="presentation"><a
										href="/kbaseball/news/index" class="link_sub_menu"
										role="menuitem"
										onclick="clickcr(this, 'LNB.news', 'news', '', event);">
											최신뉴스 </a></li>
									<li class="sub_menu_item " role="presentation"><a
										href="/kbaseball/vod/index" class="link_sub_menu"
										role="menuitem"
										onclick="clickcr(this, 'LNB.video', 'video', '', event);">
											영상 </a></li>
									<li class="sub_menu_item " role="presentation"><a
										href="/photocenter/albumList?category=kbo"
										class="link_sub_menu" role="menuitem"
										onclick="clickcr(this, 'LNB.album', 'album', '', event);">
											생생화보 </a></li>
									<li class="sub_menu_item " role="presentation"><a
										href="/kbaseball/schedule/index" class="link_sub_menu"
										role="menuitem"
										onclick="clickcr(this, 'LNB.schedule', 'schedule', '', event);">
											일정/결과 </a></li>
									<li class="sub_menu_item " role="presentation"><a
										href="/kbaseball/record/index?category=kbo"
										class="link_sub_menu" role="menuitem"
										onclick="clickcr(this, 'LNB.datacenter', 'datacenter', '', event);">
											기록/순위 </a></li>
									<li class="sub_menu_item " role="presentation"><a
										href="/kbaseball/column/columnistList" class="link_sub_menu"
										role="menuitem"
										onclick="clickcr(this, 'LNB.issue', 'issue', '', event);">
											구단/협회 </a></li>
									<li class="sub_menu_item " role="presentation"><a
										href="https://m.sports.naver.com/kbo40/index"
										class="link_sub_menu" role="menuitem"
										onclick="clickcr(this, 'LNB.kbo40th', 'kbo40th', '', event);">
											<img
											src="https://ssl.pstatic.net/static/sports/2022/m/07/12/logo_kbo40.png"
											width="67" height="36" alt="KBO40">
									</a></li>
									<li class="sub_menu_item " role="presentation"><a
										href="https://m.sports.naver.com/kbollect"
										class="link_sub_menu" role="menuitem"
										onclick="clickcr(this, 'LNB.', '', '', event);"> <img
											src="https://ssl.pstatic.net/static/sports/2022/pc/07/22/logo_kbollect.png"
											width="92" height="36" alt="KBOLLECT">
									</a></li>
								</ul></li>

							<li class="main_menu_item" role="presentation"><a
								href="#" class="link_main_menu" role="menuitem"
								onclick="clickcr(this,
																														'LNB.worldbaseball',
																														'worldbaseball', '',
																														event);">해외야구</a>
								<ul class="sub_menu_list" role="menubar">
									<li class="sub_menu_item " role="presentation"><a
										href="/wbaseball/news/index" class="link_sub_menu"
										role="menuitem"
										onclick="clickcr(this, 'LNB.news', 'news', '', event);">
											최신뉴스 </a></li>
									<li class="sub_menu_item " role="presentation"><a
										href="/wbaseball/vod/index" class="link_sub_menu"
										role="menuitem"
										onclick="clickcr(this, 'LNB.video', 'video', '', event);">
											영상 </a></li>
									<li class="sub_menu_item " role="presentation"><a
										href="/photocenter/albumList?category=mlb"
										class="link_sub_menu" role="menuitem"
										onclick="clickcr(this, 'LNB.album', 'album', '', event);">
											생생화보 </a></li>
									<li class="sub_menu_item " role="presentation"><a
										href="/wbaseball/schedule/index" class="link_sub_menu"
										role="menuitem"
										onclick="clickcr(this, 'LNB.schedule', 'schedule', '', event);">
											일정/결과 </a></li>
									<li class="sub_menu_item " role="presentation"><a
										href="/wbaseball/record/index" class="link_sub_menu"
										role="menuitem"
										onclick="clickcr(this, 'LNB.record', 'record', '', event);">
											기록/순위 </a></li>
								</ul></li>

							<li class="main_menu_item" role="presentation"><a
								href="#" class="link_main_menu" role="menuitem"
								onclick="clickcr(this,
																														'LNB.soccer',
																														'soccer', '',
																														event);">축구</a>
								<ul class="sub_menu_list" role="menubar">
									<li class="sub_menu_item " role="presentation"><a
										href="/kfootball/news/index" class="link_sub_menu"
										role="menuitem"
										onclick="clickcr(this, 'LNB.news', 'news', '', event);">
											최신뉴스 </a></li>
									<li class="sub_menu_item " role="presentation"><a
										href="/kfootball/vod/index" class="link_sub_menu"
										role="menuitem"
										onclick="clickcr(this, 'LNB.video', 'video', '', event);">
											영상 </a></li>
									<li class="sub_menu_item " role="presentation"><a
										href="/photocenter/albumList?category=kfootball"
										class="link_sub_menu" role="menuitem"
										onclick="clickcr(this, 'LNB.album', 'album', '', event);">
											생생화보 </a></li>
									<li class="sub_menu_item " role="presentation"><a
										href="/kfootball/schedule/index" class="link_sub_menu"
										role="menuitem"
										onclick="clickcr(this, 'LNB.schedule', 'schedule', '', event);">
											일정/결과 </a></li>
									<li class="sub_menu_item " role="presentation"><a
										href="/kfootball/record/index" class="link_sub_menu"
										role="menuitem"
										onclick="clickcr(this, 'LNB.record', 'record', '', event);">
											기록/순위 </a></li>
									<li class="sub_menu_item " role="presentation"><a
										href="/kfootball/column/columnistList" class="link_sub_menu"
										role="menuitem"
										onclick="clickcr(this, 'LNB.', '', '', event);"> 구단/협회 </a></li>
								</ul></li>

							<li class="main_menu_item" role="presentation"><a
								href="#" class="link_main_menu" role="menuitem"
								onclick="clickcr(this,
																														'LNB.worldfootball',
																														'worldfootball', '',
																														event);">해외축구</a>
								<ul class="sub_menu_list" role="menubar">
									<li class="sub_menu_item " role="presentation"><a
										href="/wfootball/news/index" class="link_sub_menu"
										role="menuitem"
										onclick="clickcr(this, 'LNB.news', 'news', '', event);">
											최신뉴스 </a></li>
									<li class="sub_menu_item " role="presentation"><a
										href="/wfootball/vod/index" class="link_sub_menu"
										role="menuitem"
										onclick="clickcr(this, 'LNB.video', 'video', '', event);">
											영상 </a></li>
									<li class="sub_menu_item " role="presentation"><a
										href="/photocenter/albumList?category=wfootball"
										class="link_sub_menu" role="menuitem"
										onclick="clickcr(this, 'LNB.album', 'album', '', event);">
											생생화보 </a></li>
									<li class="sub_menu_item " role="presentation"><a
										href="/wfootball/schedule/index" class="link_sub_menu"
										role="menuitem"
										onclick="clickcr(this, 'LNB.schedule', 'schedule', '', event);">
											일정/결과 </a></li>
									<li class="sub_menu_item " role="presentation"><a
										href="/wfootball/record/index" class="link_sub_menu"
										role="menuitem"
										onclick="clickcr(this, 'LNB.record', 'record', '', event);">
											기록/순위 </a></li>
									<li class="sub_menu_item " role="presentation"><a
										href="https://m.sports.naver.com/wfootball/predict"
										class="link_sub_menu" role="menuitem" target="_blank"
										onclick="clickcr(this, 'LNB.predict', 'predict', '', event);">
											<img
											src="https://sports-phinf.pstatic.net/20220107_20/1641522453127ianDL_PNG/7cc53600-6fac-11ec-8738-ecfde1d86295.png"
											width="58" height="36" alt="승부예측">
									</a></li>
								</ul></li> -->
						</ul>
					</div>
				</div>
			</div>

			<div id="container" role="main">
				<div id="spot">
					<div class="home_spot">
						<!--
						<script id="_section_home_livebox_scroll_pagination_template"
							type="text/x-handlebars-template">
								<li class="page_item" {{#ifCond pageIndex
								'==' 1}} aria-current="location" {{/ifCond}} data-pageNum="{{pageIndex}}" ><span
									class="blind">{{pageIndex}}</span></li>
							</script> -->

						<div class="home_live_box" style="display: block"
							id="_section_home_livebox_root">
							<div class="live_slider">
								<h2 class="blind">오늘의 경기</h2>
								<div class="live_card_list new_scroll"
									id="_section_home_live_scroll_holder"
									style="touch-action: none;">
									<div class="scroller" id="_section_home_live_scroll"
										style="transition-timing-function: cubic-bezier(0.1, 0.57, 0.1, 1); transition-duration: 0ms; transform: translate(0px, 0px) translateZ(0px);">
										<c:set var="listCodeEvent" value="${CodeServiceImpl.selectListCachedCode('5') }" />
						                <c:set var="listCodeLeague" value="${CodeServiceImpl.selectListCachedCode('6') }" />
						                <c:set var="listCodeTeam" value="${CodeServiceImpl.selectListCachedCode('7') }" />
						                <c:choose>
					                  		<c:when test="${fn:length(gList) eq 0}">
				                  				<div class="text-center">There is no data!</div>
					                  		</c:when>
					                   		<c:otherwise>
					                       		<c:forEach items="${gList}" var="gList" varStatus="status">
													<div class="live_box_card ">
														<div class="category">
															<c:forEach items="${listCodeLeague}" var="listLeague" varStatus="statusLeague">
																<c:if test="${gList.gLeague eq listLeague.ccSeq}"><c:out value="${listLeague.ifccName }"/></c:if>
															</c:forEach>
														</div>
														<div class="match_info">
															<div class="match_status">
																<span class="versus">VS</span> 
																<span class="status">${gList.gameDuration } 예정</span>
															</div>
															<div class="away_team">
																<span class="team"> 
																	<span class="emblem">
																		<img src="${gList.away_img }" width="30" height="30" alt="" onerror="imageOnError(this);">
																	</span> 
																	<span class="name">
																		<c:forEach items="${listCodeTeam}" var="listTeam" varStatus="statusTeam">
																			<c:if test="${gList.team_away eq listTeam.ccSeq}"><c:out value="${listTeam.ifccName }"/></c:if>
																		</c:forEach>
																	</span>
																</span>
															</div>
															<div class="home_team">
																<span class="team"> 
																	<span class="emblem">
																		<img src="${gList.home_img }" width="30" height="30" alt="마르세유" onerror="imageOnError(this);">
																	</span> 
																	<span class="name">
																		<c:forEach items="${listCodeTeam}" var="listTeam" varStatus="statusTeam">
																			<c:if test="${gList.team_home eq listTeam.ccSeq}"><c:out value="${listTeam.ifccName }"/></c:if>
																		</c:forEach>
																	</span>
																</span>
															</div>
														</div>
														<a href="/gameView?gSeq=${gList.gSeq }" class="link_live" aria-label="새창" onclick="clickcr(this, 'lbx.match', '', '', event);">
															<span class="blind">영상 보기</span>
														</a>
													</div>
												</c:forEach>
					                   		</c:otherwise>
					                   	</c:choose>
									</div>
								</div>
							</div>
							<button type="button" class="button_prev"
								style="display: none; left: -52px; transition: all 300ms cubic-bezier(0.215, 0.61, 0.355, 1)">
								<span class="blind">이전</span> <span class="page">0</span>
							</button>
							<button type="button" class="button_next"
								style="right: -52px; transition: all 300ms cubic-bezier(0.215, 0.61, 0.355, 1) 0s; display: block;">
								<span class="blind">다음</span> <span class="page">1</span>
							</button>
						</div>

						<script>
							naver = window.naver || {};
							naver.sports = naver.sports || {};
							naver.sports.section = naver.sports.section || {};
							naver.sports.section.home = naver.sports.section.home
									|| {};
							naver.sports.section.home.LiveBox = eg
									.Class({

										_SCROLL_PANNEL_SIZE : 4,
										_EMPTY_LIVEBOX_CARD : "<div class=\"live_box_card\"></div>",

										construct : function(htOption) {
											this._initVars(htOption);
											this._initHandlebarsTemplate();
											this._init();
										},
										_initVars : function(htOption) {
											this._liveBoxList = htOption.liveBoxList
													|| {};
											this._liveBoxBeforeList = htOption.liveBoxBeforeList
													|| {};
											this._totalCardCnt = 0;
										},
										_initHandlebarsTemplate : function() {
											this._sectionHomeLiveBoxTopScoreTemplate = Handlebars
													.compile($(
															"#_section_home_livebox_score_card_template")
															.html());
											this._sectionHomeLiveBoxTopRadioTemplate = Handlebars
													.compile($(
															"#_section_home_livebox_radio_card_template")
															.html());
											this._sectionHomeLiveBoxTopTextTemplate = Handlebars
													.compile($(
															"#_section_home_livebox_text_card_template")
															.html());
											this._sectionHomeLiveBoxTopTextBeforeTemplate = Handlebars
													.compile($(
															"#_section_home_livebox_text_before_card_template")
															.html());
											this._sectionHomeLiveBoxFlickingPaginationTemplate = Handlebars
													.compile($(
															"#_section_home_livebox_scroll_pagination_template")
															.html());
										},
										_init : function() {
											(naver.sports.team && naver.sports.team.MyTeam) ? new naver.sports.team.MyTeam(
													{
														"callbackFn" : $
																.proxy(
																		function(
																				subscribeList) {
																			this
																					._sort(subscribeList);
																			this
																					._draw();
																		}, this)
													})
													: this._draw();
										},

										_sort : function(subscribeList) {

											this._liveBoxList = _
													.sortBy(
															this._liveBoxList,
															function(data) {
																var isSubscribeTeam = _
																		.some(
																				subscribeList,
																				function(
																						subscribeTeam) {
																					return data.fixTopPosition == 'Y'
																							|| (subscribeTeam.categoryId == data.categoryId && (subscribeTeam.teamCode == data.teamCode1 || subscribeTeam.teamCode == data.teamCode2));
																				});

																return isSubscribeTeam ? 0
																		: 1;
															});

											this._liveBoxBeforeList = _
													.sortBy(
															this._liveBoxBeforeList,
															function(data) {
																var isSubscribeTeam = _
																		.some(
																				subscribeList,
																				function(
																						subscribeTeam) {
																					return subscribeTeam.categoryId == data.categoryId
																							&& (subscribeTeam.teamCode == data.teamCode1 || subscribeTeam.teamCode == data.teamCode2);
																				});

																return isSubscribeTeam ? 0
																		: 1;
															});

										},

										_draw : function() {
											if (this._liveBoxList.length < 1) {
												$("#_section_home_livebox_root")
														.hide();
												return;
											}

											$("#_section_home_live_scroll")
													.html("");

											var cards = _
													.map(
															this._liveBoxList
																	.concat(this._liveBoxBeforeList),
															$
																	.proxy(
																			function(
																					item) {
																				if (item.contentsId
																						.indexOf("radio") > -1) {
																					return this
																							._sectionHomeLiveBoxTopRadioTemplate(item);
																				} else if (item.contentsId
																						.indexOf("schedule") > -1
																						&& item.teamName1.length > 0) {
																					return this
																							._sectionHomeLiveBoxTopScoreTemplate(item);
																				} else if (!item.liveSchedule) {
																					return this
																							._sectionHomeLiveBoxTopTextBeforeTemplate(item);
																				} else {
																					return this
																							._sectionHomeLiveBoxTopTextTemplate(item);
																				}
																			},
																			this));

											this._totalCardCnt = cards.length;

											var emptyCardSize = this._SCROLL_PANNEL_SIZE
													- this._totalCardCnt;
											for (var i = 0; i < emptyCardSize; ++i) {
												cards
														.push(this._EMPTY_LIVEBOX_CARD);
											}

											_
													.each(
															cards,
															$
																	.proxy(
																			function(
																					card) {
																				$(
																						"#_section_home_live_scroll")
																						.append(
																								card);

																			},
																			this));

											if (cards.length > 4) {
												this._initScrolling();
											}

											// $("#veta_skin_left").length > 0 ? $("#veta_skin_left").css("top", "316px") : "";
											// $("#veta_skin_right").length > 0 ? $("#veta_skin_right").css("top", "316px") : "";
										},

										_initScrolling : function() {
											this._scroll = new IScroll(
													"#_section_home_live_scroll_holder",
													{
														scrollbars : false,
														scrollX : true,
														scrollY : false,
														mouseWheel : true,
														snap : $('.live_box_card'),
														bounce : true,
														preventDefault : true,
													});
											this._prevButton = $("#_section_home_livebox_root button.button_prev");
											this._nextButton = $("#_section_home_livebox_root button.button_next");

											// cards.length > 4 일 때 init 발생, 초기 두 개의 값을 통해 card 간 padding 계산
											var pages = this._scroll.pages;
											var cardPadding = pages[0][0].x
													- pages[1][0].x;
											var pageLength = this._scroll.pages.length;
											var buttonHideCss = "-52px";
											var buttonShowCss = "0px";

											//  좌우 여백으로 인한 버그로 인해 마지막 카드와 이전 카드 사이 간격이 일정하지 않을경우 이전 카드를 마지막 카드로 대체하는 코드
											if (pages[pageLength - 2][0].x
													- pages[pageLength - 1][0].x < cardPadding) {
												pages[pageLength - 2] = pages[pageLength - 1];
												pages.splice(pageLength - 1, 1);
											}

											/* events */
											var fnFadeOut = $.proxy(function() {
												// 양쪽 끝에서 스크롤할 시 scrollEnd 이벤트가 발생 안되는 버그에 대한 방어 코드
												this._nextButton.find(
														"span.page").fadeOut(
														200).delay(200)
														.fadeIn();
												this._prevButton.find(
														"span.page").fadeOut(
														200).delay(200)
														.fadeIn();
											}, this);

											var fnRearrange = $
													.proxy(
															function() {
																// 화면에 보이는 마지막 카드 인덱스
																var lastCardIndex = Math
																		.min(
																				Math
																						.floor((-this._scroll.currentPage.x
																								+ this._scroll.wrapperOffset.left + $(
																								window)
																								.width())
																								/ cardPadding),
																				this._totalCardCnt);
																var prevCnt = Math
																		.ceil((-this._scroll.currentPage.x + this._scroll.wrapperOffset.left)
																				/ cardPadding);
																var nextCnt = this._totalCardCnt
																		- lastCardIndex;
																prevCnt > 0 ? this._prevButton
																		.show()
																		: this._prevButton
																				.hide();
																nextCnt > 0 ? this._nextButton
																		.show()
																		: this._nextButton
																				.hide();
																this._prevButton
																		.find(
																				"span.page")
																		.html(
																				prevCnt);
																this._nextButton
																		.find(
																				"span.page")
																		.html(
																				nextCnt);
																this._prevButton
																		.find(
																				"span.page")
																		.fadeIn();
																this._nextButton
																		.find(
																				"span.page")
																		.fadeIn();
															}, this);

											this._scroll.on('scrollEnd',
													fnRearrange);
											this._scroll.on('scrollCancel',
													fnRearrange);
											this._scroll.on('scrollStart',
													fnFadeOut);

											// 현재 창 비활성화시 발생하는 커서 버그 방어 코드
											$("#_section_home_livebox_root")
													.hover(
															$
																	.proxy(
																			function() {
																				this._nextButton
																						.css({
																							right : buttonShowCss
																						});
																				this._prevButton
																						.css({
																							left : buttonShowCss
																						});
																			},
																			this),
															$
																	.proxy(
																			function() {
																				this._nextButton
																						.css({
																							right : buttonHideCss
																						});
																				this._prevButton
																						.css({
																							left : buttonHideCss
																						});
																			},
																			this));
											$(window).on("resize", fnRearrange);
											fnRearrange();

											/* buttons */
											this._prevButton
													.on(
															"click",
															$
																	.proxy(
																			function(
																					e) {
																				clickcr(
																						this,
																						'lbx.search',
																						'',
																						'',
																						e);
																				fnFadeOut();
																				this._scroll
																						.goToPage(
																								Math
																										.max(
																												this._scroll.currentPage.pageX
																														- this._SCROLL_PANNEL_SIZE,
																												0),
																								0,
																								200);
																			},
																			this));

											this._nextButton
													.on(
															"click",
															$
																	.proxy(
																			function(
																					e) {
																				clickcr(
																						this,
																						'lbx.search',
																						'',
																						'',
																						e);
																				fnFadeOut();
																				this._scroll
																						.goToPage(
																								Math
																										.min(
																												this._scroll.currentPage.pageX
																														+ this._SCROLL_PANNEL_SIZE,
																												this._totalCardCnt),
																								0,
																								200);
																			},
																			this));

										}

									});
							/* window.livebox = new naver.sports.section.home.LiveBox(
									{
										"liveBoxList" : [
												{
													"superCategoryId" : "baseball",
													"upperCategoryId" : "kbaseball",
													"categoryId" : "kbo",
													"categoryName" : "KBO",
													"gameId" : "20220930WOSK02022",
													"statusCode" : "ENDED",
													"statusInfo" : "11회말",
													"cancel" : "N",
													"isEnableNvm" : "Y",
													"gameInfo" : "{\"game_id\":\"20220930WOSK02022\",\"current_inning\":\"11회말\",\"home_team_score_by_inning\":\"0,0,0,0,0,0,2,0,0,1,4\",\"away_team_score_by_inning\":\"0,0,0,1,0,0,0,1,0,1,0\",\"home_team_rheb\":\"7,13,4,6\",\"away_team_rheb\":\"3,5,0,6\",\"home_starter_name\":\"폰트\",\"home_starter_code\":\"51863\",\"away_starter_name\":\"안우진\",\"away_starter_code\":\"68341\",\"win_pitcher_name\":\"\",\"win_pitcher_code\":\"\",\"lose_pitcher_name\":\"\",\"lose_pitcher_code\":\"\",\"pts_flag\":\"1\",\"is_vod\":\"Y\",\"home_starter_w\":\"13\",\"home_starter_l\":\"6\",\"home_starter_era\":\"2.8\",\"home_starter_inn2\":531,\"away_starter_w\":\"14\",\"away_starter_l\":\"8\",\"away_starter_era\":\"2.26\",\"away_starter_inn2\":549,\"home_comp_inng\":\"6.1\",\"home_comp_era\":\"2.796610169491525\",\"home_comp_whip\":\"0.96\",\"home_comp_innk\":\"8.24\",\"home_comp_qs\":\"19\",\"home_comp_war\":\"4.6\",\"away_comp_inng\":\"6.1\",\"away_comp_era\":\"2.262295081967213\",\"away_comp_whip\":\"0.97\",\"away_comp_innk\":\"10.43\",\"away_comp_qs\":\"22\",\"away_comp_war\":\"7.12\",\"broad_channel\":\"SPOTV\",\"home_short_name\":\"SSG\",\"home_full_name\":\"SSG 랜더스\",\"away_short_name\":\"키움\",\"away_full_name\":\"키움 히어로즈\",\"info\":\"\",\"status\":\"ORDINARY\",\"away_team_extra_info\":\"pitcher:김성진^pitcher_id:51301\",\"home_team_extra_info\":\"pitcher:김택형^pitcher_id:65343\",\"region_id\":\"13202558\",\"is_quick_highlight\":\"Y\",\"home_current_pitcher_name\":\"김택형\",\"home_current_pitcher_code\":\"65343\",\"away_current_pitcher_name\":\"김성진\",\"away_current_pitcher_code\":\"51301\",\"home_current_pitcher_w\":\"2\",\"home_current_pitcher_l\":\"5\",\"home_current_pitcher_era\":\"5.01\",\"away_current_pitcher_w\":\"0\",\"away_current_pitcher_l\":\"1\",\"away_current_pitcher_era\":\"6.33\",\"away_series_outcome\":{\"w\":\"0\",\"d\":\"0\",\"l\":\"0\"},\"home_series_outcome\":{\"w\":\"0\",\"d\":\"0\",\"l\":\"0\"},\"dheader\":\"0\",\"game_no\":\"0\",\"is_after_first_game\":true}",
													"gameDateTime" : "2022-09-30 18:30:00",
													"gameTimeHHmm" : "18:30",
													"title" : "키움 VS SSG",
													"stadium" : "문학",
													"isScheduledTv" : "Y",
													"isOnairTv" : "Y",
													"isOnairText" : "N",
													"liveTotalView" : 1065805,
													"liveCurrentView" : 63753,
													"teamName1" : "키움",
													"teamName2" : "SSG",
													"teamCode1" : "WO",
													"teamCode2" : "SK",
													"teamLogo1" : "https://sports-phinf.pstatic.net/team/kbo/default/WO.png",
													"teamLogo2" : "https://sports-phinf.pstatic.net/team/kbo/default/SK.png",
													"teamScore1" : 3,
													"teamScore2" : 7,
													"winner" : "2",
													"homeTeamName" : "SSG",
													"awayTeamName" : "키움",
													"homeTeamCode" : "SK",
													"awayTeamCode" : "WO",
													"homeTeamLogo" : "https://sports-phinf.pstatic.net/team/kbo/default/SK.png",
													"awayTeamLogo" : "https://sports-phinf.pstatic.net/team/kbo/default/WO.png",
													"homeTeamScore" : 7,
													"awayTeamScore" : 3,
													"homeAwayWinner" : "HOME",
													"disciplineId" : null,
													"disciplineName" : null,
													"matchTitle" : null,
													"url" : "/baseball/gamecenter/kbo/index?gameId=20220930WOSK02022",
													"homeTeamPenaltyScore" : -1,
													"awayTeamPenaltyScore" : -1,
													"homeCurrentPitcherName" : "김택형",
													"awayCurrentPitcherName" : "김성진",
													"templateCreateDateTime" : [
															2022, 9, 30, 23, 1,
															0, 364000000 ],
													"displayType" : "vs",
													"mainSubPriority" : 0,
													"lolSetInfoList" : [],
													"esportsLeague" : null,
													"commentCount" : 0,
													"roundCode" : "kbo_r",
													"channelCode" : "",
													"thumbnail" : "https://sports-phinf.pstatic.net/liveThumbnail/20220930WOSK02022.jpg?type=f640_360",
													"pcUrl" : "/game/20220930WOSK02022",
													"gameContents" : {
														"homeStarterId" : "51863",
														"winPitcherId" : "",
														"winPitcherName" : "",
														"awayStarterId" : "68341",
														"losePitcherName" : "",
														"homeStarterName" : "폰트",
														"awayStarterName" : "안우진",
														"losePitcherId" : ""
													},
													"winnerPredictPercentage" : 0,
													"templateTitle" : null,
													"liveSchedule" : true,
													"mainSubType" : "MAIN",
													"whiteList" : false,
													"dataId" : "AUTO_0",
													"isEnable" : "Y",
													"fixTopPosition" : "N",
													"image" : "",
													"contentsId" : "schedule.20220930WOSK02022",
													"thumbnailImage" : "https://sports-phinf.pstatic.net/liveThumbnail/20220930WOSK02022.jpg?type=f640_360"
												},
												{
													"superCategoryId" : "general",
													"upperCategoryId" : "others",
													"categoryId" : "etc",
													"categoryName" : "당구",
													"gameId" : "20220930PBA4",
													"statusCode" : "STARTED",
													"statusInfo" : "",
													"cancel" : "N",
													"isEnableNvm" : "N",
													"gameInfo" : null,
													"gameDateTime" : "2022-09-30 23:00:00",
													"gameTimeHHmm" : "23:00",
													"title" : "SK렌터카 vs 하나카드 - 웰컴저축은행 PBA팀리그",
													"stadium" : "엘리시안 강촌",
													"isScheduledTv" : "Y",
													"isOnairTv" : "Y",
													"isOnairText" : "N",
													"liveTotalView" : 5088,
													"liveCurrentView" : 810,
													"teamName1" : "",
													"teamName2" : "",
													"teamCode1" : "",
													"teamCode2" : "",
													"teamLogo1" : "",
													"teamLogo2" : "",
													"teamScore1" : 0,
													"teamScore2" : 0,
													"winner" : null,
													"homeTeamName" : "",
													"awayTeamName" : "",
													"homeTeamCode" : "",
													"awayTeamCode" : "",
													"homeTeamLogo" : "",
													"awayTeamLogo" : "",
													"homeTeamScore" : 0,
													"awayTeamScore" : 0,
													"homeAwayWinner" : "DRAW",
													"disciplineId" : null,
													"disciplineName" : null,
													"matchTitle" : null,
													"url" : "/general/gamecenter/etc/index?gameId=20220930PBA4",
													"homeTeamPenaltyScore" : -1,
													"awayTeamPenaltyScore" : -1,
													"homeCurrentPitcherName" : "",
													"awayCurrentPitcherName" : "",
													"templateCreateDateTime" : [
															2022, 9, 30, 23, 1,
															0, 498000000 ],
													"displayType" : "text",
													"mainSubPriority" : 1,
													"lolSetInfoList" : [],
													"esportsLeague" : null,
													"commentCount" : 0,
													"roundCode" : "",
													"channelCode" : "",
													"thumbnail" : "https://livecloud-thumb.akamaized.net/sports/livecloud/KR/stream/9177418/live/3566960/record/18009441/thumbnail/image_1080.jpg",
													"pcUrl" : "/game/20220930PBA4",
													"gameContents" : null,
													"winnerPredictPercentage" : 0,
													"templateTitle" : "SK렌터카 vs 하나카드 - 웰컴저축은행 PBA팀리그",
													"liveSchedule" : true,
													"mainSubType" : "SUB",
													"whiteList" : false,
													"dataId" : "AUTO_1",
													"isEnable" : "Y",
													"fixTopPosition" : "N",
													"image" : "",
													"contentsId" : "schedule.20220930PBA4",
													"thumbnailImage" : "https://livecloud-thumb.akamaized.net/sports/livecloud/KR/stream/9177418/live/3566960/record/18009441/thumbnail/image_1080.jpg"
												} ],
										"liveBoxBeforeList" : [
												{
													"superCategoryId" : "football",
													"upperCategoryId" : "wfootball",
													"categoryId" : "ligue1",
													"categoryName" : "리그1",
													"gameId" : "2022100162034172157",
													"statusCode" : "BEFORE",
													"statusInfo" : "경기전",
													"cancel" : "N",
													"isEnableNvm" : "Y",
													"gameInfo" : "{\"is_neutral_ground\":\"false\",\"shoot_out_json\":{\"home\":[],\"away\":[],\"homeScore\":0,\"awayScore\":0},\"home_team_regular_league\":\"ligue1\",\"away_team_regular_league\":\"ligue1\",\"home_team_scorer\":\"\",\"has_pt_score\":\"N\",\"current_half\":\"경기전\",\"away_team_extra_info\":\"\",\"away_team_scorer\":\"\",\"scorer_json\":{\"home\":[],\"away\":[]},\"season\":\"2223\",\"game_no\":0,\"home_team_extra_info\":\"\",\"match_day\":\"9\",\"match_round\":\"9\",\"game_id\":\"2022100162034172157\"}",
													"gameDateTime" : "2022-10-01 04:00:00",
													"gameTimeHHmm" : "04:00",
													"title" : "앙제 VS 마르세유",
													"stadium" : "Stade Raymond Kopa",
													"isScheduledTv" : "Y",
													"isOnairTv" : "N",
													"isOnairText" : "N",
													"liveTotalView" : 0,
													"liveCurrentView" : 0,
													"teamName1" : "앙제",
													"teamName2" : "마르세유",
													"teamCode1" : "32839",
													"teamCode2" : "26344",
													"teamLogo1" : "https://sports-phinf.pstatic.net/team/wfootball/default/32839.png",
													"teamLogo2" : "https://sports-phinf.pstatic.net/team/wfootball/default/26344.png",
													"teamScore1" : 0,
													"teamScore2" : 0,
													"winner" : null,
													"homeTeamName" : "앙제",
													"awayTeamName" : "마르세유",
													"homeTeamCode" : "32839",
													"awayTeamCode" : "26344",
													"homeTeamLogo" : "https://sports-phinf.pstatic.net/team/wfootball/default/32839.png",
													"awayTeamLogo" : "https://sports-phinf.pstatic.net/team/wfootball/default/26344.png",
													"homeTeamScore" : 0,
													"awayTeamScore" : 0,
													"homeAwayWinner" : "DRAW",
													"disciplineId" : null,
													"disciplineName" : null,
													"matchTitle" : null,
													"url" : "/worldfootball/gamecenter/worldfootball/index?league=ligue1&gameId=2022100162034172157",
													"homeTeamPenaltyScore" : -1,
													"awayTeamPenaltyScore" : -1,
													"homeCurrentPitcherName" : "",
													"awayCurrentPitcherName" : "",
													"templateCreateDateTime" : [
															2022, 9, 30, 23, 1,
															0, 412000000 ],
													"displayType" : "vs",
													"mainSubPriority" : 0,
													"lolSetInfoList" : [],
													"esportsLeague" : null,
													"commentCount" : 0,
													"roundCode" : "",
													"channelCode" : "",
													"thumbnail" : null,
													"pcUrl" : "/game/2022100162034172157",
													"gameContents" : {
														"gameEvent" : [],
														"predict" : null,
														"formation" : null,
														"video" : []
													},
													"winnerPredictPercentage" : 0,
													"templateTitle" : "",
													"liveSchedule" : false,
													"mainSubType" : "MAIN",
													"whiteList" : false,
													"dataId" : "AUTO_2",
													"isEnable" : "Y",
													"fixTopPosition" : "N",
													"image" : "",
													"contentsId" : "schedule.2022100162034172157",
													"thumbnailImage" : ""
												},
												{
													"superCategoryId" : "general",
													"upperCategoryId" : "others",
													"categoryId" : "etc",
													"categoryName" : "바둑",
													"gameId" : "20220930BD3",
													"statusCode" : "BEFORE",
													"statusInfo" : "",
													"cancel" : "N",
													"isEnableNvm" : "N",
													"gameInfo" : null,
													"gameDateTime" : "2022-09-30 23:00:00",
													"gameTimeHHmm" : "23:00",
													"title" : "제16회 한세실업배 대학동문전(녹방)",
													"stadium" : "바둑TV 스튜디오",
													"isScheduledTv" : "Y",
													"isOnairTv" : "N",
													"isOnairText" : "N",
													"liveTotalView" : 0,
													"liveCurrentView" : 0,
													"teamName1" : "",
													"teamName2" : "",
													"teamCode1" : "",
													"teamCode2" : "",
													"teamLogo1" : "",
													"teamLogo2" : "",
													"teamScore1" : 0,
													"teamScore2" : 0,
													"winner" : null,
													"homeTeamName" : "",
													"awayTeamName" : "",
													"homeTeamCode" : "",
													"awayTeamCode" : "",
													"homeTeamLogo" : "",
													"awayTeamLogo" : "",
													"homeTeamScore" : 0,
													"awayTeamScore" : 0,
													"homeAwayWinner" : "DRAW",
													"disciplineId" : null,
													"disciplineName" : null,
													"matchTitle" : null,
													"url" : "/general/gamecenter/etc/index?gameId=20220930BD3",
													"homeTeamPenaltyScore" : -1,
													"awayTeamPenaltyScore" : -1,
													"homeCurrentPitcherName" : "",
													"awayCurrentPitcherName" : "",
													"templateCreateDateTime" : [
															2022, 9, 30, 23, 1,
															0, 498000000 ],
													"displayType" : "text",
													"mainSubPriority" : 1,
													"lolSetInfoList" : [],
													"esportsLeague" : null,
													"commentCount" : 0,
													"roundCode" : "",
													"channelCode" : "",
													"thumbnail" : null,
													"pcUrl" : "/game/20220930BD3",
													"gameContents" : null,
													"winnerPredictPercentage" : 0,
													"templateTitle" : "제16회 한세실업배 대학동문전(녹방)",
													"liveSchedule" : false,
													"mainSubType" : "SUB",
													"whiteList" : false,
													"dataId" : "AUTO_3",
													"isEnable" : "Y",
													"fixTopPosition" : "N",
													"image" : "",
													"contentsId" : "schedule.20220930BD3",
													"thumbnailImage" : ""
												},
												{
													"superCategoryId" : "football",
													"upperCategoryId" : "wfootball",
													"categoryId" : "bundesliga",
													"categoryName" : "분데스",
													"gameId" : "2022100162534169075",
													"statusCode" : "BEFORE",
													"statusInfo" : "경기전",
													"cancel" : "N",
													"isEnableNvm" : "N",
													"gameInfo" : "{\"is_neutral_ground\":\"false\",\"shoot_out_json\":{\"home\":[],\"away\":[],\"homeScore\":0,\"awayScore\":0},\"home_team_regular_league\":\"bundesliga\",\"away_team_regular_league\":\"bundesliga\",\"home_team_scorer\":\"\",\"has_pt_score\":\"N\",\"current_half\":\"경기전\",\"away_team_extra_info\":\"\",\"away_team_scorer\":\"\",\"scorer_json\":{\"home\":[],\"away\":[]},\"season\":\"2223\",\"game_no\":0,\"home_team_extra_info\":\"\",\"match_day\":\"8\",\"match_round\":\"8\",\"game_id\":\"2022100162534169075\"}",
													"gameDateTime" : "2022-10-01 03:30:00",
													"gameTimeHHmm" : "03:30",
													"title" : "바이에른 뮌헨 VS 레버쿠젠",
													"stadium" : "Allianz Arena",
													"isScheduledTv" : "\u0000",
													"isOnairTv" : "\u0000",
													"isOnairText" : "\u0000",
													"liveTotalView" : 0,
													"liveCurrentView" : 0,
													"teamName1" : "바이에른 뮌헨",
													"teamName2" : "레버쿠젠",
													"teamCode1" : "26247",
													"teamCode2" : "26256",
													"teamLogo1" : "https://sports-phinf.pstatic.net/team/wfootball/default/26247.png",
													"teamLogo2" : "https://sports-phinf.pstatic.net/team/wfootball/default/26256.png",
													"teamScore1" : 0,
													"teamScore2" : 0,
													"winner" : null,
													"homeTeamName" : "바이에른 뮌헨",
													"awayTeamName" : "레버쿠젠",
													"homeTeamCode" : "26247",
													"awayTeamCode" : "26256",
													"homeTeamLogo" : "https://sports-phinf.pstatic.net/team/wfootball/default/26247.png",
													"awayTeamLogo" : "https://sports-phinf.pstatic.net/team/wfootball/default/26256.png",
													"homeTeamScore" : 0,
													"awayTeamScore" : 0,
													"homeAwayWinner" : "DRAW",
													"disciplineId" : null,
													"disciplineName" : null,
													"matchTitle" : null,
													"url" : "/worldfootball/gamecenter/worldfootball/index?league=bundesliga&gameId=2022100162534169075",
													"homeTeamPenaltyScore" : -1,
													"awayTeamPenaltyScore" : -1,
													"homeCurrentPitcherName" : "",
													"awayCurrentPitcherName" : "",
													"templateCreateDateTime" : [
															2022, 9, 30, 23, 1,
															0, 412000000 ],
													"displayType" : "vs",
													"mainSubPriority" : 1,
													"lolSetInfoList" : [],
													"esportsLeague" : null,
													"commentCount" : 0,
													"roundCode" : "",
													"channelCode" : "",
													"thumbnail" : null,
													"pcUrl" : "/game/2022100162534169075",
													"gameContents" : {
														"gameEvent" : [],
														"predict" : null,
														"formation" : null,
														"video" : []
													},
													"winnerPredictPercentage" : 0,
													"templateTitle" : "",
													"liveSchedule" : false,
													"mainSubType" : "SUB",
													"whiteList" : true,
													"dataId" : "AUTO_4",
													"isEnable" : "Y",
													"fixTopPosition" : "N",
													"image" : "",
													"contentsId" : "schedule.2022100162534169075",
													"thumbnailImage" : ""
												} ],
									}); */
						</script>
					</div>
				</div>
				<div id="content">
					<div class="main_wrap">
						<div class="today_section type_no_da">
							<h3 class="blind">오늘의 스포츠</h3>
							<ul class="today_list">
								<c:set var="listCodeLeague" value="${CodeServiceImpl.selectListCachedCode('6') }" />
				            	<c:choose>
			                  		<c:when test="${fn:length(aList) eq 0}">
			              				<div class="text-center">There is no data!</div>
			                  		</c:when>
			                   		<c:otherwise>
			                       		<c:forEach items="${aList}" var="aList" varStatus="status">
											<li class="today_item">
												<a href="articleView?aSeq=${aList.aSeq }" class="link_today" title="${aList.title }" onclick="clickcr(this, 'rnk*r.list', '109_0004709574', '1', event);" data-not-edited="Y">
													<div class="image_area">
														<img src="<c:out value="${aList.path }"/><c:out value="${aList.uuidName }"/>" width="160" height="95" border="6" alt="">
													</div>
													<div class="text_area">
														<c:forEach items="${aImgList}" var="aImgList" varStatus="status">
															${aImgList.path }${aImgList.uuidName }
														</c:forEach>
														<strong class="title">${aList.title } </strong>
														<!-- [D] 내용 두줄 말줄임 적용해주세요. -->
														<p class="news">${aList.content }</p>
														<div class="information">
															<span>${aList.newspaper }</span> 
															<span>
																<c:forEach items="${listCodeLeague}" var="listLeague" varStatus="statusLeague">
																	<c:if test="${aList.aLeague eq listLeague.ccSeq}"><c:out value="${listLeague.ifccName }"/></c:if>
																</c:forEach>
																리그
															</span>
														</div>
													</div>
												</a>
											</li>		
										</c:forEach>
			                   		</c:otherwise>
			                   	</c:choose>
							</ul>
						</div>
						<div class="aside_section">
							<!-- aside template -->
							<div class="aside_inner aside_creator">
								<div class="aside_head">
									<h3 class="title">스포츠 창작자 영상</h3>
									<div class="pagination">
										<span class="page" data-current="1"><em class="current">1</em>
											/ 4</span>
										<button type="button" class="button_prev" disabled="disabled"
											data-first="1"
											onclick="clickcr(this, 'crv.paging', '', '', event);">
											<span class="blind">이전</span>
										</button>
										<button type="button" class="button_next" data-last="4"
											onclick="clickcr(this, 'crv.paging', '', '', event);">
											<span class="blind">다음</span>
										</button>
									</div>
								</div>
								<ul class="creator_list">
									<li class="creator_item" data-group="1"
										style="display: list-item;"><a href="#"
										class="link_creator"
										onclick="clickcr(this, 'crv.list', '', '', event);">
											<div class="image_area">
												<span class="image"><img
													src="https://phinf.pstatic.net/tvcast/20220928_119/Ki6MF_166435811045142VPt_PNG/1664358107257.png"
													onerror="imageOnError(this);" width="110" height="68"
													alt=""></span> <span class="common_video_length"><span
													class="blind">재생시간</span>09:39</span>
											</div>
											<div class="text_area">
												<strong class="title">강정호 언급한 겁 없는 신인? 배지환 데뷔 첫
													멀티히트 맹활약!</strong>
												<div class="information">
													<span>조회 7,835</span><span>이현우의 MLBTV</span>
												</div>
											</div>
									</a></li>
									<li class="creator_item" data-group="1"
										style="display: list-item;"><a href="#"
										class="link_creator"
										onclick="clickcr(this, 'crv.list', '', '', event);">
											<div class="image_area">
												<span class="image"><img
													src="https://phinf.pstatic.net/tvcast/20220924_163/H8xjd_16639978287168I4PL_JPEG/1663997721323.jpg"
													onerror="imageOnError(this);" width="110" height="68"
													alt=""></span> <span class="common_video_length"><span
													class="blind">재생시간</span>04:23</span>
											</div>
											<div class="text_area">
												<strong class="title">※눈물주의※ 로저 페더러가 은퇴 경기에서 진 뒤 전한
													소감</strong>
												<div class="information">
													<span>조회 7,300</span><span>윔블맨 WIMBLEMAN</span>
												</div>
											</div>
									</a></li>
									<li class="creator_item" data-group="1"
										style="display: list-item;"><a href="#"
										class="link_creator"
										onclick="clickcr(this, 'crv.list', '', '', event);">
											<div class="image_area">
												<span class="image"><img
													src="https://phinf.pstatic.net/tvcast/20220929_291/6edhc_1664431690658ghUEd_JPEG/1664431477455.jpg"
													onerror="imageOnError(this);" width="110" height="68"
													alt=""></span> <span class="common_video_length"><span
													class="blind">재생시간</span>08:14</span>
											</div>
											<div class="text_area">
												<strong class="title">벨란겔! 어서 와 점프볼은 처음이지? (feat.
													이대성-최주영)</strong>
												<div class="information">
													<span>조회 960</span><span>점프볼TV (농구전문채널)</span>
												</div>
											</div>
									</a></li>
									<li class="creator_item" data-group="1"
										style="display: list-item;"><a href="#"
										class="link_creator"
										onclick="clickcr(this, 'crv.list', '', '', event);">
											<div class="image_area">
												<span class="image"><img
													src="https://phinf.pstatic.net/tvcast/20220923_158/mIsJp_1663924565028papeq_JPEG/1663924270327.jpg"
													onerror="imageOnError(this);" width="110" height="68"
													alt=""></span> <span class="common_video_length"><span
													class="blind">재생시간</span>00:59</span>
											</div>
											<div class="text_area">
												<strong class="title">NBA에서도 역대 최초 WNBA에서도 역대 최초인
													그녀</strong>
												<div class="information">
													<span>조회 24,626</span><span>농구대학</span>
												</div>
											</div>
									</a></li>
									<li class="creator_item" data-group="1"
										style="display: list-item;"><a href="#"
										class="link_creator"
										onclick="clickcr(this, 'crv.list', '', '', event);">
											<div class="image_area">
												<span class="image"><img
													src="https://phinf.pstatic.net/tvcast/20220929_244/aoqtp_16644363575375ntvi_JPEG/1664436305680.jpg"
													onerror="imageOnError(this);" width="110" height="68"
													alt=""></span> <span class="common_video_length"><span
													class="blind">재생시간</span>17:38</span>
											</div>
											<div class="text_area">
												<strong class="title">손흥민 3연속골 아스널에 경고 보냈다 '북런던 더비
													선발' (토트넘 프리뷰)</strong>
												<div class="information">
													<span>조회 2,444</span><span>한준TV</span>
												</div>
											</div>
									</a></li>
									<li class="creator_item" data-group="1"
										style="display: list-item;"><a href="#"
										class="link_creator"
										onclick="clickcr(this, 'crv.list', '', '', event);">
											<div class="image_area">
												<span class="image"><img
													src="https://phinf.pstatic.net/tvcast/20220927_73/uXxhH_1664264800362EIlIG_JPEG/1664264744762.jpg"
													onerror="imageOnError(this);" width="110" height="68"
													alt=""></span> <span class="common_video_length"><span
													class="blind">재생시간</span>12:47</span>
											</div>
											<div class="text_area">
												<strong class="title">우리 팀 신입이들 얼마나 잘했나? 2022 KBL
													트라이아웃 직캠</strong>
												<div class="information">
													<span>조회 894</span><span>농구대학</span>
												</div>
											</div>
									</a></li>
									<li class="creator_item" data-group="1"
										style="display: list-item;"><a href="#"
										class="link_creator"
										onclick="clickcr(this, 'crv.list', '', '', event);">
											<div class="image_area">
												<span class="image"><img
													src="https://phinf.pstatic.net/tvcast/20220928_95/DY9tQ_1664365912795pP6jU_PNG/1664365689628.png"
													onerror="imageOnError(this);" width="110" height="68"
													alt=""></span> <span class="common_video_length"><span
													class="blind">재생시간</span>09:14</span>
											</div>
											<div class="text_area">
												<strong class="title">'대표팀에 무슨 일이' 이강인 논란 어떻게 해결할
													것인가</strong>
												<div class="information">
													<span>조회 3,552</span><span>스포츠니어스</span>
												</div>
											</div>
									</a></li>
									<li class="creator_item" data-group="2" style="display: none;">
										<a href="#" class="link_creator"
										onclick="clickcr(this, 'crv.list', '', '', event);">
											<div class="image_area">
												<span class="image"><img
													src="https://phinf.pstatic.net/tvcast/20220929_28/7I2ov_1664420304322Mc72t_JPEG/1664420222114.jpg"
													onerror="imageOnError(this);" width="110" height="68"
													alt=""></span> <span class="common_video_length"><span
													class="blind">재생시간</span>10:50</span>
											</div>
											<div class="text_area">
												<strong class="title">올 시즌도 10위로 마감한 한화.. 순페이가 본
													한화의 2022는? [THE FASTBALL]</strong>
												<div class="information">
													<span>조회 6,261</span><span>순Fe</span>
												</div>
											</div>
									</a>
									</li>
									<li class="creator_item" data-group="2" style="display: none;">
										<a href="#" class="link_creator"
										onclick="clickcr(this, 'crv.list', '', '', event);">
											<div class="image_area">
												<span class="image"><img
													src="https://phinf.pstatic.net/tvcast/20220928_296/XL1mN_1664360249473iChWO_JPEG/1664359953080.jpg"
													onerror="imageOnError(this);" width="110" height="68"
													alt=""></span> <span class="common_video_length"><span
													class="blind">재생시간</span>12:13</span>
											</div>
											<div class="text_area">
												<strong class="title">벤투는 왜 이강인을 쓰지 않았을까?(ft. 벤쪽 같은
													내새끼)</strong>
												<div class="information">
													<span>조회 14,945</span><span>김진짜 Real KIM</span>
												</div>
											</div>
									</a>
									</li>
									<li class="creator_item" data-group="2" style="display: none;">
										<a href="#" class="link_creator"
										onclick="clickcr(this, 'crv.list', '', '', event);">
											<div class="image_area">
												<span class="image"><img
													src="https://phinf.pstatic.net/tvcast/20220923_233/vGg94_1663895823012Gbkz8_JPEG/1663895715037.jpg"
													onerror="imageOnError(this);" width="110" height="68"
													alt=""></span> <span class="common_video_length"><span
													class="blind">재생시간</span>08:02</span>
											</div>
											<div class="text_area">
												<strong class="title">[고태완의 독학골프] 헤드업, 고치기 너무 쉬운데?
													한 동작으로 헤드업 교정하기!</strong>
												<div class="information">
													<span>조회 1,406</span><span>스윙티비</span>
												</div>
											</div>
									</a>
									</li>
									<li class="creator_item" data-group="2" style="display: none;">
										<a href="#" class="link_creator"
										onclick="clickcr(this, 'crv.list', '', '', event);">
											<div class="image_area">
												<span class="image"><img
													src="https://phinf.pstatic.net/tvcast/20220927_253/Tqd2R_1664268482913eSV5I_PNG/1664268341164.png"
													onerror="imageOnError(this);" width="110" height="68"
													alt=""></span> <span class="common_video_length"><span
													class="blind">재생시간</span>10:47</span>
											</div>
											<div class="text_area">
												<strong class="title">류현진 MLB 서비스타임 10년, 연금 수령액 단위가
													달라진다!</strong>
												<div class="information">
													<span>조회 14,891</span><span>이현우의 MLBTV</span>
												</div>
											</div>
									</a>
									</li>
									<li class="creator_item" data-group="2" style="display: none;">
										<a href="#" class="link_creator"
										onclick="clickcr(this, 'crv.list', '', '', event);">
											<div class="image_area">
												<span class="image"><img
													src="https://phinf.pstatic.net/tvcast/20220924_172/vVVk8_1663989999119p7onO_PNG/1663989926426.png"
													onerror="imageOnError(this);" width="110" height="68"
													alt=""></span> <span class="common_video_length"><span
													class="blind">재생시간</span>00:43</span>
											</div>
											<div class="text_area">
												<strong class="title">해리 케인, 데뷔전 앞두고 긴장한 나머지 사고 내다</strong>
												<div class="information">
													<span>조회 85,619</span><span>인터티비</span>
												</div>
											</div>
									</a>
									</li>
									<li class="creator_item" data-group="2" style="display: none;">
										<a href="#" class="link_creator"
										onclick="clickcr(this, 'crv.list', '', '', event);">
											<div class="image_area">
												<span class="image"><img
													src="https://phinf.pstatic.net/tvcast/20220924_79/quvU3_1663956351943dPh9y_JPEG/1663956285620.jpg"
													onerror="imageOnError(this);" width="110" height="68"
													alt=""></span> <span class="common_video_length"><span
													class="blind">재생시간</span>04:55</span>
											</div>
											<div class="text_area">
												<strong class="title">프리킥 골로 클라쓰 증명한 손흥민 ㄷㄷㄷ ｜대한민국
													vs 코스타리카, 손흥민 직캠</strong>
												<div class="information">
													<span>조회 103,305</span><span>풋볼티키빠따</span>
												</div>
											</div>
									</a>
									</li>
									<li class="creator_item" data-group="2" style="display: none;">
										<a href="#" class="link_creator"
										onclick="clickcr(this, 'crv.list', '', '', event);">
											<div class="image_area">
												<span class="image"><img
													src="https://phinf.pstatic.net/tvcast/20220924_47/KGRWN_1664008682620EQWQ3_JPEG/1664008527564.jpg"
													onerror="imageOnError(this);" width="110" height="68"
													alt=""></span> <span class="common_video_length"><span
													class="blind">재생시간</span>00:59</span>
											</div>
											<div class="text_area">
												<strong class="title">"르브론 이후 최고의 재능" NBA 대기 중인 역대급
													유망주</strong>
												<div class="information">
													<span>조회 58,730</span><span>농구대학</span>
												</div>
											</div>
									</a>
									</li>
									<li class="creator_item" data-group="3" style="display: none;">
										<a href="#" class="link_creator"
										onclick="clickcr(this, 'crv.list', '', '', event);">
											<div class="image_area">
												<span class="image"><img
													src="https://phinf.pstatic.net/tvcast/20220928_156/skSa1_16643700431197BMzs_JPEG/1664368941413.jpg"
													onerror="imageOnError(this);" width="110" height="68"
													alt=""></span> <span class="common_video_length"><span
													class="blind">재생시간</span>17:34</span>
											</div>
											<div class="text_area">
												<strong class="title">한화 외인투수 둘 퇴출가능성↑/주전 3할타자없는 한화
													FA보강 필요</strong>
												<div class="information">
													<span>조회 11,787</span><span>야구부장의 크보핵인싸</span>
												</div>
											</div>
									</a>
									</li>
									<li class="creator_item" data-group="3" style="display: none;">
										<a href="#" class="link_creator"
										onclick="clickcr(this, 'crv.list', '', '', event);">
											<div class="image_area">
												<span class="image"><img
													src="https://phinf.pstatic.net/tvcast/20220928_145/FFduZ_1664338213590kbD1o_PNG/1664338081343.png"
													onerror="imageOnError(this);" width="110" height="68"
													alt=""></span> <span class="common_video_length"><span
													class="blind">재생시간</span>08:39</span>
											</div>
											<div class="text_area">
												<strong class="title">[농BTI] SK 오재현의 인연까지 찾아준 점프볼
													이야기</strong>
												<div class="information">
													<span>조회 384</span><span>점프볼TV (농구전문채널)</span>
												</div>
											</div>
									</a>
									</li>
									<li class="creator_item" data-group="3" style="display: none;">
										<a href="#" class="link_creator"
										onclick="clickcr(this, 'crv.list', '', '', event);">
											<div class="image_area">
												<span class="image"><img
													src="https://phinf.pstatic.net/tvcast/20220926_55/7cRbT_1664182830185WEKH8_JPEG/1664182695621.jpg"
													onerror="imageOnError(this);" width="110" height="68"
													alt=""></span> <span class="common_video_length"><span
													class="blind">재생시간</span>10:06</span>
											</div>
											<div class="text_area">
												<strong class="title">실수를 줄이는 '단 하나'의 레슨ㅣ임진한
													프로ㅣ2022-2023 골프다이제스트 베스트 교습가 선</strong>
												<div class="information">
													<span>조회 3,591</span><span>골프다이제스트TV</span>
												</div>
											</div>
									</a>
									</li>
									<li class="creator_item" data-group="3" style="display: none;">
										<a href="#" class="link_creator"
										onclick="clickcr(this, 'crv.list', '', '', event);">
											<div class="image_area">
												<span class="image"><img
													src="https://phinf.pstatic.net/tvcast/20220928_189/DwXlD_16643732302381EDlQ_PNG/1664373224454.png"
													onerror="imageOnError(this);" width="110" height="68"
													alt=""></span> <span class="common_video_length"><span
													class="blind">재생시간</span>14:38</span>
											</div>
											<div class="text_area">
												<strong class="title">'광주가 왜?' 우승하자마자 강등 걱정하는 감독</strong>
												<div class="information">
													<span>조회 4,733</span><span>스포츠니어스</span>
												</div>
											</div>
									</a>
									</li>
									<li class="creator_item" data-group="3" style="display: none;">
										<a href="#" class="link_creator"
										onclick="clickcr(this, 'crv.list', '', '', event);">
											<div class="image_area">
												<span class="image"><img
													src="https://phinf.pstatic.net/tvcast/20220929_215/nXPJc_16644552564509q2lj_JPEG/1664455233291.jpg"
													onerror="imageOnError(this);" width="110" height="68"
													alt=""></span> <span class="common_video_length"><span
													class="blind">재생시간</span>00:55</span>
											</div>
											<div class="text_area">
												<strong class="title">[아이빌리/짧은당구]이 배치로 뒤돌리기 포지션을
													만들기 위한 두께와 당점은? #ShortForm</strong>
												<div class="information">
													<span>조회 1,508</span><span>아이빌리TV</span>
												</div>
											</div>
									</a>
									</li>
									<li class="creator_item" data-group="3" style="display: none;">
										<a href="#" class="link_creator"
										onclick="clickcr(this, 'crv.list', '', '', event);">
											<div class="image_area">
												<span class="image"><img
													src="https://phinf.pstatic.net/tvcast/20220923_138/Tzhgx_1663862357254vhnuG_JPEG/1663862112787.jpg"
													onerror="imageOnError(this);" width="110" height="68"
													alt=""></span> <span class="common_video_length"><span
													class="blind">재생시간</span>02:07</span>
											</div>
											<div class="text_area">
												<strong class="title">'유짓수' 유수영 페이스 오프에서 일촉즉발
													신경전</strong>
												<div class="information">
													<span>조회 3,509</span><span>랭크파이브 제육 정기자 </span>
												</div>
											</div>
									</a>
									</li>
									<li class="creator_item" data-group="3" style="display: none;">
										<a href="#" class="link_creator"
										onclick="clickcr(this, 'crv.list', '', '', event);">
											<div class="image_area">
												<span class="image"><img
													src="https://phinf.pstatic.net/tvcast/20220929_210/HeQ3i_1664441485624eiNdU_PNG/1664441351772.png"
													onerror="imageOnError(this);" width="110" height="68"
													alt=""></span> <span class="common_video_length"><span
													class="blind">재생시간</span>10:34</span>
											</div>
											<div class="text_area">
												<strong class="title">드디어 터진 애런 저지 61호 대기록, 홈런볼은 누가
													잡았을까?</strong>
												<div class="information">
													<span>조회 6,682</span><span>이현우의 MLBTV</span>
												</div>
											</div>
									</a>
									</li>
									<li class="creator_item" data-group="4" style="display: none;">
										<a href="#" class="link_creator"
										onclick="clickcr(this, 'crv.list', '', '', event);">
											<div class="image_area">
												<span class="image"><img
													src="https://phinf.pstatic.net/tvcast/20220928_11/41oCG_1664357203406Peun0_JPEG/1664357089876.jpg"
													onerror="imageOnError(this);" width="110" height="68"
													alt=""></span> <span class="common_video_length"><span
													class="blind">재생시간</span>04:12</span>
											</div>
											<div class="text_area">
												<strong class="title">[전술분석] 벤투가 이강인보다 정우영을 선호하는 이유</strong>
												<div class="information">
													<span>조회 14,064</span><span>인터티비</span>
												</div>
											</div>
									</a>
									</li>
									<li class="creator_item" data-group="4" style="display: none;">
										<a href="#" class="link_creator"
										onclick="clickcr(this, 'crv.list', '', '', event);">
											<div class="image_area">
												<span class="image"><img
													src="https://phinf.pstatic.net/tvcast/20220926_117/scwZ0_1664196394960SqHKA_JPEG/1664196357712.jpg"
													onerror="imageOnError(this);" width="110" height="68"
													alt=""></span> <span class="common_video_length"><span
													class="blind">재생시간</span>00:53</span>
											</div>
											<div class="text_area">
												<strong class="title">조선의 슈터가 월드컵에서 세운 월드 레코드</strong>
												<div class="information">
													<span>조회 32,200</span><span>농구대학</span>
												</div>
											</div>
									</a>
									</li>
									<li class="creator_item" data-group="4" style="display: none;">
										<a href="#" class="link_creator"
										onclick="clickcr(this, 'crv.list', '', '', event);">
											<div class="image_area">
												<span class="image"><img
													src="https://phinf.pstatic.net/tvcast/20220921_239/lLKAX_1663763974752wmOoq_JPEG/1663763880528.jpg"
													onerror="imageOnError(this);" width="110" height="68"
													alt=""></span> <span class="common_video_length"><span
													class="blind">재생시간</span>27:08</span>
											</div>
											<div class="text_area">
												<strong class="title">이강인 시대 오나 카타르 월드컵 플랜 분석 (with
													브버지) [스카우트H]</strong>
												<div class="information">
													<span>조회 22,873</span><span>한준TV</span>
												</div>
											</div>
									</a>
									</li>
									<li class="creator_item" data-group="4" style="display: none;">
										<a href="#" class="link_creator"
										onclick="clickcr(this, 'crv.list', '', '', event);">
											<div class="image_area">
												<span class="image"><img
													src="https://phinf.pstatic.net/tvcast/20220929_174/ir6dL_166437869958486aGt_JPEG/1664378546634.jpg"
													onerror="imageOnError(this);" width="110" height="68"
													alt=""></span> <span class="common_video_length"><span
													class="blind">재생시간</span>03:42</span>
											</div>
											<div class="text_area">
												<strong class="title">한국에서 함께 연습한 남자테니스 세계 2위와 12위</strong>
												<div class="information">
													<span>조회 674</span><span>윔블맨 WIMBLEMAN</span>
												</div>
											</div>
									</a>
									</li>
									<li class="creator_item" data-group="4" style="display: none;">
										<a href="#" class="link_creator"
										onclick="clickcr(this, 'crv.list', '', '', event);">
											<div class="image_area">
												<span class="image"><img
													src="https://phinf.pstatic.net/tvcast/20220926_102/qc3d0_1664170175207cRDWB_PNG/1664169460912.png"
													onerror="imageOnError(this);" width="110" height="68"
													alt=""></span> <span class="common_video_length"><span
													class="blind">재생시간</span>11:45</span>
											</div>
											<div class="text_area">
												<strong class="title">뱃살빼는 최고의 방법을 알려드려요</strong>
												<div class="information">
													<span>조회 2,409</span><span>건강한운동</span>
												</div>
											</div>
									</a>
									</li>
									<li class="creator_item" data-group="4" style="display: none;">
										<a href="#" class="link_creator"
										onclick="clickcr(this, 'crv.list', '', '', event);">
											<div class="image_area">
												<span class="image"><img
													src="https://phinf.pstatic.net/tvcast/20220921_174/XuGMp_1663763758001JR8SJ_JPEG/1663763667210.jpg"
													onerror="imageOnError(this);" width="110" height="68"
													alt=""></span> <span class="common_video_length"><span
													class="blind">재생시간</span>25:59</span>
											</div>
											<div class="text_area">
												<strong class="title">스페인 국가대표도 극찬한 이강인의 역대급 재능
													(with 브버지) [스카우트H]</strong>
												<div class="information">
													<span>조회 15,464</span><span>한준TV</span>
												</div>
											</div>
									</a>
									</li>
									<li class="creator_item" data-group="4" style="display: none;">
										<a href="#" class="link_creator"
										onclick="clickcr(this, 'crv.list', '', '', event);">
											<div class="image_area">
												<span class="image"><img
													src="https://sports-phinf.pstatic.net//20220928_152/1664325119483pacvm_JPEG/Mct1664323350980-1280-0.jpg"
													onerror="imageOnError(this);" width="110" height="68"
													alt=""></span> <span class="common_video_length"><span
													class="blind">재생시간</span>10:03</span>
											</div>
											<div class="text_area">
												<strong class="title">[김다나 레슨] ＜드라이버＞ 임팩트 후 최고 속도가
													나오도록 스윙하기</strong>
												<div class="information">
													<span>조회 8,013</span><span>SBS골프 아카데미</span>
												</div>
											</div>
									</a>
									</li>
								</ul>
							</div>

							<!-- <script id="_video_item_template"
								type="text/x-handlebars-template">
									{{#each this}}
									<li class="creator_item" data-group="{{group}}">
										<a href="/video?id={{videoMasterId}}" class="link_creator" onClick="clickcr(this, 'crv.list', '', '', event);">
											<div class="image_area">
												<span class="image"><img src="https://dthumb-phinf.pstatic.net/?type=nf246_146&opts=12&qlt=70&sharpen=true&src={{thumbnail}}" onerror="imageOnError(this);" width="110" height="68" alt=""></span>
												<span class="common_video_length"><span class="blind">재생시간</span>{{playTime}}</span>
											</div>
											<div class="text_area">
												<strong class="title">{{{title}}}</strong>
												<div class="information">
													<span>조회 {{numberFormat hit}}</span><span>{{channelName}}</span>
												</div>
											</div>
										</a>
									</li>
									{{/each}}
								</script>

							<script id="_video_head_config_template"
								type="text/x-handlebars-template">
									<h3 class="title">{{title}}</h3>
									<div class="pagination">
										<span class="page" data-current="1"><em class="current">1</em> / {{pageNum}}</span>
										<button type="button" class="button_prev" disabled data-first="1"  onClick="clickcr(this, 'crv.paging', '', '', event);"><span class="blind">이전</span></button>
										<button type="button" class="button_next" data-last="{{pageNum}}"  onClick="clickcr(this, 'crv.paging', '', '', event);"><span class="blind">다음</span></button>
									</div>
								</script> -->

							<script>
								naver = window.naver || {};
								naver.sports = naver.sports || {};
								naver.sports.home = naver.sports.home || {};
								naver.sports.home.SelectedCategoryVideo = eg
										.Class({

											PAGING_VIDEO_COUNT : 7,

											construct : function(htOption) {
												this._initVars(htOption);
												this._initHandlebarsTemplate();
												this._draw(htOption);
												this._setEventHandlers();
											},
											_initVars : function(htOption) {
												this._config = htOption.config;
												this._videoResult = htOption.videoResult;

												var reality = Math
														.floor(this._videoResult.length
																/ this.PAGING_VIDEO_COUNT) || 1;
												var expected = Math
														.floor(this._config.extractedVideoCount
																/ this.PAGING_VIDEO_COUNT);
												this._pageNum = Math.min(
														reality, expected);

												this._extractVideoCount = this._pageNum
														* this.PAGING_VIDEO_COUNT;
											},

											_initHandlebarsTemplate : function() {
												this._videoHeadConfigTemplate = Handlebars
														.compile($(
																"#_video_head_config_template")
																.html());
												this._videoItemTemplate = Handlebars
														.compile($(
																"#_video_item_template")
																.html());
											},

											_setEventHandlers : function() {
												$(".aside_creator")
														.on(
																"click",
																".pagination .button_prev",
																$
																		.proxy(
																				function(
																						event) {
																					event
																							.preventDefault();
																					var $curTarget = $(event.currentTarget);
																					var $currentPage = $curTarget
																							.parent()
																							.find(
																									".page");
																					var currentPageNumber = $currentPage
																							.data("current");

																					if (currentPageNumber > $curTarget
																							.data("first")) {
																						this
																								._showTargetGroup(currentPageNumber - 1);
																						$currentPage
																								.find(
																										".current")
																								.text(
																										currentPageNumber - 1);
																						$currentPage
																								.data(
																										"current",
																										currentPageNumber - 1);
																					}

																					this
																							._checkPageButtonDisable();
																				},
																				this));

												$(".aside_creator")
														.on(
																"click",
																".pagination .button_next",
																$
																		.proxy(
																				function(
																						event) {
																					event
																							.preventDefault();
																					var $curTarget = $(event.currentTarget);
																					var $currentPage = $curTarget
																							.parent()
																							.find(
																									".page");
																					var currentPageNumber = $currentPage
																							.data("current");

																					if (currentPageNumber < $curTarget
																							.data("last")) {
																						this
																								._showTargetGroup(currentPageNumber + 1);
																						$currentPage
																								.find(
																										".current")
																								.text(
																										currentPageNumber + 1);
																						$currentPage
																								.data(
																										"current",
																										currentPageNumber + 1);
																					}

																					this
																							._checkPageButtonDisable();
																				},
																				this))
											},

											_draw : function() {
												// 상단 타이틀
												var configTemplateParam = {
													title : this._config.title,
													pageNum : this._pageNum
												};
												$(".aside_creator")
														.find(".aside_head")
														.html(
																this
																		._videoHeadConfigTemplate(configTemplateParam));

												// 영상 그룹 셋팅까지 해줌.
												var samplingVideo = _
														.sample(
																this._videoResult,
																this._extractVideoCount);
												_
														.each(
																samplingVideo,
																function(item,
																		index) {
																	item.group = Math
																			.floor(index / 7) + 1;
																});

												$(".aside_creator")
														.find(".creator_list")
														.html(
																this
																		._videoItemTemplate(samplingVideo));
												this._showTargetGroup("1");

												// 마지막 버튼 체크
												this._checkPageButtonDisable();
											},

											_showTargetGroup : function(group) {
												$(".aside_creator")
														.find(
																".creator_list .creator_item")
														.hide();
												$(".aside_creator").find(
														".creator_list .creator_item[data-group="
																+ group + "]")
														.show();
											},

											_checkPageButtonDisable : function() {
												var currentPageNumber = $(
														".aside_creator").find(
														".pagination .page")
														.data("current");
												var lastPageNumber = $(
														".aside_creator")
														.find(
																".pagination .button_next")
														.data("last");
												$(".aside_creator")
														.find(
																".pagination .button_prev")
														.attr(
																"disabled",
																currentPageNumber === 1);
												$(".aside_creator")
														.find(
																".pagination .button_next")
														.attr(
																"disabled",
																currentPageNumber === lastPageNumber);
											}
										});

								/* new naver.sports.home.SelectedCategoryVideo(
										{
											"config" : {
												"dataId" : 1596085512913,
												"isEnable" : "Y",
												"title" : "스포츠 창작자 영상",
												"extractedVideoCount" : "28"
											},
											"videoResult" : [
													{
														"hit" : 11787,
														"thumbnail" : "https://phinf.pstatic.net/tvcast/20220928_156/skSa1_16643700431197BMzs_JPEG/1664368941413.jpg",
														"playTime" : "17:34",
														"channelName" : "야구부장의 크보핵인싸",
														"videoMasterId" : "991563",
														"title" : "한화 외인투수 둘 퇴출가능성↑/주전 3할타자없는 한화 FA보강 필요"
													},
													{
														"hit" : 6261,
														"thumbnail" : "https://phinf.pstatic.net/tvcast/20220929_28/7I2ov_1664420304322Mc72t_JPEG/1664420222114.jpg",
														"playTime" : "10:50",
														"channelName" : "순Fe",
														"videoMasterId" : "991611",
														"title" : "올 시즌도 10위로 마감한 한화.. 순페이가 본 한화의 2022는? [THE FASTBALL]"
													},
													{
														"hit" : 14891,
														"thumbnail" : "https://phinf.pstatic.net/tvcast/20220927_253/Tqd2R_1664268482913eSV5I_PNG/1664268341164.png",
														"playTime" : "10:47",
														"channelName" : "이현우의 MLBTV",
														"videoMasterId" : "991079",
														"title" : "류현진 MLB 서비스타임 10년, 연금 수령액 단위가 달라진다!"
													},
													{
														"hit" : 7835,
														"thumbnail" : "https://phinf.pstatic.net/tvcast/20220928_119/Ki6MF_166435811045142VPt_PNG/1664358107257.png",
														"playTime" : "09:39",
														"channelName" : "이현우의 MLBTV",
														"videoMasterId" : "991431",
														"title" : "강정호 언급한 겁 없는 신인? 배지환 데뷔 첫 멀티히트 맹활약!"
													},
													{
														"hit" : 6682,
														"thumbnail" : "https://phinf.pstatic.net/tvcast/20220929_210/HeQ3i_1664441485624eiNdU_PNG/1664441351772.png",
														"playTime" : "10:34",
														"channelName" : "이현우의 MLBTV",
														"videoMasterId" : "991801",
														"title" : "드디어 터진 애런 저지 61호 대기록, 홈런볼은 누가 잡았을까?"
													},
													{
														"hit" : 3619,
														"thumbnail" : "https://phinf.pstatic.net/tvcast/20220929_147/jmmXe_1664444030147CNSH8_PNG/1664443982023.png",
														"playTime" : "11:18",
														"channelName" : "김형준의 야구야구",
														"videoMasterId" : "991791",
														"title" : "드디어 나온 61호! 벌랜더 사이영 확정?"
													},
													{
														"hit" : 6226,
														"thumbnail" : "https://phinf.pstatic.net/tvcast/20220928_180/4PcLK_1664356128126V3XMt_PNG/1664355970030.png",
														"playTime" : "13:47",
														"channelName" : "김형준의 야구야구",
														"videoMasterId" : "991448",
														"title" : "샌디에고, 4시간 혈투 끝에 다저스를 꺾다"
													},
													{
														"hit" : 14064,
														"thumbnail" : "https://phinf.pstatic.net/tvcast/20220928_11/41oCG_1664357203406Peun0_JPEG/1664357089876.jpg",
														"playTime" : "04:12",
														"channelName" : "인터티비",
														"videoMasterId" : "991565",
														"title" : "[전술분석] 벤투가 이강인보다 정우영을 선호하는 이유"
													},
													{
														"hit" : 4733,
														"thumbnail" : "https://phinf.pstatic.net/tvcast/20220928_189/DwXlD_16643732302381EDlQ_PNG/1664373224454.png",
														"playTime" : "14:38",
														"channelName" : "스포츠니어스",
														"videoMasterId" : "991554",
														"title" : "'광주가 왜?' 우승하자마자 강등 걱정하는 감독"
													},
													{
														"hit" : 14945,
														"thumbnail" : "https://phinf.pstatic.net/tvcast/20220928_296/XL1mN_1664360249473iChWO_JPEG/1664359953080.jpg",
														"playTime" : "12:13",
														"channelName" : "김진짜 Real KIM",
														"videoMasterId" : "991474",
														"title" : "벤투는 왜 이강인을 쓰지 않았을까?(ft. 벤쪽 같은 내새끼)"
													},
													{
														"hit" : 103305,
														"thumbnail" : "https://phinf.pstatic.net/tvcast/20220924_79/quvU3_1663956351943dPh9y_JPEG/1663956285620.jpg",
														"playTime" : "04:55",
														"channelName" : "풋볼티키빠따",
														"videoMasterId" : "990143",
														"title" : "프리킥 골로 클라쓰 증명한 손흥민 ㄷㄷㄷ ｜대한민국 vs 코스타리카, 손흥민 직캠"
													},
													{
														"hit" : 14871,
														"thumbnail" : "https://phinf.pstatic.net/tvcast/20220928_300/Lk7Z2_1664295519677aYT23_JPEG/1664295411428.jpg",
														"playTime" : "22:29",
														"channelName" : "한준TV",
														"videoMasterId" : "991257",
														"title" : "벤투 이강인 결장 이유 인터뷰 해설 '월드컵 26인 엔트리 분석' (카메룬전)"
													},
													{
														"hit" : 3552,
														"thumbnail" : "https://phinf.pstatic.net/tvcast/20220928_95/DY9tQ_1664365912795pP6jU_PNG/1664365689628.png",
														"playTime" : "09:14",
														"channelName" : "스포츠니어스",
														"videoMasterId" : "991496",
														"title" : "'대표팀에 무슨 일이' 이강인 논란 어떻게 해결할 것인가"
													},
													{
														"hit" : 22873,
														"thumbnail" : "https://phinf.pstatic.net/tvcast/20220921_239/lLKAX_1663763974752wmOoq_JPEG/1663763880528.jpg",
														"playTime" : "27:08",
														"channelName" : "한준TV",
														"videoMasterId" : "990964",
														"title" : "이강인 시대 오나 카타르 월드컵 플랜 분석 (with 브버지) [스카우트H]"
													},
													{
														"hit" : 85619,
														"thumbnail" : "https://phinf.pstatic.net/tvcast/20220924_172/vVVk8_1663989999119p7onO_PNG/1663989926426.png",
														"playTime" : "00:43",
														"channelName" : "인터티비",
														"videoMasterId" : "990183",
														"title" : "해리 케인, 데뷔전 앞두고 긴장한 나머지 사고 내다"
													},
													{
														"hit" : 60857,
														"thumbnail" : "https://phinf.pstatic.net/tvcast/20220924_203/vtEEa_1663953686001l2ton_PNG/1663953652299.png",
														"playTime" : "00:58",
														"channelName" : "서형욱의 뽈리TV",
														"videoMasterId" : "990203",
														"title" : "[미국방송] \"김민재, 세리에A 최고 수비수\" 伊 축구 전문가 '만장일치' 선정!"
													},
													{
														"hit" : 15464,
														"thumbnail" : "https://phinf.pstatic.net/tvcast/20220921_174/XuGMp_1663763758001JR8SJ_JPEG/1663763667210.jpg",
														"playTime" : "25:59",
														"channelName" : "한준TV",
														"videoMasterId" : "990259",
														"title" : "스페인 국가대표도 극찬한 이강인의 역대급 재능 (with 브버지) [스카우트H]"
													},
													{
														"hit" : 3382,
														"thumbnail" : "https://phinf.pstatic.net/tvcast/20220929_189/0aGrP_1664444620520Dadti_JPEG/1664444461847.jpg",
														"playTime" : "11:26",
														"channelName" : "새벽의 축구 전문가",
														"videoMasterId" : "991777",
														"title" : "'점유 vs 역습' 손흥민 활용법, 콘테 아스날전 352 사용할까? | 북런던 더비 관전 포인트"
													},
													{
														"hit" : 2444,
														"thumbnail" : "https://phinf.pstatic.net/tvcast/20220929_244/aoqtp_16644363575375ntvi_JPEG/1664436305680.jpg",
														"playTime" : "17:38",
														"channelName" : "한준TV",
														"videoMasterId" : "991722",
														"title" : "손흥민 3연속골 아스널에 경고 보냈다 '북런던 더비 선발' (토트넘 프리뷰)"
													},
													{
														"hit" : 58730,
														"thumbnail" : "https://phinf.pstatic.net/tvcast/20220924_47/KGRWN_1664008682620EQWQ3_JPEG/1664008527564.jpg",
														"playTime" : "00:59",
														"channelName" : "농구대학",
														"videoMasterId" : "990362",
														"title" : "\"르브론 이후 최고의 재능\" NBA 대기 중인 역대급 유망주"
													},
													{
														"hit" : 32200,
														"thumbnail" : "https://phinf.pstatic.net/tvcast/20220926_117/scwZ0_1664196394960SqHKA_JPEG/1664196357712.jpg",
														"playTime" : "00:53",
														"channelName" : "농구대학",
														"videoMasterId" : "990949",
														"title" : "조선의 슈터가 월드컵에서 세운 월드 레코드"
													},
													{
														"hit" : 24626,
														"thumbnail" : "https://phinf.pstatic.net/tvcast/20220923_158/mIsJp_1663924565028papeq_JPEG/1663924270327.jpg",
														"playTime" : "00:59",
														"channelName" : "농구대학",
														"videoMasterId" : "990012",
														"title" : "NBA에서도 역대 최초 WNBA에서도 역대 최초인 그녀"
													},
													{
														"hit" : 508,
														"thumbnail" : "https://phinf.pstatic.net/tvcast/20220929_133/AbSmH_16644296916986UOxj_PNG/1664429617653.png",
														"playTime" : "04:34",
														"channelName" : "점프볼TV (농구전문채널)",
														"videoMasterId" : "991672",
														"title" : "올 시즌 원주종합체육관에 변화는?"
													},
													{
														"hit" : 960,
														"thumbnail" : "https://phinf.pstatic.net/tvcast/20220929_291/6edhc_1664431690658ghUEd_JPEG/1664431477455.jpg",
														"playTime" : "08:14",
														"channelName" : "점프볼TV (농구전문채널)",
														"videoMasterId" : "991804",
														"title" : "벨란겔! 어서 와 점프볼은 처음이지? (feat. 이대성-최주영)"
													},
													{
														"hit" : 384,
														"thumbnail" : "https://phinf.pstatic.net/tvcast/20220928_145/FFduZ_1664338213590kbD1o_PNG/1664338081343.png",
														"playTime" : "08:39",
														"channelName" : "점프볼TV (농구전문채널)",
														"videoMasterId" : "991454",
														"title" : "[농BTI] SK 오재현의 인연까지 찾아준 점프볼 이야기"
													},
													{
														"hit" : 894,
														"thumbnail" : "https://phinf.pstatic.net/tvcast/20220927_73/uXxhH_1664264800362EIlIG_JPEG/1664264744762.jpg",
														"playTime" : "12:47",
														"channelName" : "농구대학",
														"videoMasterId" : "991064",
														"title" : "우리 팀 신입이들 얼마나 잘했나? 2022 KBL 트라이아웃 직캠"
													},
													{
														"hit" : 1580,
														"thumbnail" : "https://sports-phinf.pstatic.net//20220929_253/1664418421156qO7se_JPEG/5H31664416720243-1280-0.jpg",
														"playTime" : "09:40",
														"channelName" : "SBS골프 아카데미",
														"videoMasterId" : "991599",
														"title" : "[김가형 레슨] ＜드라이버＞ 양 팔꿈치 아래쪽을 살짝 모아 방향성 향상하기"
													},
													{
														"hit" : 8013,
														"thumbnail" : "https://sports-phinf.pstatic.net//20220928_152/1664325119483pacvm_JPEG/Mct1664323350980-1280-0.jpg",
														"playTime" : "10:03",
														"channelName" : "SBS골프 아카데미",
														"videoMasterId" : "991295",
														"title" : "[김다나 레슨] ＜드라이버＞ 임팩트 후 최고 속도가 나오도록 스윙하기"
													},
													{
														"hit" : 1816,
														"thumbnail" : "https://phinf.pstatic.net/tvcast/20220929_98/dhRoc_1664436684600SekVW_JPEG/1664436583540.jpg",
														"playTime" : "07:09",
														"channelName" : "허석프로",
														"videoMasterId" : "991721",
														"title" : "[허석프로] 겨드랑이 밀착.. 정말 후회스럽다 강남골프레슨"
													},
													{
														"hit" : 2344,
														"thumbnail" : "https://phinf.pstatic.net/tvcast/20220928_80/0Ypi1_1664376107455d1gNL_JPEG/1664376103006.JPG",
														"playTime" : "05:44",
														"channelName" : "닥치고스윙 김준년프로",
														"videoMasterId" : "991559",
														"title" : "아이언 방향성이 흔들린다면 이것부터 체크해 보셔야 합니다"
													},
													{
														"hit" : 2175,
														"thumbnail" : "https://phinf.pstatic.net/tvcast/20220928_61/vSq0u_1664362253606KUzpV_JPEG/1664362075488.jpg",
														"playTime" : "09:04",
														"channelName" : "정프로의 클라쓰",
														"videoMasterId" : "991568",
														"title" : "어깨에 힘을 빼는 원리"
													},
													{
														"hit" : 1406,
														"thumbnail" : "https://phinf.pstatic.net/tvcast/20220923_233/vGg94_1663895823012Gbkz8_JPEG/1663895715037.jpg",
														"playTime" : "08:02",
														"channelName" : "스윙티비",
														"videoMasterId" : "991731",
														"title" : "[고태완의 독학골프] 헤드업, 고치기 너무 쉬운데? 한 동작으로 헤드업 교정하기!"
													},
													{
														"hit" : 3591,
														"thumbnail" : "https://phinf.pstatic.net/tvcast/20220926_55/7cRbT_1664182830185WEKH8_JPEG/1664182695621.jpg",
														"playTime" : "10:06",
														"channelName" : "골프다이제스트TV",
														"videoMasterId" : "990891",
														"title" : "실수를 줄이는 '단 하나'의 레슨ㅣ임진한 프로ㅣ2022-2023 골프다이제스트 베스트 교습가 선"
													},
													{
														"hit" : 3509,
														"thumbnail" : "https://phinf.pstatic.net/tvcast/20220923_138/Tzhgx_1663862357254vhnuG_JPEG/1663862112787.jpg",
														"playTime" : "02:07",
														"channelName" : "랭크파이브 제육 정기자 ",
														"videoMasterId" : "989841",
														"title" : "'유짓수' 유수영 페이스 오프에서 일촉즉발 신경전"
													},
													{
														"hit" : 2409,
														"thumbnail" : "https://phinf.pstatic.net/tvcast/20220926_102/qc3d0_1664170175207cRDWB_PNG/1664169460912.png",
														"playTime" : "11:45",
														"channelName" : "건강한운동",
														"videoMasterId" : "990785",
														"title" : "뱃살빼는 최고의 방법을 알려드려요"
													},
													{
														"hit" : 7300,
														"thumbnail" : "https://phinf.pstatic.net/tvcast/20220924_163/H8xjd_16639978287168I4PL_JPEG/1663997721323.jpg",
														"playTime" : "04:23",
														"channelName" : "윔블맨 WIMBLEMAN",
														"videoMasterId" : "990231",
														"title" : "※눈물주의※ 로저 페더러가 은퇴 경기에서 진 뒤 전한 소감"
													},
													{
														"hit" : 1508,
														"thumbnail" : "https://phinf.pstatic.net/tvcast/20220929_215/nXPJc_16644552564509q2lj_JPEG/1664455233291.jpg",
														"playTime" : "00:55",
														"channelName" : "아이빌리TV",
														"videoMasterId" : "991892",
														"title" : "[아이빌리/짧은당구]이 배치로 뒤돌리기 포지션을 만들기 위한 두께와 당점은? #ShortForm"
													},
													{
														"hit" : 674,
														"thumbnail" : "https://phinf.pstatic.net/tvcast/20220929_174/ir6dL_166437869958486aGt_JPEG/1664378546634.jpg",
														"playTime" : "03:42",
														"channelName" : "윔블맨 WIMBLEMAN",
														"videoMasterId" : "991575",
														"title" : "한국에서 함께 연습한 남자테니스 세계 2위와 12위"
													} ]
										}); */

								//# sourceURL=sportsHomeSelectedCategoryVideo.js
							</script>
						</div>

						<div class="vod_section">
							<!-- 많이 본 영상 -->
							<h3 class="section_title">
								<a href="#" class="link_title"
									onclick="clickcr(this, 'rnk*m.gopage', '', '', event);"> 많이
									본 영상<span class="blind">더보기</span>
								</a>
							</h3>

							<p class="section_description">오후 9시 ~ 10시 까지 집계한 조회수 입니다. 총
								누적수와는 다를 수 있습니다.</p>

							<ul class="vod_list">
								<li class="vod_item"><a href="#"
									class="link_vod"
									onclick="clickcr(this, 'rnk*m.list', '991928', '1', event); "
									title="'드디어 터졌다!' 스트라이크 판정에 뿔난 푸이그! [7AM]">

										<div class="image_area">
											<span class="rank number1"><span class="blind">1위</span></span>
											<span class="common_video_length"><span class="blind">재생시간</span>01:48</span>
											<div class="image">
												<img
													src="https://sports-phinf.pstatic.net/20220930_129/1664482825721IBsuL_JPEG/%27%B5%E5%B5%F0%BE%EE_%C5%CD%C1%B3%B4%D9%27_%BD%BA%C6%AE%B6%F3%C0%CC%C5%A9_%C6%C7%C1%A4%BF%A1_%BB%D4%B3%AD_%C7%AA%C0%CC%B1%D7_7AM.jpg&amp;type=nf194_112&amp;service=sports"
													width="194" height="112" alt="" class="imageLazyLoad"
													lazy-src="https://sports-phinf.pstatic.net/20220930_129/1664482825721IBsuL_JPEG/%27%B5%E5%B5%F0%BE%EE_%C5%CD%C1%B3%B4%D9%27_%BD%BA%C6%AE%B6%F3%C0%CC%C5%A9_%C6%C7%C1%A4%BF%A1_%BB%D4%B3%AD_%C7%AA%C0%CC%B1%D7_7AM.jpg&amp;type=nf194_112&amp;service=sports"
													onerror="imageOnError(this);">
											</div>
										</div>
										<div class="text_area _sports_home_most_viewed_vod_title"
											style="overflow-wrap: break-word;">'드디어 터졌다!' 스트라이크 판정에
											뿔난 푸이그! [7AM]</div>
								</a></li>

								<li class="vod_item"><a href="#"
									class="link_vod"
									onclick="clickcr(this, 'rnk*m.list', '992002', '2', event); "
									title="'주의 요망' 자꾸 보고 싶은 KBO 짤 모음! [크보.GIF]">

										<div class="image_area">
											<span class="rank number2"><span class="blind">2위</span></span>
											<span class="common_video_length"><span class="blind">재생시간</span>02:27</span>
											<div class="image">
												<img
													src="https://sports-phinf.pstatic.net/20220929_39/1664434938965vHDva_JPEG/%27%C1%D6%C0%C7_%BF%E4%B8%C1%27_%C0%DA%B2%D9_%BA%B8%B0%ED_%BD%CD%C0%BA_KBO_%C2%A9_%B8%F0%C0%BD_%C5%A9%BA%B8.GIF.jpg&amp;type=nf194_112&amp;service=sports"
													width="194" height="112" alt="" class="imageLazyLoad"
													lazy-src="https://sports-phinf.pstatic.net/20220929_39/1664434938965vHDva_JPEG/%27%C1%D6%C0%C7_%BF%E4%B8%C1%27_%C0%DA%B2%D9_%BA%B8%B0%ED_%BD%CD%C0%BA_KBO_%C2%A9_%B8%F0%C0%BD_%C5%A9%BA%B8.GIF.jpg&amp;type=nf194_112&amp;service=sports"
													onerror="imageOnError(this);">
											</div>
										</div>
										<div class="text_area _sports_home_most_viewed_vod_title"
											style="overflow-wrap: break-word;">'주의 요망' 자꾸 보고 싶은 KBO
											짤 모음! [크보.GIF]</div>
								</a></li>

								<li class="vod_item"><a href="#"
									class="link_vod"
									onclick="clickcr(this, 'rnk*m.list', '992032', '3', event); "
									title="손흥민 해트트릭을 지켜본 케인 &quot;난 그를 믿고 있었다&quot; [스포츠타임]">

										<div class="image_area">
											<span class="rank number3"><span class="blind">3위</span></span>
											<span class="common_video_length"><span class="blind">재생시간</span>03:24</span>
											<div class="image">
												<img
													src="https://sports-phinf.pstatic.net/20220930_150/1664512577577JMg0E_JPEG/%C4%C9%C0%CE-%B3%AA%BF%EC.jpg&amp;type=nf194_112&amp;service=sports"
													width="194" height="112" alt="" class="imageLazyLoad"
													lazy-src="https://sports-phinf.pstatic.net/20220930_150/1664512577577JMg0E_JPEG/%C4%C9%C0%CE-%B3%AA%BF%EC.jpg&amp;type=nf194_112&amp;service=sports"
													onerror="imageOnError(this);">
											</div>
										</div>
										<div class="text_area _sports_home_most_viewed_vod_title"
											style="overflow-wrap: break-word;">손흥민 해트트릭을 지켜본 케인 "난
											그를 믿고 있었다" [스포츠타임]</div>
								</a></li>

								<li class="vod_item"><a href="#"
									class="link_vod"
									onclick="clickcr(this, 'rnk*m.list', '992219', '4', event); "
									title="이대호, 마지막 대전 원정에서 때려낸 선제 투런포">

										<div class="image_area">
											<span class="rank number4"><span class="blind">4위</span></span>
											<span class="common_video_length"><span class="blind">재생시간</span>03:44</span>
											<div class="image">
												<img
													src="https://sports-phinf.pstatic.net/20220930_210/1664531712056OKvRN_JPEG/3_%B7%D4%B5%A5_vs_%C7%D1%C8%AD1%C8%B8%C3%CA_%C0%CC%B4%EB%C8%A3%2C_%B8%B6%C1%F6%B8%B7_%B4%EB%C0%FC_%BF%F8%C1%A4%BF%A1%BC%AD_%B6%A7%B7%C1%B3%BD_%BC%B1%C1%A6_%C5%F5%B7%B1%C6%F7.jpg&amp;type=nf194_112&amp;service=sports"
													width="194" height="112" alt="" class="imageLazyLoad"
													lazy-src="https://sports-phinf.pstatic.net/20220930_210/1664531712056OKvRN_JPEG/3_%B7%D4%B5%A5_vs_%C7%D1%C8%AD1%C8%B8%C3%CA_%C0%CC%B4%EB%C8%A3%2C_%B8%B6%C1%F6%B8%B7_%B4%EB%C0%FC_%BF%F8%C1%A4%BF%A1%BC%AD_%B6%A7%B7%C1%B3%BD_%BC%B1%C1%A6_%C5%F5%B7%B1%C6%F7.jpg&amp;type=nf194_112&amp;service=sports"
													onerror="imageOnError(this);">
											</div>
										</div>
										<div class="text_area _sports_home_most_viewed_vod_title"
											style="overflow-wrap: break-word;">이대호, 마지막 대전 원정에서 때려낸
											선제 투런포</div>
								</a></li>

								<li class="vod_item"><a href="#"
									class="link_vod"
									onclick="clickcr(this, 'rnk*m.list', '992210', '5', event); "
									title="송진우-장종훈-김태균, 이글스 레전드들의 합동 시구">

										<div class="image_area">
											<span class="rank number5"><span class="blind">5위</span></span>
											<span class="common_video_length"><span class="blind">재생시간</span>01:45</span>
											<div class="image">
												<img
													src="https://sports-phinf.pstatic.net/20220930_218/1664530832131QEqFH_JPEG/2_%B7%D4%B5%A5_vs_%C7%D1%C8%AD1%C8%B8%C3%CA_%BC%DB%C1%F8%BF%EC-%C0%E5%C1%BE%C8%C6-%B1%E8%C5%C2%B1%D5%2C_%C0%CC%B1%DB%BD%BA_%B7%B9%C0%FC%B5%E5%B5%E9%C0%C7_%C7%D5%B5%BF_%BD%C3%B1%B8.jpg&amp;type=nf194_112&amp;service=sports"
													width="194" height="112" alt="" class="imageLazyLoad"
													lazy-src="https://sports-phinf.pstatic.net/20220930_218/1664530832131QEqFH_JPEG/2_%B7%D4%B5%A5_vs_%C7%D1%C8%AD1%C8%B8%C3%CA_%BC%DB%C1%F8%BF%EC-%C0%E5%C1%BE%C8%C6-%B1%E8%C5%C2%B1%D5%2C_%C0%CC%B1%DB%BD%BA_%B7%B9%C0%FC%B5%E5%B5%E9%C0%C7_%C7%D5%B5%BF_%BD%C3%B1%B8.jpg&amp;type=nf194_112&amp;service=sports"
													onerror="imageOnError(this);">
											</div>
										</div>
										<div class="text_area _sports_home_most_viewed_vod_title"
											style="overflow-wrap: break-word;">송진우-장종훈-김태균, 이글스
											레전드들의 합동 시구</div>
								</a></li>

								<li class="vod_item"><a href="#"
									class="link_vod"
									onclick="clickcr(this, 'rnk*m.list', '992054', '6', event); "
									title="’손-케-샬 출격 대기’ 북런던 더비 앞둔 콘테의 선발 라인업은? [스포츠타임]">

										<div class="image_area">
											<span class="rank number6"><span class="blind">6위</span></span>
											<span class="common_video_length"><span class="blind">재생시간</span>01:41</span>
											<div class="image">
												<img
													src="https://sports-phinf.pstatic.net/20220930_228/1664516660987JXOnb_JPEG/%B3%D7%C0%CC%B9%F6%B3%AA%BF%EC_%BD%E6%B3%D7%C0%CF.jpg&amp;type=nf194_112&amp;service=sports"
													width="194" height="112" alt="" class="imageLazyLoad"
													lazy-src="https://sports-phinf.pstatic.net/20220930_228/1664516660987JXOnb_JPEG/%B3%D7%C0%CC%B9%F6%B3%AA%BF%EC_%BD%E6%B3%D7%C0%CF.jpg&amp;type=nf194_112&amp;service=sports"
													onerror="imageOnError(this);">
											</div>
										</div>
										<div
											class="text_area _sports_home_most_viewed_vod_title is-truncated"
											style="overflow-wrap: break-word;">’손-케-샬 출격 대기’ 북런던 더비
											앞둔 콘테의 선발 라인업은...</div>
								</a></li>

								<li class="vod_item"><a href="#"
									class="link_vod"
									onclick="clickcr(this, 'rnk*m.list', '991935', '7', event); "
									title="[9/29] '1OUT 남았는데...' 완봉 직전 교체되는 뷰캐넌">

										<div class="image_area">
											<span class="rank number7"><span class="blind">7위</span></span>
											<span class="common_video_length"><span class="blind">재생시간</span>05:01</span>
											<div class="image">
												<img
													src="https://sports-phinf.pstatic.net/20220930_88/1664472944817F6fyR_JPEG/2.jpg&amp;type=nf194_112&amp;service=sports"
													width="194" height="112" alt="" class="imageLazyLoad"
													lazy-src="https://sports-phinf.pstatic.net/20220930_88/1664472944817F6fyR_JPEG/2.jpg&amp;type=nf194_112&amp;service=sports"
													onerror="imageOnError(this);">
											</div>
										</div>
										<div class="text_area _sports_home_most_viewed_vod_title"
											style="overflow-wrap: break-word;">[9/29] '1OUT
											남았는데...' 완봉 직전 교체되는 뷰캐넌</div>
								</a></li>

								<li class="vod_item"><a href="#"
									class="link_vod"
									onclick="clickcr(this, 'rnk*m.list', '992063', '8', event); "
									title="아.. 감독님....이강인...은 써야죠.... 【옐카3】 196회ㅣKBS 방송">

										<div class="image_area">
											<span class="rank number8"><span class="blind">8위</span></span>
											<span class="common_video_length"><span class="blind">재생시간</span>31:25</span>
											<div class="image">
												<img
													src="https://phinf.pstatic.net/tvcast/20220930_15/ImoUq_1664516279995ikRIM_JPEG/zSRQTcbxEC2R.jpg&amp;type=nf194_112&amp;service=sports"
													width="194" height="112" alt="" class="imageLazyLoad"
													lazy-src="https://phinf.pstatic.net/tvcast/20220930_15/ImoUq_1664516279995ikRIM_JPEG/zSRQTcbxEC2R.jpg&amp;type=nf194_112&amp;service=sports"
													onerror="imageOnError(this);">
											</div>
										</div>
										<div class="text_area _sports_home_most_viewed_vod_title"
											style="overflow-wrap: break-word;">아.. 감독님....이강인...은
											써야죠.... 【옐카3】 196회ㅣKBS 방송</div>
								</a></li>

								<li class="vod_item"><a href="#"
									class="link_vod"
									onclick="clickcr(this, 'rnk*m.list', '991905', '9', event); "
									title="[전체HL] '고종욱 결승타+불펜 역투' KIA, 롯데에 5-4 승리">

										<div class="image_area">
											<span class="rank number9"><span class="blind">9위</span></span>
											<span class="common_video_length"><span class="blind">재생시간</span>10:47</span>
											<div class="image">
												<img
													src="https://sports-phinf.pstatic.net/20220929_283/1664457094222A37mQ_JPEG/%C0%FC%C3%BCHL_-_%27%B0%ED%C1%BE%BF%ED_%B0%E1%BD%C2%C5%B8%2B%BA%D2%C6%E6_%BF%AA%C5%F5%27_KIA%2C_%B7%D4%B5%A5%BF%A1_5-4_%BD%C2%B8%AE.jpg&amp;type=nf194_112&amp;service=sports"
													width="194" height="112" alt="" class="imageLazyLoad"
													lazy-src="https://sports-phinf.pstatic.net/20220929_283/1664457094222A37mQ_JPEG/%C0%FC%C3%BCHL_-_%27%B0%ED%C1%BE%BF%ED_%B0%E1%BD%C2%C5%B8%2B%BA%D2%C6%E6_%BF%AA%C5%F5%27_KIA%2C_%B7%D4%B5%A5%BF%A1_5-4_%BD%C2%B8%AE.jpg&amp;type=nf194_112&amp;service=sports"
													onerror="imageOnError(this);">
											</div>
										</div>
										<div class="text_area _sports_home_most_viewed_vod_title"
											style="overflow-wrap: break-word;">[전체HL] '고종욱 결승타+불펜
											역투' KIA, 롯데에 5-4 승리</div>
								</a></li>

								<li class="vod_item"><a href="#"
									class="link_vod"
									onclick="clickcr(this, 'rnk*m.list', '992059', '10', event); "
									title="2022 K리그 9월 이달의 골 / TOP 10 Goals of September 2022">

										<div class="image_area">
											<span class="rank number10"><span class="blind">10위</span></span>
											<span class="common_video_length"><span class="blind">재생시간</span>02:53</span>
											<div class="image">
												<img
													src="https://phinf.pstatic.net/tvcast/20220930_249/Lb1kc_1664512766999UHcjm_PNG/1664512732203.png&amp;type=nf194_112&amp;service=sports"
													width="194" height="112" alt="" class="imageLazyLoad"
													lazy-src="https://phinf.pstatic.net/tvcast/20220930_249/Lb1kc_1664512766999UHcjm_PNG/1664512732203.png&amp;type=nf194_112&amp;service=sports"
													onerror="imageOnError(this);">
											</div>
										</div>
										<div class="text_area _sports_home_most_viewed_vod_title"
											style="overflow-wrap: break-word;">2022 K리그 9월 이달의 골 /
											TOP 10 Goals of September 2022</div>
								</a></li>

								<li class="vod_item" style="display: none;"><a
									href="#" class="link_vod"
									onclick="clickcr(this, 'rnk*m.list', '991923', '11', event); "
									title="[전체HL] '이정후+송성문 11타점 합작' 키움, SSG에 14-9 역전승">

										<div class="image_area">
											<span class="rank number11"><span class="blind">11위</span></span>
											<span class="common_video_length"><span class="blind">재생시간</span>13:29</span>
											<div class="image">
												<img
													src="https://sports-phinf.pstatic.net/20220929_162/16644612987158BQE3_JPEG/%C0%FC%C3%BCHL_-_%27%C0%CC%C1%A4%C8%C4%2B%BC%DB%BC%BA%B9%AE_11%C5%B8%C1%A1_%C7%D5%C0%DB%27_%C5%B0%BF%F2%2C_SSG%BF%A1_14-9_%BF%AA%C0%FC%BD%C2.jpg&amp;type=nf194_112&amp;service=sports"
													width="194" height="112" alt="" class="imageLazyLoad"
													lazy-src="https://sports-phinf.pstatic.net/20220929_162/16644612987158BQE3_JPEG/%C0%FC%C3%BCHL_-_%27%C0%CC%C1%A4%C8%C4%2B%BC%DB%BC%BA%B9%AE_11%C5%B8%C1%A1_%C7%D5%C0%DB%27_%C5%B0%BF%F2%2C_SSG%BF%A1_14-9_%BF%AA%C0%FC%BD%C2.jpg&amp;type=nf194_112&amp;service=sports"
													onerror="imageOnError(this);">
											</div>
										</div>
										<div class="text_area _sports_home_most_viewed_vod_title"
											style="overflow-wrap: break-word;">[전체HL] '이정후+송성문 11타점
											합작' 키움, SSG에 14-9 역전승</div>
								</a></li>

								<li class="vod_item" style="display: none;"><a
									href="#" class="link_vod"
									onclick="clickcr(this, 'rnk*m.list', '992262', '12', event); "
									title="피렐라, 라이온즈 파크에 수놓은 솔로 홈런">

										<div class="image_area">
											<span class="rank number12"><span class="blind">12위</span></span>
											<span class="common_video_length"><span class="blind">재생시간</span>01:58</span>
											<div class="image">
												<img
													src="https://sports-phinf.pstatic.net/20220930_247/16645340760497Ei4U_JPEG/7_%B5%CE%BB%EA_vs_%BB%EF%BC%BA2%C8%B8%B8%BB_%C7%C7%B7%BC%B6%F3%2C_%B6%F3%C0%CC%BF%C2%C1%EE_%C6%C4%C5%A9%BF%A1_%BC%F6%B3%F5%C0%BA_%BC%D6%B7%CE_%C8%A8%B7%B1.jpg&amp;type=nf194_112&amp;service=sports"
													width="194" height="112" alt="" class="imageLazyLoad"
													lazy-src="https://sports-phinf.pstatic.net/20220930_247/16645340760497Ei4U_JPEG/7_%B5%CE%BB%EA_vs_%BB%EF%BC%BA2%C8%B8%B8%BB_%C7%C7%B7%BC%B6%F3%2C_%B6%F3%C0%CC%BF%C2%C1%EE_%C6%C4%C5%A9%BF%A1_%BC%F6%B3%F5%C0%BA_%BC%D6%B7%CE_%C8%A8%B7%B1.jpg&amp;type=nf194_112&amp;service=sports"
													onerror="imageOnError(this);">
											</div>
										</div>
										<div class="text_area _sports_home_most_viewed_vod_title"
											style="overflow-wrap: break-word;">피렐라, 라이온즈 파크에 수놓은 솔로
											홈런</div>
								</a></li>

								<li class="vod_item" style="display: none;"><a
									href="#" class="link_vod"
									onclick="clickcr(this, 'rnk*m.list', '992297', '13', event); "
									title="홍창기, 역전을 만들어내는 행운의 내야 안타">

										<div class="image_area">
											<span class="rank number13"><span class="blind">13위</span></span>
											<span class="common_video_length"><span class="blind">재생시간</span>01:21</span>
											<div class="image">
												<img
													src="https://sports-phinf.pstatic.net/20220930_158/1664537806089P9NB9_JPEG/11_NC_vs_LG6%C8%B8%B8%BB_%C8%AB%C3%A2%B1%E2%2C_%BF%AA%C0%FC%C0%BB_%B8%B8%B5%E9%BE%EE%B3%BB%B4%C2_%C7%E0%BF%EE%C0%C7_%B3%BB%BE%DF_%BE%C8%C5%B8.jpg&amp;type=nf194_112&amp;service=sports"
													width="194" height="112" alt="" class="imageLazyLoad"
													lazy-src="https://sports-phinf.pstatic.net/20220930_158/1664537806089P9NB9_JPEG/11_NC_vs_LG6%C8%B8%B8%BB_%C8%AB%C3%A2%B1%E2%2C_%BF%AA%C0%FC%C0%BB_%B8%B8%B5%E9%BE%EE%B3%BB%B4%C2_%C7%E0%BF%EE%C0%C7_%B3%BB%BE%DF_%BE%C8%C5%B8.jpg&amp;type=nf194_112&amp;service=sports"
													onerror="imageOnError(this);">
											</div>
										</div>
										<div class="text_area _sports_home_most_viewed_vod_title"
											style="overflow-wrap: break-word;">홍창기, 역전을 만들어내는 행운의
											내야 안타</div>
								</a></li>

								<li class="vod_item" style="display: none;"><a
									href="#" class="link_vod"
									onclick="clickcr(this, 'rnk*m.list', '991929', '14', event); "
									title="'양보 못할 타격왕 2연패' 이정후의 불방망이쇼 [7AM]">

										<div class="image_area">
											<span class="rank number14"><span class="blind">14위</span></span>
											<span class="common_video_length"><span class="blind">재생시간</span>02:38</span>
											<div class="image">
												<img
													src="https://sports-phinf.pstatic.net/20220930_89/1664478154034vO3Iz_JPEG/%27%BE%E7%BA%B8_%B8%F8%C7%D2_%C5%B8%B0%DD%BF%D5_2%BF%AC%C6%D0%27_%C0%CC%C1%A4%C8%C4%C0%C7_%BA%D2%B9%E6%B8%C1%C0%CC%BC%EE_7AM.jpg&amp;type=nf194_112&amp;service=sports"
													width="194" height="112" alt="" class="imageLazyLoad"
													lazy-src="https://sports-phinf.pstatic.net/20220930_89/1664478154034vO3Iz_JPEG/%27%BE%E7%BA%B8_%B8%F8%C7%D2_%C5%B8%B0%DD%BF%D5_2%BF%AC%C6%D0%27_%C0%CC%C1%A4%C8%C4%C0%C7_%BA%D2%B9%E6%B8%C1%C0%CC%BC%EE_7AM.jpg&amp;type=nf194_112&amp;service=sports"
													onerror="imageOnError(this);">
											</div>
										</div>
										<div class="text_area _sports_home_most_viewed_vod_title"
											style="overflow-wrap: break-word;">'양보 못할 타격왕 2연패' 이정후의
											불방망이쇼 [7AM]</div>
								</a></li>

								<li class="vod_item" style="display: none;"><a
									href="#" class="link_vod"
									onclick="clickcr(this, 'rnk*m.list', '991832', '15', event); "
									title="이정후, 김광현 상대로 만들어낸 동점 스리런포">

										<div class="image_area">
											<span class="rank number15"><span class="blind">15위</span></span>
											<span class="common_video_length"><span class="blind">재생시간</span>03:20</span>
											<div class="image">
												<img
													src="https://sports-phinf.pstatic.net/20220929_265/1664447971763IePGn_JPEG/7_%C5%B0%BF%F2_vs_SSG3%C8%B8%C3%CA_%C0%CC%C1%A4%C8%C4%2C_%B1%E8%B1%A4%C7%F6_%BB%F3%B4%EB%B7%CE_%B8%B8%B5%E9%BE%EE%B3%BD_%B5%BF%C1%A1_%BD%BA%B8%AE%B7%B1%C6%F7.jpg&amp;type=nf194_112&amp;service=sports"
													width="194" height="112" alt="" class="imageLazyLoad"
													lazy-src="https://sports-phinf.pstatic.net/20220929_265/1664447971763IePGn_JPEG/7_%C5%B0%BF%F2_vs_SSG3%C8%B8%C3%CA_%C0%CC%C1%A4%C8%C4%2C_%B1%E8%B1%A4%C7%F6_%BB%F3%B4%EB%B7%CE_%B8%B8%B5%E9%BE%EE%B3%BD_%B5%BF%C1%A1_%BD%BA%B8%AE%B7%B1%C6%F7.jpg&amp;type=nf194_112&amp;service=sports"
													onerror="imageOnError(this);">
											</div>
										</div>
										<div class="text_area _sports_home_most_viewed_vod_title"
											style="overflow-wrap: break-word;">이정후, 김광현 상대로 만들어낸 동점
											스리런포</div>
								</a></li>

								<li class="vod_item" style="display: none;"><a
									href="#" class="link_vod"
									onclick="clickcr(this, 'rnk*m.list', '992078', '16', event); "
									title="[하이라이트] 2018년 이날 니스전에 있었던 네이마르 선수의 브레이스!!">

										<div class="image_area">
											<span class="rank number16"><span class="blind">16위</span></span>
											<span class="common_video_length"><span class="blind">재생시간</span>00:44</span>
											<div class="image">
												<img
													src="https://phinf.pstatic.net/tvcast/20220930_108/tdyjx_1664517689170RUhpN_PNG/1664517687241.png&amp;type=nf194_112&amp;service=sports"
													width="194" height="112" alt="" class="imageLazyLoad"
													lazy-src="https://phinf.pstatic.net/tvcast/20220930_108/tdyjx_1664517689170RUhpN_PNG/1664517687241.png&amp;type=nf194_112&amp;service=sports"
													onerror="imageOnError(this);">
											</div>
										</div>
										<div class="text_area _sports_home_most_viewed_vod_title"
											style="overflow-wrap: break-word;">[하이라이트] 2018년 이날
											니스전에 있었던 네이마르 선수의 브레이스!!</div>
								</a></li>

								<li class="vod_item" style="display: none;"><a
									href="#" class="link_vod"
									onclick="clickcr(this, 'rnk*m.list', '991991', '17', event); "
									title="전북현대 떠나 포르투갈 1부로...K리그 크랙이었던 '왜인 루니' 쿠니모토 근황">

										<div class="image_area">
											<span class="rank number17"><span class="blind">17위</span></span>
											<span class="common_video_length"><span class="blind">재생시간</span>05:07</span>
											<div class="image">
												<img
													src="https://phinf.pstatic.net/tvcast/20220930_237/RkM0U_1664466350567IYGLW_JPEG/1664466145356.jpg&amp;type=nf194_112&amp;service=sports"
													width="194" height="112" alt="" class="imageLazyLoad"
													lazy-src="https://phinf.pstatic.net/tvcast/20220930_237/RkM0U_1664466350567IYGLW_JPEG/1664466145356.jpg&amp;type=nf194_112&amp;service=sports"
													onerror="imageOnError(this);">
											</div>
										</div>
										<div class="text_area _sports_home_most_viewed_vod_title"
											style="overflow-wrap: break-word;">전북현대 떠나 포르투갈
											1부로...K리그 크랙이었던 '왜인 루니' 쿠니모토 근황</div>
								</a></li>

								<li class="vod_item" style="display: none;"><a
									href="#" class="link_vod"
									onclick="clickcr(this, 'rnk*m.list', '992283', '18', event); "
									title="약간 신경이 날카로워진 홍창기">

										<div class="image_area">
											<span class="rank number18"><span class="blind">18위</span></span>
											<span class="common_video_length"><span class="blind">재생시간</span>02:02</span>
											<div class="image">
												<img
													src="https://sports-phinf.pstatic.net/20220930_102/16645362865508NS5l_JPEG/8_NC_vs_LG5%C8%B8%B8%BB_%BE%E0%B0%A3_%BD%C5%B0%E6%C0%CC_%B3%AF%C4%AB%B7%CE%BF%F6%C1%F8_%C8%AB%C3%A2%B1%E2.jpg&amp;type=nf194_112&amp;service=sports"
													width="194" height="112" alt="" class="imageLazyLoad"
													lazy-src="https://sports-phinf.pstatic.net/20220930_102/16645362865508NS5l_JPEG/8_NC_vs_LG5%C8%B8%B8%BB_%BE%E0%B0%A3_%BD%C5%B0%E6%C0%CC_%B3%AF%C4%AB%B7%CE%BF%F6%C1%F8_%C8%AB%C3%A2%B1%E2.jpg&amp;type=nf194_112&amp;service=sports"
													onerror="imageOnError(this);">
											</div>
										</div>
										<div class="text_area _sports_home_most_viewed_vod_title"
											style="overflow-wrap: break-word;">약간 신경이 날카로워진 홍창기</div>
								</a></li>

								<li class="vod_item" style="display: none;"><a
									href="#" class="link_vod"
									onclick="clickcr(this, 'rnk*m.list', '992104', '19', event); "
									title="'이제 안녕~' 홍란의 은퇴 무대를 축하해주는 동료들 [하나금융그룹 2R]">

										<div class="image_area">
											<span class="rank number19"><span class="blind">19위</span></span>
											<span class="common_video_length"><span class="blind">재생시간</span>05:01</span>
											<div class="image">
												<img
													src="https://sports-phinf.pstatic.net/20220930_278/16645218806023CbxT_JPEG/bandicam_2022-09-30_16-11-08-296.jpg&amp;type=nf194_112&amp;service=sports"
													width="194" height="112" alt="" class="imageLazyLoad"
													lazy-src="https://sports-phinf.pstatic.net/20220930_278/16645218806023CbxT_JPEG/bandicam_2022-09-30_16-11-08-296.jpg&amp;type=nf194_112&amp;service=sports"
													onerror="imageOnError(this);">
											</div>
										</div>
										<div class="text_area _sports_home_most_viewed_vod_title"
											style="overflow-wrap: break-word;">'이제 안녕~' 홍란의 은퇴 무대를
											축하해주는 동료들 [하나금융그룹 2R]</div>
								</a></li>

								<li class="vod_item" style="display: none;"><a
									href="#" class="link_vod"
									onclick="clickcr(this, 'rnk*m.list', '992273', '20', event); "
									title="스트라이크 판정에 불만을 표출하는 홍창기">

										<div class="image_area">
											<span class="rank number20"><span class="blind">20위</span></span>
											<span class="common_video_length"><span class="blind">재생시간</span>01:14</span>
											<div class="image">
												<img
													src="https://sports-phinf.pstatic.net/20220930_124/1664534600062fIoRR_JPEG/7_NC_vs_LG3%C8%B8%B8%BB_%BD%BA%C6%AE%B6%F3%C0%CC%C5%A9_%C6%C7%C1%A4%BF%A1_%BA%D2%B8%B8%C0%BB_%C7%A5%C3%E2%C7%CF%B4%C2_%C8%AB%C3%A2%B1%E2.jpg&amp;type=nf194_112&amp;service=sports"
													width="194" height="112" alt="" class="imageLazyLoad"
													lazy-src="https://sports-phinf.pstatic.net/20220930_124/1664534600062fIoRR_JPEG/7_NC_vs_LG3%C8%B8%B8%BB_%BD%BA%C6%AE%B6%F3%C0%CC%C5%A9_%C6%C7%C1%A4%BF%A1_%BA%D2%B8%B8%C0%BB_%C7%A5%C3%E2%C7%CF%B4%C2_%C8%AB%C3%A2%B1%E2.jpg&amp;type=nf194_112&amp;service=sports"
													onerror="imageOnError(this);">
											</div>
										</div>
										<div class="text_area _sports_home_most_viewed_vod_title"
											style="overflow-wrap: break-word;">스트라이크 판정에 불만을 표출하는
											홍창기</div>
								</a></li>

							</ul>
							<!-- [D] 20위까지 펼쳤을 경우 버튼 미노출 적용 -->
							<div class="vod_button_area">
								<button type="button" class="button_more">11~20위 영상 더보기</button>
							</div>
						</div>

						<script>
							$("._sports_home_most_viewed_vod_title").dotdotdot(
									{
										'height' : 36
									});

							$(".vod_button_area")
									.on(
											"click",
											"button",
											function(e) {
												$(".vod_item").show();
												$(
														"._sports_home_most_viewed_vod_title")
														.dotdotdot({
															'height' : 36
														});
												$(e.currentTarget).hide();
												clickcr(this, 'rnk*m.more', '',
														'', e);
											});
						</script>

						<div id="_sports_home_airs_area" class="news_section">
							<h3 class="section_title">추천뉴스</h3>
							<ul class="news_list">
								<c:choose>
			                  		<c:when test="${fn:length(aList) eq 0}">
			              				<div class="text-center">There is no data!</div>
			                  		</c:when>
			                   		<c:otherwise>
			                       		<c:forEach items="${aList}" var="aList" varStatus="status">
											<li class="news_item type_top">
												<a href="articleView?aSeq=${aList.aSeq }" class="link_news_item">
													<div class="image_area">
														<div class="image">
															<img src="<c:out value="${aList.path }"/><c:out value="${aList.uuidName }"/>" width="160" height="95" border="6" alt="">
														</div>
													</div>
													<div class="text_area">
														<strong class="title">
															${aList.title }
														</strong> 
														<span class="press">${aList.newspaper }</span>
													</div>
												</a>
											</li>
										</c:forEach>
			                   		</c:otherwise>
			                   	</c:choose>
			                   	<c:choose>
			                  		<c:when test="${fn:length(aList) eq 0}">
			              				<div class="text-center">There is no data!</div>
			                  		</c:when>
			                   		<c:otherwise>
			                       		<c:forEach items="${aList}" var="aList" varStatus="status">
											<li class="news_item">
												<a href="articleView?aSeq=${aList.aSeq }" class="link_news_item">
													<div class="image_area">
														<div class="image">
															<img src="<c:out value="${aList.path }"/><c:out value="${aList.uuidName }"/>" width="160" height="95" border="6" alt="">
														</div>
													</div>
													<div class="text_area">
														<strong class="title">
															${aList.title }
														</strong> 
														<span class="press">${aList.newspaper }</span>
													</div>
												</a>
											</li>
										</c:forEach>
			                   		</c:otherwise>
			                   	</c:choose>
							</ul>
						</div>

						<div class="shopping_section">
							<h3 class="section_title">
								<a href="https://shopping.naver.com/" class="link_title">spopia
									쇼핑<span class="blind">더보기</span>
								</a>
							</h3>
							<ul class="shopping_list">
								<li class="shopping_item"><a
									href="https://shopping.naver.com/plan/details/611276?first=5103975258"
									onclick="clickcr(this, 'plw.goods', '', '', event);"
									class="link_shopping">
										<div class="image_area">
											<div class="image">
												<img
													src="https://shop-phinf.pstatic.net/20220929_216/1664420429510FvI9x_JPEG/1.jpg"
													class="imageLazyLoad"
													lazy-src="https://shop-phinf.pstatic.net/20220929_216/1664420429510FvI9x_JPEG/1.jpg"
													alt="무료반품&amp;교환 혜택<br>손목 발목 중량밴드" width="150" height="190"
													onerror="imageOnError(this);">
											</div>
										</div>
										<div class="text_area">
											<div class="price">
												<b class="num">18,900</b>원
											</div>
											<div class="title">
												무료반품&amp;교환 혜택<br>손목 발목 중량밴드
											</div>
										</div>
								</a></li>

								<li class="shopping_item"><a
									href="https://shopping.naver.com/plan/details/611274?first=6771526619"
									onclick="clickcr(this, 'plw.goods', '', '', event);"
									class="link_shopping">
										<div class="image_area">
											<div class="image">
												<img
													src="https://shop-phinf.pstatic.net/20220927_168/1664238412362Dp5gC_JPEG/2.jpg"
													class="imageLazyLoad"
													lazy-src="https://shop-phinf.pstatic.net/20220927_168/1664238412362Dp5gC_JPEG/2.jpg"
													alt="내일 도착 보장제<br>루맥스 충전식 랜턴" width="150" height="190"
													onerror="imageOnError(this);">
											</div>
										</div>
										<div class="text_area">
											<div class="price">
												<b class="num">79,000</b>원
											</div>
											<div class="title">
												내일 도착 보장제<br>루맥스 충전식 랜턴
											</div>
										</div>
								</a></li>

								<li class="shopping_item"><a
									href="https://shopping.naver.com/window-p/play/category?menu=20004267&amp;first=7264424979&amp;sort=POPULARITY"
									onclick="clickcr(this, 'plw.goods', '', '', event);"
									class="link_shopping">
										<div class="image_area">
											<div class="image">
												<img
													src="https://shop-phinf.pstatic.net/20220927_33/1664238429727aFUcu_JPEG/3.jpg"
													class="imageLazyLoad"
													lazy-src="https://shop-phinf.pstatic.net/20220927_33/1664238429727aFUcu_JPEG/3.jpg"
													alt="놀라운 스윙을 위한<br>미즈노 2피스 골프공" width="150" height="190"
													onerror="imageOnError(this);">
											</div>
										</div>
										<div class="text_area">
											<div class="price">
												<b class="num">44,000</b>원
											</div>
											<div class="title">
												놀라운 스윙을 위한<br>미즈노 2피스 골프공
											</div>
										</div>
								</a></li>

								<li class="shopping_item"><a
									href="https://shopping.naver.com/play/fishing/category/10002335?first=6576850283&amp;menu=10002327&amp;sort=RECENT&amp;water=SEA"
									onclick="clickcr(this, 'plw.goods', '', '', event);"
									class="link_shopping">
										<div class="image_area">
											<div class="image">
												<img
													src="https://shop-phinf.pstatic.net/20220927_146/1664238466767Fq3jw_JPEG/4.jpg"
													class="imageLazyLoad"
													lazy-src="https://shop-phinf.pstatic.net/20220927_146/1664238466767Fq3jw_JPEG/4.jpg"
													alt="강한 허리힘 오슬로<br>골드비 GA-BH 가비" width="150" height="190"
													onerror="imageOnError(this);">
											</div>
										</div>
										<div class="text_area">
											<div class="price">
												<b class="num">250,000</b>원
											</div>
											<div class="title">
												강한 허리힘 오슬로<br>골드비 GA-BH 가비
											</div>
										</div>
								</a></li>

								<li class="shopping_item"><a
									href="https://shopping.naver.com/window-p/play/category?menu=20004318&amp;first=7229542389&amp;sort=POPULARITY"
									onclick="clickcr(this, 'plw.goods', '', '', event);"
									class="link_shopping">
										<div class="image_area">
											<div class="image">
												<img
													src="https://shop-phinf.pstatic.net/20220927_22/1664238514007ADN3S_JPEG/55.jpg"
													class="imageLazyLoad"
													lazy-src="https://shop-phinf.pstatic.net/20220927_22/1664238514007ADN3S_JPEG/55.jpg"
													alt="스마트터치 자전거용<br>패딩 기모 방수장갑" width="150" height="190"
													onerror="imageOnError(this);">
											</div>
										</div>
										<div class="text_area">
											<div class="price">
												<b class="num">16,900</b>원
											</div>
											<div class="title">
												스마트터치 자전거용<br>패딩 기모 방수장갑
											</div>
										</div>
								</a></li>

								<li class="shopping_item"><a
									href="https://shopping.naver.com/window-p/play/category?menu=20004309&amp;first=7198151991&amp;sort=POPULARITY"
									onclick="clickcr(this, 'plw.goods', '', '', event);"
									class="link_shopping">
										<div class="image_area">
											<div class="image">
												<img
													src="https://shop-phinf.pstatic.net/20220927_206/1664238534954wQ5bO_JPEG/5.jpg"
													class="imageLazyLoad"
													lazy-src="https://shop-phinf.pstatic.net/20220927_206/1664238534954wQ5bO_JPEG/5.jpg"
													alt="가정용 허리 운동기구<br>이고진 전동거꾸리" width="150" height="190"
													onerror="imageOnError(this);">
											</div>
										</div>
										<div class="text_area">
											<div class="price">
												<b class="num">604,000</b>원
											</div>
											<div class="title">
												가정용 허리 운동기구<br>이고진 전동거꾸리
											</div>
										</div>
								</a></li>
							</ul>
						</div>
					</div>
				</div>
				<script id="_sports_da_template" type="text/x-handlebars-template">
						<iframe {{#if iframeId}}
									id="{{iframeId}}"
									name="{{iframeId}}"
								{{else}}
									id="{{previewId}}{{#if calpId}}_{{calpId}}{{/if}}"
									name="{{previewId}}{{#if calpId}}_{{calpId}}{{/if}}"
								{{/if}}
								data-veta-preview="{{previewId}}"
								src="https://veta.naver.com/fxshow?su={{unitId}}{{#if calpId}}&calp={{calpId}}{{/if}}"
								width="{{width}}"
								height="{{height}}"
								title="광고"
								alt="광고 영역 입니다."
								allowTransparency="true"
								marginheight="0"
								marginwidth="0"
								frameborder="0"
								scrolling="no"
								align="center"
								{{#if ext}}{{ext}}{{/if}}>
						</iframe>
					</script>

				<script id="_sports_2020_da_template"
					type="text/x-handlebars-template">
						{{#with adUnit}}
						<iframe {{#if iframeId}}
								id="{{iframeId}}"
								name="{{iframeId}}"
								{{else}}
								id="{{previewId}}{{#if calpId}}_{{calpId}}{{/if}}"
								name="{{previewId}}{{#if calpId}}_{{calpId}}{{/if}}"
								{{/if}}
								data-veta-preview="{{previewId}}"
								src="{{../daUrl}}su={{unitId}}{{#if calpId}}&calp={{calpId}}{{/if}}"
								width="{{width}}"
								height="{{height}}"
								title="광고"
								alt="광고 영역 입니다."
								allowTransparency="true"
								marginheight="0"
								marginwidth="0"
								frameborder="0"
								scrolling="no"
								align="center"
								{{#if ext}}{{ext}}{{/if}}>
						</iframe>
						{{/with}}
					</script>
				<script>
					//TODO section pc2018 인건 평창끝나면 지워주세요
					//NOTE : 뉴스 엔드 하단 광고 경우엔 NewsEndAdUnit.java 에서 데이터 내려주고 있음.

					var adList = [ {
						"sid" : "sports_home_right_banner",
						"name" : "스포츠_우측배너(스포츠홈)",
						"section" : "",
						"type" : "pc",
						"oldUnitId" : "1002B",
						"unitId" : "SU10351",
						"previewId" : "p_sports_right",
						"width" : "300",
						"height" : "250",
						"menu" : "",
						"calpId" : "home",
						"useCase" : "iframe"
					}, {
						"sid" : "section_home_double_play",
						"name" : "P_스포츠_더블플레이(스포츠홈, 종목홈)",
						"section" : "kbaseball",
						"type" : "pc",
						"oldUnitId" : "986B",
						"unitId" : "SU10514",
						"previewId" : "p_sports_dpl",
						"width" : "600",
						"height" : "70",
						"menu" : "",
						"calpId" : "kbaseball",
						"useCase" : "js"
					}, {
						"sid" : "section_home_double_play",
						"name" : "P_스포츠_더블플레이(스포츠홈, 종목홈)",
						"section" : "wbaseball",
						"type" : "pc",
						"oldUnitId" : "988C",
						"unitId" : "SU10514",
						"previewId" : "p_sports_dpl",
						"width" : "600",
						"height" : "70",
						"menu" : "",
						"calpId" : "wbaseball",
						"useCase" : "js"
					}, {
						"sid" : "section_home_double_play",
						"name" : "P_스포츠_더블플레이(스포츠홈, 종목홈)",
						"section" : "kfootball",
						"type" : "pc",
						"oldUnitId" : "989B",
						"unitId" : "SU10514",
						"previewId" : "p_sports_dpl",
						"width" : "600",
						"height" : "70",
						"menu" : "",
						"calpId" : "kfootball",
						"useCase" : "js"
					}, {
						"sid" : "section_home_double_play",
						"name" : "P_스포츠_더블플레이(스포츠홈, 종목홈)",
						"section" : "wfootball",
						"type" : "pc",
						"oldUnitId" : "928C",
						"unitId" : "SU10514",
						"previewId" : "p_sports_dpl",
						"width" : "600",
						"height" : "70",
						"menu" : "",
						"calpId" : "wfootball",
						"useCase" : "js"
					}, {
						"sid" : "section_home_double_play",
						"name" : "P_스포츠_더블플레이(스포츠홈, 종목홈)",
						"section" : "basketball",
						"type" : "pc",
						"oldUnitId" : "990B",
						"unitId" : "SU10514",
						"previewId" : "p_sports_dpl",
						"width" : "600",
						"height" : "70",
						"menu" : "",
						"calpId" : "basketball",
						"useCase" : "js"
					}, {
						"sid" : "section_home_double_play",
						"name" : "P_스포츠_더블플레이(스포츠홈, 종목홈)",
						"section" : "volleyball",
						"type" : "pc",
						"oldUnitId" : "1279A",
						"unitId" : "SU10514",
						"previewId" : "p_sports_dpl",
						"width" : "600",
						"height" : "70",
						"menu" : "",
						"calpId" : "volleyball",
						"useCase" : "js"
					}, {
						"sid" : "section_home_double_play",
						"name" : "P_스포츠_더블플레이(스포츠홈, 종목홈)",
						"section" : "golf",
						"type" : "pc",
						"oldUnitId" : "992G",
						"unitId" : "SU10514",
						"previewId" : "p_sports_dpl",
						"width" : "600",
						"height" : "70",
						"menu" : "",
						"calpId" : "golf",
						"useCase" : "js"
					}, {
						"sid" : "section_home_double_play",
						"name" : "P_스포츠_더블플레이(스포츠홈, 종목홈)",
						"section" : "general",
						"type" : "pc",
						"oldUnitId" : "994C",
						"unitId" : "SU10514",
						"previewId" : "p_sports_dpl",
						"width" : "600",
						"height" : "70",
						"menu" : "",
						"calpId" : "general",
						"useCase" : "js"
					}, {
						"sid" : "section_home_double_play",
						"name" : "P_스포츠_더블플레이(스포츠홈, 종목홈)",
						"section" : "esports",
						"type" : "pc",
						"oldUnitId" : "1046C",
						"unitId" : "SU10514",
						"previewId" : "p_sports_dpl",
						"width" : "600",
						"height" : "70",
						"menu" : "",
						"calpId" : "esports",
						"useCase" : "js"
					}, {
						"sid" : "section_home_double_play",
						"name" : "P_스포츠_더블플레이(스포츠홈, 종목홈)",
						"section" : "pc2018",
						"type" : "pc",
						"oldUnitId" : "",
						"unitId" : "SU10282",
						"previewId" : "p_sports_dpl",
						"width" : "600",
						"height" : "70",
						"menu" : "",
						"calpId" : "",
						"useCase" : "js"
					},

					{
						"sid" : "section_end_right_banner",
						"name" : "P_스포츠_우측배너(영상외 주요지면)",
						"section" : "",
						"type" : "pc",
						"oldUnitId" : "159M",
						"unitId" : "SU10351",
						"previewId" : "p_sports_right",
						"width" : "300",
						"height" : "250",
						"menu" : "",
						"calpId" : "",
						"useCase" : "iframe"
					}, {
						"sid" : "section_end_right_banner",
						"name" : "P_스포츠_우측배너(영상외 주요지면)",
						"section" : "all",
						"type" : "pc",
						"oldUnitId" : "159M",
						"unitId" : "SU10351",
						"previewId" : "p_sports_right",
						"width" : "300",
						"height" : "250",
						"menu" : "",
						"calpId" : "",
						"useCase" : "iframe"
					}, {
						"sid" : "section_end_right_banner",
						"name" : "P_스포츠_우측배너(영상외 주요지면)",
						"section" : "kbaseball",
						"type" : "pc",
						"oldUnitId" : "159M",
						"unitId" : "SU10351",
						"previewId" : "p_sports_right",
						"width" : "300",
						"height" : "250",
						"menu" : "",
						"calpId" : "kbaseball",
						"useCase" : "iframe"
					}, {
						"sid" : "section_end_right_banner",
						"name" : "P_스포츠_우측배너(영상외 주요지면)",
						"section" : "wbaseball",
						"type" : "pc",
						"oldUnitId" : "159M",
						"unitId" : "SU10351",
						"previewId" : "p_sports_right",
						"width" : "300",
						"height" : "250",
						"menu" : "",
						"calpId" : "wbaseball",
						"useCase" : "iframe"
					}, {
						"sid" : "section_end_right_banner",
						"name" : "P_스포츠_우측배너(영상외 주요지면)",
						"section" : "kfootball",
						"type" : "pc",
						"oldUnitId" : "159M",
						"unitId" : "SU10351",
						"previewId" : "p_sports_right",
						"width" : "300",
						"height" : "250",
						"menu" : "",
						"calpId" : "kfootball",
						"useCase" : "iframe"
					}, {
						"sid" : "section_end_right_banner",
						"name" : "P_스포츠_우측배너(영상외 주요지면)",
						"section" : "wfootball",
						"type" : "pc",
						"oldUnitId" : "159M",
						"unitId" : "SU10351",
						"previewId" : "p_sports_right",
						"width" : "300",
						"height" : "250",
						"menu" : "",
						"calpId" : "wfootball",
						"useCase" : "iframe"
					}, {
						"sid" : "section_end_right_banner",
						"name" : "P_스포츠_우측배너(영상외 주요지면)",
						"section" : "basketball",
						"type" : "pc",
						"oldUnitId" : "159M",
						"unitId" : "SU10351",
						"previewId" : "p_sports_right",
						"width" : "300",
						"height" : "250",
						"menu" : "",
						"calpId" : "basketball",
						"useCase" : "iframe"
					}, {
						"sid" : "section_end_right_banner",
						"name" : "P_스포츠_우측배너(영상외 주요지면)",
						"section" : "volleyball",
						"type" : "pc",
						"oldUnitId" : "159M",
						"unitId" : "SU10351",
						"previewId" : "p_sports_right",
						"width" : "300",
						"height" : "250",
						"menu" : "",
						"calpId" : "volleyball",
						"useCase" : "iframe"
					}, {
						"sid" : "section_end_right_banner",
						"name" : "P_스포츠_우측배너(영상외 주요지면)",
						"section" : "golf",
						"type" : "pc",
						"oldUnitId" : "1001C",
						"unitId" : "SU10351",
						"previewId" : "p_sports_right",
						"width" : "300",
						"height" : "250",
						"menu" : "",
						"calpId" : "golf",
						"useCase" : "iframe"
					}, {
						"sid" : "section_end_right_banner",
						"name" : "P_스포츠_우측배너(영상외 주요지면)",
						"section" : "general",
						"type" : "pc",
						"oldUnitId" : "159M",
						"unitId" : "SU10351",
						"previewId" : "p_sports_right",
						"width" : "300",
						"height" : "250",
						"menu" : "",
						"calpId" : "general",
						"useCase" : "iframe"
					}, {
						"sid" : "section_end_right_banner",
						"name" : "P_스포츠_우측배너(영상외 주요지면)",
						"section" : "esports",
						"type" : "pc",
						"oldUnitId" : "1047E",
						"unitId" : "SU10351",
						"previewId" : "p_sports_right",
						"width" : "300",
						"height" : "250",
						"menu" : "",
						"calpId" : "esports",
						"useCase" : "iframe"
					}, {
						"sid" : "section_end_right_banner",
						"name" : "P_스포츠_우측배너(영상외 주요지면)",
						"section" : "tokyo2020",
						"type" : "pc",
						"oldUnitId" : "",
						"unitId" : "SU10351",
						"previewId" : "p_sports_right",
						"width" : "300",
						"height" : "250",
						"menu" : "",
						"calpId" : "",
						"useCase" : "iframe"
					},

					// 영상 통합 광고
					{
						"sid" : "vod_right_banner",
						"name" : "P_스포츠_영상_통합스킨",
						"section" : "kbaseball",
						"type" : "pc",
						"oldUnitId" : "1253B",
						"unitId" : "SU10453",
						"previewId" : "p_sports_right",
						"width" : "300",
						"height" : "250",
						"menu" : "",
						"calpId" : "kbaseball",
						"useCase" : "js"
					}, {
						"sid" : "vod_right_banner",
						"name" : "P_스포츠_영상_통합스킨",
						"section" : "wbaseball",
						"type" : "pc",
						"oldUnitId" : "1051D",
						"unitId" : "SU10453",
						"previewId" : "p_sports_right",
						"width" : "300",
						"height" : "250",
						"menu" : "",
						"calpId" : "wbaseball",
						"useCase" : "js"
					}, {
						"sid" : "vod_right_banner",
						"name" : "P_스포츠_영상_통합스킨",
						"section" : "kfootball",
						"type" : "pc",
						"oldUnitId" : "1255C",
						"unitId" : "SU10453",
						"previewId" : "p_sports_right",
						"width" : "300",
						"height" : "250",
						"menu" : "",
						"calpId" : "kfootball",
						"useCase" : "js"
					}, {
						"sid" : "vod_right_banner",
						"name" : "P_스포츠_영상_통합스킨",
						"section" : "wfootball",
						"type" : "pc",
						"oldUnitId" : "1057D",
						"unitId" : "SU10453",
						"previewId" : "p_sports_right",
						"width" : "300",
						"height" : "250",
						"menu" : "",
						"calpId" : "wfootball",
						"useCase" : "js"
					}, {
						"sid" : "vod_right_banner",
						"name" : "P_스포츠_영상_통합스킨",
						"section" : "basketball",
						"type" : "pc",
						"oldUnitId" : "1251B",
						"unitId" : "SU10453",
						"previewId" : "p_sports_right",
						"width" : "300",
						"height" : "250",
						"menu" : "",
						"calpId" : "basketball",
						"useCase" : "js"
					}, {
						"sid" : "vod_right_banner",
						"name" : "P_스포츠_영상_통합스킨",
						"section" : "basketball",
						"category" : "nba",
						"type" : "pc",
						"unitId" : "SU10453",
						"previewId" : "p_sports_right",
						"width" : "300",
						"height" : "250",
						"menu" : "",
						"calpId" : "nba",
						"useCase" : "js"
					}, {
						"sid" : "vod_right_banner",
						"name" : "P_스포츠_영상_통합스킨",
						"section" : "volleyball",
						"type" : "pc",
						"oldUnitId" : "1251B",
						"unitId" : "SU10453",
						"previewId" : "p_sports_right",
						"width" : "300",
						"height" : "250",
						"menu" : "",
						"calpId" : "volleyball",
						"useCase" : "js"
					}, {
						"sid" : "vod_right_banner",
						"name" : "P_스포츠_영상_통합스킨",
						"section" : "golf",
						"type" : "pc",
						"oldUnitId" : "1021D",
						"unitId" : "SU10453",
						"previewId" : "p_sports_right",
						"width" : "300",
						"height" : "250",
						"menu" : "",
						"calpId" : "golf",
						"useCase" : "js"
					}, {
						"sid" : "vod_right_banner",
						"name" : "P_스포츠_영상_통합스킨",
						"section" : "general",
						"type" : "pc",
						"oldUnitId" : "1251B",
						"unitId" : "SU10453",
						"previewId" : "p_sports_right",
						"width" : "300",
						"height" : "250",
						"menu" : "",
						"calpId" : "general",
						"useCase" : "js"
					}, {
						"sid" : "vod_right_banner",
						"name" : "P_스포츠_영상_통합스킨",
						"section" : "esports",
						"type" : "pc",
						"oldUnitId" : "1102C",
						"unitId" : "SU10453",
						"previewId" : "p_sports_right",
						"width" : "300",
						"height" : "250",
						"menu" : "",
						"calpId" : "esports",
						"useCase" : "js"
					}, {
						"sid" : "vod_right_banner",
						"name" : "P_스포츠_영상_통합스킨",
						"section" : "tokyo2020",
						"type" : "pc",
						"oldUnitId" : "",
						"unitId" : "SU10453",
						"previewId" : "p_sports_right",
						"width" : "300",
						"height" : "250",
						"menu" : "",
						"calpId" : "",
						"useCase" : "js"
					},

					// TODO ioctv 관련 sports/sus#1867 채널 삭제시 광고 상수 역시 삭제 필요
					{
						"sid" : "vod_right_banner",
						"name" : "P_스포츠_영상_통합스킨",
						"section" : "general",
						"category" : "ioctv",
						"type" : "pc",
						"oldUnitId" : "1102C",
						"unitId" : "SU10453",
						"previewId" : "p_sports_right",
						"width" : "300",
						"height" : "250",
						"menu" : "",
						"calpId" : "ioctv",
						"useCase" : "js"
					},

					// 평창 영상 광고코드
					{
						"sid" : "veta_300250",
						"name" : "P_스포츠_영상_통합스킨",
						"section" : "pc2018",
						"type" : "pc",
						"oldUnitId" : "",
						"unitId" : "SU10284",
						"previewId" : "p_sports_right",
						"width" : "300",
						"height" : "250",
						"menu" : "",
						"calpId" : "",
						"useCase" : "js"
					}, {
						"sid" : "vod_topskin",
						"name" : "P_스포츠_영상_상단스킨",
						"section" : "pc2018",
						"type" : "pc",
						"oldUnitId" : "",
						"unitId" : "SU10284",
						"previewId" : "p_sports_topskin",
						"width" : "300",
						"height" : "75",
						"menu" : "",
						"calpId" : "",
						"useCase" : "iframe"
					},

					{
						"sid" : "gamecenter_right_banner",
						"name" : "P_스포츠_게임센터_경기결과_우측배너 ",
						"section" : "kbaseball",
						"type" : "pc",
						"oldUnitId" : "735A",
						"unitId" : "SU10124",
						"previewId" : "p_sports_game",
						"width" : "200",
						"height" : "573",
						"menu" : "",
						"calpId" : "kbaseball",
						"useCase" : "iframe"
					}, {
						"sid" : "gamecenter_right_banner",
						"name" : "P_스포츠_게임센터_경기결과_우측배너 ",
						"section" : "wbaseball",
						"type" : "pc",
						"oldUnitId" : "1053A",
						"unitId" : "SU10124",
						"previewId" : "p_sports_game",
						"width" : "200",
						"height" : "573",
						"menu" : "",
						"calpId" : "wbaseball",
						"useCase" : "iframe"
					}, {
						"sid" : "gamecenter_topskin",
						"name" : "P_스포츠_게임센터_상단스킨",
						"section" : "",
						"type" : "pc",
						"oldUnitId" : "1059A",
						"unitId" : "SU10125",
						"previewId" : "p_sports_gskin",
						"width" : "560",
						"height" : "53",
						"menu" : "",
						"calpId" : "",
						"useCase" : "iframe"
					}, {
						"sid" : "gamecenter_fence",
						"name" : "P_스포츠_게임센터_펜스광고",
						"section" : "",
						"type" : "pc",
						"oldUnitId" : "1059B",
						"unitId" : "SU10126",
						"previewId" : "p_sports_gfence",
						"width" : "434",
						"height" : "32",
						"menu" : "",
						"calpId" : "",
						"useCase" : "iframe"
					},

					{
						"sid" : "tv_bottom_banner",
						"name" : "P_스포츠_생중계_하단배너",
						"section" : "kbaseball",
						"type" : "pc",
						"oldUnitId" : "",
						"unitId" : "SU10670",
						"previewId" : "p_sports_live",
						"width" : "700",
						"height" : "70",
						"menu" : "",
						"calpId" : "kbaseball",
						"useCase" : "iframe"
					}, {
						"sid" : "tv_bottom_banner",
						"name" : "P_스포츠_생중계_하단배너",
						"section" : "wbaseball",
						"type" : "pc",
						"oldUnitId" : "",
						"unitId" : "SU10670",
						"previewId" : "p_sports_live",
						"width" : "700",
						"height" : "70",
						"menu" : "",
						"calpId" : "wbaseball",
						"useCase" : "iframe"
					}, {
						"sid" : "tv_bottom_banner",
						"name" : "P_스포츠_생중계_하단배너",
						"section" : "kfootball",
						"type" : "pc",
						"oldUnitId" : "",
						"unitId" : "SU10670",
						"previewId" : "p_sports_live",
						"width" : "700",
						"height" : "70",
						"menu" : "",
						"calpId" : "kfootball",
						"useCase" : "iframe"
					}, {
						"sid" : "tv_bottom_banner",
						"name" : "P_스포츠_생중계_하단배너",
						"section" : "wfootball",
						"type" : "pc",
						"oldUnitId" : "",
						"unitId" : "SU10670",
						"previewId" : "p_sports_live",
						"width" : "700",
						"height" : "70",
						"menu" : "",
						"calpId" : "wfootball",
						"useCase" : "iframe"
					}, {
						"sid" : "tv_bottom_banner",
						"name" : "P_스포츠_생중계_하단배너",
						"section" : "basketball",
						"type" : "pc",
						"oldUnitId" : "",
						"unitId" : "SU10670",
						"previewId" : "p_sports_live",
						"width" : "700",
						"height" : "70",
						"menu" : "",
						"calpId" : "basketball",
						"useCase" : "iframe"
					}, {
						"sid" : "tv_bottom_banner",
						"name" : "P_스포츠_생중계_하단배너",
						"section" : "volleyball",
						"type" : "pc",
						"oldUnitId" : "",
						"unitId" : "SU10670",
						"previewId" : "p_sports_live",
						"width" : "700",
						"height" : "70",
						"menu" : "",
						"calpId" : "volleyball",
						"useCase" : "iframe"
					}, {
						"sid" : "tv_bottom_banner",
						"name" : "P_스포츠_생중계_하단배너",
						"section" : "golf",
						"type" : "pc",
						"oldUnitId" : "",
						"unitId" : "SU10670",
						"previewId" : "p_sports_live",
						"width" : "700",
						"height" : "70",
						"menu" : "",
						"calpId" : "golf",
						"useCase" : "iframe"
					}, {
						"sid" : "tv_bottom_banner",
						"name" : "P_스포츠_생중계_하단배너",
						"section" : "general",
						"type" : "pc",
						"oldUnitId" : "",
						"unitId" : "SU10670",
						"previewId" : "p_sports_live",
						"width" : "700",
						"height" : "70",
						"menu" : "",
						"calpId" : "general",
						"useCase" : "iframe"
					}, {
						"sid" : "tv_bottom_banner",
						"name" : "P_스포츠_생중계_하단배너",
						"section" : "esports",
						"type" : "pc",
						"oldUnitId" : "",
						"unitId" : "SU10670",
						"previewId" : "p_sports_live",
						"width" : "700",
						"height" : "70",
						"menu" : "",
						"calpId" : "esports",
						"useCase" : "iframe"
					} ];
				</script>
			</div>

			<div id="footer">
				<div class="notice_foot">
					<strong class="title">공지</strong>
					<div class="inner">
						<a href="https://blog.naver.com/naver_sports/222881414395"
							onclick="clickcr(this, 'not.noti', '1663864014207', '', event);"><span>spopia스포츠의
								새로운 '커뮤니티'를 만나보세요</span></a> <a
							href="https://blog.naver.com/naver_sports/222879538415"
							onclick="clickcr(this, 'not.noti', '1663864062389', '', event);"><span>스포츠
								오픈톡 열고, 5만 페이포인트 받자!</span></a> <a
							href="https://blog.naver.com/naver_sports/222879745905"
							target="_blank"
							onclick="clickcr(this, 'not.noti', '1466402863231', '', event);"><span>스포츠
								TV중계 편성 - 9/19(월)~9/26(월)</span></a>
					</div>
				</div>
				<ul>
					<li class="first"><a
						onclick="clickcr(this, 'fot.service', '', '', event);"
						target="_blank" href="https://www.naver.com/rules/service.html">spopia
							이용약관</a></li>
					<li><a href="https://news.naver.com/main/principle.nhn"
						target="_blank"
						onclick="clickcr(this, 'fot.principle', '', '', event);">댓글/게시글
							운영원칙</a></li>
					<li><a
						href="https://news.naver.com/main/ombudsman/edit.naver?mid=omb">기사배열
							원칙 책임자 : 유봉석</a></li>
					<li><span>청소년 보호 책임자 : 이희만</span></li>
					<li><a href="https://www.naver.com/rules/privacy.html"
						target="_blank"
						onclick="clickcr(this, 'fot.privacy', '', '', event);"><strong>개인정보처리방침</strong></a></li>
					<li><a href="https://www.naver.com/rules/disclaimer.html"
						target="_blank"
						onclick="clickcr(this, 'fot.disclaimer', '', '', event);">책임의
							한계와 법적고지</a></li>
					<li><a target="_blank"
						onclick="OPS.viewOPS('ops', {url : 'https://help.naver.com/alias/contents2/sports/sports_2.naver'}); clickcr(this, 'fot.shelp', '', '', event); return false;"
						href="#">스포츠 고객센터</a></li>
				</ul>
				<p class="copyr">본 콘텐츠의 저작권은 spopia 및 제공처에 있으며, 이를 이용하는 경우 저작권법 등에
					따라 법적책임을 질 수 있습니다.</p>
				<address>
					<a href="#" target="_blank" class="logo">
						<img src="/resources/images/SPOPIA1.png" width="63" height="11" alt="SPOPIA"
					</a> 
					<em>Copyright ©</em> 
					<a href="#" target="_blank">SPOPIA Corp.</a>
					<span>All Rights Reserved.</span>
				</address>
			</div>
			<script type="text/javascript"
				src="https://ssl.pstatic.net/static.sports/resources/pc/2022/09/29/130734/js/src/changeUrl.js"
				charset="UTF-8"></script>
			<script type="text/javascript">
				var container_link = "container";
				if (document.getElementById("container_link")) {
					document.getElementById("container_link").innerHTML = "<a href='#container' onclick=\"document.getElementById('container').tabIndex=-1;document.getElementById('container').focus();\"><span>본문으로 바로가기</span></a>";
				}

				function goToMobileUrl(mobileRedirectUrl) {
					if (mobileRedirectUrl) {
						location.href = "/mobileview.nhn?url="
								+ encodeURIComponent(mobileRedirectUrl);
					} else {
						location.href = "/index.nhn";
					}
				}
				lazyloadjs("https://ssl.pstatic.net/static/common/js/cs_ops_webncc.js");
			</script>
		</div>
	</form>
	<script>
		lazyloadjs('https://ssl.pstatic.net/static.sports/resources/pc/2022/09/29/130734/js/generated/baseJsBottomLazy.js');
	</script>
	<script src="https://kit.fontawesome.com/1d32d56af5.js" crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.js" crossorigin="anonymous"></script>
   	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script type="text/javascript">
	
		 function menuToggle() {
            const toggleMenu = document.querySelector('.menu');
            toggleMenu.classList.toggle('active')
        };
        
        $("#signOutBtn").on("click", function() {
			$.ajax({
				type: "POST"
				,url: "/logoutProc"
				,data: {}
				,success : function(response) {
					if (response.rt == "success") {
						window.location.href = "/";
					} else {
						localStorage.clear();
						window.location.href = "/";
						/* window.location.href = "/naverLogout"; */
					}
				}
			});
		});
		
	</script>
	<script type="text/javascript">
		
		var form = $("#myForm");
		var goUrlUView = "/member/memberUView";
		var goUrlXdmin = "/member/memberList";
		
		goXdmin = function() {
			form.attr("action", goUrlXdmin).submit();
		}
		
		goView = function(keyValue) {
			form.attr("action", goUrlUView).submit();
		}
		
		$(".link_creator").on("click", function() {
			alert("준비 중인 항목입니다!!!");
		})
		
		$(".link_vod").on("click", function() {
			alert("준비 중인 항목입니다!!!");
		})
	</script>
</body>
</html>