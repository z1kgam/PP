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
<link rel="stylesheet" href="${contextPath}/mypage/css/bootstrap.css">
<link rel="stylesheet" href="${contextPath}/mypage/css/custom.css">
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
	.page_wrap{
		text-align: center;
		font-size: 0;
	}
	.page_nation{
		display: inline-block;
	}
	.page_nation .none{
		display: none;	
	}
	.page_nation a{
		display:block;
		margin:0 3px;
		float: left;
		border: 1px solid #e6e6e6;
		width: 28px;
		height: 28px;
		line-height: 28px;
		text-align: center;
		background-color: #fff;
		font-size: 13px;
		color:#999999;
		text-decoration: none;
	}
	.page_nation .arrow{
		border: 1px solid #ccc;
	}
	.page_nation .prev{
		background: #f8f8f8 url('img/page_prev.png') no-repeat center center;
		margin-left: 7px;
	}
	.page_nation .next{
		background: #f8f8f8 url('img/page_next.png') no-repeat center center; 
		margin-left: 7px;
	}
	
	.page_nation a.active{
		background-color:#42454c;
		color: #fff;
		border: 1px solid #42454c; 
	}
	.page_nation a:hover{
		color:#ggg;
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
	 		총 금액 : <fmt:formatNumber pattern="###,###,###" value="${total}"/>
			<button type="button" onclick="btnDelete()" class="btn btn-primary pull-right">장바구니 비우기</button>
		<c:if test="${!empty cartList}">
			<button type="button" onclick="btnPay()" class="btn btn-primary pull-right">전체 결제</button>
	 	</c:if>	
	 	
	 		<button onclick="location.href='${contextPath}/index.jsp'" class="btn btn-primary pull-right" >메인으로</button>
	 	</div>
	 </div>
	 <div class="page_wrap">
	 	<div class="page_nation">
	 		<c:if test="${nowPage>blockSize}">
	 			<a href="location.href='${contextPath}/Order/cartList.do?nowPage=${blockFirst-blockSize}'" class="arrow prev"></a>
	 		</c:if>
	 		
	 		<c:forEach begin="${blockFirst}" end="${blockLast}" var="i">
	 			<c:choose>
	 				<c:when test="${i eq nowPage}">
						<a href="location.href='${contextPath}/Order/cartList.do?nowPage=${i}'" class="active">${i}</a>	 				
	 				</c:when>
	 				<c:otherwise>
	 					<a href="location.href='${contextPath}/Order/cartList.do?nowPage=${i}'">${i}</a>
	 				</c:otherwise>
	 			</c:choose>
	 		</c:forEach>
	 		
	 		<c:if test="${blockLast != totalPage}">
	 			<a href="location.href='${contextPath}/Order/cartList.do?${blockLast+1}'" class="arrow next"></a>
	 		</c:if>
	 	</div>
	 </div>



   <!-- 제이쿼리 자바스크립트 추가하기 -->
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <!-- 부트스트랩 자바스크립트 추가하기 -->

    <script src="${contextPath}/mypage/js/bootstrap.js"></script>
</body>
</html>