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
    <link rel="shortcut icon" href="https://cdn-icons-png.flaticon.com/512/6646/6646786.png" type="image/x-icon">
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
                    <img class="light-mode-item navbar-brand-item" src="/resources/images/SPOPIA_white.png" alt="logo"
                        style="width: 90px;">
                </a>
                <!-- Profile START -->
                <c:choose>
                	<c:when test="${empty sessName }">
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
		                                <c:choose>
		                               		<c:when test="${empty sessImg }">
			                                	<img class="avatar-img rounded-circle" src="/resources/images/diano.jpg" alt="avatar" style="width: 35px;">
		                               		</c:when>
		                               		<c:otherwise>
			                                    <img class="avatar-img rounded-circle" src="${sessImg }" alt="avatar" style="width: 35px;">		                                		
		                               		</c:otherwise>
		                               	</c:choose>
		                            </a>
		                            <ul class="dropdown-menu dropdown-animation dropdown-menu-end shadow pt-3" aria-labelledby="profileDropdown">
		                                <!-- Profile info -->
		                                <li class="px-3 mb-2 border-bottom">
		                                    <div class="d-flex align-items-center pb-2">
		                                        <!-- Avatar -->
		                                        <div class="avatar pt-2">
		                                            <c:choose>
		                                        		<c:when test="${empty sessImg }">
		                                        			<img class="avatar-img rounded-circle" src="/resources/images/diano.jpg" alt="avatar" style="width: 35px;">
		                                        		</c:when>
		                                        		<c:otherwise>
				                                            <img class="avatar-img rounded-circle shadow" src="${sessImg }" alt="avatar" style="width: 35px;">
		                                        		</c:otherwise>
		                                        	</c:choose>
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
				                                    <button type="button" class="dropdown-item bg-danger-soft-hover" id="signOutBtn" >
				                                        <i class="fa-solid fa-power-off me-2"></i>
				                                        Sign Out
				                                    </button>
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
				                                    <button type="button" class="dropdown-item bg-danger-soft-hover" id="signOutBtn" >
				                                        <i class="fa-solid fa-power-off me-2"></i>
				                                        Sign Out
				                                    </button>
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
        <nav class="navbar navbar-expand-lg bg-white">
        	<div class="container">
       			<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
       				<span class="navbar-toggler-icon"></span>
       			</button>
			   	<div class="collapse navbar-collapse" id="navbarSupportedContent">
			   		<ul class="navbar-nav me-auto mb-2 ms-4 mb-lg-0">
			   			<li class="nav-item">
			   				<a class="nav-link active" aria-current="page" href="/sportMain">스포츠홈</a>
		   				</li>
	   					<!-- <li class="nav-item">
	   						<a class="nav-link" href="#">야구</a>
	   					</li>
	   					<li class="nav-item">
	   						<a class="nav-link" href="#">해외야구</a>
	   					</li>
	   					<li class="nav-item">
	   						<a class="nav-link" href="#">축구</a>
	   					</li>
	   					<li class="nav-item">
	   						<a class="nav-link" href="#">해외축구</a>
	   					</li> -->
   					</ul>
				</div>
			</div>
		</nav>
    </header>

    <main>
    	<form method="post" name="myForm" id="myForm">
          	<!-- *Vo.jsp s -->
			<%@include file="articleVo.jsp"%>		<!-- #-> -->
			<!-- *Vo.jsp e -->
	        <div style="height: 120px;"></div>
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
	                                <span class="u_cbox_count">Total : ${cVo.totalRows }</span>
	                                <button type="button" class="u_cbox_btn_refresh" onclick="refresh()">
	                                    <span class="u_cbox_ico_refresh"></span>
	                                    <span class="u_cbox_txt_refresh">새로고침</span>
	                                </button>
	                            </div>
                                <c:choose>
	                               	<c:when test="${empty sessSeq}">
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
																		<textarea title="댓글" id="comment"  class="u_cbox_text" rows="3" cols="30"></textarea>
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
						                   				<c:when test="${sessSeq eq comment.createdBy }">
						                   					<input type="hidden" name="seq" value="<c:out value="${comment.seq}"/>"/>
						                   					<li class="u_cbox_comment cbox_module__comment_765728306778603670 _user_id_no_3MkTI">
						                                        <div class="u_cbox_comment_box">
						                                            <div class="u_cbox_area">
						                                                <div class="u_cbox_info">
						                                                    <span class="u_cbox_info_main">
						                                                        <span class="u_cbox_name">
						                                                            <span class="u_cbox_name_area">
						                                                                <span class="u_cbox_nick_area">
						                                                                    <span class="u_cbox_nick"><c:out value="${comment.id }"/> ${comment.seq }</span>
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
						                                                        <button type="button" class="u_cbox_btn_report" data-bs-toggle="modal" data-bs-target="#staticBackdrop" data-id="${comment.seq }" onclick="test(${comment.seq })">
						                                                            <span class="u_cbox_ico_bar"></span>
						                                                            <span class="u_cbox_ico_report"></span>
						                                                            <span class="u_cbox_in_report"><i class="fa-solid fa-trash"></i></span>
						                                                        </button>
						                                                        <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
																					<input type="hidden" name="acSeq" value=""/>
																					<div class="modal-dialog">
																						<div class="modal-content">
																							<div class="modal-header">
																				        		<h1 class="modal-title fs-5" id="staticBackdropLabel">Modal title</h1>
																				        		<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">
																				        			<i class="fa-solid fa-xmark" style="font-size: 20px; margin-right: 5px;"></i>
																				        		</button>
																							</div>
																							<div class="modal-body">
																							 정말로 삭제하시겠습니까?
																							</div>
																							<div class="modal-footer">
																						        <button type="button" class="btn" data-bs-dismiss="modal" style="margin-right: 10px;">Close</button>
																						        <button type="button" class="btn" style="margin-right: 10px;" onclick="commentUelete()">삭제</button>
																							</div>
																					    </div>
																					</div>
																				</div>
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
	                            <!-- <div class="u_cbox_paginate">
	                                <a href="#" class="u_cbox_btn_more" data-action="page#more" data-log="RPC.more">
	                                    <span class="u_cbox_more_wrap">
	                                        <span class="u_cbox_box_more">
	                                            <span class="u_cbox_page_more">더보기</span>
	                                            <span class="u_cbox_ico_more"></span>
	                                        </span>
	                                    </span>
	                                </a>
	                            </div> -->
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
    <script src="https://code.jquery.com/jquery-3.6.0.js" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <!-- <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script> -->
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script type="text/javascript">
		$("#signOutBtn").on("click", function() {
			$.ajax({
				type: "POST"
				,url: "/logoutProc"
				,data: {}
				,success : function(response) {
					if (response.rt == "success") {
						window.location.href = "/";
					} else if (response.rt == "kakao") {
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
    
    	var goUrlLogin = "/userLogin";
    	var goUrlInst = "/articleInsert";
    	var form = $("#myForm");
    	
    	var seq = $("input[name=seq]");
    	
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
   				,url: "articleInsert"
   				/* ,data : $("#formLogin").serialize() */
   				,data : { "comment" : $("#comment").val(), "mSeq" : $("input[name=mSeq]").val(), "aSeq" : $("input[name=aSeq]").val()}
   				,success: function(response) {
   					if (response.rt == "success") {
   						location.href = "/articleView?aSeq="+ $("input[name=aSeq]").val();
   					} else {
   						alert("댓글을 입력하시오!!");
   					}
   				}
   				,error : function(jqXHR, textStatus, errorThrown){
   					alert("ajaxUpdate " + jqXHR.textStatus + " : " + jqXHR.errorThrown);
   				}
   			});
		}
		
		function commentUelete() {
			
			$.ajax({
   				async: true 
   				,cache: false
   				,type: "post"
   				/* ,dataType:"json" */
   				,url: "articleCommentUelete"
   				/* ,data : $("#formLogin").serialize() */
   				,data : {"seq" : $("input[name=acSeq]").val(), "mSeq" : $("input[name=mSeq]").val(), "aSeq" : $("input[name=aSeq]").val()}
   				,success: function(response) {
   					if (response.rt == "success") {
   						location.href = "/articleView?aSeq="+ $("input[name=aSeq]").val();
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
   				,url: "articleRefresh"
   				/* ,data : $("#formLogin").serialize() */
   				,data : {"aSeq" : $("input[name=aSeq]").val()}
   				,success: function(response) {
   					if (response.rt != "success") {
   						location.href = "/articleView?aSeq="+ $("input[name=aSeq]").val();
   					} 
   				}
   				,error : function(jqXHR, textStatus, errorThrown){
   					alert("ajaxUpdate " + jqXHR.textStatus + " : " + jqXHR.errorThrown);
   				}
   			});
		}
		
		test = function(seq) {
			$("input[name=acSeq]").val(seq);
		}

    </script>
</body>

</html>