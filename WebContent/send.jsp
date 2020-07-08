<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div align = "center">
		<h2>콘서트 좌석 예매</h2>
		<h4>예매할 좌석을 체크한 후 예약 버튼을 눌러주세요.</h4>
	</div>
	
	<form action = "test00.jsp">
	
		<p align = "center">
		
			<strong>좌석 배치도</strong><br>&nbsp;&nbsp;&nbsp;&nbsp;
			<%for(char c='A' ; c<='Z'; c++){ %>
				<small><%=c %></small>&nbsp;&nbsp;
			<%} %>
			<br>
			<% for(int r=1;r<=3;r++){ %>
				<%= r %>
				<%for(char c='A';c<='Z';c++){ %>
					<input type = "checkbox" name="seat" value="<%=c %>-<%=r %>">
				<%} %>
				<br>
				<%} %>
			<br>
			<% for(int r=4;r<=6;r++){ %>
				<%= r %>
				<%for(char c='A';c<='Z';c++){ %>
					<input type = "checkbox" name="seat" value="<%=c %>-<%=r %>">
				<%} %>
				<br>
				<%} %>
			<br>
			<% for(int r=7;r<=9;r++){ %>
				<%= r %>
				<%for(char c='A';c<='Z';c++){ %>
					<input type = "checkbox" name="seat" value="<%=c %>-<%=r %>">
				<%} %>
				<br>
				<%} %>
			<br>
		<input type="submit" value="전송">
	</form>
</body>
</html>