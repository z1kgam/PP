<%@page import="java.text.DecimalFormat"%>
<%@page import="Product.ProductBean"%> 
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../css/default.css" rel="stylesheet" type="text/css">
<link href="../css/subpage.css" rel="stylesheet" type="text/css">
<link href="../css/submenu.css" rel="stylesheet" type="text/css">

<style type="text/css">
h1{font-family: "Times New Roman";
font-size: 40px; margin : 50px;
font-weight: 600; text-align: center;
}

.submit{
	height: 30px; width: 150px; border: 1px solid #666;
	border-radius:10px; box-shadow:3px 3px 2px #CCC;
	font-size: 14px;
	background-image: url("../images/member/submit_back.jpg");
	background-repeat: repeat-x;
	background-position: center center;
	color: #fff;
	text-align: center;
	margin-top: 10px;
	margin-left: 700px;
}

.cancel{
	height: 30px; width: 150px; border: 1px solid #666;
	border-radius:10px; box-shadow:3px 3px 2px #CCC;
	font-size: 14px;
	background-image: url("../images/member/cancel_back.jpg");
	background-repeat: repeat-x;
	background-position: center center;
	color: #fff;
	text-align: center;
	margin-top: 10px;
	margin-left: 700px;
}

table{
	text-align: center;
	font-size: 18px;
	margin: 20px 0px 0px 180px;
	margin-top: 50px;
	font-weight: 600;
	line-height: 150%;
}

td{
	border: solid;
	width : 125px; height:50px;
}

td img{
	width : 350px; height:400px;
}

td #ao{
	border-style: dashed;
}

</style>

</head>
<%
	request.setCharacterEncoding("UTF-8");
	String id=(String)session.getAttribute("id");

	int pageNum = (Integer)request.getAttribute("pageNum");
	
	//int line = (Integer)request.getAttribute("line");
	
	ProductBean bean = (ProductBean)request.getAttribute("Bean");
	DecimalFormat formt = new DecimalFormat("###,###,###");
	
	
%>
<body>
<div id="wrap">



<div id="resou"></div>

<h1><%=bean.getName()%></h1>

<table>
<%
	String[] image = new String[2];
	image = bean.getImage().split(",");
	String[] content = new String[2];
	content = bean.getContent().split(",");
	
%>
	<tr>
		<td colspan="2" rowspan="7"><img src="../consert/<%=image[0]%>"></td>
		<td>제품번호</td>
		<td><%=bean.getNum()%></td>
	</tr>
	<tr>
		<td>제품명</td>
		<td><%=bean.getName()%></td>
	</tr>
	<tr>
		<td>장르</td>
		<td><%=bean.getGenre()%></td>
	</tr>
	<tr>
		<td>이용가등급</td>
		<td><%=bean.getCla()%></td>
	</tr>
	<tr>
		<td>가격</td>
		<td><%=formt.format(bean.getPrice())%>원</td>
	</tr>
	<tr>
		<td>공연시간</td>
		<td><%=bean.getMinute()%>분</td>
	</tr>
	<tr>
		<td>공연기간</td>
		<td><%=new SimpleDateFormat("yyyy.MM.dd").format(bean.getStartdate())%> ~ <%=new SimpleDateFormat("yyyy.MM.dd").format(bean.getEnddate())%></td>
	</tr>

	<tr>
		<td colspan="4">제품설명</td>
	</tr>
	<tr>
		<td colspan="4" rowspan="3" style="min-height: 150px;">
		<img style="height: 450px; width: 450px" src="../consert/<%=content[0]%>"></td>
	</tr>

</table>
<%
	if(id != null){
		if(id.equals("admin")){
%>
	<input type="button" value="상세등록" class="submit" onclick="location.href='${contextPath}/Proser/details.do?num=<%=bean.getNum()%>&pageNum=<%=pageNum%>'">
	<input type="button" value="삭제하기" 
	class="cancel" onclick="location.href='${contextPath}/Proser/delete.do?num=<%=bean.getNum()%>&path=consert&image=<%=image[0]%>&content=<%=content[0]%>&pageNum=<%=pageNum%>'">
<% 
		}
	}
%>
<input type="button" value="예매하기" class="submit" onclick="location.href='${contextPath}/Proser/winopen.do'">
<input type="button" value="목록보기" class="cancel" onclick="location.href='${contextPath}/Proser/imcontact.do?pageNum=<%=pageNum%><%-- &line=<%=line%> --%>'">
<div class="clear"></div>
<div id="page_control">

</div>

<div class="clear"></div>

<div class="bean"></div>

<nav class="submenu">
	<ul class="subul">
		<li class="subli"><a href="#">콘서트 설명</a></li> 
		<li class="subli"><a href="#">콘서트 댓글</a></li>
		<li class="subli"><a href="#">콘서트 리뷰</a></li>
	</ul>
</nav>
<hr>
<div class="detail"></div>
<div class="clear"></div>


</div>
</body>
</html>