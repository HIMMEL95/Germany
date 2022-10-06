<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="rb" uri="http://www.springframework.org/tags" %>

<!doctype html>
<html lang="ko">

<head>
	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>회원정보</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
</head>

<body>
	<form name="form1" method="get" action="">
		<div>
			<select class="code1" id="abroadNy" name="abroadNy" onchange="setComboBox1(this)" style="width:100px;">
				<option value="">- 해외 -</option>
				<c:forEach items="${list}" var="list" varStatus="status">
					<option value="<c:out value="${list.abroadNy }"/>"> ${list.abroadNy }</option>				
				</c:forEach>
			</select>
			<select class="code2" id="event" name="event" onchange="setComboBox2(this)" style="width:100px;">
				<option value="">- 종목 -</option>
				<%-- <c:forEach items="${list}" var="list" varStatus="status">
					<option value="<c:out value="${list.event }"/>"> ${list.event }</option>				
				</c:forEach> --%>
			</select>
			<select class="code3" id="league" name="league" onchange="setComboBox3(this)" style="width:100px;">
				<option value="">- 리그 -</option>
				<%-- <c:forEach items="${list}" var="list" varStatus="status">
					<option value="<c:out value="${list.league }"/>"> ${list.league }</option>				
				</c:forEach> --%>
			</select>
			<select class="code4" id="teamName" name="teamName" style="width:100px;">
				<option value="">- 팀 -</option>
				<%-- <c:forEach items="${list}" var="list" varStatus="status">
					<option value="<c:out value="${list.teamName }"/>"> ${list.teamName }</option>				
				</c:forEach> --%>
			</select>
		</div>		
	</form>
	
	<script type="text/javascript">

		function setComboBox1(o){
			var code = o.value;
			
			$("option").remove(".select");
			$("option").remove(".select1");
			$("option").remove(".select2");

   			$.ajax({
   				async: true 
   				,cache: false
   				,type: "post"
   				/* ,dataType:"json" */
   				,url: "abroad"
   				/* ,data : $("#formLogin").serialize() */
   				,data : { "abroadNy" : code }
   				,success: function(response) {
   					
   					if (response.rt == "success") {
						for (var i=0; i<response.event.length; i++) {
							$(".code2").append('<option class="select" value="' + response.event[i].event + '">' + response.event[i].event + '</option>');
						}
   					}
   				}
   				,error : function(jqXHR, textStatus, errorThrown){
   					alert("ajaxUpdate " + jqXHR.textStatus + " : " + jqXHR.errorThrown);
   				}
   			});
	 
		}

		function setComboBox2(o){
			var code = o.value;
			var abroadNy = $("#abroadNy").val();
			
			$("option").remove(".select1");
			$("option").remove(".select2");

   			$.ajax({
   				async: true 
   				,cache: false
   				,type: "post"
   				/* ,dataType:"json" */
   				,url: "event"
   				/* ,data : $("#formLogin").serialize() */
   				,data : { "event" : code, "abroadNy" : abroadNy }
   				,success: function(response) {
   					
   					if (response.rt == "success") {
						for (var i=0; i<response.league.length; i++) {
							$(".code3").append('<option class="select1" value="' + response.league[i].league + '">' + response.league[i].league + '</option>');
						}
   					}
   				}
   				,error : function(jqXHR, textStatus, errorThrown){
   					alert("ajaxUpdate " + jqXHR.textStatus + " : " + jqXHR.errorThrown);
   				}
   			});
	 
		}

		function setComboBox3(o){
			var code = o.value;
			var abroadNy = $("#abroadNy").val();
			var event = $("#event").val();
			
   			$.ajax({
   				async: true 
   				,cache: false
   				,type: "post"
   				/* ,dataType:"json" */
   				,url: "league"
   				/* ,data : $("#formLogin").serialize() */
   				,data : { "league" : code, "event" : event, "abroadNy" : abroadNy  }
   				,success: function(response) {
   					
   					if (response.rt == "success") {
						for (var i=0; i<response.teamName.length; i++) {
							$(".code4").append('<option class="select2" value="' + response.teamName[i].teamName + '">' + response.teamName[i].teamName + '</option>');
						}
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