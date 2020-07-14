<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- JSTL 사용을 위해 선언 -->    
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />


<link href="//fonts.googleapis.com/earlyaccess/nanumgothic.css" rel="stylesheet" type="text/css">


  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700&display=swap" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css?family=Noto+Sans+ER" rel="stylesheet">


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
  	<nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
  		<div class="container" >
  			<div class="row m-auto">
  				<div class="col-12 w-100 text-center">
  					<a class="navbar-brand w-100" href="${contextPath}" style="float: left; margin-left: -400px;" >Ticketing</a>
  					
  					
  					
 				
  	<table style="width:300px; height: 100px;  border-collapse: separate;	
    border-spacing: 1px; margin: 100px; text-align: center; float: right; margin-top: -100px; font-size: 12px;">
    
  <c:if test="${id!=null}">
     <tr height="10" align="center" bgcolor="#FFB5B5" style="width: 155px;
    		padding: 10px; font-weight: bold;">
        <td rowspan="3" align = "center" bgcolor="#FFB5B5" width="100px;">
   <c:choose>    	
    	 <c:when test="${!empty profile_img }">
	       <img src="${contextPath}/upload/${profile_img}" alt="프로필 이미지" style="max-width: 100px;">
    	 </c:when>
     
   		 <c:when test="${empty profile_img}">
			<img src="${contextPath}/images/icon.png" width="100px" height="100px">
  		 </c:when>
   </c:choose>
        </td>
	<td colspan="2" style="width: 100px;"><span id="counter"> </span> 후 자동로그아웃 <input type="button" class="btn btn-primary" value="연장" onclick="counter_reset()"></td>
	
    </tr>
    <tr height="10" align="center" bgcolor="#FFB5B5" style="width: 155px; padding: 10px; font-weight: bold;">
		<td colspan="2">
	
		<c:if test="${id!=null}">
  					${id}님 로그인중..
  		</c:if>
		</td>
        </tr>
        
        <tr height="10" align="center" bgcolor="#FFB5B5" style="width: 155px; padding: 10px; font-weight: bold;">
		    <c:if test="${id!=null}">
		        <td><a href="${contextPath}/member/logout.do" style="color: #fff;">로그아웃</a></td>
				<td><a href="${contextPath}/mycon/mypageForm.do" style="color: #fff;">마이 페이지</a></td>
			</c:if>	
        </tr>

</c:if>
</table>
  					
	
  					
  					
			      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
			        <span class="oi oi-menu"></span> Menu
			      </button>
  				</div>
  				<!-- 메인페이지 -->
  				<div class="col-12 w-100 text-center" style="margin-top: -100px;">
  					<div class="collapse navbar-collapse" id="ftco-nav">
			        <ul class="navbar-nav m-auto">
			          <li class="nav-item active"><a href="index/index.jsp" class="nav-link" style="font-size: 18px; font-family:나눔고딕">메인</a></li>
			          <li class="nav-item"><a href="${contextPath}/Proser/imcontact.do" class="nav-link" style="font-size: 18px; font-family:나눔고딕">공연&상품 페이지</a></li>
			          <li class="nav-item"><a href="#" class="nav-link" style="font-size: 18px; font-family:나눔고딕">###</a></li>
			          <li class="nav-item"><a href="${contextPath}/ev/listEvent.do" class="nav-link" style="font-size: 18px; font-family:나눔고딕">이벤트</a></li>
			     <c:if test="${is_admin == 1}">     
			          <li class="nav-item"><a href="${contextPath}/admin/adminPage.do" class="nav-link" style="font-size: 18px; font-family:나눔고딕">관리자 페이지</a></li>
			     </c:if>     
			          <li class="nav-item"><a href="../blog.jsp" class="nav-link" style="font-size: 18px; font-family:나눔고딕">예매하기</a></li>
			          <li class="nav-item"><a href="${contextPath}/notice/listNotice.do" class="nav-link" style="font-size: 18px; font-family:나눔고딕">고객센터</a></li>
			     <c:if test="${id==null}">
			          <li class="nav-item"><a href="${contextPath}/member/login.do" class="nav-link" style="font-size: 18px; font-family:나눔고딕">로그인</a></li>
			          <li class="nav-item"><a href="${contextPath}/member/join.do" class="nav-link" style="font-size: 18px; font-family:나눔고딕">회원가입</a></li>
			     </c:if>
			        </ul>
			      </div>
  				</div>
  			</div>
  		</div>
	  </nav>
    <!-- END nav -->
    
    
    

    

    <section class="home-slider js-fullheight owl-carousel">
      <div class="slider-item js-fullheight" style="background-image:url(../images/mainimg.jpeg);">
      	<div class="overlay"></div>
        <div class="container">
          <div class="row no-gutters slider-text js-fullheight align-items-center justify-content-center" data-scrollax-parent="true">
          <div class="col-md-10 text ftco-animate text-center">
            <h1 class="mb-4">Discover Your Inner Sanctuary</h1>
            <h3 class="subheading">Everyday We Bring Hope and Smile to the Patient We Serve</h3>
            <p><a href="#" class="btn btn-white btn-outline-white px-4 py-3 mt-3">View our works</a></p>
          </div>
        </div>
        </div>
      </div>

      <div class="slider-item js-fullheight" style="background-image:url(../images/mainimg2.jpeg);">
      	<div class="overlay"></div>
        <div class="container">
          <div class="row no-gutters slider-text js-fullheight align-items-center justify-content-center" data-scrollax-parent="true">
          <div class="col-md-10 text ftco-animate text-center">
            <h1 class="mb-4">Lighting Your Heart &amp; Mind</h1>
            <h3 class="subheading">Your Health is Our Top Priority with Comprehensive, Affordable medical.</h3>
            <p><a href="#" class="btn btn-white btn-outline-white px-4 py-3 mt-3">View our works</a></p>
          </div>
        </div>
        </div>
      </div>
    </section>
    
    
    
    
    
    
    
    
    
    
    
    
    
    
 <section class="ftco-section">  
 <div class="container">
 <div class="row">
 <div class="col-md-4" >     
 <div class="classes w-100 ftco-animate">  			
 <iframe class="img w-100 mb-3" src="https://www.youtube.com/embed/N5Dz7azrIVI" frameborder="0" allow="accelerometer; 
 autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
 </div> 
 </div>
    
    
 <div class="col-md-4" >  
 <div  class="classes w-100 ftco-animate">
 <iframe class="img w-100 mb-3" src="https://www.youtube.com/embed/dr9xhEPIoWc" 
 frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
 </div>   
 </div>

    
 <div class="col-md-4" >  
 <div  class="classes w-100 ftco-animate">
 <iframe class="img w-100 mb-3" src="https://www.youtube.com/embed/oYQZZnOw5Fs" frameborder="0" allow="accelerometer; autoplay; 
 encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
 </div>   
 </div>
 
  </div>
 </div>
 </section>
    
	<jsp:include page="../include/carousel.jsp" />					
					
