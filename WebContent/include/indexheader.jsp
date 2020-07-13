<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!-- PP -->
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
  	
  	
  	
  	
  	
  	
  	
  	
<!------------------------------------------------ 맨위 내비바 -------------------------------------------------->





<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<style>
body {
	background: #eeeeee;
	font-family: 'Varela Round', sans-serif;
}
.navbar {
	color: #fff;
	background: #3d435c !important;
	padding: 5px 16px;
	border-radius: 0;
	border: none;
	box-shadow: 0 0 4px rgba(0,0,0,.1);
}


/* .navbar img {
	border-radius: 50%;
	width: 36px;
	height: 36px;
	margin-right: 10px;
}
 */



.navbar .navbar-brand {
	color: #efe5ff;
	padding-left: 0;
	padding-right: 50px;
	font-size: 24px;		
}
.navbar .navbar-brand:hover, .navbar .navbar-brand:focus {
	color: #fff;
}
.navbar .navbar-brand i {
	font-size: 25px;
	margin-right: 5px;
}
.search-box {
	position: relative;
}	
.search-box input {
	padding-right: 35px;
	min-height: 38px;
	border: none;
	background: #faf7fd;
	border-radius: 3px !important;
}
.search-box input:focus {		
	background: #fff;
	box-shadow: none;
}
.search-box .input-group-addon {
	min-width: 35px;
	border: none;
	background: transparent;
	position: absolute;
	right: 0;
	z-index: 9;
	padding: 10px 7px;
	height: 100%;
}
.search-box i {
	color: #a0a5b1;
	font-size: 19px;
}
.navbar .nav-item i {
	font-size: 18px;
}
.navbar .nav-item span {
	position: relative;
	top: 3px;
}
.navbar .navbar-nav > a {
	color: #efe5ff;
	padding: 8px 15px;
	font-size: 14px;		
}
.navbar .navbar-nav > a:hover, .navbar .navbar-nav > a:focus {
	color: #fff;
	text-shadow: 0 0 4px rgba(255,255,255,0.3);
}
.navbar .navbar-nav > a > i {
	display: block;
	text-align: center;
}
.navbar .dropdown-item i {
	font-size: 16px;
	min-width: 22px;
}
.navbar .dropdown-item .material-icons {
	font-size: 21px;
	line-height: 16px;
	vertical-align: middle;
	margin-top: -2px;
}
.navbar .nav-item.open > a, .navbar .nav-item.open > a:hover, .navbar .nav-item.open > a:focus {
	color: #fff;
	background: none !important;
}
.navbar .dropdown-menu {
	border-radius: 1px;
	border-color: #e5e5e5;
	box-shadow: 0 2px 8px rgba(0,0,0,.05);
}
.navbar .dropdown-menu a {
	color: #777 !important;
	padding: 8px 20px;
	line-height: normal;
	font-size: 15px;
}
.navbar .dropdown-menu a:hover, .navbar .dropdown-menu a:focus {
	color: #333 !important;
	background: transparent !important;
}
.navbar .navbar-nav .active a, .navbar .navbar-nav .active a:hover, .navbar .navbar-nav .active a:focus {
	color: #fff;
	text-shadow: 0 0 4px rgba(255,255,255,0.2);
	background: transparent !important;
}
.navbar .navbar-nav .user-action {
	padding: 9px 15px;
	font-size: 15px;
}
.navbar .navbar-toggle {
	border-color: #fff;
}
.navbar .navbar-toggle .icon-bar {
	background: #fff;
}
.navbar .navbar-toggle:focus, .navbar .navbar-toggle:hover {
	background: transparent;
}
.navbar .navbar-nav .open .dropdown-menu {
	background: #faf7fd;
	border-radius: 1px;
	border-color: #faf7fd;
	box-shadow: 0 2px 8px rgba(0,0,0,.05);
}
.navbar .divider {
	background-color: #e9ecef !important;
}
@media (min-width: 1200px){
	.form-inline .input-group {
		width: 350px;
		margin-left: 30px;
	}
}
@media (max-width: 1199px){
	.navbar .navbar-nav > a > i {
		display: inline-block;			
		text-align: left;
		min-width: 30px;
		position: relative;
		top: 4px;
	}
	.navbar .navbar-collapse {
		border: none;
		box-shadow: none;
		padding: 0;
	}
	.navbar .navbar-form {
		border: none;			
		display: block;
		margin: 10px 0;
		padding: 0;
	}
	.navbar .navbar-nav {
		margin: 8px 0;
	}
	.navbar .navbar-toggle {
		margin-right: 0;
	}
	.input-group {
		width: 100%;
	}
}
</style>



<!------------------------------------------------------내비바------------------------------------------------------>


