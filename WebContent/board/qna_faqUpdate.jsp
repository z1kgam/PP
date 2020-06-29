<%@page import="team.faqboard.faqBean"%>
<%@page import="java.util.List"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    


<%
	//한글처리
	request.setCharacterEncoding("UTF-8");
%>

<%--컨텍스트 주소 얻기 --%>    
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>

<html>
<head>
<title>FAQ작성</title>
	<link rel="stylesheet" href="../css/bootstrap.min.css" />
	<link rel="stylesheet" href="../css/style.css" />
	
	<script src="../js/jquery-3.4.1.min.js"></script>
	<script src="../js/bootstrap.min.js"></script>
</head>
<body>



<section class="container body-container py-5">
<div class="row">
	<div class="col-12">
		<h2>FAQ 수정</h2>
	</div>
</div>
<!-- 게시판 -->
<article class="mt-3">
	<form action="${contextPath}/fboard/faqUpdate.do?faq_num=${faqUpdate.faq_num}" method="post">
		<table class="table">
			<colgroup>
				<col style="max-width: 15%" />
				<col />
			</colgroup>
			<tr>
				<th class="align-middle">
					<label for="poolName" class="m-0">카테고리 선택</label>
				</th>
				<td>
						
<!-- 					<input class="form-control" type="text" name="poolName" id="poolName" required /> -->
						<input type="radio" name="cate" value="티켓예매" checked="checked">티켓예매 &nbsp;&nbsp;
						<input type="radio" name="cate" value="취소/환불">취소/환불 &nbsp;&nbsp;
						<input type="radio" name="cate" value="이벤트">이벤트 &nbsp;&nbsp;
						<input type="radio" name="cate" value="티켓수령">티켓수령 &nbsp;&nbsp;
						<input type="radio" name="cate" value="회원">회원 &nbsp;&nbsp;
				</td>
			</tr>
			
			<tr>
				<th class="align-middle">
					<label for="poolAddress1" class="m-0">제목</label>
				</th>
				<td>
					<input type="text" class="form-control" name="title" value="${faqUpdate.faq_title}" id="poolAddress1" maxlength="50">
				</td>
			</tr>
			
			<tr>
				<th class="align-middle">
					<label for="contents" class="m-0">내용</label>
				</th>
				<td>
					<textarea class="form-control" name="contents" id="poolContent" cols="40" rows="13" required>${faqUpdate.faq_contents}</textarea>
				</td>
			</tr>
		</table>
		<div class="text-center my-5">
			<button type="button" class="btn btn-secondary" onclick="history.back()">취소</button>
			<button type="submit" class="btn btn-primary">수정하기</button>
		</div>
	</form>
</article>
<!-- 게시판 -->
</section>

</body>
</html>