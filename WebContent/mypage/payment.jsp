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
<script type="text/javascript">
	function btnPayment(){
		if(confirm("결제를 진행하시겠습니까?")){
			location.href="${contextPath}/Order/PaymentAction.do?id=${payVO.id}&num=${payVO.num}";
		}else{
			return false;
		}
	}

</script>

<meta charset="UTF-8">
<title>결제페이지</title>
<style type="text/css">
	a:hover{
		color:red;
	}
	
	a{
		color:blue;
		text-decoration: none;
	}
</style>
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
	 					<th style="background-color: #eeeeee; text-align: center;">주문일자</th>
	 					<th style="background-color: #eeeeee; text-align: center;">주문취소</th>
	 					
	 				</tr>
	 			</thead>
	 			<tbody>
 			<c:if test="${!empty payVO}">
				
	 				<tr>
	 					<td>${payVO.num}</td>
	 					<td>${payVO.id}</td>
	 					<td>${payVO.name}</td>
	 					<td>${payVO.qty}</td>
	 					<td>${payVO.totalprice}</td>
	 					<td>${payVO.orderdate}</td>
	 					<td><a href="${contextPath}/Order/delCart.do?num=${payVO.num}&id=${payVO.id}">주문취소</a></td>
	 				</tr>
	 			
	 		</c:if>	
	 		<c:if test="${empty payVO}">
	 			<tr>
				<td colspan="7">추가된 상품이 없습니다.</td>
				</tr>
			</c:if>
				
			

	 			</tbody>
	 		</table>
	 		총 금액 : <fmt:formatNumber pattern="###,###,###" value="${total}"/>			
			<button type="button" onclick="btnPayment()" class="btn btn-primary pull-right">결제하기</button>
	 	</div>
	 </div>
	



   <!-- 제이쿼리 자바스크립트 추가하기 -->
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <!-- 부트스트랩 자바스크립트 추가하기 -->

    <script src="${contextPath}/mypage/js/bootstrap.js"></script>
</body>
</html>