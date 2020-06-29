<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- JSTL 사용을 위해 선언 -->    
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="../include/header.jsp" />
</head>
<body>
	<div class="container">
		<div>
			<div class="row">      
            	<div class="col-md-12 mb-3">
					<p><a href="${contextPath}/mycon/mypageForm.do"></a><span>마이페이지</span></p>
				</div>
				<div class="col-md-12 mb-3">
					<p><span>프로필이미지 수정</span> <a href="${contextPath}/member/updateProfile.do"></a></p>
				</div>
				<div class="col-md-12 mb-3">
					<p><span>배송지 관리</span> <a href="${contextPath}/member/address.do"></a></p>
	            </div>
            	<div class="col-md-12 mb-3">
              		<p><span>좋아요 목록</span> <a href="${contextPath}/mycon/likelistForm.do"></a></p>
            	</div>
            	<div>
            		<p><span>예매확인<a href="${contextPath}/mycon/reservlistForm.do"></a></span></p>
            	</div>
           	</div>
		</div>
	</div>


</body>
</html>