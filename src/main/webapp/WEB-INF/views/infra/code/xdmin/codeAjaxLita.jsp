<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="rb" uri="http://www.springframework.org/tags" %>

<!-- 리스트 -->
<%-- <span style="margin: 0; padding: 0; font-weight: 800;">Total : ${vo.totalRows }</span> --%>
<%@include file="../../common/xdmin/includeV1/totalAndRowNum.jsp" %>

<div class="card ps-3 pt-3 pe-3 shadow">
	<table class="table text-center align-middle">
		<thead>
			<tr>
				<th style="font-size: small;">
					<input class="form-check-input" type="checkbox" value="" id="checkboxAll">
				</th>
				<th>#</th>
				<th>코드그룹 코드</th>
				<th>코드그룹 이름(한글)</th>
				<th>코드</th>
				<th>대체 코드</th>
				<th>코드 이름(한글)</th>
				<th>코드 이름(영문)</th>
				<th>사용</th>
				<th>순서</th>
				<th>등록일</th>
				<th>수정일</th>
			</tr>
		</thead>
		<tbody onclick="newPage()">
			<c:choose>
				<c:when test="${fn:length(list) eq 0}">
					<tr>
						<td class="text-center" colspan="12">There is no data!</td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach items="${list}" var="list" varStatus="status">
						<tr onclick="goForm(<c:out value="${list.ccSeq }"/>)" style="cursor: pointer;">
							<td onclick="event.cancelBubble=true">
								<input class="form-check-input" type="checkbox" value="${list.ccSeq }" id="checkboxSeq" name="checkboxSeq">
							</td>
							<td><c:out value="${vo.totalRows - ((vo.thisPage - 1) * vo.rowNumToShow + status.index) }"/></td>
							<td>${list.ccgSeq}</td>
							<td>${list.ifcgName}</td>
							<td>${list.ccSeq }</td>
							<td>${list.ifccAnother }</td>
							<td>${list.ifccName}</td>
							<td>${list.ifccNameEng }</td>
							<td>${list.ifccUseNy}</td>
							<td>${list.ifccOrder}</td>
							<td>${list.createdAt }</td>
							<td>${list.modifiedAt }</td>
						</tr>		
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</tbody>
	</table>
	<%@include file="../../common/xdmin/includeV1/pagination.jsp" %>
</div>
<script type="text/javascript">

	goForm = function(keyValue) {
		seq.val(keyValue);
		form.attr("action", goUrlForm).submit();
	}
	
	goList = function(thisPage) {
		$("input:hidden[name=thisPage]").val(thisPage);
		setLita();			
	}
	
	$("#changeRowNum").on("change", function(){
		$("input:hidden[name=rowNumToShow]").val($("#changeRowNum option:selected").val());
		setLita();
	}); 

	/* checkbox delete s */
	
	$("#checkboxAll").click(function() {
		if($("#checkboxAll").is(":checked")) $("input[name=checkboxSeq]").prop("checked", true);
		else $("input[name=checkboxSeq]").prop("checked", false);
	});
	
	$("input[name=checkboxSeq]").click(function() {
		var total = $("input[name=checkboxSeq]").length;
		var checked = $("input[name=checkboxSeq]:checked").length;
		
		if(total != checked) $("#checkboxAll").prop("checked", false);
		else $("#checkboxAll").prop("checked", true); 
	});
	/* checkbox delete e */
</script>