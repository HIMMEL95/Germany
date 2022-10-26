<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="rb" uri="http://www.springframework.org/tags" %>

<jsp:useBean id="CodeServiceImpl" class="com.spopia.infra.modules.code.CodeServiceImpl"/>

<!doctype html>
<html lang="ko" data-theme="light">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Article Reg Form</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
    <link href="/resources/css/xdmin/article/articleForm.css" rel="stylesheet" type="text/css">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
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
                <div class="dropdown">
                    <ul class="nav flex-nowrap align-items-center ms-sm-3 list-unstyled">
                        <li class="me-2">
                            <a class="p-0" href="#" id="profileDropdown" role="button" data-bs-auto-close="outside"
                                data-bs-display="static" data-bs-toggle="dropdown" aria-expanded="false">
                                <img class="avatar-img rounded-circle" src="/resources/images/diano.jpg" alt="avatar"
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
                                            <a class="fs-6 fw-bold" href="/member/memberUView?seq=${sessSeq }"><c:out value="${sessName }"/> </a>
                                            <p class="small m-0"><c:out value="${sessEmail }"/> </p>
                                        </div>
                                    </div>
                                    <hr>
                                </li>
                                <!-- Links -->
                                <li>
                                    <a class="dropdown-item" href="/member/memberUView?seq=${sessSeq }">
                                        <i class="fa-solid fa-user me-2"></i>
                                        Edit Profile
                                    </a>
                                </li>
                                <!-- <li>
                                    <a class="dropdown-item" href="#">
                                        <i class="fa-solid fa-gear me-2"></i>
                                        Account Settings
                                    </a>
                                </li> -->
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
        <form method="post" name="myForm" id="myForm" autocomplete="off" enctype="multipart/form-data">
        	<!-- *Vo.jsp s -->
			<%@include file="articleVo.jsp"%>		<!-- #-> -->
			<!-- *Vo.jsp e -->
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
                            <textarea class="form-control" style="height: 200px;" id="content" name="content" aria-label="content">${item.content }</textarea>
                        </div>
                    </div>
                    <div class="row mb-4">
                        <div class="col">
                            <label for="newspaper" class="form-label fw-bold">신문사</label>
                            <input type="text" class="form-control" id="newspaper" name="newspaper" value='<c:out value="${item.newspaper }"/>'>
                        </div>
                        <div class="col">
                        	<c:set var="listCodeAbroad" value="${CodeServiceImpl.selectListCachedCode('4') }" />
                            <label for="aAbroadNy" class="form-label fw-bold">해외여부</label>
                            <select id="aAbroadNy" class="form-select form-select fw-bold" name="aAbroadNy" aria-label=".form-select example" onchange="setComboBox1(this)">
                                <option value="">선택</option>
                                <c:choose>
                                	<c:when test="${empty item.aSeq }">
                                		<c:forEach items="${listCodeAbroad}" var="listAbroad" varStatus="statusAborad">
											<option value="${listAbroad.ccSeq }" <c:if test="${item.aAbroadNy eq listAbroad.ccSeq}">selected</c:if>><c:out value="${listAbroad.ifccName }"/></option>
										</c:forEach>
                                	</c:when>
                                	<c:otherwise>
                                		<c:forEach items="${listCodeAbroad }" var="listAbroad" varStatus="statusAbroad">
                                			<option value="${listAbroad.ccSeq }" <c:if test="${item.aAbroadNy eq listAbroad.ccSeq}">selected</c:if>><c:out value="${listAbroad.ifccName }"/></option>
                                		</c:forEach>
                                	</c:otherwise>
                                </c:choose>
                            </select>
                        </div>
                        <div class="col">
                        	<c:set var="listCodeEvent" value="${CodeServiceImpl.selectListCachedCode('5') }" />
                            <label for="aEvent" class="form-label fw-bold">종목</label>
                            <select id="aEvent" class="form-select form-select fw-bold" name="aEvent" aria-label=".form-select example" onchange="setComboBox2(this)">
                                <option value="">선택</option>
                             	<c:choose>
                                	<c:when test="${empty item.aSeq }">
                                		<c:forEach items="${listCodeEvent}" var="listEvent" varStatus="statusEvent">
											<option class="select" value="${listEvent.ccSeq }" <c:if test="${item.aEvent eq listEvent.ccSeq}">selected</c:if>><c:out value="${listEvent.ifccName }"/></option>
										</c:forEach>
                                	</c:when>
                                	<c:otherwise>
                                		<c:forEach items="${listCodeEvent}" var="listEvent" varStatus="statusEvent">
											<option class="select" value="${listEvent.ccSeq }" <c:if test="${item.aEvent eq listEvent.ccSeq}">selected</c:if>><c:out value="${listEvent.ifccName }"/></option>
										</c:forEach>
                                	</c:otherwise>
                                </c:choose>
                            </select>
                        </div>
                        <div class="col">
                        	<c:set var="listCodeLeague" value="${CodeServiceImpl.selectListCachedCode('6') }" />
                            <label for="aLeague" class="form-label fw-bold">리그</label>
                            <select id="aLeague" class="form-select form-select fw-bold" name="aLeague" aria-label=".form-select example">
                                <option value="" selected>선택</option>
                                <c:forEach items="${listCodeLeague}" var="listLeague" varStatus="statusLeague">
									<option class="select1" value="${listLeague.ccSeq }" <c:if test="${item.aLeague eq listLeague.ccSeq}">selected</c:if>><c:out value="${listLeague.ifccName }"/></option>
								</c:forEach>
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
                            <label for="articleImage"></label>
                            <input type="file" id="articleImage" name="articleImage" multiple="multiple" class="form-control" aria-label="file example" onChange="upload('articleImage', 1, 0, 1, 0, 0, 1);">
                        </div>
                    </div>
                    <c:choose>
                    	<c:when test="${empty vo.aSeq }">
                    		<div class="row align-items-center">
		                        <div class="col-1">
		                            <button class="border-0 btn btn-sm bg-secondary shadow" id="btnList" type="button">
		                                <i class="fa-solid fa-bars" style="color: white;"></i>
		                            </button> 
		                        </div>
		                        <div class="col-3 offset-8" align="right">
		                            <button id="btnSave" class="border-0 btn btn-sm bg-success shadow" type="button">
		                                <i class="fa-regular fa-bookmark" style="color: white;"></i>
		                            </button>
		                        </div>
		                    </div>
                    	</c:when>
                    	<c:otherwise>
                    		<div class="row align-items-center">
		                        <div class="col-1">
		                            <button class="border-0 btn btn-sm bg-secondary shadow" id="btnList" type="button">
		                                <i class="fa-solid fa-bars" style="color: white;"></i>
		                            </button> 
		                        </div>
		                        <div class="col-3 offset-8" align="right">
		                            <button id="btnUel" value="Uel" class="border-0 btn btn-sm bg-danger shadow" type="button" data-bs-toggle="modal"
		                                data-bs-target="#deleteModal">
		                                <i class="fa-solid fa-xmark" style="color: white;"></i>
		                            </button>
		                            <div class="modal fade" id="deleteModal" data-bs-backdrop="static" data-bs-keyboard="false"
		                                tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
		                                <div class="modal-dialog">
		                                    <div class="modal-content">
		                                        <div class="modal-header">
		                                            <h5 class="modal-title fw-bold" id="staticBackdropLabel">게시물 삭제</h5>
		                                            <button type="button" class="btn-close" data-bs-dismiss="modal"
		                                                aria-label="Close"></button>
		                                        </div>
		                                        <div class="modal-body fs-6">
		                                       		선택하신 게시물을 정말로 삭제하시겠습니까?
		                                        </div>
		                                        <div class="modal-footer">
		                                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
		                                            <button id="delBtn" type="button" class="btn btn-primary">삭제</button>
		                                        </div>
		                                    </div>
		                                </div>
		                            </div>
		                            <button id="btnDel" value="Del" class="border-0 btn btn-sm bg-danger shadow" type="button" data-bs-toggle="modal"
		                                data-bs-target="#deleteModal">
		                                <i class="fa-solid fa-trash-can" style="color: white;"></i>
		                            </button>
		                            <button id="btnSave" class="border-0 btn btn-sm bg-success shadow" type="button">
		                                <i class="fa-regular fa-bookmark" style="color: white;"></i>
		                            </button>
		                        </div>
		                    </div>
                    	</c:otherwise>
                    </c:choose>
                </div>
            </div>
            <div style="height: 50px;"></div>
        </form>
        <form name="formVo" id="formVo" method="post">
			<!-- *Vo.jsp s -->
			<%@include file="articleVo.jsp"%>		<!-- #-> -->
			<!-- *Vo.jsp e -->
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
    <script type="text/javascript">
	 	// 이미지 미리보기
		const reader = new FileReader();
	
	    reader.onload = (readerEvent) => {
	        document.querySelector("#preview").setAttribute("src", readerEvent.target.result);
	    };
	
	    document.querySelector("#articleImage").addEventListener("change", (changeEvent) => {
	
	        const imgFile = changeEvent.target.files[0];
	        reader.readAsDataURL(imgFile);
	    })	
    
    	var goUrlList = "/article/articleList";
        var goUrlInst = "/article/articleInst";
        var goUrlUpdt = "/article/articleUpdt";
        var goUrlUel = "/article/articleUele";
        var goUrlDel = "/article/articleDele";
        
        var seq = $("input:hidden[name=aSeq]");
        var form = $("#myForm");
        var formVo = $("form[name=formVo]");
        
        $("#btnSave").on("click", function() {
        	if (seq.val() == "0" || seq.val() == "") {
        		form.attr("action", goUrlInst).submit();
        	} else {
        		form.attr("action", goUrlUpdt).submit();
        	}
		});
        
        $("#btnList").on("click", function(){
    		formVo.attr("action", goUrlList).submit();
    	});        

		$("#btnUel").on("click", function() {
			DelValidation("#delBtn", goUrlUel, "선택하신 게시물을 삭제하시겠습니까?");
		})
		
		$("#btnDel").on("click", function() {
			DelValidation("#delBtn", goUrlDel, "선택하신 게시물을 진짜로 삭제하시겠습니까?");		
		})
		
		DelValidation = function(confirm, url, msg) {
			$(".modal-body").html(msg);
			$(confirm).on("click", function() {
				form.attr("action", url).submit();
			})
		}
		
		upload = function(objName, seq, allowedMaxTotalFileNumber, allowedExtdiv, allowedEachFileSize, allowedTotalFileSize, uiType) {

			const MAX_EACH_FILE_SIZE = 5 * 1024 * 1024;		//	5M
			const MAX_TOTAL_FILE_SIZE = 25 * 1024 * 1024;	//	25M
			const MAX_TOTAL_FILE_NUMBER = 5;				//	5

			function kbToMb(bytes) {
			    var e = Math.floor(Math.log(bytes)/Math.log(1024));

			    if(e == "-Infinity") return 0;
			    else return (bytes/Math.pow(1024, Math.floor(e))).toFixed(2).slice(0, -3);
			}
			
			checkUploadedTotalFileNumber = function(obj, allowedMaxTotalFileNumber, fileCount) {
				if(allowedMaxTotalFileNumber < fileCount){
					alert("전체 파일 갯수는 "+ allowedMaxTotalFileNumber +"개 까지 허용됩니다.");
//					$("#file"+seq).val("");
//					obj.val("");
					return false;
				}
			}


			checkUploadedExt = function(objName, seq, div) {
				var ext = objName.split('.').pop().toLowerCase();
				var extArray = eval("extArray" + div);
				
				if(extArray.indexOf(ext) == -1) {
					alert("허용된 확장자가 아닙니다.");
//					$("#file"+seq).val("");
					return false;
				}
			}


			checkUploadedEachFileSize = function(obj, seq, allowedEachFileSize) {

				if(obj.size > allowedEachFileSize){
					alert("각 첨부 파일 사이즈는 "+kbToMb(allowedEachFileSize)+"MB 이내로 등록 가능합니다.");
					$("#file"+seq).val("");
					return false;
				}
			}


			checkUploadedTotalFileSize = function(seq, totalSize, allowedTotalFileSize) {
				if(totalSize > allowedTotalFileSize){
					alert("전체 용량은 "+kbToMb(allowedTotalFileSize)+"M를 넘을 수 없습니다.");
					$("#file"+seq).val("");
					return false;
				}
			}

//			objName 과 seq 는 jsp 내에서 유일 하여야 함.
//			memberProfileImage: 1
//			memberImage: 2
//			memberFile : 3
			
			var extArray1 = new Array();
			extArray1 = ["jpg","gif","png","jpeg","bmp","tif","jfif"];
			
			var extArray2 = new Array();
			extArray2 = ["txt","pdf","hwp","doc","docx","xls","xlsx","ppt","pptx","html"];
			
			var totalFileSize = 0;
			var obj = $("#" + objName +"")[0].files;	
			var fileCount = obj.length;
			
			allowedMaxTotalFileNumber = allowedMaxTotalFileNumber == 0 ? MAX_TOTAL_FILE_NUMBER : allowedMaxTotalFileNumber;
			allowedEachFileSize = allowedEachFileSize == 0 ? MAX_EACH_FILE_SIZE : allowedEachFileSize;
			allowedTotalFileSize = allowedTotalFileSize == 0 ? MAX_TOTAL_FILE_SIZE : allowedTotalFileSize;
			
			if(checkUploadedTotalFileNumber(obj, allowedMaxTotalFileNumber, fileCount) == false) { return false; } 
			alert("총 " + fileCount + "개 파일을 선택하셨습니다.")

			for (var i = 0 ; i < fileCount ; i++) {
				if(checkUploadedExt($("#" + objName +"")[0].files[i].name, seq, allowedExtdiv) == false) { return false; }
				if(checkUploadedEachFileSize($("#" + objName +"")[0].files[i], seq, allowedEachFileSize) == false) { return false; }

				totalFileSize += $("#" + objName +"")[0].files[i].size;
			}

			if(checkUploadedTotalFileSize(seq, totalFileSize, allowedTotalFileSize) == false) { return false; }
			
			if (uiType == 1) {
				$("#ulFile" + seq).children().remove();
				
				for (var i = 0 ; i < fileCount ; i++) {
					addUploadLi(seq, i, $("#" + objName +"")[0].files[i].name);
				}
			} else if(uiType == 2) {
				$("#ulFile" + seq).children().remove();
				
				for (var i = 0 ; i < fileCount ; i++) {
					addUploadLi(seq, i, $("#" + objName +"")[0].files[i].name);
				}
			} else if (uiType == 3) {
				var fileReader = new FileReader();
				 fileReader.readAsDataURL($("#" + objName +"")[0].files[0]);
				
				 fileReader.onload = function () {
					 $("#imgProfile").attr("src", fileReader.result);		
				 }		
			} else {
				return false;
			}
			return false;
		}
		
		function setComboBox1(o){
			var code = o.value;
			
			$("option").remove(".select");
			$("option").remove(".select1");

   			$.ajax({
   				async: true 
   				,cache: false
   				,type: "post"
   				/* ,dataType:"json" */
   				,url: "/article/abroad"
   				/* ,data : $("#formLogin").serialize() */
   				,data : { "aAbroadNy" : code }
   				,success: function(response) {
   					   					
   					<c:set var="listCodeEvent" value="${CodeServiceImpl.selectListCachedCode('5') }" />
					var arr = new Array();
					<c:forEach items="${listCodeEvent}" var="listEvent" varStatus="statusEvent">
						arr.push({
							num : "${listEvent.ccSeq}"
							,name : "${listEvent.ifccName}"
						});
					</c:forEach>
					for(var i=0; i<response.event.length; i++){
						 var list = response.event[i];
						 var num =0;
						 for(var j=0; j<arr.length; j++){
							 if(list.event == arr[j].num){
						 		 list.event = arr[j].name;
						 		 num = arr[j].num
							 }
						 }
						 $("#aEvent").append('<option class="select" value="' + num +'" <c:if test="${'+ list.event +'eq '+ num + ' }">selected</c:if>>'+ list.event+'</option>')
					}                                                                                                                                                                              
   				}
   				,error : function(jqXHR, textStatus, errorThrown){
   					alert("ajaxUpdate " + jqXHR.textStatus + " : " + jqXHR.errorThrown);
   				}
   			});
	 
		}
		
		function setComboBox2(o){
			var code = o.value;
			var abroadNy = $("#aAbroadNy").val();

			$("option").remove(".select1");
			
   			$.ajax({
   				async: true 
   				,cache: false
   				,type: "post"
   				/* ,dataType:"json" */
   				,url: "/article/event"
   				/* ,data : $("#formLogin").serialize() */
   				,data : { "aEvent" : code, "aAbroadNy" : abroadNy }
   				,success: function(response) {
   					
   					<c:set var="listCodeLeague" value="${CodeServiceImpl.selectListCachedCode('6') }" />
					var arr = new Array();
					<c:forEach items="${listCodeLeague}" var="listLeague" varStatus="statusLeague">
						arr.push({
							num : "${listLeague.ccSeq}"
							,name : "${listLeague.ifccName}"
						});
					</c:forEach>
					for(var i=0; i<response.league.length; i++){
						 var list = response.league[i];
						 var num =0;
						 for(var j=0; j<arr.length; j++){
							 if(list.league == arr[j].num){
						 		 list.league = arr[j].name;
						 		 num = arr[j].num
							 }
						 }
						 $("#aLeague").append('<option class="select1" value="' + num +'" <c:if test="${'+ list.league +'eq '+ num + ' }">selected</c:if>>'+ list.league+'</option>')
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