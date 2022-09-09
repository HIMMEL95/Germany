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
</head>

<body>
    <!-- start -->
    <header class="navbar-light fixed-top header-static bg-mode align-items-center">
        <!-- 상단 -->
        <nav class="navbar navbar-expand-lg">
            <div class="container px-3 px-xl-5 pt-1">
                <!-- Logo START -->
                <a class="navbar-brand" href="/sportMain">
                    <img class="light-mode-item navbar-brand-item" src="../../image/SPOPIA_white.png" alt="logo"
                        style="width: 90px;">
                </a>
                <!-- Profile START -->
                <div class="dropdown">
                    <ul class="nav flex-nowrap align-items-center ms-sm-3 list-unstyled">
                        <li class="me-2">
                            <a class="p-0" href="#" id="profileDropdown" role="button" data-bs-auto-close="outside"
                                data-bs-display="static" data-bs-toggle="dropdown" aria-expanded="false">
                                <img class="avatar-img rounded-circle" src="../../image/diano.jpg" alt="avatar"
                                    style="width: 30px;">
                            </a>
                            <ul class="dropdown-menu dropdown-animation dropdown-menu-end shadow pt-3"
                                aria-labelledby="profileDropdown">
                                <!-- Profile info -->
                                <li class="px-3 mb-2 border-bottom">
                                    <div class="d-flex align-items-center pb-2">
                                        <!-- Avatar -->
                                        <div class="avatar pt-2">
                                            <img class="avatar-img rounded-circle shadow" src="../../image/diano.jpg"
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
                                    <a class="dropdown-item bg-danger-soft-hover" href="../../seperate/html/seperatePage.html">
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
            <div class="card shadow mb-3">
                <!-- 팀 선택 -->
                <div class="CheerVS_comp_cheer__2Ko7V is_cheer">
                    <div class="CheerVS_cheer_box__1oy_U">
                        <h3 class="blind">당신의 팀을 응원하세요!</h3>
                        <div class="CheerVS_cheer_alert__3ioWG" style="display: block;">
                            <p class="CheerVS_alert_text__1ms91">응원팀을 터치하세요</p>
                        </div>
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
            <form method="get">
                <div class="card CommentModule_comp_comment__18nvt CommentModule_is_pc__2froM p-3">
                    <div class="u_cbox" id="cbox_module">
                        <div class="u_cbox_wrap u_cbox_type_select u_cbox_ko">
                            <div class="u_cbox_head">
                                <h5 class="u_cbox_title">응원톡</h5>
                                <span class="u_cbox_count">34,632</span>
                                <button type="button" class="u_cbox_btn_refresh" data-action="count#refresh" data-log="RPO.refresh">
                                    <span class="u_cbox_ico_refresh"></span>
                                    <span class="u_cbox_txt_refresh">새로고침</span>
                                </button>
                            </div>
                            <div class="u_cbox_write_wrap">
                                <div class="u_cbox_write_box u_cbox_type_logged_out">
                                    <fieldset>
                                        <legend class="u_vc">댓글 쓰기</legend>
                                        <div class="u_cbox_write">
                                            <div class="u_cbox_write_inner">
                                                <div class="u_cbox_write_area">
                                                    <strong class="u_vc">댓글 입력</strong>
                                                    <div class="u_cbox_inbox">
                                                        <textarea title="응원톡" id="cbox_module__write_textarea" class="u_cbox_text"
                                                            rows="3" cols="30" data-log="RPC.input">
                                                                    </textarea>
                                                        <label for="cbox_module__write_textarea" class="u_cbox_guide"
                                                            data-action="write#placeholder" data-param="@event">
                                                            댓글을 작성하려면
                                                            <a href="#" class="u_cbox_link">로그인</a>
                                                            해주세요
                                                        </label>
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
                                </div>
                                <div class="u_cbox_sticker"></div>
                            </div>
                            <div class="u_cbox_notice u_cbox_notice_none" style="display: none;"></div>
                            <div class="u_cbox_refresh_wrap">
                                <strong class="u_vc">자동업데이트 설정</strong>
                                <div class="u_cbox_refresh_area">
                                    <button data-action="refresh#toggle" type="button"
                                        class="u_cbox_btn_refresh_auto u_cbox_btn_refresh_auto_on" title="자동 업데이트"
                                        data-log="RPO.autoon#RPO.autooff">
                                        <span class="u_cbox_bg_wrap">
                                            <span class="u_cbox_bg_left"></span>
                                            <span class="u_cbox_bg_right"></span>
                                        </span>
                                        <span class="u_cbox_ico_refresh_auto">ON</span>
                                    </button>
                                    <span class="u_cbox_txt_refresh">자동 업데이트</span>
                                </div>
                                <div class="u_cbox_refresh_box">
                                    <span class="u_cbox_refresh_time">2 초 후</span>
                                    <button data-action="refresh#request" type="button" class="u_cbox_btn_refresh_man" title="새로고침">
                                        <span class="u_cbox_ico_refresh_man"></span>
                                        <span class="u_cbox_txt_refresh_man">새로고침</span>
                                    </button>
                                </div>
                            </div>
                            <div id="cbox_module_wai_u_cbox_content_wrap_tabpanel" tabindex="0" class="u_cbox_content_wrap"
                                style="outline: 0">
                                <ul class="u_cbox_list">
                                    <li class="u_cbox_comment cbox_module__comment_765728306778603670 _user_id_no_3MkTI"
                                        data-info="commentNo:'765728306778603670',deleted:false,best:false,visible:true,secret:false,manager:false,mine:false,report:undefined,blindReport:false,objectId:'20220806OBHT02022',replyLevel:1,parentCommentNo:'765728306778603670',pick:false">
                                        <div class="u_cbox_comment_box">
                                            <div class="u_cbox_area">
                                                <div class="u_cbox_info">
                                                    <span class="u_cbox_info_main">
                                                        <span class="u_cbox_name">
                                                            <span class="u_cbox_name_area">
                                                                <span class="u_cbox_nick_area">
                                                                    <span class="u_cbox_nick">pkw9****</span>
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
                                                        구종도 없는 정해영좀 쓰지마라 볼때마다 안맞엇던게 신기하다
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
                                    <li class="u_cbox_comment cbox_module__comment_765727927965843622 _user_id_no_27w2P"
                                        data-info="commentNo:'765727927965843622',deleted:false,best:false,visible:true,secret:false,manager:false,mine:false,report:undefined,blindReport:false,objectId:'20220806OBHT02022',replyLevel:1,parentCommentNo:'765727927965843622',pick:false">
                                        <div class="u_cbox_comment_box">
                                            <div class="u_cbox_area">
                                                <div class="u_cbox_info">
                                                    <span class="u_cbox_info_main">
                                                        <span class="u_cbox_name">
                                                            <span class="u_cbox_name_area">
                                                                <span class="u_cbox_nick_area">
                                                                    <span class="u_cbox_nick">KT Wiz</span>
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
                                                        호식이 횽들 정신 안차려? ㅋ 뒷덜미 잡힐라
                                                    </span>
                                                </div>
                                                <div class="u_cbox_info_base">
                                                    <span class="u_cbox_date" data-value="2022-08-07T07:21:45+0900">27분 전</span>
                                                    <span class="u_cbox_work_main">
                                                        <a href="#" class="u_cbox_btn_report" data-action="report#openLayer"
                                                            data-param="objectId:'20220806OBHT02022',commentNo:'765727927965843622'"
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
                                    <li class="u_cbox_comment cbox_module__comment_765726323392905369 _user_id_no_1lOcb"
                                        data-info="commentNo:'765726323392905369',deleted:false,best:false,visible:true,secret:false,manager:false,mine:false,report:undefined,blindReport:false,objectId:'20220806OBHT02022',replyLevel:1,parentCommentNo:'765726323392905369',pick:false">
                                        <div class="u_cbox_comment_box">
                                            <div class="u_cbox_area">
                                                <div class="u_cbox_info">
                                                    <span class="u_cbox_info_main">
                                                        <span class="u_cbox_name">
                                                            <span class="u_cbox_name_area">
                                                                <span class="u_cbox_nick_area">
                                                                    <span class="u_cbox_nick">hand****</span>
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
                                                    <span class="u_cbox_cleanbot_contents" style="display:block;">
                                                        <em>클린봇</em>이 부적절한 표현을 감지한 댓글입니다.
                                                    </span>
                                                    <span class="u_cbox_ico_exclamation" style="display:none;"></span>
                                                    <span class="u_cbox_delete_contents" style="display:none;">내가 차단한 이용자의 댓글입니다.</span>
                                                </div>
                                                <div class="u_cbox_info_base">
                                                    <span class="u_cbox_date" data-value="2022-08-07T06:56:51+0900">52분 전</span>
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
                                    <li class="u_cbox_comment cbox_module__comment_765726310709330030 _user_id_no_3GjHx"
                                        data-info="commentNo:'765726310709330030',deleted:false,best:false,visible:true,secret:false,manager:false,mine:false,report:undefined,blindReport:false,objectId:'20220806OBHT02022',replyLevel:1,parentCommentNo:'765726310709330030',pick:false">
                                        <div class="u_cbox_comment_box">
                                            <div class="u_cbox_area">
                                                <div class="u_cbox_info">
                                                    <span class="u_cbox_info_main">
                                                        <span class="u_cbox_name">
                                                            <span class="u_cbox_name_area">
                                                                <span class="u_cbox_nick_area">
                                                                    <span class="u_cbox_nick">이게무슨일</span>
                                                                </span>
                                                            </span>
                                                        </span>
                                                    </span>
                                                    <span class="u_cbox_info_sub"></span>
                                                </div>
                                                <div class="u_cbox_pic">
                                                    <span class="u_cbox_pic_wrap">
                                                        <img src="https://sports-phinf.pstatic.net/team/kbo/default/HT.png?type=f108_108"
                                                            class="u_cbox_img_contents" alt="댓글 이미지"
                                                            onerror="cbox.Util.leave(this, '.u_cbox_pic');">
                                                        <span class="u_cbox_pic_mask"></span>
                                                    </span>
                                                </div>
                                                <div class="u_cbox_text_wrap">
                                                    <span class="u_cbox_contents" data-lang="ko">
                                                        무쌍이 고객센터 민원 넣은다니까 쫄려서 만지셨잖아요로 닉변했네?
                                                    </span>
                                                </div>
                                                <div class="u_cbox_info_base">
                                                    <span class="u_cbox_date" data-value="2022-08-07T06:56:40+0900">52분 전</span>
                                                    <span class="u_cbox_work_main">
                                                        <a href="#" class="u_cbox_btn_report" data-action="report#openLayer"
                                                            data-param="objectId:'20220806OBHT02022',commentNo:'765726310709330030'"
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
                                    <li class="u_cbox_comment cbox_module__comment_765726323392905369 _user_id_no_1lOcb"
                                        data-info="commentNo:'765726323392905369',deleted:false,best:false,visible:true,secret:false,manager:false,mine:false,report:undefined,blindReport:false,objectId:'20220806OBHT02022',replyLevel:1,parentCommentNo:'765726323392905369',pick:false">
                                        <div class="u_cbox_comment_box">
                                            <div class="u_cbox_area">
                                                <div class="u_cbox_info">
                                                    <span class="u_cbox_info_main">
                                                        <span class="u_cbox_name">
                                                            <span class="u_cbox_name_area">
                                                                <span class="u_cbox_nick_area">
                                                                    <span class="u_cbox_nick">hand****</span>
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
                                                    <span class="u_cbox_cleanbot_contents" style="display:block;">
                                                        <em>클린봇</em>이 부적절한 표현을 감지한 댓글입니다.
                                                    </span>
                                                    <span class="u_cbox_ico_exclamation" style="display:none;"></span>
                                                    <span class="u_cbox_delete_contents" style="display:none;">내가 차단한 이용자의 댓글입니다.</span>
                                                </div>
                                                <div class="u_cbox_info_base">
                                                    <span class="u_cbox_date" data-value="2022-08-07T06:56:51+0900">52분 전</span>
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
                                    <li class="u_cbox_comment cbox_module__comment_765726091733106739 _user_id_no_1p8oq"
                                        data-info="commentNo:'765726091733106739',deleted:false,best:false,visible:true,secret:false,manager:false,mine:false,report:undefined,blindReport:false,objectId:'20220806OBHT02022',replyLevel:1,parentCommentNo:'765726091733106739',pick:false">
                                        <div class="u_cbox_comment_box">
                                            <div class="u_cbox_area">
                                                <div class="u_cbox_info">
                                                    <span class="u_cbox_info_main">
                                                        <span class="u_cbox_name">
                                                            <span class="u_cbox_name_area">
                                                                <span class="u_cbox_nick_area">
                                                                    <span class="u_cbox_nick">rkwkqlgod</span>
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
                                                        감독 이러다가 책임지고 사퇴하겠다하겠지. 정해영투수는 돈과 빽이 좋은가봐. 몇년를 말아먹어도 나오는거 보면. 프로야구?? 프로 뜻이나
                                                        공부하셔</span>
                                                </div>
                                                <div class="u_cbox_info_base">
                                                    <span class="u_cbox_date" data-value="2022-08-07T06:53:16+0900">55분 전</span>
                                                    <span class="u_cbox_work_main">
                                                        <a href="#" class="u_cbox_btn_report" data-action="report#openLayer"
                                                            data-param="objectId:'20220806OBHT02022',commentNo:'765726091733106739'"
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
                                    <li class="u_cbox_comment cbox_module__comment_765726323392905369 _user_id_no_1lOcb"
                                        data-info="commentNo:'765726323392905369',deleted:false,best:false,visible:true,secret:false,manager:false,mine:false,report:undefined,blindReport:false,objectId:'20220806OBHT02022',replyLevel:1,parentCommentNo:'765726323392905369',pick:false">
                                        <div class="u_cbox_comment_box">
                                            <div class="u_cbox_area">
                                                <div class="u_cbox_info">
                                                    <span class="u_cbox_info_main">
                                                        <span class="u_cbox_name">
                                                            <span class="u_cbox_name_area">
                                                                <span class="u_cbox_nick_area">
                                                                    <span class="u_cbox_nick">hand****</span>
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
                                                    <span class="u_cbox_cleanbot_contents" style="display:block;">
                                                        <em>클린봇</em>이 부적절한 표현을 감지한 댓글입니다.
                                                    </span>
                                                    <span class="u_cbox_ico_exclamation" style="display:none;"></span>
                                                    <span class="u_cbox_delete_contents" style="display:none;">내가 차단한 이용자의 댓글입니다.</span>
                                                </div>
                                                <div class="u_cbox_info_base">
                                                    <span class="u_cbox_date" data-value="2022-08-07T06:56:51+0900">52분 전</span>
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
                                    <li class="u_cbox_comment cbox_module__comment_765726323392905369 _user_id_no_1lOcb"
                                        data-info="commentNo:'765726323392905369',deleted:false,best:false,visible:true,secret:false,manager:false,mine:false,report:undefined,blindReport:false,objectId:'20220806OBHT02022',replyLevel:1,parentCommentNo:'765726323392905369',pick:false">
                                        <div class="u_cbox_comment_box">
                                            <div class="u_cbox_area">
                                                <div class="u_cbox_info">
                                                    <span class="u_cbox_info_main">
                                                        <span class="u_cbox_name">
                                                            <span class="u_cbox_name_area">
                                                                <span class="u_cbox_nick_area">
                                                                    <span class="u_cbox_nick">hand****</span>
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
                                                    <span class="u_cbox_cleanbot_contents" style="display:block;">
                                                        <em>클린봇</em>이 부적절한 표현을 감지한 댓글입니다.
                                                    </span>
                                                    <span class="u_cbox_ico_exclamation" style="display:none;"></span>
                                                    <span class="u_cbox_delete_contents" style="display:none;">내가 차단한 이용자의 댓글입니다.</span>
                                                </div>
                                                <div class="u_cbox_info_base">
                                                    <span class="u_cbox_date" data-value="2022-08-07T06:56:51+0900">52분 전</span>
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
                                    <li class="u_cbox_comment cbox_module__comment_765726323392905369 _user_id_no_1lOcb"
                                        data-info="commentNo:'765726323392905369',deleted:false,best:false,visible:true,secret:false,manager:false,mine:false,report:undefined,blindReport:false,objectId:'20220806OBHT02022',replyLevel:1,parentCommentNo:'765726323392905369',pick:false">
                                        <div class="u_cbox_comment_box">
                                            <div class="u_cbox_area">
                                                <div class="u_cbox_info">
                                                    <span class="u_cbox_info_main">
                                                        <span class="u_cbox_name">
                                                            <span class="u_cbox_name_area">
                                                                <span class="u_cbox_nick_area">
                                                                    <span class="u_cbox_nick">hand****</span>
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
                                                    <span class="u_cbox_cleanbot_contents" style="display:block;">
                                                        <em>클린봇</em>이 부적절한 표현을 감지한 댓글입니다.
                                                    </span>
                                                    <span class="u_cbox_ico_exclamation" style="display:none;"></span>
                                                    <span class="u_cbox_delete_contents" style="display:none;">내가 차단한 이용자의 댓글입니다.</span>
                                                </div>
                                                <div class="u_cbox_info_base">
                                                    <span class="u_cbox_date" data-value="2022-08-07T06:56:51+0900">52분 전</span>
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
                                    <li class="u_cbox_comment cbox_module__comment_765723804411363477 _user_id_no_16S6N"
                                        data-info="commentNo:'765723804411363477',deleted:false,best:false,visible:true,secret:false,manager:false,mine:false,report:undefined,blindReport:false,objectId:'20220806OBHT02022',replyLevel:1,parentCommentNo:'765723804411363477',pick:false">
                                        <div class="u_cbox_comment_box">
                                            <div class="u_cbox_area">
                                                <div class="u_cbox_info">
                                                    <span class="u_cbox_info_main">
                                                        <span class="u_cbox_name">
                                                            <span class="u_cbox_name_area">
                                                                <span class="u_cbox_nick_area">
                                                                    <span class="u_cbox_nick">대천사</span>
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
                                                        욕 나올수밖에..돌감독 사퇴해라
                                                    </span>
                                                </div>
                                                <div class="u_cbox_info_base">
                                                    <span class="u_cbox_date" data-value="2022-08-07T06:17:44+0900">1시간 전</span>
                                                    <span class="u_cbox_work_main">
                                                        <a href="#" class="u_cbox_btn_report" data-action="report#openLayer"
                                                            data-param="objectId:'20220806OBHT02022',commentNo:'765723804411363477'"
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
                    <div class="Toast_comp_toast__1Tz2f">
                        <p class="Toast_text__2Q22E">더보기해서 자동 업데이트가 멈췄습니다.</p>
                    </div>
                </div>
            </form>
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
                        <img src="../../image/SPOPIA1.png" alt="logo" style="width: 45px;">
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