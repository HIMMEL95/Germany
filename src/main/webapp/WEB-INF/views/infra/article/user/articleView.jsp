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
    <title>Article View</title>
    <link
        href="https://ssl.pstatic.net/static.sports/resources/web-ui/game/220804-183157/static/css/main.5632a96e.chunk.css"
        rel="stylesheet">
    <link rel="stylesheet" type="text/css"
        href="https://ssl.pstatic.net/static.sports/resources/web-ui/game/220804-183157/static/css/14.ec71709b.chunk.css">
    <link id="naver-splugin-css" rel="stylesheet" type="text/css"
        href="https://ssl.pstatic.net/spi/css/20210531/spi_standard_m_https.css">
    <style type="text/css" id="_cbox_default_style_"></style>
    <link type="text/css" rel="stylesheet"
        href="https://ssl.pstatic.net/static.cbox/20220804143236/css/comment_sports_talk.css" charset="utf-8">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
    <link href="/resources/css/user/game.css" rel="stylesheet" type="text/css">
    <link href="/resources/css/user/gameView.css" rel="stylesheet" type="text/css">
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
				                                    <a class="dropdown-item bg-danger-soft-hover" href="/">
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
				                                    <a class="dropdown-item bg-danger-soft-hover" href="/">
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
    	<form method="post">
          	<!-- *Vo.jsp s -->
			<%@include file="articleVo.jsp"%>		<!-- #-> -->
			<!-- *Vo.jsp e -->
	        <div style="height: 80px;"></div>
	        <div class="container" style="max-width: 900px;">
	            <div class="card ps-5 pe-5 pt-4 pb-4 mb-3 shadow">
	                <div class="row">
	                    <div class="col-12 mb-2">
	                        <span class="fs-4 fw-bold">${item.title }</span>
	                    </div>
	                </div>
	                <div class="row mb-5">
	                    <div class="col-12 mb-2">
	                        <span style="font-size: small;"><strong>기사제공</strong>${item.newspaper }</span>
	                        <span class="ps-3" style=" font-size: small;"><strong>기사입력</strong> ${item.aCreatedAt } |
	                        </span>
	                        <span style="font-size: small;"><strong>최종수정</strong> ${item.aModifiedAt }</span>
	                        <hr>
	                    </div>
	                    <div class="col-12 mb-3">
	                        <img class="pb-2" src='<c:out value="${item.path }"/><c:out value="${item.uuidName }"/> ' alt=""
	                            style="width: 100%; height: 350px; float: left;">
	                    </div>
	                    <div class="col-12">
	                        <div>
	                        	<br>
	                            <p class="fs-5" id="content">
	                            	${item.content }
	                            </p><br>
	                        </div>
	                        <span><strong>기사제공</strong> 문화일보${item.newspaper }</span>
	                        <p>${item.reporter } 기자 (${item.email })</p>
	                    </div>
	                </div>
	                <!-- 댓글 -->
	                <div class="CommentModule_comp_comment__18nvt CommentModule_is_pc__2froM">
	                    <div class="u_cbox" id="cbox_module">
	                        <div class="u_cbox_wrap u_cbox_type_select u_cbox_ko">
	                            <div class="u_cbox_head">
	                                <h5 class="u_cbox_title">응원톡</h5>
	                                <span class="u_cbox_count">Total : ${vo.totalRows }</span>
	                                <button type="button" class="u_cbox_btn_refresh" data-action="count#refresh" data-log="RPO.refresh">
	                                    <span class="u_cbox_ico_refresh"></span>
	                                    <span class="u_cbox_txt_refresh">새로고침</span>
	                                </button>
	                            </div>
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
	                                                            <textarea title="응원톡" id="cbox_module__write_textarea" name="content" class="u_cbox_text"
	                                                                rows="3" cols="30" data-log="RPC.input"></textarea>
	                                                            <label for="cbox_module__write_textarea" class="u_cbox_guide"
	                                                                data-action="write#placeholder" data-param="@event">
	                                                                댓글을 작성하려면
	                                                                <button class="btn" type="button" data-bs-toggle="modal"
	                                                                    data-bs-target="#modal">로그인</button>
	                                                                해주세요
	                                                            </label>
	                                                            <div class="modal fade" id="modal" tabindex="-1"
	                                                                aria-labelledby="exampleModalLabel" aria-hidden="true">
	                                                                <div class="modal-dialog">
	                                                                    <div class="modal-content">
	                                                                        <div class="modal-header">
	                                                                            <h5 class="modal-title" id="exampleModalLabel">로그인 여부</h5>
	                                                                            <button type="button" class="btn-close text-black"
	                                                                                data-bs-dismiss="modal" aria-label="Close">
	                                                                                <i class="fa-solid fa-xmark"></i>
	                                                                            </button>
	                                                                        </div>
	                                                                        <div class="modal-body">
	                                                                            로그인 하시겠습니까?
	                                                                        </div>
	                                                                        <div class="modal-footer">
	                                                                            <button type="button" class="btn btn-secondary"
	                                                                                data-bs-dismiss="modal">Close</button>
	                                                                            <a role="button" class="btn bg-white"
	                                                                                href="/userLogin">Login</a>
	                                                                        </div>
	                                                                    </div>
	                                                                </div>
	                                                            </div>
	                                                        </div>
	                                                    </div>
	                                                    <div class="u_cbox_upload_image" style="display:none">
	                                                        <span class="u_cbox_upload_image_wrap fileButton browsebutton _cboxImageSelect">
	                                                            <span class="u-cbox-browse-box">
	                                                                <input class="u-cbox-browse-file-input" type="file" name="browse"
	                                                                    accept="image/*" title="이미지 추가">
	                                                            </span>
	                                                            <a href="#" class="u_cbox_upload_thumb_link u-cbox-browse-button"
	                                                                data-log="RPP.add">
	                                                                <span class="u_cbox_upload_thumb_add">이미지 추가</span>
	                                                                <span class="u_cbox_upload_thumb_mask"></span>
	                                                            </a>
	                                                        </span>
	                                                    </div>
	                                                    <div class="u_cbox_upload_sticker" style="display:none"></div>
	                                                    <div class="u_cbox_write_count">
	                                                        <span class="u_vc">현재 입력한 글자수</span>
	                                                        <strong class="u_cbox_count_num">0</strong>
	                                                        /
	                                                        <span class="u_vc">전체 입력 가능한 글자수</span>
	                                                        <span class="u_cbox_write_total">300</span>
	                                                    </div>
	                                                    <div class="u_cbox_upload">
	                                                        <div class="u_cbox_addition">
	                                                            <button type="button" class="u_cbox_btn_upload_sticker"
	                                                                data-action="write#beforeToggleSticker" data-log="RPO.sticker">
	                                                                <span class="u_cbox_ico_upload_sticker"></span>
	                                                                <span class="u_cbox_txt_upload_sticker">스티커</span>
	                                                                <span class="u_cbox_ico_arrow"></span>
	                                                            </button>
	                                                        </div>
	                                                        <button type="button" class="u_cbox_btn_upload" data-action="write#request"
	                                                            data-log="RPC.write#RPC.reply">
	                                                            <span class="u_cbox_ico_upload"></span>
	                                                            <span class="u_cbox_txt_upload">등록</span>
	                                                        </button>
	                                                    </div>
	                                                </div>
	                                            </div>
	                                        </fieldset>
	                                    </form>
	                                </div>
	                                <div class="u_cbox_sticker"></div>
	                            </div>
	                            <div id="cbox_module_wai_u_cbox_content_wrap_tabpanel" tabindex="0" class="u_cbox_content_wrap"
	                                style="outline: 0">
	                                <ul class="u_cbox_list">
		                                <c:choose>
					                  		<c:when test="${fn:length(aList) eq 0}">
					              				<div class="text-center">댓글을 입력하시오!!</div>
					                  		</c:when>
					                   		<c:otherwise>
					                       		<c:forEach items="${aList}" var="aList" varStatus="status">
													 <li class="u_cbox_comment cbox_module__comment_765728306778603670 _user_id_no_3MkTI"
				                                        data-info="commentNo:'765728306778603670',deleted:false,best:false,visible:true,secret:false,manager:false,mine:false,report:undefined,blindReport:false,objectId:'20220806OBHT02022',replyLevel:1,parentCommentNo:'765728306778603670',pick:false">
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
				                                                        <a href="#" class="u_cbox_btn_report" data-action="report#openLayer"
				                                                            data-param="objectId:'20220806OBHT02022',commentNo:'765728306778603670'"
				                                                            data-log="RPC.fold">
				                                                            <span class="u_cbox_ico_bar"></span>
				                                                            <span class="u_cbox_ico_report"></span>
				                                                            <span class="u_cbox_in_report">신고</span>
				                                                        </a>
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
	        </div>
        </form>
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
</body>

</html>