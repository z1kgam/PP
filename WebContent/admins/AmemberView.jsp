
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%
	request.setCharacterEncoding("UTF-8");
%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

    <!-- 회원 관리 페이지 -->
    
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
	<title>Ready Bootstrap Dashboard</title>
	<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no' name='viewport' />
	<link rel="stylesheet" href="${contextPath}/admins/assets/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i">
	<link rel="stylesheet" href="${contextPath}/admins/assets/css/ready.css">
	<link rel="stylesheet" href="${contextPath}/assets/css/demo.css">
	
<style type="text/css">

div#box {
	
	
	width: 25%;
	
}

button#formbutton {

	    padding: 20px 40px;
	    
}



</style>

<script type="text/javascript">

//포인트 입력 박스
function te3(t) {
	
	if(t == 1) {
	  var z = document.getElementById("po");
	  if (z.style.display === "none") {
	    z.style.display = "block";
	  } else {
	    z.style.display = "none";
	  }
	  
	  var x = document.getElementById("po2");
	  if (x.style.display === "none") {
	    x.style.display = "block";
	  } else {
	    x.style.display = "none";
	  }
	  
	 }
	
	if(t == 2) {
		
		var z = document.getElementById("po");
		if (z.style.display === "block") {
			z.style.display = "none";
		 }
		
		
		var x = document.getElementById("po2");
		 if (x.style.display === "none") {
		  x.style.display = "block";
		}
	}
		
	
	
	}


//목록 리스트 이동 
function list3(f) {
	
	f.action = "${contextPath}/admin/MemberManager.do?nowpage=1";
	f.submit();
	
}

//수정 함수
function update(f) {
	
	console.debug(f);
	 if (confirm("정말 수정하시겠습니까??") == true){    //확인
	f.action = "${contextPath}/admin/MemberUpdate.do?point2=${memberInfo.point}";
	f.submit();
	} else {
		return false;
	}

}


</script>
	
