<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
  <head>
    <title>Meditative - Free Bootstrap 4 Template by Colorlib</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700&display=swap" rel="stylesheet">

    <link href="https://fonts.googleapis.com/css?family=EB+Garamond:400,400i,500,500i,600,600i,700,700i&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="../css/open-iconic-bootstrap.min.css">
    <link rel="stylesheet" href="../css/animate.css">
    
    <link rel="stylesheet" href="../css/owl.carousel.min.css">
    <link rel="stylesheet" href="../css/owl.theme.default.min.css">
    <link rel="stylesheet" href="../css/magnific-popup.css">

    <link rel="stylesheet" href="../css/aos.css">

    <link rel="stylesheet" href="../css/ionicons.min.css">

    <link rel="stylesheet" href="../css/bootstrap-datepicker.css">
    <link rel="stylesheet" href="../css/jquery.timepicker.css">

    
    <link rel="stylesheet" href="../css/flaticon.css">
    <link rel="stylesheet" href="../css/icomoon.css">
    <link rel="stylesheet" href="../css/style.css">

	<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  

	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  

	<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
	
	<script src="../js/content.js"></script>  

</head>
  <body>
<jsp:include page="../include/subheader.jsp" />
    <!-- END nav -->

    <section class="hero-wrap hero-wrap-2" style="background-image: url('../images/concert.jpg');" data-stellar-background-ratio="0.5">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text js-fullheight align-items-center justify-content-center">
          <div class="col-md-9 ftco-animate text-center">
            <h1 class="mb-3 bread">Our Blog</h1>
            <p class="breadcrumbs"><span class="mr-2"><a href="index.jsp">Home</a></span> <span>Blog</span></p>
          </div>
        </div>
      </div>
    </section>

	<section class="ftco-section">
		<div class="container">
			<div class="row">
				<div>
					<div class="row">
						<div class="col-md-12 d-flex ftco-animate">
							<div
								class="blog-entry blog-entry-2 justify-content-end d-md-flex w-100">
								<a href="blog-single.jsp" class="block-20"
									style="background-image: url('../consert/${Bean.image}'); width: 250px; height: 350px; margin-right: 100px; margin-bottom: 150px;">
								</a>
								<div class="text pl-md-4 ml-md-2 pt-4"
									style="margin-right: 100px;">
									<div class="meta">
										<div>
											<a href="#">단독 판매</a>
										</div>

									</div>
									<h3 class="heading mt-2">
										<a href="#">${Bean.name}</a>
									</h3>
									<table style="width: 700px;">

										<tr>
											<td>공연시간</td>
											<td><fmt:formatDate value="${Bean.startdate}" /> ~ <fmt:formatDate
													value="${Bean.enddate}" /></td>
											<td>관람시간</td>
											<td>${Bean.runtime}분</td>
										</tr>
										<tr>

											<td>관람등급</td>
											<td>${Bean.cla}</td>
											<td>장르</td>
											<td>${Bean.genre}</td>
										</tr>
										<tr>
											<td>가격</td>
											<td><fmt:formatNumber value="${Bean.price}" pattern="#,###" />원</td>
											<td></td>
											<td></td>
										</tr>
										<tr>
											<td>좋아요<span class="icon icon-heart"></span></td>
											<td>${requestScope.likeCount}</td> 
											<td>										
												<form action="${contextPath}/mycon/addBasket.do" method="post">
													<input type="hidden" name="id" value="${sessionScope.id}">
													<input type="hidden" name="num" value="${Bean.num}">
													<%-- <input type="hidden" name="numbers" value="${Bean.qty}"> --%>
													<input type="submit" value="장바구니에 담기" class="btn btn-outline-primary">
												</form>	
											</td>
											<td></td>
										</tr>
									</table>

									<p style="margin-top: 70px;">
										<a href="${contextPath}/Proser/details.do?num=${Bean.num}" class="btn btn-outline-primary">상세등록</a> 
										<a href="${contextPath}/Proser/delete.do?num=${Bean.num}&path=consert&image=${Bean.image}&content=${Bean.content}" class="btn btn-outline-primary">삭제하기</a>
										<a href="${contextPath}/Proser/imcontact.do" class="btn btn-outline-primary">목록보기</a>					
									<c:if test="${sessionScope.id != null}">
										<c:choose>
											<c:when test="${requestScope.checkZ == 'false'}">
												<a href="${contextPath}/mycon/likeAction.do?id=${sessionScope.id}&num=${Bean.num}" class="btn btn-outline-primary">찜하기</a>
											</c:when>
											<c:when test="${requestScope.checkZ == 'true'}">
												<a href="${contextPath}/mycon/likeAction.do?id=${sessionScope.id}&num=${Bean.num}" class="btn btn-outline-primary">찜취소</a>
											</c:when>
										</c:choose>
									</c:if>
									</p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<section>
		<nav style="width: 1500px; height:60px; padding-bottom: 25px; margin-left: auto;margin-right: auto;">
			<ul style="	list-style:none; font-family: verdana,Geneba,sans-serif;">
				<li style="float: left;margin-left: 175px;"><a style="text-decoration: none;color: #333;font-size: 25px;" onclick="explanation()">상세정보</a></li>
				<li style="float: left;margin-left: 175px;"><a style="text-decoration: none;color: #333;font-size: 25px;" onclick="reply()">관람후기</a></li>
				<li style="float: left;margin-left: 175px;"><a style="text-decoration: none;color: #333;font-size: 25px;" onclick="review()">공연장정보</a></li>
				<li style="float: left;margin-left: 175px;"><a style="text-decoration: none;color: #333;font-size: 25px;" onclick="trybuy()">티켓예매</a></li>
			</ul>
		</nav>
		<hr style="width: 1500px; margin: auto;">
		<div class="detail" id="explanation"><jsp:include page="../proinc/explanation.jsp" /></div>
		<div class="detail" id="reply" style="display: none;"><jsp:include page="../proinc/reply.jsp" /></div>
		<div class="detail" id="review" style="display: none;"><jsp:include page="../proinc/review.jsp" /></div>
		<div class="detail" id="trybuy" style="display: none;"><jsp:include page="../proinc/trybuy.jsp" /></div>
	</section>

	<jsp:include page="../include/footer.jsp" />    
    
  
  <script src="../js/jquery.min.js"></script>
  <script src="../js/jquery-migrate-3.0.1.min.js"></script>
  <script src="../js/popper.min.js"></script>
  <script src="../js/bootstrap.min.js"></script>
  <script src="../js/jquery.easing.1.3.js"></script>
  <script src="../js/jquery.waypoints.min.js"></script>
  <script src="../js/jquery.stellar.min.js"></script>
  <script src="../js/owl.carousel.min.js"></script>
  <script src="../js/jquery.magnific-popup.min.js"></script>
  <script src="../js/aos.js"></script>
  <script src="../js/jquery.animateNumber.min.js"></script>
  <script src="../js/bootstrap-datepicker.js"></script>
  <script src="../js/jquery.timepicker.min.js"></script>
  <script src="../js/scrollax.min.js"></script>
  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
  <script src="../js/google-map.js"></script>
  <script src="../js/main.js"></script>
    
  </body>
</html>