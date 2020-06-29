<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

#import{
	width: 800px;
	margin-left: auto;
	margin-right: auto;
	margin-top: 50px;
}

#import tr{
	text-align: center;
}

</style>
</head>
<body>
<div style="clear: both;"></div>
<div>
	<table id="import" border="1">
		<c:choose>
			<c:when test="${empty detail}">
				<tr>
					<td colspan="7">등록된 콘서트가 없습니다.</td>
				</tr>
			</c:when>
			<c:when test="${!empty detail}">
					<tr>
						<td>No.</td>
						<td>공연명</td>
						<td>공연날짜</td>
						<td>공연시간</td>
						<td>잔여좌석</td>
						<td>좌석수</td>
						<td>공연장</td>
						<td></td>
					</tr>
					<c:forEach var="det" items="${detail}" varStatus="status">
						<tr>
							<fmt:formatNumber value="${det.seat}" type="number" var="seat" />
							<fmt:formatNumber value="${det.reserved}" type="number" var="reserved" />
							<td>${status.count}</td>
							<td>${Bean.name}</td>
							<td>${det.date}</td>
							<td>${det.time}</td>
							<td>${seat-reserved}</td>
							<td>${det.seat}</td>
							<td>${det.place}</td>
							<td><input type="button" value="에약하기" 
							onclick="location.href='${contextPath}/Proser/prepare.do?num=${Bean.num}&detailnum=${det.pronum}'"></td>
						</tr>
					</c:forEach>
			</c:when>
		</c:choose>
			
		</table>
	<!-- <input type="text" id="testDatepicker" style="margin-left: 50%;"> -->
</div>

</body>
</html>