<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%--컨텍스트 주소 얻기 --%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<%
	//한글처리
	request.setCharacterEncoding("UTF-8");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#div {
width: 500px;
}
</style>
</head>
<body>
<!-- header -->
<jsp:include page="../include/header.jsp"/>
<!-- header -->
   <section class="hero-wrap hero-wrap-2" style="background-image: url('../images/bg_3.jpg');" data-stellar-background-ratio="0.5">
		<div class="overlay"></div>
			<div class="container">
        		<div class="row no-gutters slider-text js-fullheight align-items-center justify-content-center">
          			<div class="col-md-9 ftco-animate text-center">
						<h1 class="mb-3 bread">Event</h1>
						<p class="breadcrumbs"><span class="mr-2"><a href="index.html">Home</a></span> <span>Contact</span></p>
					</div>
				</div>
			</div>
	</section>
	<section class="ftco-section contact-section ftco-no-pt ftco-no-pb">
		<div class="container">

	<section class="container body-container py-5">



<table style="table-layout: fixed;">
	<tr >
		<td width="800px;" >
			<label>${couponBean.event_title } </label><br>
			<label>${couponBean.event_startdate} ~ ${couponBean.event_enddate}</label>
		</td>
	</tr>
	<tr>
		<td>
			<img src="../upload/${couponBean.event_image}" id="div"><br>
			<label>${couponBean.event_content } </label>
		</td>
	</tr>
	<tr>
		<td>
		<c:if test="${is_admin == 1}"> 
			<input type="button" value="삭제하기" onclick="location.href='${contextPath}/coupon/eventDelete.do?event_num=${couponBean.event_num}'">
			<input type="button" value="수정하기" onclick="location.href='${contextPath}/coupon/eventUpdateForm.do?event_num=${couponBean.event_num}'">
		</c:if>
		</td>
	</tr>


</table>
</section>
</div>

</section>

	<div class="text-center my-5">
		<button type="button" class="btn btn-secondary" onclick="history.back()">돌아가기</button>
	</div>	


<!-- footer -->
<jsp:include page="../include/footer.jsp"/>
<!-- footer -->	
</body>
</html>