</head>
<body>
	<div class="wrapper">
		<div class="main-header">  
			<div class="logo-header">
				<a href="#" class="logo">
					Ready Dashboard
				</a>
				<button class="navbar-toggler sidenav-toggler ml-auto" type="button" data-toggle="collapse" data-target="collapse" aria-controls="sidebar" aria-expanded="false" aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<button class="topbar-toggler more"><i class="la la-ellipsis-v"></i></button>
			</div>
			<nav class="navbar navbar-header navbar-expand-lg">
				<div class="container-fluid">
					
					<form class="navbar-left navbar-form nav-search mr-md-3" action="">
						<div class="input-group">
							<input type="text" placeholder="Search ..." class="form-control">
							<div class="input-group-append">
								<span class="input-group-text">
									<i class="la la-search search-icon"></i>
								</span>
							</div>
						</div>
					</form>
					<ul class="navbar-nav topbar-nav ml-md-auto align-items-center">
						<li class="nav-item dropdown hidden-caret">
							<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
								<i class="la la-envelope"></i>
							</a>
							<div class="dropdown-menu" aria-labelledby="navbarDropdown">
								<a class="dropdown-item" href="#">Action</a>
								<a class="dropdown-item" href="#">Another action</a>
								<div class="dropdown-divider"></div>
								<a class="dropdown-item" href="#">Something else here</a>
							</div>
						</li>
						
						<!-- 상단 알림창 -->
						<li class="nav-item dropdown hidden-caret">
							<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
								<i class="la la-bell"></i>
								<span class="notification">3</span>
							</a>
							<ul class="dropdown-menu notif-box" aria-labelledby="navbarDropdown">
								<li>
									<div class="dropdown-title">You have 4 new notification</div>
								</li>
								<li>
									<div class="notif-center">
										<a href="#">
											<div class="notif-icon notif-primary"> <i class="la la-user-plus"></i> </div>
											<div class="notif-content">
												<span class="block">
													New user registered
												</span>
												<span class="time">5 minutes ago</span> 
											</div>
										</a>
										<a href="#">
											<div class="notif-icon notif-success"> <i class="la la-comment"></i> </div>
											<div class="notif-content">
												<span class="block">
													Rahmad commented on Admin
												</span>
												<span class="time">12 minutes ago</span> 
											</div>
										</a>
										<a href="#">
											<div class="notif-img"> 
												<img src="${contextPath}/admins/assets/img/profile2.jpg" alt="Img Profile">
											</div>
											<div class="notif-content">
												<span class="block">
													Reza send messages to you
												</span>
												<span class="time">12 minutes ago</span> 
											</div>
										</a>
										<a href="#">
											<div class="notif-icon notif-danger"> <i class="la la-heart"></i> </div>
											<div class="notif-content">
												<span class="block">
													Farrah liked Admin
												</span>
												<span class="time">17 minutes ago</span> 
											</div>
										</a>
									</div>
								</li>
								<li>
									<a class="see-all" href="javascript:void(0);"> <strong>See all notifications</strong> <i class="la la-angle-right"></i> </a>
								</li>
							</ul>
						</li>
						<!-- 상단 알림창 -->	
						
						</ul>
					</div>
				</nav>
			</div>
			
			<div class="sidebar">
				<div class="scrollbar-inner sidebar-wrapper">
					<div class="user">
						<div class="photo">
							<img src="${contextPath}/admins/assets/img/profile.jpg">
						</div>
						<div class="info">
							<a class="" data-toggle="collapse" href="#collapseExample" aria-expanded="true">
								<span>
									Hizrian
									<span class="user-level">Administrator</span>
									<span class="caret"></span>
								</span>
							</a>
							<div class="clearfix"></div>

							<div class="collapse in" id="collapseExample" aria-expanded="true" style="">
								<ul class="nav">
									<li>
										<a href="#">
											<span class="link-collapse">My Profile</span>
										</a>
									</li>
									<li>
										<a href="#">
											<span class="link-collapse">Edit Profile</span>
										</a>
									</li>
									<li>
										<a href="#">
											<span class="link-collapse">Settings</span>
										</a>
									</li>
								</ul>
							</div>
						</div>
					</div>
					
					<!-- 사이드 네비 창 -->
					<ul class="nav">
						<li class="nav-item active">
							<a href="${contextPath}/admin/adminPage.do">
								<i class="la la-dashboard"></i>
								<p>메인 페이지</p>
								<span class="badge badge-count">5</span>
							</a>
						</li>
						<li class="nav-item active">
							<a href="${contextPath}/admin/MemberManager.do">
								<i class="la la-group"></i>
								<p>회원 관리</p>
								<span class="badge badge-count">5</span>
							</a>
						</li>
						<li class="nav-item active">
							<a href="${contextPath}/admin/ProductMan.do">
								<i class="la la-cart-plus"></i>
								<p>공연 상품 관리</p>
								<span class="badge badge-count">5</span>
							</a>
						</li>
						<li class="nav-item active">
							<a href="#">
								<i class="la la-gift"></i>
								<p>이벤트 관리</p>
								<span class="badge badge-count">5</span>
							</a>
						</li>
						
						<li class="nav-item active">
							<a href="#">
								<i class="la la-bullhorn"></i>
								<p>공지 사항 관리</p>
								<span class="badge badge-count">5</span>
							</a>
						</li>
						<li class="nav-item">
							<a href="${contextPath}/admins/components.html">
								<i class="la la-table"></i>
								<p>Components</p>
								<span class="badge badge-count">14</span>
							</a>
						</li>
						<li class="nav-item">
							<a href="${contextPath}/admins/forms.html">
								<i class="la la-keyboard-o"></i>
								<p>Forms</p>
								<span class="badge badge-count">50</span>
							</a>
						</li>
						<li class="nav-item">
							<a href="${contextPath}/admins/tables.html">
								<i class="la la-th"></i>
								<p>Tables</p>
								<span class="badge badge-count">6</span>
							</a>
						</li>
						<li class="nav-item">
							<a href="${contextPath}/admins/notifications.html">
								<i class="la la-bell"></i>
								<p>Notifications</p>
								<span class="badge badge-success">3</span>
							</a>
						</li>
						<li class="nav-item">
							<a href="${contextPath}/admins/typography.html">
								<i class="la la-font"></i>
								<p>Typography</p>
								<span class="badge badge-danger">25</span>
							</a>
						</li>
						  <h6 class="sidebar-heading d-flex justify-content-between align-items-center px-3 mt-4 mb-1 text-muted te" >
        			  <span style="font-size: 12px;">고객 센터 관리</span>
          			<a class="d-flex align-items-center text-muted" href="#" aria-label="Add a new report">
          			  <span data-feather="plus-circle"></span>
         			 </a>
       				 </h6>
       				 	<li class="nav-item active">
							<a href="#">
								<i class="la la-clipboard"></i>
								<p>FAQ 관리</p>
								<span class="badge badge-count">5</span>
							</a>
						</li>
       				 	<li class="nav-item active">
							<a href="#">
								<i class="la la-bullhorn"></i>
								<p>공지 사항 관리</p>
								<span class="badge badge-count">5</span>
							</a>
						</li>
						<li class="nav-item active">
							<a href="#">
								<i class="la la-vimeo-square la-vine la-vk la-volume-down la-volume-off la-volume-up la-warning la-wechat"></i>
								<p>문의 내역 답변 관리</p>
								<span class="badge badge-count">5</span>
							</a>
						</li>
						<li class="nav-item active">
							<a href="#">
								<i class="la la-gavel"></i>
								<p>회원 신고 관리</p>
								<span class="badge badge-count">5</span>
							</a>
						</li>
						<li class="nav-item">
							<a href="#">
								<i class="la la-fonticons"></i>
								<p>Icons</p>
							</a>
						</li>
					</ul>
					<!-- 사이드 네비 창 -->
					
				</div>
			</div>
			
			<!-- Body 부분 -->

		
		
		<div class="main-panel">
				<div class="content">
					<div class="container-fluid">
						<h4 class="page-title">${memberInfo.id}님의 정보</h4>
					<div class="row">
						<div class="col-md-3">
							<div class="card card-stats card-warning">
								<div class="card-body ">
									<div class="row">
										<div class="col-5">
											<div class="icon-big text-center">
												<i class="la la-users"></i>
											</div>
										</div>
										<div class="col-7 d-flex align-items-center">
											<div class="numbers">
												<p class="card-category">Visitors</p>
												<h4 class="card-title">1,294</h4>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-md-3">
							<div class="card card-stats card-success">
								<div class="card-body ">
									<div class="row">
										<div class="col-5">
											<div class="icon-big text-center">
												<i class="la la-bar-chart"></i>
											</div>
										</div>
										<div class="col-7 d-flex align-items-center">
											<div class="numbers">
												<p class="card-category">Sales</p>
												<h4 class="card-title">$ 1,345</h4>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-md-3">
							<div class="card card-stats card-danger">
								<div class="card-body">
									<div class="row">
										<div class="col-5">
											<div class="icon-big text-center">
												<i class="la la-newspaper-o"></i>
											</div>
										</div>
										<div class="col-7 d-flex align-items-center">
											<div class="numbers">
												<p class="card-category">ID님의 작성 글</p>
												<h4 class="card-title">1303</h4>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-md-3">
							<div class="card card-stats card-primary">
								<div class="card-body ">
									<div class="row">
										<div class="col-5">
											<div class="icon-big text-center">
												<i class="la la-check-circle"></i>
											</div>
										</div>
										<div class="col-7 d-flex align-items-center">
											<div class="numbers">
												<p class="card-category">주문 현황</p>
												<h4 class="card-title">1</h4>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					
					
					<!-- 회원 프로파일링 -->
					<form action="#" method="post">
					<div class="row row-card-no-pd">
							<div class="col-md-4">
								<div class="card">
									<div class="card-body">
										<p class="fw-bold mt-1"> 포인트 </p>
										<h4><b>P ${memberInfo.point}</b></h4>
										<div id="po"  style="display: none">
										<input type="text" class="form-control input-pill" id="pillInput" placeholder="AJAX 구현하기" name="point">	
										</div>
										<div id="po2">
										<a href="#" class="btn btn-primary btn-full text-left mt-3 mb-3" onclick="te3(1)"><i class="la la-plus"></i>포인트 변경</a>
										</div>
									</div>
									<div class="card-footer">
										<ul class="nav">
											<li class="nav-item"><a class="btn btn-default btn-link" href="#"><i class="la la-history"></i> History</a></li>
											<li class="nav-item ml-auto"><a class="btn btn-default btn-link" onclick="update(this.form)"><i class="la la-refresh"></i> Refresh</a></li>
											<li class="nav-item ml-auto"><a class="btn btn-default btn-link" href="#" onclick="te3(2)"><i class="la la-refresh"></i> Refresh</a></li>
										</ul>
									</div>
								</div>
							</div>
							<div class="col-md-5">
								<div class="card">
									<div class="card-body">
										<div class="progress-card">
											<div class="d-flex justify-content-between mb-1">
												<span class="text-muted">힙합</span>
												<span class="text-muted fw-bold"> $3K</span>
											</div>
											<div class="progress mb-2" style="height: 7px;">
												<div class="progress-bar bg-success" role="progressbar" style="width: 78%" aria-valuenow="78" aria-valuemin="0" aria-valuemax="100" data-toggle="tooltip" data-placement="top" title="78%"></div>
											</div>
										</div>
										<div class="progress-card">
											<div class="d-flex justify-content-between mb-1">
												<span class="text-muted">클래식</span>
												<span class="text-muted fw-bold"> 576</span>
											</div>
											<div class="progress mb-2" style="height: 7px;">
												<div class="progress-bar bg-info" role="progressbar" style="width: 65%" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" data-toggle="tooltip" data-placement="top" title="65%"></div>
											</div>
										</div>
										<div class="progress-card">
											<div class="d-flex justify-content-between mb-1">
												<span class="text-muted">아이돌</span>
												<span class="text-muted fw-bold"> 좋아요 횟수</span>
											</div>
											<div class="progress mb-2" style="height: 7px;">
												<div class="progress-bar bg-primary" role="progressbar" style="width: 12%" aria-valuenow="12" aria-valuemin="0" aria-valuemax="100" data-toggle="tooltip" data-placement="top" title="12"></div>
											</div>
										</div>
										<div class="progress-card">
											<div class="d-flex justify-content-between mb-1">
												<span class="text-muted">발라드</span>
												<span class="text-muted fw-bold"> 60%</span>
											</div>
											<div class="progress mb-2" style="height: 7px;">
												<div class="progress-bar bg-warning" role="progressbar" style="width: 60%" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" data-toggle="tooltip" data-placement="top" title="60%"></div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="col-md-3">
								<div class="card card-stats">
									<div class="card-body">
										<p class="fw-bold mt-1">Statistic</p>
										<div class="row">
											<div class="col-5">
												<div class="icon-big text-center icon-warning">
													<i class="la la-pie-chart text-warning"></i>
												</div>
											</div>
											<div class="col-7 d-flex align-items-center">
												<div class="numbers">
													<p class="card-category">Number</p>
													<h4 class="card-title">150GB</h4>
												</div>
											</div>
										</div>
										<hr/>
										<div class="row">
											<div class="col-5">
												<div class="icon-big text-center">
													<i class="la la-heart-o text-primary"></i>
												</div>
											</div>
											<div class="col-7 d-flex align-items-center">
												<div class="numbers">
													<p class="card-category">찜한 목록</p>
													<h4 class="card-title">+45K</h4>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					
					<!-- 회원 프로파일링 -->
					
					<!-- 정보값 수정 칸 -->
					
					
					<input type="hidden" value="${memberInfo.id}" name="id"/>
					 
					<div class="form-group" id="box">
						<label for="pillInput"><b>비밀번호</b></label> 
						<input type="text" class="form-control input-pill" id="pillInput" value="${memberInfo.password}" name="password">
							<br>
						<label for="pillInput"><b>이름</b></label> 
						<input type="text" class="form-control input-pill" id="pillInput" value="${memberInfo.name}" name="name">
							<br>
						<label for="pillInput"><b>이메일</b></label> 
						<input type="text" class="form-control input-pill" id="pillInput" value="${memberInfo.email}" name="email">
							<br>	
						<label for="pillInput"><b>휴대폰 번호</b></label> 
						<input type="text" class="form-control input-pill" id="pillInput" value="${memberInfo.phone}" name="phone">	
							<br>
						<b>회원 상태</b> : 	
	                  	<c:choose>
							<c:when test="${memberInfo.status == 1}">
								이용 가능
							</c:when>
							<c:when test="${memberInfo.status == 2}">
								이용 정지
							</c:when>
						</c:choose>
						<div class="col-lg-4 col-md-9 col-sm-12">
							<select name="status" class="form-control input-fixed" id="notify_state">
								<option value="1" selected="selected">회원 이용 가능</option>
								<option value="2">회원 이용 정지</option>
							</select>
						</div>
						<br>
						<b>관리자 권한</b> : 
						<c:choose>
							<c:when test="${memberInfo.is_admin == 1}">
								 관리자
							</c:when>
							<c:when test="${memberInfo.is_admin == 0}">
						 		일반 회원
							</c:when>
						</c:choose> 
						<div class="col-lg-4 col-md-9 col-sm-12">
							<select name="admin" class="form-control input-fixed" id="notify_state">
								<option value="0" selected="selected">일반 회원</option>
								<option value="1">관리자</option>
							</select>
						</div>
						</div>	
					<!-- 정보값 수정 칸 -->
					
					
