<%@page import="java.util.ArrayList"%>
<%@page import="com.mysql.fabric.xmlrpc.base.Array"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<%-- <%
	String ch = request.getParameter("chseat");
	
	String[] a = ch.split(",");

	List<String> list = new ArrayList<String>();
	
	for(int i = 0; i<a.length; i ++){
		list.add(a[i]);
		System.out.println(list);
	}

%> --%>


<!DOCTYPE html>
<html>
<head>
<%-- <link rel="stylesheet" href="${contextPath}/mypage/css/bootstrap.css">
<link rel="stylesheet" href="${contextPath}/mypage/css/custom.css"> --%>

<!-- Bootstrap -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
    <!-- jQuery(부트스트랩의 자바스크립트 플러그인을 위해 필요)-->
    <script src="http://code.jquery.com/jquery.js"></script> 
    <!-- 모든 합쳐진 플러그인을 포함하거나 필요한 파일을 포함 -->
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <!-- Respond.js으로 IE8에서 반응형 기능활성화 -->
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>

<meta charset="UTF-8">
<title>주문내역</title>
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
	function btnDelete(){
			if(confirm("장바구니를 비우시겠습니까?")){
				location.href="${contextPath}/Order/delAllCart.do?id=${sessionScope.id}";
			}else{
				return false;
			}
	}

	function btnPay(){
			if(confirm("결제를 진행하시겠습니까?")){
				location.href="${contextPath}/Order/AllPayment.do";
			}else{
				return false;
			}
	}
	
	
</script>
</head>
<body>


<jsp:include page="../include/header.jsp" />

 <div class="container" style="margin-top: 100px; margin-bottom: 10px;">
 <div class="page-header">
  
    	<h1 style="margin-top: -50px;">Cart List</h1>
   
    </div>
	 	<div class="row">
	 		<table class="table table-striped" style="text-align:center; border: 1px solid #dddddd; margin-top: 50px;">
	 			<thead>
	 				<tr>
	 					<th style="background-color: #eeeeee; text-align: center;">번호</th>
	 					<th style="background-color: #eeeeee; text-align: center;">주문자</th>
	 					<th style="background-color: #eeeeee; text-align: center;">공연명</th>
	 					<th style="background-color: #eeeeee; text-align: center;">수량</th>
	 					<th style="background-color: #eeeeee; text-align: center;">가격</th>
	 					<th style="background-color: #eeeeee; text-align: center;">주문일자</th>
	 					<th style="background-color: #eeeeee; text-align: center;">주문하기</th>
	 					<th style="background-color: #eeeeee; text-align: center;">삭제</th>
	 					
	 				</tr>
	 			</thead>
	 			<tbody>
 			<c:if test="${!empty cartList}">
				<c:forEach var="cart" items="${sessionScope.cartList}">
	 				<tr>
	 					<td>${cart.num}</td>
	 					<td>${cart.id}</td>
	 					<td>${cart.name}</td>
	 					<td>${cart.qty}</td>
	 					<td>${cart.totalprice}</td>
	 					<td>${cart.orderdate}</td>
	 					<td><a href="${contextPath}/Order/Payment.do?num=${cart.num}&id=${cart.id}">결제하기</td></td>
	 					<td><a href="${contextPath}/Order/delCart.do?num=${cart.num}&id=${cart.id}">삭제</a></td>
	 				</tr>
	 			</c:forEach>
	 		</c:if>	
	 		<c:if test="${empty cartList}">
	 			<tr>
				<td colspan="8">장바구니에 상품이 없습니다.</td>
				</tr>
			</c:if>
				
			

	 			</tbody>
	 		</table>
	 		총 금액 : <fmt:formatNumber pattern="###,###,###" value="${total}" /> 
	 		
	 		<div class="button" style="margin-left: 500px; margin-top: 100px;">
			<button type="button" onclick="btnDelete()" class="btn btn-primary pull-right" style="background-color: #00E7D6 !important; border-color: #00E7D6 !important; color: #fff !important; margin-bottom: 50px; margin-left: 20px;">장바구니 비우기</button>
		<c:if test="${!empty cartList}">
			<button type="button" onclick="btnPay()" class="btn btn-primary pull-right" >전체 결제</button>
	 	</c:if>	
	 	
	 		<button onclick="location.href='${contextPath}/index.jsp'" class="btn btn-primary pull-right" style="background-color: #A9FF7F !important; border-color: #A9FF7F !important; color: #fff !important;">메인으로</button>
	 	</div>
	 	</div>
	 	
	 	
	 </div>
	



   <!-- 제이쿼리 자바스크립트 추가하기 -->
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <!-- 부트스트랩 자바스크립트 추가하기 -->

    <script src="${contextPath}/mypage/js/bootstrap.js"></script>
    
    
    <jsp:include page="../include/footer.jsp" />
    
</body>
</html>