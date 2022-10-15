<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="rb" uri="http://www.springframework.org/tags" %>

<jsp:useBean id="CodeServiceImpl" class="com.spopia.infra.modules.code.CodeServiceImpl"/>

<!doctype html>
<html lang="ko">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no">
    <title>네이버 스포츠</title>
    <script>"Microsoft Internet Explorer" === navigator.appName && (window.onload = function () { "false" !== window.sessionStorage.getItem("gameCenterIeAlert") && (window.sessionStorage.setItem("gameCenterIeAlert", "false"), alert("Internet Explorer 10 이하 버전의 유저에게는 일부 서비스가 정상 작동하지 않을 수 있습니다. 원활한 서비스를 위해 상위 버전으로 업그레이드 후 이용해 주시기를 권해드립니다.")) })</script>
    <link
        href="https://ssl.pstatic.net/static.sports/resources/web-ui/game/220804-183157/static/css/main.5632a96e.chunk.css"
        rel="stylesheet">
    <link rel="stylesheet" type="text/css"
        href="https://ssl.pstatic.net/static.sports/resources/web-ui/game/220804-183157/static/css/14.ec71709b.chunk.css">
    <script charset="utf-8"
        src="https://ssl.pstatic.net/static.sports/resources/web-ui/game/220804-183157/static/js/14.956e9981.chunk.js"></script>
    <link id="naver-splugin-css" rel="stylesheet" type="text/css"
        href="https://ssl.pstatic.net/spi/css/20210531/spi_standard_m_https.css">
    <script type="text/javascript" charset="utf-8"
        src="https://ssl.pstatic.net/static.cbox/js/cbox.core.js?v=1383187"></script>
    <style type="text/css" id="_cbox_default_style_"></style>
    <link type="text/css" rel="stylesheet"
        href="https://ssl.pstatic.net/static.cbox/20220804143236/css/comment_sports_talk.css" charset="utf-8">
    <title>Game View</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
    <link href="/resources/css/user/game.css" rel="stylesheet" type="text/css">
    <link href="/resources/css/user/gameView.css" rel="stylesheet" type="text/css">
    <link href="/resources/css/user/comment.css" rel="stylesheet" type="text/css">
</head>

