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
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
    <link href="/resources/css/xdmin/article/articleForm.css" rel="stylesheet" type="text/css">
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
                                <li class="px-3">
                                    <div class="d-flex align-items-center">
                                        <!-- Avatar -->
                                        <div class="avatar ps-1 pt-2">
                                            <img class="avatar-img rounded-circle shadow" src="/resources/images/diano.jpg"
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
        <form class="needs-validation" action="/article/articleInst" method="post" name="myForm">
            <div style="height: 80px;"></div>
            <div class="container" style="max-width: 900px;">
                <div class="text-center pb-3">
                    <span class="fs-1 fw-bold">기사 등록</span>
                </div>
                <div class="card ps-5 pe-5 pt-4 pb-4 shadow">
                    <div class="row mb-4">
                        <div class="col-5">
                            <label for="title" class="form-label fw-bold">제목</label>
                            <input type="text" class="form-control" id="title" name="title" value='<c:out value="${item.title }"/>'>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-12 mb-4">
                            <label for="content" class="form-label fw-bold">본문</label>
                            <textarea class="form-control" style="height: 200px;" id="content" name="content" aria-label="content" th:text="${item.content }"></textarea>
                        </div>
                    </div>
                    <div class="row mb-4">
                        <div class="col">
                            <label for="newspaper" class="form-label fw-bold">신문사</label>
                            <input type="text" class="form-control" id="newspaper" name="newspaper" value='<c:out value="${item.newspaper }"/>'>
                        </div>
                        <div class="col">
                            <label for="aAbroadNy" class="form-label fw-bold">해외여부</label>
                            <select id="aAbroadNy" class="form-select form-select fw-bold" name="aAbroadNy" aria-label=".form-select example">
                                <option value="">선택</option>
                                <option value="9" <c:if test="${item.aAbroadNy eq 9 }">selected</c:if>>국내</option>
                                <option value="10" <c:if test="${item.aAbroadNy eq 10 }">selected</c:if>>해외</option>
                            </select>
                        </div>
                        <div class="col">
                            <label for="aEvent" class="form-label fw-bold">종목</label>
                            <select id="aEvent" class="form-select form-select fw-bold" name="aEvent" aria-label=".form-select example">
                                <option value="">선택</option>
                                <option value="10" <c:if test="${item.aEvent eq 10 }">selected</c:if>>야구</option>
                                <option value="11" <c:if test="${item.aEvent eq 11 }">selected</c:if>>축구</option>
                            </select>
                        </div>
                        <div class="col">
                            <label for="aLeague" class="form-label fw-bold">리그</label>
                            <select id="aLeague" class="form-select form-select fw-bold" name="aLeague" aria-label=".form-select example">
                                <option value="" selected>선택</option>
                                <option value="13" <c:if test="${item.aLeague eq 13 }">selected</c:if>>KBO</option>
                                <option value="14" <c:if test="${item.aLeague eq 14 }">selected</c:if>>메이저리그</option>
                                <option value="15" <c:if test="${item.aLeague eq 15 }">selected</c:if>>아메리칸리그</option>
                                <option value="16" <c:if test="${item.aLeague eq 16 }">selected</c:if>>센트럴리그</option>
                                <option value="17" <c:if test="${item.aLeague eq 17 }">selected</c:if>>퍼시픽리그</option>
                                <option value="18" <c:if test="${item.aLeague eq 18 }">selected</c:if>>K리그 1</option>
                                <option value="19" <c:if test="${item.aLeague eq 19 }">selected</c:if>>K리그 2</option>
                                <option value="20" <c:if test="${item.aLeague eq 20 }">selected</c:if>>프리미어리그</option>
                                <option value="21" <c:if test="${item.aLeague eq 21 }">selected</c:if>>라리가</option>
                                <option value="22" <c:if test="${item.aLeague eq 22 }">selected</c:if>>분데스리가</option>
                                <option value="23" <c:if test="${item.aLeague eq 23 }">selected</c:if>>세리에 A</option>
                                <option value="24" <c:if test="${item.aLeague eq 24 }">selected</c:if>>리그 1</option>
                            </select>
                        </div>
                        <div class="col">
                            <label for="reporter" class="form-label fw-bold">기자</label>
                            <input type="text" class="form-control" id="reporter" name="reporter" value='<c:out value="${item.reporter }"/>'>
                        </div>
                    </div>
                    <div class="row mb-4">
                        <div class="col align-items-center">
                            <img src="" id="preview" width="500px;" class="mb-2">
                            <label for="ex_file"></label>
                            <input type="file" id="ex_file" class="form-control" aria-label="file example">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-2">
                            <a class="btn btn-primary btn-sm text-white fw-bold shadow" href="/article/articleList"
                                role="button">취소</a>
                        </div>
                        <div class="col-2 offset-8" align="right">
                            <button class="btn btn-primary btn-sm text-white fw-bold shadow" type="submit" id="btnSave" >등록</button>
                        </div>
                    </div>
                </div>
            </div>
            <div style="height: 50px;"></div>
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
    <script type="text/javascript">
        // Example starter JavaScript for disabling form submissions if there are invalid fields
        (() => {
            'use strict'

            // Fetch all the forms we want to apply custom Bootstrap validation styles to
            const forms = document.querySelectorAll('.needs-validation')

            // Loop over them and prevent submission
            Array.from(forms).forEach(form => {
                form.addEventListener('submit', event => {
                    if (!form.checkValidity()) {
                        event.preventDefault()
                        event.stopPropagation()
                    }

                    form.classList.add('was-validated')
                }, false)
            })
        })()

        // 이미지 미리보기
		const reader = new FileReader();

        reader.onload = (readerEvent) => {
            document.querySelector("#preview").setAttribute("src", readerEvent.target.result);
        };

        document.querySelector("#ex_file").addEventListener("change", (changeEvent) => {

            const imgFile = changeEvent.target.files[0];
            reader.readAsDataURL(imgFile);
            document.getElementById("text").innerHTML = " ";
        })
        
        var goUrlInst = "/article/articleInst";
        var form = "$(form[name=myForm])"
        
        $("#btnSave").on("click", function() {
			form.attr("action", goUrlInst).submit();
		})
    </script>
</body>

</html>