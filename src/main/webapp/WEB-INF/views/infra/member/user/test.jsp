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
		<c:set var="listCodeAbroad" value="${CodeServiceImpl.selectListCachedCode('4') }" />
		<div>
			<select class="code1" name="code1" onchange="setComboBox(this)" style="width:100px;">
				<option value="">- 전체 -</option>
				<c:forEach items="${list}" var="list" varStatus="status">
					<option value="<c:out value="${list.abroadNy }"/>"> ${list.abroadNy }</option>				
				</c:forEach>
				<c:forEach items="${listCodeAbroad}" var="listAbroad" varStatus="statusAbroad">
					<c:if test="${list.abroadNy eq listGender.ccSeq}"><c:out value="${listGender.ifccName }"/></c:if>
				</c:forEach>
			</select>
			<select class="code2" name="code2" onchange="setComboBox(this)" style="width:100px;">
				<div id="asdf">
				
				<option value="">- 전체 -</option>
				</div>
			</select>
			<select class="code3" name="code3" style="width:100px;">
				<option value="">- 전체 -</option>
			</select>
		</div>		
	</form>
	
	<script type="text/javascript">

	function setComboBox(o){
		var code = o.value;
		var div = $(o).parent(); // 셀렉트 박스의 상위 객체
		var cnt = $('select', div).size(); // 셀렉트 박스 갯수
		var idx = $('select', div).index(o); // 현재 셀렉트 박스의 순서
		var depth = cnt - 1 + idx;
		var combo = $('select', div).eq(idx + 1);
		var text = '<option value="">- 전체 -</option>';
		
		/* if(code == ''){ // 전체를 선택했을 경우
			$('select:gt(' + idx + ')', div).html(text);
			return;
		} */
		$.post(
			'test'
			, {depth:depth, code:code}
			, function(rst){
				var data = new Set();
				
				data = rst;
				
				console.log(data);
				var loop = data.rt.length;
				console.log(loop);
				$('select:gt(' + idx + ')', div).html(text);
				
				var options = "";
				
				for(var i=0 ; i<loop ; i++){
					options += combo.append('<option value="' + data.rt[i].abroadNy + '">' + data.rt[i].abroadNy + '</option>');
				}
				
				combo.append();
			});
		}
	
	</script>
	
</body>

</html>