<!-- 					회원 프로파일링 -->
<!-- 					<div class="row row-card-no-pd"> -->
<!-- 							<div class="col-md-4"> -->
<!-- 								<div class="card"> -->
<!-- 									<div class="card-body"> -->
<!-- 										<p class="fw-bold mt-1"> 포인트 </p> -->
<%-- 										<h4><b>P ${memberInfo.point}</b></h4> --%>
<!-- 										<div id="po"  style="display: none"> -->
<!-- 										<input type="text" class="form-control input-pill" id="pillInput" value="AJAX 구현하기" name="point">	 -->
<!-- 										</div> -->
<!-- 										<div id="po2"> -->
<!-- 										<a href="#" class="btn btn-primary btn-full text-left mt-3 mb-3" onclick="te3(1)"><i class="la la-plus"></i>포인트 변경</a> -->
<!-- 										</div> -->
<!-- 									</div> -->
<!-- 									<div class="card-footer"> -->
<!-- 										<ul class="nav"> -->
<!-- 											<li class="nav-item"><a class="btn btn-default btn-link" href="#"><i class="la la-history"></i> History</a></li> -->
<!-- 											<li class="nav-item ml-auto"><a class="btn btn-default btn-link" href="#" onclick="te3(2)"><i class="la la-refresh"></i> Refresh</a></li> -->
<!-- 										</ul> -->
<!-- 									</div> -->
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 							<div class="col-md-5"> -->
<!-- 								<div class="card"> -->
<!-- 									<div class="card-body"> -->
<!-- 										<div class="progress-card"> -->
<!-- 											<div class="d-flex justify-content-between mb-1"> -->
<!-- 												<span class="text-muted">힙합</span> -->
<!-- 												<span class="text-muted fw-bold"> $3K</span> -->
<!-- 											</div> -->
<!-- 											<div class="progress mb-2" style="height: 7px;"> -->
<!-- 												<div class="progress-bar bg-success" role="progressbar" style="width: 78%" aria-valuenow="78" aria-valuemin="0" aria-valuemax="100" data-toggle="tooltip" data-placement="top" title="78%"></div> -->
<!-- 											</div> -->
<!-- 										</div> -->
<!-- 										<div class="progress-card"> -->
<!-- 											<div class="d-flex justify-content-between mb-1"> -->
<!-- 												<span class="text-muted">클래식</span> -->
<!-- 												<span class="text-muted fw-bold"> 576</span> -->
<!-- 											</div> -->
<!-- 											<div class="progress mb-2" style="height: 7px;"> -->
<!-- 												<div class="progress-bar bg-info" role="progressbar" style="width: 65%" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" data-toggle="tooltip" data-placement="top" title="65%"></div> -->
<!-- 											</div> -->
<!-- 										</div> -->
<!-- 										<div class="progress-card"> -->
<!-- 											<div class="d-flex justify-content-between mb-1"> -->
<!-- 												<span class="text-muted">아이돌</span> -->
<!-- 												<span class="text-muted fw-bold"> 좋아요 횟수</span> -->
<!-- 											</div> -->
<!-- 											<div class="progress mb-2" style="height: 7px;"> -->
<!-- 												<div class="progress-bar bg-primary" role="progressbar" style="width: 12%" aria-valuenow="12" aria-valuemin="0" aria-valuemax="100" data-toggle="tooltip" data-placement="top" title="12"></div> -->
<!-- 											</div> -->
<!-- 										</div> -->
<!-- 										<div class="progress-card"> -->
<!-- 											<div class="d-flex justify-content-between mb-1"> -->
<!-- 												<span class="text-muted">발라드</span> -->
<!-- 												<span class="text-muted fw-bold"> 60%</span> -->
<!-- 											</div> -->
<!-- 											<div class="progress mb-2" style="height: 7px;"> -->
<!-- 												<div class="progress-bar bg-warning" role="progressbar" style="width: 60%" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" data-toggle="tooltip" data-placement="top" title="60%"></div> -->
<!-- 											</div> -->
<!-- 										</div> -->
<!-- 									</div> -->
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 							<div class="col-md-3"> -->
<!-- 								<div class="card card-stats"> -->
<!-- 									<div class="card-body"> -->
<!-- 										<p class="fw-bold mt-1">Statistic</p> -->
<!-- 										<div class="row"> -->
<!-- 											<div class="col-5"> -->
<!-- 												<div class="icon-big text-center icon-warning"> -->
<!-- 													<i class="la la-pie-chart text-warning"></i> -->
<!-- 												</div> -->
<!-- 											</div> -->
<!-- 											<div class="col-7 d-flex align-items-center"> -->
<!-- 												<div class="numbers"> -->
<!-- 													<p class="card-category">Number</p> -->
<!-- 													<h4 class="card-title">150GB</h4> -->
<!-- 												</div> -->
<!-- 											</div> -->
<!-- 										</div> -->
<!-- 										<hr/> -->
<!-- 										<div class="row"> -->
<!-- 											<div class="col-5"> -->
<!-- 												<div class="icon-big text-center"> -->
<!-- 													<i class="la la-heart-o text-primary"></i> -->
<!-- 												</div> -->
<!-- 											</div> -->
<!-- 											<div class="col-7 d-flex align-items-center"> -->
<!-- 												<div class="numbers"> -->
<!-- 													<p class="card-category">찜한 목록</p> -->
<!-- 													<h4 class="card-title">+45K</h4> -->
<!-- 												</div> -->
<!-- 											</div> -->
<!-- 										</div> -->
<!-- 									</div> -->
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 						</div> -->
					
