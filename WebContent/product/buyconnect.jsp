<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

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
	
	<script type="text/javascript">
		function getValue() {
			var count = Number(document.getElementById("count").value);

			var price = Number(${DBean.price});

			var Max = price*count;
			
			var print = Max.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")+"원";
			$("#total").text(print);
			document.getElementById("totalprice").value = Max;
		}
		
		jQuery(document).ready(function($){
			$("input[name=seat]:checkbox").change(function(){  //체크박스가 변경되었을 때
				var cnt = $("#count").val();
				if( cnt == $("input[name=seat]:checkbox:checked").length){
					$(":checkbox:not(:checked)").attr("disabled","disabled");
				}else{
					$("input[name=seat]:checkbox").removeAttr("disabled");
				}
			});
			
			$("#count").change(function(){
				$("input[name=seat]:checkbox").removeAttr("checked");
				$("input[name=seat]:checkbox").removeAttr("disabled");
			});
		});
	</script>
	
	<style type="text/css">
		#table{
			margin-left: 200px;
			width: 600px;
			min-height:800px;
			text-align: center;
			font-size: 16px;
		}
		
		#count{
			vertical-align: middle;
			text-align-last: center;
			width: 80px;
		}
		#submit{
			width: 150px;
			height: 40px;
			margin-left: 650px;
		}
	
	</style>  

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
							<div class="blog-entry blog-entry-2 justify-content-end d-md-flex w-100">
								<form action="${contextPath}/Order/order.do">
									<input type="hidden" name="id" value="${sessionScope.id}">
									<input type="hidden" name="name" value="${DBean.name}">
									<input type="hidden" name="detailnum" value="${DBean.detailnum}">
									<input type="hidden" name="today" value="${DBean.today}">
									<table border="1" id="table">
										<tr>
											<td>콘서트명</td>
											<td>${DBean.name}</td>
										</tr>
										<tr>
											<td>포스터</td>
											<td><img src="../consert/${DBean.image}"></td>
										</tr>
										<tr>
											<td>장르</td>
											<td>${DBean.genre}</td>
										</tr>
										<tr>
											<td>관람등급</td>
											<td>${DBean.cla}</td>
										</tr>
										<tr>
											<td>관람시간</td>
											<td>${DBean.runtime}분</td>
										</tr>
										<tr>
											<td>공연장</td>
											<td>${DBean.place}</td>
										</tr>
										<tr>
											<td>공연날짜</td>
											<td><fmt:formatDate value="${DBean.today}" type="date" dateStyle="full" /></td>
										</tr>
										<tr>
											<td>시작시간</td>
											<td>${fn:split(DBean.starttime,':')[0]}시 ${fn:split(DBean.starttime,':')[1]}분</td>
										</tr>
										<tr>
											<td>가격</td>
											<td><fmt:formatNumber value="${DBean.price}" pattern="#,###" />원</td>

										</tr>
										<tr>
											<td>예매수</td>
											<td>
												<select id="count" name="count" onchange="getValue()">

													<c:choose>
														<c:when test="${(DBean.seat-DBean.totalreserved) > 4}">
															<option value="1">1</option>
															<option value="2">2</option>
															<option value="3">3</option>
															<option value="4">4</option>
														</c:when>
														<c:when test="${(DBean.seat-DBean.totalreserved) < 4}">
															<c:forEach begin="1"
																end="${DBean.seat-DBean.totalreserved}"
																varStatus="seatnum">
																<option>${seatnum.count}</option>
															</c:forEach>
														</c:when>
													</c:choose>

												</select>
											</td>
										<tr>
										<tr>
											<td>총가격</td>

											<td id="total"><fmt:formatNumber value="${DBean.price}" pattern="#,###" />원</td>
										<tr>
										<tr>
											<td>
												<p align = "center">
											
											<strong>좌석 배치도</strong><br>&nbsp;&nbsp;&nbsp;&nbsp;
											</td>
											<td>&nbsp;&nbsp;&nbsp;
											<c:set var="alphabet" value="A,B,C,D,E,F,G,H,I,G,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y,Z"/>
											<c:forTokens items="${alphabet}" delims="," var="letter"  >
												<font size="2.95em">${letter}</font>&nbsp;
											</c:forTokens>
											<br>
											<c:set var="oneline" value="1,2,3"/>
											<c:set var="twoline" value="4,5,6"/>
											<c:set var="thrline" value="7,8,9"/>
											<c:forTokens items="${oneline}" delims="," var="line1">
												${line1}
												<c:forEach begin="1" end="26" step="1" items="${alphabet}" var="i">
													<input type="checkbox" name="seat" value="${i}${line1}"  >
												</c:forEach>
												<br>
											</c:forTokens>
												<br>
												
											<c:forTokens items="${twoline}" delims="," var="line2">
												${line2}
												<c:forEach begin="1" end="26" step="1" items="${alphabet}" var="i">
													<input type="checkbox" name="seat" value="${i}${line2}">
												</c:forEach>
												<br>
											</c:forTokens>
												<br>
												
											<c:forTokens items="${thrline}" delims="," var="line3">
												${line3}
												<c:forEach begin="1" end="26" step="1" items="${alphabet}"  var="i">
													<input type="checkbox" name="seat" value="${i}${line3}">
												</c:forEach>
												<br>
											</c:forTokens>
												<br>
											
											
											</td>
										<tr>		
										
									</table>
									
								<%-- <c:set var="alphabet" value="A,B,C,D,E,F,G,H,I,G,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y,Z"/>
								<c:forTokens items="${alphabet}" delims="," var="letter"  >
									${letter}
								</c:forTokens> --%>
									<input type="submit" value="장바구니에 담기" id="submit">
									<input type="hidden" id="totalprice" name="totalprice" value="${DBean.price}">
								</form>
							
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<div>

	</div>
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