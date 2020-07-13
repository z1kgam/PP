<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>좋아요 목록</title>
</head>
<body>
<c:forEach items="${likeList}" var="list">
	<table>
		<tr>
			<th>No</th>
			<th>게시글 번호</th>
			<th>ID</th>
		</tr>
		
		<tr>
			<td>${list.likenum}</td>
			<td>${list.num}</td>
			<td>${list.id}</td>
		</tr>
	</table>
</c:forEach>
</body>
</html>