<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%
	//한글처리
	request.setCharacterEncoding("UTF-8");
%>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<jsp:useBean id="now" class="java.util.Date"/>  
<fmt:formatDate value="${now}" pattern="yyyy.MM.dd HH:mm:ss" var="today"/>

  
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>인기공연</title>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootswatch/4.5.0/lux/bootstrap.min.css">
<!-- 부트스트랩 -->

    
<jsp:include page="../include/header.jsp" />

</head>
<body>

 <section class="ftco-section contact-section ftco-no-pt ftco-no-pb">
	<div class="container">
		<div class="row block-9">
		
		<div class="col-md-10">


<div class="rank_date">
	<p><span class="nowTextInfo">인기콘서트 <br>
	<font size="4px;" style="letter-spacing:3px;">(<c:out value="${today}"/> 현재)</font></span><span class="bg_arrow"></span></p>
</div>


<table class="table table-hover">
  <thead>
    <tr>
      <th scope="col">랭킹</th>
      <th scope="col"></th>
      <th scope="col">공연명</th>
      <th scope="col">공연일시</th>
      <th scope="col">공연장소</th>
      <th scope="col">예매</th>
    </tr>
  </thead>
  <tbody>
  
  <c:forEach items="${bestList}" var="VO">
  
    <tr>
      <td scope="row">${VO.detailnum}</td>
      <td><img src="${contextPath}/consert/${VO.image}" width="80px" height="100px"></td>
      <td>${VO.name}</td>
      <td>${VO.startdate}</td>
      <td>${VO.place}</td>
      <td><button>예매하기</button></td>
    </tr>
    
    </c:forEach>
    
   </tbody>
</table>

			</div>
        </div>
	</div>
</section>

<jsp:include page="../include/footer.jsp"/>



</body>
</html>