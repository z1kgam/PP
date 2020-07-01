<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>        
<%
//한글처리
request.setCharacterEncoding("UTF-8");
%>

<%--컨텍스트 주소 얻기 --%>    
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1문의</title>

<jsp:include page="../include/header.jsp"></jsp:include>

</head>
<body>

<button type="button" onclick="location.href='${contextPath}/qboard/qwriteForm.do'">1:1문의하기</button>

<form action="${contextPath}/qboard/qnaList.do" method="post">
	<div class="row">
		<div class="col-md-10 col-md-offset-1">
<br><br>
  		<table class="table table-hover" id="table1">
		<tr>
			<td class="tno"><b>No.</b></td>
		    <td class="ttitle"><b>처리상태</b></td>
		    <td class="twrite"><b>제목</b></td>
		    <td class="tdate"><b>등록일</b></td>
		</tr>
 				<c:choose>
  				<c:when test="${total ==0}">
  					<tr height="10">
					<td colspan="4">
						<p align="center"><b>등록된 글이 없습니다.</b></p>
					</td>   				
  					</tr>
  				</c:when>
  				<c:when test="${total != 0}">
  					<c:forEach var="qnaList" items="${qnaList}" varStatus="status">
  						<tr>
   						<td>${qnaList.qna_num}</td>
   						<td>
						
   							<c:if test="${qnaList.qna_status == 0}">
   							대기중
   							</c:if>
   							
   							<c:if test="${qnaList.qna_status == 1}">
   							답변완료
   							</c:if>
   							
<%--  							${qnaList.qna_status} --%>
						</td>
   						<td>
   						<a href="${contextPath}/qboard/viewQna.do?qna_num=${qnaList.qna_num}">${qnaList.qna_title}</a>
   						</td>
   						<td>
   							<fmt:formatDate value="${qnaList.qna_date}" type="DATE" pattern="yyyy-MM-dd"/>
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
                     <a href="${contextPath}/qboard/qnaList.do?nowPage=${blockFirst-blockSize}"></a>
                 </c:if>
                 <c:forEach var="i" begin="${blockFirst}" end="${blockLast}" step="1">
                 	<a href="${contextPath }/qboard/qnaList.do?nowPage=${i}">${i}</a>
                 </c:forEach>
                 <c:if test="${blockLast!=totalPage}">
                     <a href="${contextPath}/qboard/qnaList.do?nowPage=${blockLast+1}"></a>                    
                 </c:if>
<!--페이징 -->

	</form>



<jsp:include page="../include/footer.jsp"></jsp:include>


</body>
</html>