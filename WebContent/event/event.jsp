<%@page import="java.sql.Date"%> 
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%
	//한글처리
	request.setCharacterEncoding("UTF-8");
%>
<%--컨텍스트 주소 얻기 --%>    
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>

<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>이벤트</title>
<link rel="stylesheet" href="../css/bootstrap.min.css" />
<link rel="stylesheet" href="../css/style.css" />
<script src="../js/jquery-3.4.1.min.js"></script>
<script src="../js/bootstrap.min.js"></script>


</head>
<body style="text-align: center;">
<jsp:include page="../include/subheader.jsp"/>
   <section class="hero-wrap hero-wrap-2" style="background-image: url('../images/bg_3.jpg');" data-stellar-background-ratio="0.5">
		<div class="overlay"></div>
			<div class="container">
        		<div class="row no-gutters slider-text js-fullheight align-items-center justify-content-center">
          			<div class="col-md-9 ftco-animate text-center">
						<h1 class="mb-3 bread">이벤트 / 쿠폰</h1>
						<p class="breadcrumbs"><span class="mr-2"><a href="index.html">Home</a></span> <span>Contact</span></p>
					</div>
				</div>
			</div>
	</section>
	
			<div>		
				<div style="margin-left: 500px; margin-top: 100px;">	
					<a href="#" onclick="te3(1)"><input type="button" style="background-color: #A9FF7F !important; border-color: #A9FF7F !important; color: #fff !important; width: 100px;" value="이벤트"></a>
				</div>
				<div style="margin-left: 800px; margin-top: -30px;">
					<a href="#" onclick="te3(2)"><input type="button" style="background-color: #00E7D6 !important; border-color: #00E7D6 !important; color: #fff !important; margin-bottom: 100px; width: 100px;" value="쿠폰존"></a>
				</div>
			</div>
	<div id="event">
	<section class="ftco-section contact-section ftco-no-pt ftco-no-pb">
		<div class="container">
		

		
	<section class="container body-container py-5">

		<!-- 게시판 -->
		
		<article class="mt-3">
			<div class="gallery-grid">
				<c:if test="${eventList != null}">
					<c:forEach var="event" items="${eventList}" varStatus="status">
						<div class="gallery-grid-item">
	 						<a href="${contextPath}/ev/viewEvent.do?e_num=${event.e_num}">
	 							<img src="${contextPath}/event/image/${event.e_file}"><br>
							</a>
							<small>${event.e_title}</small><br>
							<small>${event.e_startdate}</small>&nbsp;~&nbsp;<small>${event.e_enddate}</small>
						</div>
					</c:forEach>
				</c:if>
				<c:if test="${eventList == null }">
					<div class="gallery-grid-item">
						등록된 게시글이 없습니다.
					</div>
				</c:if>
			</div>				
			<div class="row  my-5">
				<div class="col-12 col-lg-8">
					
				</div>
				<div class="col-12 col-lg-4 mt-3 mt-lg-0">
				
						<div class="form-group text-center text-lg-right">
							<button type="button" class="btn btn-secondary" onclick="location.href='${contextPath}/ev/eventForm.do'">글쓰기</button>
						</div>
					
				</div>
			</div>
			<div class="row">
				<div class="col-12">				
					<ul class="pagination justify-content-center">
					
		<%-- 페이징처리 --%>			
 		<c:if test="${nowpage > blocksize}">
			<li class="page-item">
				<a class="page-link" href="${contextPath}/ev/listEvent.do?nowpage=${blockfirst - blocksize}">이전</a>
			</li>
		</c:if>
      	<c:if test="${blockFirst!=1}">
             <a href="${contextPath}/ev/listEvent.do?nowPage=${blockFirst-blockSize}"></a>
         </c:if>
         <c:forEach var="i" begin="${blockFirst}" end="${blockLast}" step="1">
         	<a href="${contextPath }/ev/listEvent.do?nowPage=${i}">${i}</a>
         </c:forEach>
         <c:if test="${blockLast!=totalPage}">
             <a href="${contextPath}/ev/listEvent.do?nowPage=${blockLast+1}"></a>                    
         </c:if>
		<c:if test="${blocklast != totalpage}">
			<li class="page-item">
				<a class="page-link" href="${contextPath}/ev/listEvent.do?nowpage=${blocklast + 1}">다음</a>
			</li>
		</c:if>
					</ul>
				</div>
			</div>
		</article>
		<!-- 게시판 -->
	</section>
	
	</div>

	</section>
	</div>
	
	
	<div id="coupon">

	<section class="ftco-section contact-section ftco-no-pt ftco-no-pb">
		<div class="container">

	<section class="container body-container py-5">

    
    
    <section>
    <div>
    <input type="button" class="submit" value="쿠폰 등록" formmethod="post" onclick="location.href='${contextPath}/coupon/eventWriteForm.do'">
	<c:set var="i" value="0" />
    <c:set var="j" value="3" />
    <table border="1" style="">    
<%--     	<c:forEach var="eventBean" items="${list}"> --%>
    	<c:forEach var="couponBean" items="${list}">	
    			<c:if test="${i%j == 0}">
    				<tr>
    			</c:if>	    					
   						<td style="width:300px; height: 150px;">
    						<a href="${contextPath}/coupon/eventInfo.do?event_num=${couponBean.event_num}">
							<img src="../upload/${couponBean.event_timage}" style="width:300px; height: 120px;">
							<div class="text  text-left" style="text-align: left; font-size: 1em;">
								${couponBean.event_title}
							</div></a>
							<div class="text  text-left" style="text-align: left; font-size: 1em;">
								${couponBean.event_startdate} ~ ${couponBean.event_enddate}
							</div>
						</td>	
    			<c:if test="${i%j == j-1}">
    				</tr>
    			</c:if>
    			<c:set var="i" value="${i+1}" />	
    			
    	</c:forEach>
    </table>
    </div>

    	
    </section>
    </section>
    </div>
	</section>
	</div>

<jsp:include page="../include/footer.jsp"/>
<script src="${contextPath}/js/masonry.pkgd.min.js"></script>

	<script>
		function toggleContent(obj){
			$(obj).next().toggle();
		}
		function hideContent(){
			$(".poolcontent").hide();
		}
	</script>
	
	<script>
	$(document).ready(function(){
		
			$(".gallery-grid").masonry({
				itemSelector : '.gallery-grid-item'
			}).addClass("active");

	})
	</script>
	
	<script type="text/javascript">
	(function(){
		var x = document.getElementById("coupon");
		    x.style.display = "none"; 
		  }());
	function te3(t) {
		if(t == 1) {
			var z = document.getElementById("event");
		    z.style.display = "block";
		  	var x = document.getElementById("coupon");
		 	    x.style.display = "none"; 
		 }	
		if(t == 2) {	
			var z = document.getElementById("event");
				z.style.display = "none";
	
			var x = document.getElementById("coupon");
			 	x.style.display = "block";	
		}
	}
</script>

</body>
</html>