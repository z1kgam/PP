<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<html>
<head>

<!-- JSTL 사용을 위해 선언 -->    
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700&display=swap" rel="stylesheet">

    <link href="https://fonts.googleapis.com/css?family=EB+Garamond:400,400i,500,500i,600,600i,700,700i&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="${contextPath}/css/open-iconic-bootstrap.min.css">
    <link rel="stylesheet" href="${contextPath}/css/animate.css">
    
    <link rel="stylesheet" href="${contextPath}/css/owl.carousel.min.css">
    <link rel="stylesheet" href="${contextPath}/css/owl.theme.default.min.css">
    <link rel="stylesheet" href="${contextPath}/css/magnific-popup.css">

    <link rel="stylesheet" href="${contextPath}/css/aos.css">

    <link rel="stylesheet" href="${contextPath}/css/ionicons.min.css">

    <link rel="stylesheet" href="${contextPath}/css/bootstrap-datepicker.css">
    <link rel="stylesheet" href="${contextPath}/css/jquery.timepicker.css">

    
    <link rel="stylesheet" href="${contextPath}/css/flaticon.css">
    <link rel="stylesheet" href="${contextPath}/css/icomoon.css">
    <link rel="stylesheet" href="${contextPath}/css/style.css">
    
</head>


<body>
<!-- footer start -->
    <footer class="ftco-footer ftco-section bg-light" style="width: 100%;">
      <div class="container">
        <div class="row d-flex">
          <div class="col-md">
            <div class="ftco-footer-widget mb-4">
              <h2 class="ftco-heading-2" style="font-family: 'Do Hyeon', sans-serif;">㈜2티켓</h2>
              <p>109, Dongcheon-ro, Busanjin-gu, Busan, Republic of Korea</p>
              <ul class="ftco-footer-social list-unstyled float-lft mt-3">
                <li class="ftco-animate"><a href="#" style="background-color: #EB008B;"><span class="icon-twitter"></span></a></li>
                <li class="ftco-animate"><a href="#" style="background-color: #00E7D6;"><span class="icon-facebook"></span></a></li>
                <li class="ftco-animate"><a href="#" style="background-color: #D8FF54;"><span class="icon-instagram"></span></a></li>
              </ul>
            </div>
          </div>
          <div class="col-md">
            <div class="ftco-footer-widget mb-4 ml-md-4">
              <h2 class="ftco-heading-2" style="font-family: 'Do Hyeon', sans-serif;">이용약관</h2>
              <ul class="list-unstyled">
                <li><a href="${contextPath}/caution/caution1.jsp">예매취소 시 유의사항</a></li>
                <li><a href="${contextPath}/caution/caution2.jsp">환불안내</a></li>
                <li><a href="${contextPath}/caution/caution3.jsp">무통장입금 시 주의사항</a></li>
               
              </ul>
            </div>
          </div>
          <div class="col-md">
            <div class="ftco-footer-widget mb-4">
              <h2 class="ftco-heading-2" style="font-family: 'Do Hyeon', sans-serif;">Quick Links</h2>
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
              <h2 class="ftco-heading-2" style="font-family: 'Do Hyeon', sans-serif;">Have a Questions?</h2>
              <div class="block-23 mb-3">
                <ul>
                  <li><span class="icon icon-map-marker"></span><span class="text" style="padding: 0 0px 2px; font-weight: 100;">109, Dongcheon-ro, Busanjin-gu, Busan, Republic of Korea</span></li>
                  <li><a href="#"><span class="icon icon-phone"></span><span class="text" style="padding: 0 0px 2px; font-weight: 100;">+2 392 3929 210</span></a></li>
                  <li><a href="#"><span class="icon icon-envelope"></span><span class="text" style="padding: 0 0px 2px; font-weight: 100;">2ticket@ticket.com</span></a></li>
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
    
  <script src="${contextPath}/js/jquery.min.js"></script>
  <script src="${contextPath}/js/jquery-migrate-3.0.1.min.js"></script>
  <script src="${contextPath}/js/popper.min.js"></script>
  <script src="${contextPath}/js/bootstrap.min.js"></script>
  <script src="${contextPath}/js/jquery.easing.1.3.js"></script>
  <script src="${contextPath}/js/jquery.waypoints.min.js"></script>
  <script src="${contextPath}/js/jquery.stellar.min.js"></script>
  <script src="${contextPath}/js/owl.carousel.min.js"></script>
  <script src="${contextPath}/js/jquery.magnific-popup.min.js"></script>
  <script src="${contextPath}/js/aos.js"></script>
  <script src="${contextPath}/js/jquery.animateNumber.min.js"></script>
  <script src="${contextPath}/js/bootstrap-datepicker.js"></script>
  <script src="${contextPath}/js/jquery.timepicker.min.js"></script>
  <script src="${contextPath}/js/scrollax.min.js"></script>
  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
  <script src="${contextPath}/js/google-map.js"></script>
  <script src="${contextPath}/js/main.js"></script>

</body>
</html>    