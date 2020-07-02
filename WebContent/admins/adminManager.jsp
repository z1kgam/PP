<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />    
    
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
						<li class="nav-item update-pro">
							<button  data-toggle="modal" data-target="#modalUpdate">
								<i class="la la-hand-pointer-o"></i>
								<p>Update To Pro</p>
							</button>
						</li>
					</ul>
					<!-- 사이드 네비 창 -->
					
				</div>
			</div>
			
			<!-- 회원 정보 출력 테이블 -->
			<div class="main-panel">
				<div class="content">
					<div class="container-fluid">
						<h4 class="page-title">Dashboard</h4>
						<table class="table table-bordered table-bordered-bd-warning mt-4">
											<thead>
												<tr>
													<th scope="col">아이디</th>
													<th scope="col">이름</th>
													<th scope="col">비밀번호</th>
													<th scope="col">이메일</th>
													<th scope="col">우편번호</th>
													<th scope="col">주소1</th>
													<th scope="col">주소2</th>
													<th scope="col">휴대폰 번호</th>
													<th scope="col">포인트</th>
													<th scope="col">회원 상태</th>
													<th scope="col">관리자 권한</th>
													<th scope="col">정보 수정</th>
												</tr>
											</thead>
											<tbody>
											<c:forEach var="memberlist" items="${list}" varStatus="membersNum">
            						<tr>
            								<td><b>${memberlist.id}</b></td>
            								<td>${memberlist.name}</td>
            								<td>${memberlist.password}</td>
            								<td>${memberlist.email}</td>
            								<td>${memberlist.zipcode}</td>
            								<td>${memberlist.address1}</td>
            								<td>${memberlist.address2}</td>
            								<td>${memberlist.phone}</td>
            								<td>${memberlist.point}</td>
            								<td>${memberlist.status}</td>
            								<td>${memberlist.is_admin}</td>
            								<td>
            								<input type="button" onclick="location.href='${contextPath}/admin/MemberView.do?id=${memberlist.id}&nowpage=${nowpage}'" value="정보 조회">
            								</td>
            						</tr>
            							</c:forEach>
											</tbody>
										</table>
				<!-- 페이징 -->	
					<div align="center">
						<c:if test="${nowpage>blocksize}">
						<a href="${contextPath}/admin/MemberManager.do?nowpage=${blockfirst-blocksize}">[이전]</a>
						</c:if>
						<c:forEach begin="${blockfirst}" end="${blocklast}" var="i">
							<a href="${contextPath}/admin/MemberManager.do?nowpage=${i}">${i}</a>
						</c:forEach>
						<c:if test="${blocklast != totalPage }">
							<a href="${contextPath}/admin/MemberManager.do?nowpage=${blocklast+1}">[다음]</a>
						</c:if>
					</div>
				<!-- 페이징 -->		
					
						</div>
				</div>
			</div>
			<!-- 회원 정보 출력 테이블 -->
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