<body>
    <!-- start -->
    <header class="navbar-light fixed-top header-static bg-mode align-items-center">
        <!-- 상단 -->
        <nav class="navbar navbar-expand-lg">
            <div class="container px-3 px-xl-5 pt-1">
                <!-- Logo START -->
                <a class="navbar-brand" href="/sportMain">
                    <img class="light-mode-item navbar-brand-item" src="/resources/images/SPOPIA_white.png" alt="logo" style="width: 90px;">
                </a>
                <!-- Profile START -->
                <c:choose>
                	<c:when test="${empty sessSeq }">
                		<ul class="nav flex-nowrap align-items-center ms-sm-3 list-unstyled">
	                        <li class="nav_li">
                   				<div class="login_po">
		                            <a class="login" href="/userLogin">
		                                <i class="fa-solid fa-right-to-bracket"></i>
		                            </a>	                    					
                   				</div>
	                        </li>
	                    </ul>
                	</c:when>
                	<c:otherwise>
                		<div class="dropdown">
		                    <ul class="nav flex-nowrap align-items-center ms-sm-3 list-unstyled">
		                        <li class="me-2">
		                            <a class="p-0" href="#" id="profileDropdown" role="button" data-bs-auto-close="outside"
		                                data-bs-display="static" data-bs-toggle="dropdown" aria-expanded="false">
		                                <img class="avatar-img rounded-circle" src="/resources/images/diano.jpg" alt="avatar"
		                                    style="width: 30px;">
		                            </a>
		                            <ul class="dropdown-menu dropdown-animation dropdown-menu-end shadow pt-3" aria-labelledby="profileDropdown">
		                                <!-- Profile info -->
		                                <li class="px-3 mb-2 border-bottom">
		                                    <div class="d-flex align-items-center pb-2">
		                                        <!-- Avatar -->
		                                        <div class="avatar pt-2">
		                                            <img class="avatar-img rounded-circle shadow" src="/resources/images/diano.jpg" alt="avatar"
		                                                style="width: 30px;">
		                                        </div>
		                                        <div>
		                                            <a class="fs-6 fw-bold" href="/member/memberUView?seq=${sessSeq }"><c:out value="${sessName }"/></a>
		                                            <p class="small m-0"><c:out value="${sessEmail}"/></p>
		                                        </div>
		                                    </div>
		                                </li>
		                                <!-- Links -->
		                                <c:choose>
		                                	<c:when test="${sessUser eq 25 }">
		                                		<li>
				                                    <a class="dropdown-item" href="/member/memberUView?seq=${sessSeq }">
				                                        <i class="fa-solid fa-user me-2"></i>
				                                        Edit Profile
				                                    </a>
				                                </li>
				                                <li>
				                                    <a class="dropdown-item" href="#">
				                                        <i class="fa-solid fa-circle-info me-2"></i>
				                                        Help
				                                    </a>
				                                </li>
				                                <li>
				                                    <a class="dropdown-item bg-danger-soft-hover" id="signOutBtn" >
				                                        <i class="fa-solid fa-power-off me-2"></i>
				                                        Sign Out
				                                    </a>
				                                </li>
		                                	</c:when>
		                                	<c:otherwise>
			                                	<li>
				                                    <a class="dropdown-item" href="/member/memberUView?seq=${sessSeq }">
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
				                                    <a class="dropdown-item bg-danger-soft-hover" id="signOutBtn" >
				                                        <i class="fa-solid fa-power-off me-2"></i>
				                                        Sign Out
				                                    </a>
				                                </li>
			                                </c:otherwise>
		                                </c:choose>
		                                <!-- Dark mode switch START -->
		                            </ul>
		                        </li>
		                    </ul>
		                </div>					
                	</c:otherwise>
                </c:choose>
                <!-- Profile START -->
            </div>
        </nav>
    </header>

    <main>
    	<form method="post" name="myForm" id="myForm">
       	<!-- *Vo.jsp s -->
		<%@include file="gameVo.jsp"%>		<!-- #-> -->
		<!-- *Vo.jsp e -->
	        <div style="height: 80px;"></div>
	        <div class="container" style="max-width: 1000px;">
	            <div class="card shadow position-relative">
	                <!-- <img class="card-img" src="../../image/background.jpg" alt="background" style="height: 300px;"> -->
	                <img src="https://ssl.pstatic.net/static/sports/common/livecenter/new/bg_live_baseball.jpg"
	                    class="LiveGuide_cover_image__3dPRt card shadow alt="">
	                <div class="card-img-overlay align-bottom text-white">
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
	                    <span class="MatchBox_date__1bJ9G mb-2">${item.gameDate }<span class="MatchBox_time__2z_nB">${item.gameDuration }</span></span>
	                    <c:set var="listCodeStadium" value="${CodeServiceImpl.selectListCachedCode('8') }" />
	                    <span class="MatchBox_stadium__17mQ4">${item.stadium }
	                    	<c:forEach items="${listCodeStadium}" var="listStadium" varStatus="statusStadium">
								<c:if test="${list.stadium eq listStadium.ccSeq}"><c:out value="${listStadium.ifccName }"/></c:if>
							</c:forEach>
	                    </span>
	                </div>
	                <div class="MatchBox_home__MPL6D pt-2">
	                    <div class="MatchBox_team_area__a9Jet">
	                        <div class="MatchBox_image__3CcVt"><img
	                                src="https://sports-phinf.pstatic.net/team/kbo/default/OB.png?type=f108_108" alt="" width="72"
	                                height="72"></div>
	                        <div class="MatchBox_text__22e-R text-center">
	                        	<c:set var="listCodeTeam" value="${CodeServiceImpl.selectListCachedCode('7') }" />
	                            <em class="MatchBox_name__11AyG">${item.team_away }
	                            	<c:forEach items="${listCodeTeam}" var="listTeam" varStatus="statusTeam">
										<c:if test="${list.team_away eq listTeam.ccSeq}"><c:out value="${listTeam.ifccName }"/></c:if>
									</c:forEach>
	                            </em>
	                            <p class="MatchBox_pitcher__2Krgp">선-${item.player_away }</p>
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
	                            <i class="MatchBox_badge__p5jYW">홈</i>${item.team_home }</em>
	                            <p class="MatchBox_pitcher__2Krgp">선-${item.player_home }</p>
	                        </div>
	                    </div>
	                </div>
	            </div>
	            <div class="card shadow mb-3">
	                <!-- 팀 선택 -->
	                <div class="CheerVS_comp_cheer__2Ko7V is_cheer">
	                    <div class="CheerVS_cheer_box__1oy_U">
	                        <h3 class="blind">당신의 팀을 응원하세요!</h3>
	                        <div class="CheerVS_cheer_area__1jVle">
	                            <div class="CheerVS_left_team__3uqU9" style="width: 53.8574%; color: rgb(255, 255, 255);">
	                                <div class="CheerVS_team_cover__2Fb3h"
	                                    style="background: linear-gradient(to right, rgb(19, 18, 48), rgb(19, 18, 48));"><img
	                                        src="https://sports-phinf.pstatic.net/team/kbo/default/OB.png" class="CheerVS_emblem__2zXNQ"
	                                        alt="" width="50" height="50">
	                                    <div class="CheerVS_message__A0q9j">
	                                        <div class="CheerVS_team__5OZFJ">두산</div>
	                                        <div class="CheerVS_count__3K7p8">3,454,096</div>
	                                    </div>
	                                </div>
	                            </div>
	                            <div class="CheerVS_right_team__2cmbF CheerVS_is_disabled__3d-e-"
	                                style="width: 46.1426%; color: rgb(255, 255, 255); z-index: 10;">
	                                <div class="CheerVS_versus__xXspg">종료</div>
	                                <div class="CheerVS_team_cover__2Fb3h"
	                                    style="background: linear-gradient(to right, rgb(163, 37, 37), rgb(163, 37, 37));"><img
	                                        src="https://sports-phinf.pstatic.net/team/kbo/default/HT.png" class="CheerVS_emblem__2zXNQ"
	                                        alt="" width="50" height="50">
	                                    <div class="CheerVS_message__A0q9j">
	                                        <div class="CheerVS_team__5OZFJ">KIA</div>
	                                        <div class="CheerVS_count__3K7p8">2,959,320</div>
	                                    </div>
	                                </div>
	                            </div>
	                        </div>
	                    </div>
	                </div>
	            </div>
	            	<!-- 댓글 --> 
	            <div class="CommentModule_comp_comment__18nvt CommentModule_is_pc__2froM">
                    <div class="u_cbox" id="cbox_module" style="padding: 30px;">
                        <div class="u_cbox_wrap u_cbox_type_select u_cbox_ko">
                            <div class="u_cbox_head">
                                <h5 class="u_cbox_title">응원톡</h5>
                                <span class="u_cbox_count">Total : ${cVo.totalRows }</span>
                                <button type="button" class="u_cbox_btn_refresh" onclick="refresh()">
                                    <span class="u_cbox_ico_refresh"></span>
                                    <span class="u_cbox_txt_refresh">새로고침</span>
                                </button>
                            </div>
                               <c:choose>
                               	<c:when test="${empty sessName}">
		                            <div class="u_cbox_write_wrap">
										<div class="u_cbox_write_box u_cbox_type_logged_out">
											<form>
												<fieldset>
													<legend class="u_vc">댓글 쓰기</legend>
													<div class="u_cbox_write">
														<div class="u_cbox_write_inner">
															<div class="u_cbox_write_area">
																<strong class="u_vc">댓글 입력</strong>
																<div class="u_cbox_inbox">
																	<textarea title="댓글" id="comment" class="u_cbox_text" rows="3" cols="30"></textarea>
																	<label for="comment" class="u_cbox_guide">댓글을 작성하려면 <a class="login_link">로그인</a> 해주세요</label>
																</div>
															</div>
															<div class="u_cbox_write_count">
																<span class="u_vc">현재 입력한 글자수</span>
																<strong class="u_cbox_count_num">0</strong>/
																<span class="u_vc">전체 입력 가능한 글자수</span>
																<span class="u_cbox_write_total">500</span>
															</div>
															<div class="u_cbox_upload">
																<div class="u_cbox_addition"></div>
																<button type="button" class="u_cbox_btn_upload">
																	<span class="u_cbox_ico_upload"></span>
																	<span class="u_cbox_txt_upload">등록</span>
																</button>
															</div>
														</div>
													</div>
												</fieldset>
											</form>
										</div>
									</div>
								</c:when>
								<c:otherwise>
									<div class="u_cbox_write_wrap u_cbox_focus">
										<div class="u_cbox_write_box u_cbox_type_logged_in">
											<form>
												<fieldset>
													<legend class="u_vc">댓글 쓰기</legend>
													<div class="u_cbox_write">
														<div class="u_cbox_write_inner">
															<div class="u_cbox_profile_area">
																<div class="u_cbox_profile">
																	<strong class="u_vc">로그인 정보</strong>
																	<div class="u_cbox_thumb">
																		<img src="https://static.nid.naver.com/images/web/user/default.png?type=f132_132" alt="bbluesky7738" class="u_cbox_img_profile" onerror="cbox.Util.onImageError(this);">
																	</div>
																	<div class="u_cbox_box_name">
																		<span class="u_cbox_write_name">${sessId }</span>
																	</div>
																</div>
															</div>
															<div class="u_cbox_write_area">
																<strong class="u_vc">댓글 입력</strong>
																<div class="u_cbox_inbox">
																	<textarea title="댓글" id="comment" name="comment" class="u_cbox_text form-control" rows="3" cols="30" oninput="change_text()"></textarea>
																	<label for="comment" id="label_guide" class="u_cbox_guide">저작권 등 다른 사람의 권리를 침해하거나 명예를 훼손하는 게시물은 이용약관 및 관련 법률에 의해 제재를 받을 수 있습니다. 건전한 토론문화와 양질의 댓글 문화를 위해, 타인에게 불쾌감을 주는 욕설 또는 특정 계층/민족, 종교 등을 비하하는 단어들은 표시가 제한됩니다.</label>
																</div>
															</div>
															<div class="u_cbox_write_count">
																<span class="u_vc">현재 입력한 글자수</span>
																<strong class="u_cbox_count_num">0</strong>/
																<span class="u_vc">전체 입력 가능한 글자수</span>
																<span class="u_cbox_write_total">500</span>
															</div>
															<div class="u_cbox_upload">
																<div class="u_cbox_addition"></div>
																<button type="button" class="u_cbox_btn_upload" id="saveBtn" onclick="commentSave()">
																	<span class="u_cbox_ico_upload"></span>
																	<span class="u_cbox_txt_upload">등록</span>
																</button>
															</div>
														</div>
													</div>
												</fieldset>
											</form>
										</div>
									</div>
								</c:otherwise>
                            </c:choose>
                            <div id="cbox_module_wai_u_cbox_content_wrap_tabpanel" tabindex="0" class="u_cbox_content_wrap" style="outline: 0">
                                <ul class="u_cbox_list">
	                                <c:choose>
				                  		<c:when test="${fn:length(comment) eq 0}">
				              				<div class="text-center">댓글을 입력하시오!!</div>
				                  		</c:when>
				                   		<c:otherwise>
				                       		<c:forEach items="${comment}" var="comment" varStatus="status">
					                   			<c:choose>
					                   				<c:when test="${sessId eq comment.id }">
					                   					<input type="hidden" name="seq" value="<c:out value="${comment.seq}"/>"/>
					                   					<li class="u_cbox_comment cbox_module__comment_765728306778603670 _user_id_no_3MkTI">
					                                        <div class="u_cbox_comment_box">
					                                            <div class="u_cbox_area">
					                                                <div class="u_cbox_info">
					                                                    <span class="u_cbox_info_main">
					                                                        <span class="u_cbox_name">
					                                                            <span class="u_cbox_name_area">
					                                                                <span class="u_cbox_nick_area">
					                                                                    <span class="u_cbox_nick"><c:out value="${comment.id }"/></span>
					                                                                </span>
					                                                            </span>
					                                                        </span>
					                                                    </span>
					                                                    <span class="u_cbox_info_sub"></span>
					                                                </div>
					                                                <div class="u_cbox_pic">
					                                                    <span class="u_cbox_pic_wrap">
					                                                        <img src="https://ssl.pstatic.net/static/sports/2021/m/12/07/no_emblem_baseball.png"
					                                                            class="u_cbox_img_contents" alt="댓글 이미지"
					                                                            onerror="cbox.Util.leave(this, '.u_cbox_pic');">
					                                                        <span class="u_cbox_pic_mask"></span>
					                                                    </span>
					                                                </div>
					                                                <div class="u_cbox_text_wrap">
					                                                    <span class="u_cbox_contents" data-lang="ko">
					                                                        ${comment.comment }
					                                                    </span>
					                                                </div>
					                                                <div class="u_cbox_info_base">
					                                                    <span class="u_cbox_date" data-value="2022-08-07T07:27:39+0900">21분 전</span>
					                                                    <span class="u_cbox_work_main">
					                                                        <button type="button" class="u_cbox_btn_report" onclick="commentUelete(<c:out value="${comment.seq }"/>)">
					                                                            <span class="u_cbox_ico_bar"></span>
					                                                            <span class="u_cbox_ico_report"></span>
					                                                            <span class="u_cbox_in_report"><i class="fa-solid fa-trash"></i></span>
					                                                        </button>
					                                                    </span>
					                                                </div>
					                                                <div class="u_cbox_tool"></div>
					                                                <span class="u_cbox_comment_frame">
					                                                    <span class="u_cbox_ico_tip"></span>
					                                                    <span class="u_cbox_comment_frame_top">
					                                                        <span class="u_cbox_comment_bg_r"></span>
					                                                        <span class="u_cbox_comment_bg_l"></span>
					                                                    </span>
					                                                    <span class="u_cbox_comment_frame_bottom">
					                                                        <span class="u_cbox_comment_bg_r"></span>
					                                                        <span class="u_cbox_comment_bg_l"></span>
					                                                    </span>
					                                                </span>
					                                            </div>
					                                        </div>
					                                        <div class="u_cbox_reply_area" style="display:none;"></div>
					                                    </li>
					                   				</c:when>
					                   				<c:otherwise>
					                   					<li class="u_cbox_comment cbox_module__comment_765728306778603670 _user_id_no_3MkTI">
					                                        <div class="u_cbox_comment_box">
					                                            <div class="u_cbox_area">
					                                                <div class="u_cbox_info">
					                                                    <span class="u_cbox_info_main">
					                                                        <span class="u_cbox_name">
					                                                            <span class="u_cbox_name_area">
					                                                                <span class="u_cbox_nick_area">
					                                                                    <span class="u_cbox_nick">${comment.id }</span>
					                                                                </span>
					                                                            </span>
					                                                        </span>
					                                                    </span>
					                                                    <span class="u_cbox_info_sub"></span>
					                                                </div>
					                                                <div class="u_cbox_pic">
					                                                    <span class="u_cbox_pic_wrap">
					                                                        <img src="https://ssl.pstatic.net/static/sports/2021/m/12/07/no_emblem_baseball.png"
					                                                            class="u_cbox_img_contents" alt="댓글 이미지"
					                                                            onerror="cbox.Util.leave(this, '.u_cbox_pic');">
					                                                        <span class="u_cbox_pic_mask"></span>
					                                                    </span>
					                                                </div>
					                                                <div class="u_cbox_text_wrap">
					                                                    <span class="u_cbox_contents" data-lang="ko">
					                                                        ${comment.comment }
					                                                    </span>
					                                                </div>
					                                                <div class="u_cbox_info_base">
					                                                    <span class="u_cbox_date" data-value="2022-08-07T07:27:39+0900">21분 전</span>
					                                                    <span class="u_cbox_work_main">
					                                                        <button type="button" class="u_cbox_btn_report" >
					                                                            <span class="u_cbox_ico_bar"></span>
					                                                            <span class="u_cbox_ico_report"></span>
					                                                            <span class="u_cbox_in_report"></span>
					                                                        </button>
					                                                    </span>
					                                                </div>
					                                                <div class="u_cbox_tool"></div>
					                                                <span class="u_cbox_comment_frame">
					                                                    <span class="u_cbox_ico_tip"></span>
					                                                    <span class="u_cbox_comment_frame_top">
					                                                        <span class="u_cbox_comment_bg_r"></span>
					                                                        <span class="u_cbox_comment_bg_l"></span>
					                                                    </span>
					                                                    <span class="u_cbox_comment_frame_bottom">
					                                                        <span class="u_cbox_comment_bg_r"></span>
					                                                        <span class="u_cbox_comment_bg_l"></span>
					                                                    </span>
					                                                </span>
					                                            </div>
					                                        </div>
					                                        <div class="u_cbox_reply_area" style="display:none;"></div>
					                                    </li>
					                   				</c:otherwise>
					                   			</c:choose>
											</c:forEach>
				                   		</c:otherwise>
				                   	</c:choose>
                                </ul>
                            </div>
                            <div class="u_cbox_paginate">
                                <a href="#" class="u_cbox_btn_more" data-action="page#more" data-log="RPC.more">
                                    <span class="u_cbox_more_wrap">
                                        <span class="u_cbox_box_more">
                                            <span class="u_cbox_page_more">더보기</span>
                                            <span class="u_cbox_ico_more"></span>
                                        </span>
                                    </span>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
	        </div>
	        <div style="height: 40px;"></div>
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

    <!-- end -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2"
        crossorigin="anonymous"></script>
    <script src="https://kit.fontawesome.com/1d32d56af5.js" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.js" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script type="text/javascript">
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
	    
	    var goUrlLogin = "/userLogin";
    	var goUrlInst = "/gameInsert";
    	var form = $("#myForm");
    	
    	$(".login_link").on("click", function() {
	    	swAlert("로그인", "로그인 하시겠습니까?", "success");
		});
	    
	    function swAlert(title, text, icon) {
			swal({
				title: title
				,text: text
				,icon: icon
				,buttons: "로그인"
			}).then((value) => {
				if (value) {
					location.href = goUrlLogin;
				}
			})
		}
	    
	    change_text = function() {
	    	var content = $("#comment").val();

	    	if (content != null || content != "") {
	    		$(".u_cbox_write_wrap").addClass('u_cbox_writing');
	    		$("label[for=comment]").text("")
	    	} else if ($("#comment").length == 0) {
	    		$("label[for=comment]").text("저작권 등 다른 사람의 권리를 침해하거나 명예를 훼손하는 게시물은 이용약관 및 관련 법률에 의해 제재를 받을 수 있습니다. 건전한 토론문화와 양질의 댓글 문화를 위해, 타인에게 불쾌감을 주는 욕설 또는 특정 계층/민족, 종교 등을 비하하는 단어들은 표시가 제한됩니다.")
	    	}
	    	
	    	if (content.length == 0 || content == '') {
	    		$(".u_cbox_count_num").text("0");
	    	} else {
	    		$(".u_cbox_count_num").text(content.length)
	    	}
	    	
	    	if (content.length > 500) {
	    		$(".u_cbox_count_num").val($(".u_cbox_count_num").val().substring(0, 500));
	    		alert("글자수는 최대 500자 까지 입력 가능합니다.!!!");
	    	};
		};
		
		function commentSave() {
			
			$.ajax({
   				async: true 
   				,cache: false
   				,type: "post"
   				/* ,dataType:"json" */
   				,url: "gameInsert"
   				/* ,data : $("#formLogin").serialize() */
   				,data : { "comment" : $("#comment").val(), "mSeq" : $("input[name=mSeq]").val(), "gSeq" : $("input[name=gSeq]").val()}
   				,success: function(response) {
   					if (response.rt == "success") {
   						location.href = "/gameView?gSeq="+ $("input[name=gSeq]").val();
   					} else {
   						alert("댓글을 입력하시오!!");
   					}
   				}
   				,error : function(jqXHR, textStatus, errorThrown){
   					alert("ajaxUpdate " + jqXHR.textStatus + " : " + jqXHR.errorThrown);
   				}
   			});
		}
		
		function commentUelete(seq) {
			
			$.ajax({
   				async: true 
   				,cache: false
   				,type: "post"
   				/* ,dataType:"json" */
   				,url: "gameCommentUelete"
   				/* ,data : $("#formLogin").serialize() */
   				,data : {"seq" : seq, "mSeq" : $("input[name=mSeq]").val(), "gSeq" : $("input[name=gSeq]").val()}
   				,success: function(response) {
   					if (response.rt == "success") {
   						location.href = "/gameView?gSeq="+ $("input[name=gSeq]").val();
   					} else {
   						alert("댓글을 입력하시오!!");
   					}
   				}
   				,error : function(jqXHR, textStatus, errorThrown){
   					alert("ajaxUpdate " + jqXHR.textStatus + " : " + jqXHR.errorThrown);
   				}
   			});
		}
		
		function refresh() {
			$.ajax({
   				async: true 
   				,cache: false
   				,type: "post"
   				/* ,dataType:"json" */
   				,url: "gameRefresh"
   				/* ,data : $("#formLogin").serialize() */
   				,data : {"gSeq" : $("input[name=gSeq]").val()}
   				,success: function(response) {
   					if (response.rt != "success") {
   						location.href = "/gameView?gSeq="+ $("input[name=gSeq]").val();
   					} 
   				}
   				,error : function(jqXHR, textStatus, errorThrown){
   					alert("ajaxUpdate " + jqXHR.textStatus + " : " + jqXHR.errorThrown);
   				}
   			});
		}
    </script>
</body>

</html>