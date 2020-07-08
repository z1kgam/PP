<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<form action="send.jsp">
		<c:forEach begin="1" end="100" var="i">
		<c:if test=""></c:if>
		<input type="checkbox" value="${i}" name="check${i}" >
		<c:if test="${i%10==0}">
			<br>
		</c:if>
		</c:forEach>
		<br><input type="submit" value="전송">
	</form>
</body>
</html>