</head> 
<body>
<nav class="navbar navbar-expand-xl navbar-dark bg-dark">
	<a href="#" class="navbar-brand"><i class="fa fa-cube"></i>Ticketing</a>  		
	<button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
		<span class="navbar-toggler-icon"></span>
	</button>
	<!-- Collection of nav links, forms, and other content for toggling -->
	<div id="navbarCollapse" class="collapse navbar-collapse justify-content-start">		
		<form class="navbar-form form-inline">
			<div class="input-group search-box">								
				<input type="text" id="search" class="form-control" placeholder="검색하기..." style="height: 15px !important; margin-top: 10px;">
				<span class="input-group-addon"><i class="material-icons">&#xE8B6;</i></span>
			</div>
		</form>
		<div class="navbar-nav ml-auto">
			<a href="#" class="nav-item nav-link active"><i class="fa fa-home"></i><span>홈으로</span></a>
			<a href="#" class="nav-item nav-link"><i class="fa fa-gears"></i><span>관리자 페이지</span></a>
			<a href="#" class="nav-item nav-link"><i class="fa fa-users"></i><span>고객센터</span></a>
			<a href="#" class="nav-item nav-link"><i class="fa fa-pie-chart"></i><span>이용안내</span></a>
			<a href="#" class="nav-item nav-link"><i class="fa fa-briefcase"></i><span>장바구니</span></a>
			<a href="#" class="nav-item nav-link"><i class="fa fa-envelope"></i><span>메세지</span></a>		
			<a href="#" class="nav-item nav-link"><i class="fa fa-bell"></i><span>알림</span></a>
			<div class="nav-item dropdown">
				<a href="#" data-toggle="dropdown" class="nav-item nav-link dropdown-toggle user-action"><img src="https://www.tutorialrepublic.com/examples/images/avatar/3.jpg" class="avatar" alt="Avatar" style="border-radius: 50%;
	width: 36px;
	height: 36px;
	margin-right: 10px;"> Antonio Moreno <b class="caret"></b></a>
				<div class="dropdown-menu">
					<a href="#" class="dropdown-item"><i class="fa fa-user-o"></i> 마이페이지</a>
					<a href="#" class="dropdown-item"><i class="fa fa-calendar-o"></i> 로그인</a>
					<a href="#" class="dropdown-item"><i class="fa fa-sliders"></i> 회원가입</a>
					<div class="divider dropdown-divider"></div>
					<a href="#" class="dropdown-item"><i class="material-icons" style="min-width: 100px !important;">&#xE8AC;</i> 로그아웃</a>
				</div>
			</div>
		</div>
	</div>
</nav>


<!-------------------------------------------------------- 내비바 끝 ---------------------------------------------------------------->
  	
  	
  	
  	
  	
  	
<!--------------------------------------------------- 메뉴바 ------------------------------------------------------->
  	
  	<nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
  		<div class="container" >
  			<div class="row m-auto">
  				<div class="col-12 w-100 text-center">
  					<!-- <a class="navbar-brand w-100" href="index.jsp" style="float: left; margin-left: -400px;" >Ticketing</a> -->
  					<a class="navbar-brand w-100" href="${contextPath}" style="float: left; margin-left: 40px; margin-top: 20px;" ><img src="../images/tclogo.png"" alt="tlogo" style=" max-height: 120px;"></a> 
  					
  					
  					
  	
  					
	
  					
  					
			      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
			        <span class="oi oi-menu"></span> Menu
			      </button>
  				</div>
  				
  				<c:if test="${id!=null}">
  					${id}님 로그인중..
  				</c:if>

  				
  				

  				



  				<div class="col-12 w-100 text-center" style="margin-top: -20px;">
  					<div class="collapse navbar-collapse" id="ftco-nav">
			        <ul class="navbar-nav m-auto" >
			          <li class="nav-item"><a href="index/index.jsp" class="nav-link" style="font-size: 18px; font-family:나눔고딕; ">메인</a></li>
			          <li class="nav-item"><a href="${contextPath}/Proser/imcontact.do" class="nav-link" style="font-size: 18px; font-family:나눔고딕">공연&상품 페이지</a></li>
			          <li class="nav-item"><a href="#" class="nav-link" style="font-size: 18px; font-family:나눔고딕">###</a></li>
			          <li class="nav-item"><a href="../blog.jsp" class="nav-link" style="font-size: 18px; font-family:나눔고딕">이벤트</a></li>
			     <c:if test="${is_admin == 1}">     
			          <li class="nav-item"><a href="${contextPath}/admin/adminPage.do" class="nav-link" style="font-size: 18px; font-family:나눔고딕">관리자 페이지</a></li>
			     </c:if>     
			          <li class="nav-item"><a href="../blog.jsp" class="nav-link" style="font-size: 18px; font-family:나눔고딕">예매하기</a></li>
			          <li class="nav-item"><a href="${contextPath}/notice/listNotice.do" class="nav-link" style="font-size: 18px; font-family:나눔고딕">공지사항</a></li>
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
    
    
    

    
<!------------------------------------------------ body ------------------------------------------------->



<!-- 
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
    
    
   -->  
  
  
  <!-- -----------------------------------------------------------메인 이미지---------------------------------------------------------- -->  
    
    
    
    
    
   
 <!-------------------------------------------------- 캐로셀 ------------------------------------------------->
    
    
    <div class="carousel1" style="margin-top: 100px;"> 
	<jsp:include page="../include/carousel.jsp" />					
	</div>				
	  
    
    
    
    
 <section class="ftco-section" style="margin-top: -200px;">  
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
 
