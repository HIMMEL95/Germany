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
    <title>Article Reg Form</title>
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
    <link href="/resources/css/user/sgameView.css" rel="stylesheet" type="text/css">
</head>

<body>
    <!-- start -->
    <header class="navbar-light fixed-top header-static bg-mode align-items-center">
        <!-- 상단 -->
        <nav class="navbar navbar-expand-lg">
            <div class="container px-3 px-xl-5 pt-1">
                <!-- Logo START -->
                <a class="navbar-brand" href="./main_page.html">
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
                            <ul class="dropdown-menu dropdown-animation dropdown-menu-end shadow pt-3" aria-labelledby="profileDropdown">
                                <!-- Profile info -->
                                <li class="px-3 mb-2 border-bottom">
                                    <div class="d-flex align-items-center pb-2">
                                        <!-- Avatar -->
                                        <div class="avatar pt-2">
                                            <img class="avatar-img rounded-circle shadow" src="../../image/diano.jpg" alt="avatar"
                                                style="width: 30px;">
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
        <div class="container" style="max-width: 900px;">
            <div class="card ps-5 pe-5 pt-4 pb-4 mb-3 shadow">
                <div class="row">
                    <div class="col-12 mb-2">
                        <span class="fs-4 fw-bold">최지만 2타수 무안타 후 교체, 탬파베이는 3-2 역전승</span>
                    </div>
                </div>
                <div class="row mb-5">
                    <div class="col-12 mb-2">
                        <span style="font-size: small;"><strong>기사제공</strong> 문화일보</span>
                        <span class="ps-3" style=" font-size: small;"><strong>기사입력</strong> 2022.07.13. 오전 11 : 36 |
                        </span>
                        <span style="font-size: small;"><strong>최종수정</strong> 2022.07.13. 오전 11 : 36</span>
                        <hr>
                    </div>
                    <div class="col-12 mb-3">
                        <img class="pb-2" src="../../image/baseball.jpg" alt="야구"
                            style="width: 100%; height: 300px; float: left;">
                    </div>
                    <div class="col-12">
                        <div>
                            <p class="fs-5">
                                최지만(31·탬파베이 레이스)이 안타 없이 두 타석만 소화하고 교체됐다. 특히 역전 찬스에서 곧바로 교체돼 아쉬움을 남겼다.
                            </p><br>
                            <p class="fs-5">
                                최지만은 13일 오전(한국시간) 미국 플로리다주 세인트피터즈버그 트로피카나필드에서 열린 미국프로야구 메이저리그 보스턴과 경기에 6번 타자(1루수)로 선발 출전해
                                2타수
                                무안타를 남겼다. 최지만의 타율은 0.283에서 0.280으로 하락했다.
                            </p><br>
                            <p class="fs-5">
                                최지만은 2회 말 1사에서 크리스 세일의 슬라이더에 헛스윙 삼진으로 물러났고, 4회 1사 3루에서는
                                세일의 초구를 쳤지만 2루수 땅볼로 아웃됐다. 탬파베이는 0-2로 뒤진 6회 2사 1, 2루에서 최지만 타석 때 보스턴이 좌완 맷 스트람으로 교체하자 곧바로 대타
                                프란시스코
                                메히아를 투입했다.
                            </p><br>
                            <p class="fs-5">
                                스위치 타자인 메히아는 1타점 중전 적시타를 쳤다. 탬파베이는 이어진 1사 1, 2루에서 테일러 윌스가 투수 강습 타구를 날렸고, 상대 실책이 연거푸 나오면서 2점을
                                뽑아
                                3-2로 역전했다. 탬파베이는 1점 차 리드를 끝까지 지켜 이겼다.
                            </p><br>
                        </div>
                        <span><strong>기사제공</strong> 문화일보</span>
                        <p>정세영 기자 (niners@munhwa.com)</p>
                    </div>
                </div>
                <!-- 댓글 -->
                <form method="get">
                    <div class="CommentModule_comp_comment__18nvt CommentModule_is_pc__2froM">
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
                                        <form>
                                            <fieldset>
                                                <legend class="u_vc">댓글 쓰기</legend>
                                                <div class="u_cbox_write">
                                                    <div class="u_cbox_write_inner">
                                                        <div class="u_cbox_write_area">
                                                            <strong class="u_vc">댓글 입력</strong>
                                                            <div class="u_cbox_inbox">
                                                                <textarea title="응원톡" id="cbox_module__write_textarea" class="u_cbox_text"
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
                                                                                    href="../login/loginForm.html">Login</a>
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