<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%
	List alist = (List)request.getAttribute("alist");
	
	for(int i=0; i<alist.size();i++){
		System.out.println("자바배열 :" + alist.get(i));
	}
	
%>


<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%-- <%
	String ch =(String)request.getAttribute("chseat");
	System.out.println(ch); 
    String[] a = ch.split(",");
	
	System.out.println(ch);
	for(int i = 0; i<a.length; i ++){
		System.out.println(a[i]);
	}	

%> --%>


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
		<script>
			function getValue() {
				var count = Number(document.getElementById("count").value);
				var price = Number(${DBean.price});
				
				var Max = price*count;
				var List = String(${alist}).split(',');
				
				var print = Max.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")+"원";
				$("#total").text(print);
				document.getElementById("totalprice").value = Max;
			
			}

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
</script>
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
								<form action="${contextPath}/Order/order.do" name="selectform">
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
											<!-- <c:set var="alphabet" value="1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26"/> -->
											<c:set var="alphabet" value="A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y,Z"/>
											<c:set var="number" value="1,2,3,4,5,6,7,8,9"/>
											<c:forTokens items="${alphabet}" delims="," var="letter"  >
												<font size="2.95em">${letter}</font>&nbsp;
											</c:forTokens>
											<br>
											1<c:forEach begin="1" end="234" var="i">
												<input type="checkbox" name="seat" value="${alphabet}${i}" id="seat" onclick="check()">
												<c:choose>
													<c:when test="${i eq 234 }">
														<br>
													</c:when>
													<c:when test="${i eq 208 }">
														<br>9
													</c:when>
													<c:when test="${i eq 182 }">
														<br>8
													</c:when>
													<c:when test="${i eq 156 }">
														<br>7
													</c:when>
													<c:when test="${i eq 130 }">
														<br>6
													</c:when>
													<c:when test="${i eq 104 }">
														<br>5
													</c:when>
													<c:when test="${i eq 78 }">
														<br>4
													</c:when>
													<c:when test="${i eq 52 }">
														<br>3
													</c:when>
													<c:when test="${i eq 26 }">
														<br>2
													</c:when>
												</c:choose>
											</c:forEach> 
						<script>
							//html이 다 로딩된 후에 실행
							$(document).ready(function(){	
								//체크박스들이 변경되었을 때
								$(":checkbox").change(function(){	
									var cnt = $("#count").val();
									
									
								//셀렉트박스의 값과 체크박스중 체크된 갯수가 같을때, 다른 체크박스들을 disabled처리함
									if(cnt == $(":checkbox:checked").length){
										$(":checkbox:not(:checked)").attr("disabled","disabled");
										$("#submit").attr("disabled",false);
									}else{	//체크된 갯수가 다르면 활성화 시킴
										$(":checkbox").removeAttr("disabled");
										$("#submit").attr("disabled",true);
									}
									
									<c:forEach items="${selseat}" var="vo">
										<c:forTokens items="${vo.selectseat}" delims="," var="cseat">

													var select = eval("document.selectform");
													var checked = document.getElementsByName("seat");
													for(var i=0; i<select.seat.length; i++){
														if(checked[i].value == ${cseat}){
															checked[i].disabled = true;
														}
													}
										 			
										</c:forTokens>
									</c:forEach>				
								});
								
								//셀렉트박스에서 다른 인원수를 선택하면 초기화를 시킴
								$("#count").change(function(){
									$(":checkbox").removeAttr("checked");
									$(":checkbox").removeAttr("disabled");
									
									<c:forEach items="${selseat}" var="vo">
									<c:forTokens items="${vo.selectseat}" delims="," var="cseat">

												var select = eval("document.selectform");
												var checked = document.getElementsByName("seat");
												for(var i=0; i<select.seat.length; i++){
													if(checked[i].value == ${cseat}){
														checked[i].disabled = true;
													}
												}
												
									</c:forTokens>
								</c:forEach>	
									
								});
							});
						
						
						</script>						

							<c:forEach items="${selseat}" var="vo">
									<c:forTokens items="${vo.selectseat}" delims="," var="cseat">

														<script>
													

													var select = eval("document.selectform");
													var checked = document.getElementsByName("seat");
													for(var i=0; i<select.seat.length; i++){
														if(checked[i].value == ${cseat}){
															checked[i].disabled = true;
														}
													}
												</script>
								</c:forTokens>
							</c:forEach> 
							<br>
											${chseat}
											
											</td>
										<tr>		
										 
									</table>
									
								<%-- <c:set var="alphabet" value="A,B,C,D,E,F,G,H,I,G,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y,Z"/>
								<c:forTokens items="${alphabet}" delims="," var="letter"  >
									${letter}
								</c:forTokens> --%>
								<script>
									var cnt = $("#count").val();
									
									if(cnt != $(":checkbox:checked").length){
										alert("예매선택한 갯수와 좌석선택수가 일치하지 않습니다.");
										$(".submit").attr("disabled",false);
										return;
									}
								</script>
								
									<input type="submit" value="장바구니에 담기" id="submit" disabled="disabled" class="btn btn-info" >
								
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