<!-- 					회원 프로파일링 -->
					<br><br><br>
					
					<!-- 버튼 -->
					<div class="card-action" align="center">
					  <button class="btn btn-success" id="formbutton" onclick="update(this.form)">Submit</button>
					  <button class="btn btn-danger" id="formbutton" onclick="list3(this.form)">Cancel</button>
					</div>
					<!-- 버튼 -->
					
					</form>
			</div>
		</div> 
	</div>






	</div>
	<!-- Modal -->
	<div class="modal fade" id="modalUpdate" tabindex="-1" role="dialog" aria-labelledby="modalUpdatePro" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header bg-primary">
					<h6 class="modal-title"><i class="la la-frown-o"></i> Under Development</h6>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span> 
					</button>
				</div>
				<div class="modal-body text-center">									
					<p>Currently the pro version of the <b>관리자 페이지</b> Bootstrap is in progress development</p>
					<p>
						<b>We'll let you know when it's done</b></p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
</body>
<script src="${contextPath}/admins/assets/js/core/jquery.3.2.1.min.js"></script>
<script src="${contextPath}/admins/assets/js/plugin/jquery-ui-1.12.1.custom/jquery-ui.min.js"></script>
<script src="${contextPath}/admins/assets/js/core/popper.min.js"></script>
<script src="${contextPath}/admins/assets/js/core/bootstrap.min.js"></script>
<script src="${contextPath}/admins/assets/js/plugin/chartist/chartist.min.js"></script>
<script src="${contextPath}/admins/assets/js/plugin/chartist/plugin/chartist-plugin-tooltip.min.js"></script>
<script src="${contextPath}/admins/assets/js/plugin/bootstrap-notify/bootstrap-notify.min.js"></script>
<script src="${contextPath}/admins/assets/js/plugin/bootstrap-toggle/bootstrap-toggle.min.js"></script>
<script src="${contextPath}/admins/assets/js/plugin/jquery-mapael/jquery.mapael.min.js"></script>
<script src="${contextPath}/admins/assets/js/plugin/jquery-mapael/maps/world_countries.min.js"></script>
<script src="${contextPath}/admins/assets/js/plugin/chart-circle/circles.min.js"></script>
<script src="${contextPath}/admins/assets/js/plugin/jquery-scrollbar/jquery.scrollbar.min.js"></script>
<script src="${contextPath}/admins/assets/js/ready.min.js"></script>
<script src="${contextPath}/admins/assets/js/demo.js"></script>
</html>