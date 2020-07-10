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
</head>
<body>

<jsp:include page="./include/top_navi.jsp" />

			
			<!-- 바디 영역 -->
			<div class="main-panel">
				<div class="content">
					<div class="container-fluid">
						<h4 class="page-title">문의 내역 답변 관리 페이지</h4>
			
					<table class="table table-hover">
											<thead>
												<tr align="center">
													<th scope="col">처리상태</th>
													<th scope="col">제목</th>
													<th scope="col">등록일</th>
													<th scope="col">답변 하기</th>
													<th scope="col">글 삭제</th>
												</tr>
											</thead>
											<tbody>
											<c:choose>
											 <c:when test="${qnaList == null}">
											 <tr>
											 <td colspan="12" align="center">등록된 회원이 없습니다.</td>
											 </tr>
											 </c:when>
										<c:when test="${qnaList != null }">
											<c:forEach var="qnaList" items="${qnaList}" varStatus="membersNum">
											<fmt:formatDate var="parseDate" value="${qnaList.qna_date}" pattern="yyyy-MM-dd"/>
										<tr align="center">
											<td><p class="text-muted">
											<c:if test="${qnaList.qna_status == 0}"><p class="text-warning">대기중</p></c:if>
					   						<c:if test="${qnaList.qna_status == 1}"><p class="text-success">답변완료<p></c:if>
											</p></td>
											<td align="left"><p class="text-muted">${qnaList.qna_title}</p></td>
											<td><p class="text-muted">${parseDate}</p></td>
											<!-- 버튼 -->
											<div class="form-button-action">
											<td>
											<button type="button" data-toggle="tooltip" title="답변 하기" 
												onclick="location.href='${contextPath}/admin/AqnaModify.do?qna_num=${qnaList.qna_num}'" 
												class="btn btn-link <btn-simple-primary" style=" font-size: 17px; ">
												<i class="la la-comments"></i>
											</button>
											</td>
											<td>
											<button type="button" data-toggle="tooltip" title="회원 삭제"
												onclick="del('${memberlist.id}')" class="btn btn-link btn-simple-danger" style=" font-size: 17px; ">
											<i class="la la-times"></i>
											</button>
											</td>
											</div>
											<!-- 버튼 -->
										</tr>
									</c:forEach>
            							</c:when>
            							</c:choose>	
											</tbody>
										</table>
				
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
				
					</div>
				</div>
			</div>
			<!-- 바디 영역 -->
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