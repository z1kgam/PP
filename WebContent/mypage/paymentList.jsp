<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="${contextPath}/mypage/css/bootstrap.css">
<link rel="stylesheet" href="${contextPath}/mypage/css/custom.css">
<meta charset="UTF-8">
<title>나의 결제내역보기</title>
<style type="text/css">
	a:hover{
		color:red;
	}
	
	a{
		color:blue;
		text-decoration: none;
	}
</style>
<script type="text/javascript">
	function btnPayAlldel(){
		if(confirm("결제내역 전체를 삭제하시겠습니까?")){
			location.href="${contextPath}/Order/payAlldel.do?id=${sessionScope.id}";
		}else{
			return false;
		}
	}
	
</script>
</head>
<body>
<div class="container">
	 	<div class="row">
	 		<table class="table table-striped" style="text-align:center; border: 1px solid #dddddd">
	 			<thead>
	 				<tr>
	 					<th style="background-color: #eeeeee; text-align: center;">번호</th>
	 					<th style="background-color: #eeeeee; text-align: center;">주문자</th>
	 					<th style="background-color: #eeeeee; text-align: center;">공연명</th>
	 					<th style="background-color: #eeeeee; text-align: center;">수량</th>
	 					<th style="background-color: #eeeeee; text-align: center;">가격</th>
	 					<th style="background-color: #eeeeee; text-align: center;">결제일자</th>
	 					<th style="background-color: #eeeeee; text-align: center;">내역삭제</th>
	 					
	 				</tr>
	 			</thead>
	 			<tbody>
 			
 			<c:if test="${!empty paymentList}">
				<c:forEach items="${requestScope.paymentList}" var="payment" >
	 				<tr>
	 					<td>${payment.p_seq_num}</td>
	 					<td>${payment.id}</td>
	 					<td>${payment.name}</td>
	 					<td>${payment.qty}</td>
	 					<td>${payment.totalprice}</td>
	 					<td>${payment.p_paydate}</td>
	 					<td><a href="${contextPath}/Order/paydel.do?p_num=${payment.p_num}&id=${payment.id}" onclick="return confirm('결제내역을 삭제하시겠습니까?');">내역삭제</a></td>
	 				</tr>
	 			</c:forEach>
	 		</c:if>	
	 		<c:if test="${empty paymentList}">
	 			<tr>
				<td colspan="7">결제완료 된 상품이 없습니다.</td>
				</tr>
			</c:if>
				
			

	 			</tbody>
	 		</table>
	 		총 결제금액 : <fmt:formatNumber pattern="###,###,###" value="${totalpayprice}"/>
	 		<button onclick="location.href='${contextPath}/index.jsp'" class="btn btn-primary pull-right">메인으로</button>
	 		<button type="button" onclick="btnPayAlldel()" class="btn btn-primary pull-right">결제내역 삭제하기</button>			
	 	</div>
	 </div>
	



   <!-- 제이쿼리 자바스크립트 추가하기 -->
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <!-- 부트스트랩 자바스크립트 추가하기 -->

    <script src="${contextPath}/mypage/js/bootstrap.js"></script>
</body>
</html>