<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
  <head>
  
    <title>Meditative - Free Bootstrap 4 Template by Colorlib</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
   
  </head>
  <body>
  	<jsp:include page="../include/subheader.jsp" />
    <!-- END nav -->

    

    <section class="ftco-section contact-section ftco-no-pt ftco-no-pb">
      <div class="container">
        <div class="row block-9">
			<div class="col-md-4 contact-info ftco-animate p-4 w-100 py-md-5">
				<div class="row">
		            <div class="col-md-12 mb-3">
		              <p style="font-size: 16px;"><a href="${contextPath}/member/pwCheckForm.do">내 정보수정</a></p>
		            </div>
		            <div class="col-md-12 mb-3">
		              <p style="font-size: 16px;"><a href="${contextPath}/member/updateProfile.do">프로필 이미지</a></p>
		            </div>
		            <div class="col-md-12 mb-3">
		              <p style="font-size: 16px;"><a href="${contextPath}/member/address.do">배송지 관리</a></p>
		            </div>
		            <div class="col-md-12 mb-3">
		              <p style="font-size: 16px;"><a href="${contextPath}/mycon/likelistForm.do">좋아요 리스트</a></p>
		            </div>
		            <div class="col-md-12 mb-3">
		              <p style="font-size: 16px;"><a href="${contextPath}/Order/cartList.do">장바구니</a></p>
		            </div>
		            <div class="col-md-12 mb-3">
		              <p style="font-size: 16px;"><a href="${contextPath}/Order/payList.do">결제내역보기</a></p>
		            </div>
				</div>
			</div>  
			
 <table border="1" font-size="30px"  style="width:50%; margin: 100px; text-align: center;" >      
 	<tbody>
    	<tr>
        	<td width="50%;" height="300px;" >
    			<c:choose> 
     				<c:when test="${!empty profile_img}">
	       				<img src="${contextPath}/upload/${profile_img}" alt="프로필 이미지" style="max-width: 250px;">
     				</c:when>
     
    				<c:when test="${empty profile_img}">
						<img src="${contextPath}/images/icon.png" style="max-width: 250px;">
  					</c:when>
   				</c:choose>    
       		</td>  
          <td>예매 내역 : <a href="${contextPath}/Order/cartList.do?id=${sessionScope.id}">${sessionScope.cartCount}</a></td>
        </tr>
      
   <tbody>
      <tr>
        <td  height="150px">${sessionScope.id}</td>
        <td rowspan="2">문의 내역</td>
      </tr>
        <tr>
          <td height="150px">${sessionScope.name}</td>
        </tr>
        <tr>
        	<td>결제 내역 : <a href="${contextPath}/Order/payList.do?id=${sessionScope.id}">${requestScope.payCount}</a></td>
        </tr>
      </tbody>
</table>







    <footer class="ftco-footer ftco-section bg-light">
      <div class="container">
        <div class="row d-flex">
          <div class="col-md">
            <div class="ftco-footer-widget mb-4">
              <h2 class="ftco-heading-2">Meditative</h2>
              <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
              <ul class="ftco-footer-social list-unstyled float-lft mt-3">
                <li class="ftco-animate"><a href="#"><span class="icon-twitter"></span></a></li>
                <li class="ftco-animate"><a href="#"><span class="icon-facebook"></span></a></li>
                <li class="ftco-animate"><a href="#"><span class="icon-instagram"></span></a></li>
              </ul>
            </div>
          </div>
          <div class="col-md">
            <div class="ftco-footer-widget mb-4 ml-md-4">
              <h2 class="ftco-heading-2">Popular Links</h2>
              <ul class="list-unstyled">
                <li><a href="#">Yoga for Beginners</a></li>
                <li><a href="#">Yoga for Pregnant</a></li>
                <li><a href="#">Yoga Barre</a></li>
                <li><a href="#">Yoga Advance</a></li>
              </ul>
            </div>
          </div>
          <div class="col-md">
            <div class="ftco-footer-widget mb-4">
              <h2 class="ftco-heading-2">Quick Links</h2>
              <ul class="list-unstyled">
                <li><a href="#">Home</a></li>
                <li><a href="#">About</a></li>
                <li><a href="#">Classes</a></li>
                <li><a href="#">Schedule</a></li>
                <li><a href="#">Contact</a></li>
              </ul>
            </div>
          </div>
          <div class="col-md">
            <div class="ftco-footer-widget mb-4">
              <h2 class="ftco-heading-2">Have a Questions?</h2>
              <div class="block-23 mb-3">
                <ul>
                  <li><span class="icon icon-map-marker"></span><span class="text">203 Fake St. Mountain View, San Francisco, California, USA</span></li>
                  <li><a href="#"><span class="icon icon-phone"></span><span class="text">+2 392 3929 210</span></a></li>
                  <li><a href="#"><span class="icon icon-envelope"></span><span class="text">info@yourdomain.com</span></a></li>
                </ul>
              </div>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-md-12 text-center">

            <p class="mb-0">
              <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
              Copyright &copy;<script>
                document.write(new Date().getFullYear());

              </script> All rights reserved | This template is made with <i class="icon-heart" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
              <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
            </p>
          </div>
        </div>
      </div>
    </footer>
    
  

  <!-- loader -->
  <div id="ftco-loader" class="show fullscreen" ><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>


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