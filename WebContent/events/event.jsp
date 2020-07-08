<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%
	//한글처리
	request.setCharacterEncoding("UTF-8");
%>

<%-- 컨텍스트 주소 얻기 --%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이벤트 페이지</title>


</head>
<body>
<jsp:include page="../include/header.jsp"/>

	<div>
		이벤트 페이지
	</div>
	
<jsp:include page="../include/footer.jsp"/>	
</body>
</html>