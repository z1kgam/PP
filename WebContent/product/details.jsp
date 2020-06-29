<%@page import="Product.ProductBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="Product.ProductBean"%>
 
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

	<%
		request.setCharacterEncoding("UTF-8");
		String id = (String)session.getAttribute("id");
		//int line = (Integer)request.getAttribute("line");
		int pageNum = (Integer)request.getAttribute("pageNum");
		ProductBean bean = (ProductBean)request.getAttribute("Bean");
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../css/default.css" rel="stylesheet" type="text/css">
<link href="../css/subpage.css" rel="stylesheet" type="text/css">

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	function checkdate(){
		var start = $("#stdate").val();
		var end = $("#endate").val();
		
		var date = $("#date").val();
		if((start > date) || (end < date)){
			alert(start+" 와 "+end+" 사이 날짜로 입력하세요!!");
			$("#date").val(null);
			return;
		}
	}
</script>

<style type="text/css">
#tb {
	 margin: 10px;
}

#file{
	margin-left: 70px;
}

select{
	width: 170px; height: 25px;
}

input {
	text-align: center;
}
</style>
</head>
<body>
<div id="wrap">



<div id="resou"></div>



<article>
<h1>Register Product</h1>

<form action="${contextPath}/Proser/detailsPro.do?" method="post" name="f">
	<input type="hidden" value="<%=bean.getStartdate()%>" id="stdate">
	<input type="hidden" value="<%=bean.getEnddate()%>" id="endate">
	<input type="hidden" value="<%=bean.getNum()%>" name="num">
	<input type="hidden" value="<%=pageNum%>" name="pageNum">
	<table id="notice">			
		<tr>
			<td>콘서트명</td>
			<td><input type="text" name="name" value="<%=bean.getName()%>"></td>
		</tr>
		<tr>
			<td>공연장</td>
			<td>
				<select name="place" style="vertical-align: middle; text-align-last: center;">
					<option>공연장1</option>
					<option>공연장2</option>
					<option>공연장3</option>
					<option>공연장4</option>
					<option>공연장5</option>
					<option>공연장6</option>
				</select>
			</td>
		</tr>
		<tr>
			<td>좌석</td>
			<td>
				<select name="seat" style="vertical-align: middle; text-align-last: center;">
					<option>100</option>
					<option>150</option>
					<option>200</option>
					<option>250</option>
				</select>
			</td>
		</tr>
		<tr>
			<td>공연날짜</td>
			<td><input type="date" name="date" id="date" oninput="checkdate()"></td>
		</tr>
		<tr>
			<td>공연시간</td>
			<td><input type="time" name="time"></td>
		</tr>
		
	</table>
	<div id="table_search">
		<input type="submit" value="상세등록" class="btn">
		<input type="reset" value="다시작성" class="btn">
		<input type="button" value="제품목록" class="btn" onclick="location.href='${contextPath}/Proser/imcontact.do'">
	</div>	
</form>
<div class="clear"></div>
<div id="page_control"></div>

</article>
<!-- 게시판 -->
<!-- 본문들어가는 곳 -->
<div class="clear"></div>
<!-- 푸터들어가는 곳 -->

<!-- 푸터들어가는 곳 -->
</div>
</body>
</html>





