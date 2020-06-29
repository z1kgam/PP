<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	request.setCharacterEncoding("utf-8");
%>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>



<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Meditative - Free Bootstrap 4 Template by Colorlib</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
	<jsp:include page="../include/header.jsp" />
    <!-- END nav -->
</head>
<body>

<script>
	function fnRead(num) {
		document.read.num.value = num;
		document.read.submit();
	}
</script>
    <section class="hero-wrap hero-wrap-2" style="background-image: url('../images/bg_3.jpg');" data-stellar-background-ratio="0.5">
		<div class="overlay"></div>
			<div class="container">
        		<div class="row no-gutters slider-text js-fullheight align-items-center justify-content-center">
          			<div class="col-md-9 ftco-animate text-center">
						<h1 class="mb-3 bread">Contact Us</h1>
						<p class="breadcrumbs"><span class="mr-2"><a href="index.html">Home</a></span> <span>Contact</span></p>
					</div>
				</div>
			</div>
	</section>
    <section class="ftco-section contact-section ftco-no-pt ftco-no-pb">
		<div class="container">
			<div class="row block-9">
				<div class="col-md-2 contact-info ftco-animate p-4 w-100 h-500">
					<div class="row">      
		            	<div class="col-md-12 mb-3">
							<p><a href="${contextPath}/notice/listNotice.do"><span>공지사항</span></a></p>
						</div>
						<div class="col-md-12 mb-3">
							<p><span>이용안내</span> <a href="tel://1234567920"></a></p>
						</div>
						<div class="col-md-12 mb-3">
							<p><span>FAQ</span> <a href="mailto:info@yoursite.com"></a></p>
			            </div>
		            	<div class="col-md-12 mb-3">
		              		<p><span>나의 문의 내역</span> <a href="#"></a></p>
		            	</div>
	            	</div>
				</div>
			<div class="col-md-10">
				<p>공지사항 </p>
			<div>
				<select>
					<option>안내</option>
					<option>서비스 소식</option>
					<option>서비스 안내</option>
					<option>서비스 점검</option>
				</select>
			</div>
			<form action="${contextPath}/notice/listNotice.do" method="post">
				<div class="row">
  					<div class="col-md-10 col-md-offset-1">
<br><br>
		    		<table class="table table-hover" id="table1">
						<tr>
							<td class="tno"><b>분류</b></td>
						    <td class="ttitle"><b>제목</b></td>
						    <td class="twrite"><b>작성자</b></td>
						    <td class="tdate"><b>날짜</b></td>
						</tr>
  		 				<c:choose>
			   				<c:when test="${requestScope.noticeList == null }">
			   					<tr height="10">
									<td colspan="4">
										<p align="center"><b>등록된 글이 없습니다.</b></p>
									</td>   				
			   					</tr>
			   				</c:when>
			   				<c:when test="${requestScope.noticeList != null }">
			   					<c:forEach var="notice" items="${noticeList}" varStatus="status">
			   						<tr>
				   						<td>${notice.n_code}</td>
				   						<td>
											<a href="${contextPath}/notice/viewNotice.do?n_num=${notice.n_num}">
												${notice.title}
											</a>   						
										</td>
				   						<td>관리자</td>
				   						<td>
				   							<fmt:formatDate value="${notice.n_date}" type="DATE" pattern="yyyy-MM-dd"/>
			   							</td>
			   						</tr>
			   					</c:forEach>	
			   				</c:when>
			   			</c:choose> 				
					</table>
				</div>
			</div>
			<!--테이블  -->
			
			<!--페이징 -->
                    <c:if test="${blockFirst!=1}">
                        <a href="${contextPath}/notice/listNotice.do?nowPage=${blockFirst-blockSize}"></a>
                    </c:if>
                    <c:forEach var="i" begin="${blockFirst}" end="${blockLast}" step="1">
                    	<a href="${contextPath }/notice/listNotice.do?nowPage=${i}">${i}</a>
                    </c:forEach>
                    <c:if test="${blockLast!=totalPage}">
                        <a href="${contextPath}/notice/listNotice.do?nowPage=${blockLast+1}"></a>                    
                    </c:if>
			<!--페이징 -->

				</form>
			</div>
        <a href="${contextPath}/notice/noticeForm.do">글쓰기</a>
        </div>
	</div>
</section>

<jsp:include page="../include/footer.jsp"/>
    
  </body>
</html>