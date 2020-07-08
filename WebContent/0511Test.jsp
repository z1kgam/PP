<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set value="${pageContext.request.contextPath}" var="contextPath"/>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="${contextPath}/seat.css">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div align="center">
		<h2>콘서트 좌석 예매</h2>
		<h4>예매할 좌석을 눌러주세요.</h4>
	</div>
	<form action="">
		<strong>좌석 배치도</strong><br>&nbsp;&nbsp;&nbsp;&nbsp;
		A
		<c:forEach begin="1" end="10" step="1" var="i">
			<input type="checkbox" name="seat" value="${i}">${i}
		</c:forEach>
	
	</form>
</body>

</html>