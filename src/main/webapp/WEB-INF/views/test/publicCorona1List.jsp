<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="rb" uri="http://www.springframework.org/tags"%>

</head>
<body>
publicCorona1List

<br>aaa : <c:out value="${resultCode }"/>
<br>aaa : <c:out value="${resultMsg }"/>
<br>aaa : <c:out value="${pageNo }"/>
<br>aaa : <c:out value="${totalCount }"/>
<br>aaa : <c:out value="${numOfRows }"/>
<br>aaa : <c:out value="${items }"/>
<br>aaa : <c:out value="${fn:length(items) }"/>

<c:forEach items="${items}" var="item" varStatus="status">
	<c:out value="${item.item.PRDUCT }"/>
	<br><c:out value="${item.item.PRMISN_STTEMNT }"/>	
	<br><c:out value="${item.item.PRDUCT_PRMISN_NO }"/>	
	<br><c:out value="${item.item.PRMISN_DT }"/>	
	<br><c:out value="${item.item.RTRCN_DSCTN_DIVS_CD }"/>	
	<br><c:out value="${item.item.RTRCN_DSCTN_DT }"/>	
	<br><c:out value="${item.item.MDEQ_PRDLST_SN }"/>	
	<br><c:out value="${item.item.TRCK_MNG_TRGT_YN }"/>	
</c:forEach>

</body>
</html>