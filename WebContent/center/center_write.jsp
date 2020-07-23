<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<title>공지사항 글쓰기</title>
    
<!--     <script type="text/javascript">
 		 function backToList(obj){ //아래의 <form>요소전체가 매개변수로 넘어온다.
		 
 		 obj.action = "${contextPath}/notice/listNotice.do";
	 	 obj.submit(); //<form>태그를 이용해 Controller서블릿으로 전체글을 검색해줘~요청함.
	 }    
     </script> -->    
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
</head>
<body>
	<!--  header -->
	<jsp:include page="../include/header.jsp" />
	<!--  header -->	
	

  <section class="ftco-section contact-section ftco-no-pt ftco-no-pb">
		<div class="container" style="margin-top: 50px;">

<!-- 탭메뉴 -->	
<ul class="nav nav-tabs" style="font-size: 14px;">
  <li class="nav-item" style="margin-right: 0;">
    <a class="nav-link"  href="${contextPath}/notice/listNotice.do" style="padding: 15px 110px 15px 110px;">
   	 공지사항
    </a>
  </li>
  <li class="nav-item" style="margin-right: 0;">
    <a class="nav-link active"  href="${contextPath}/board/info2.jsp" style="padding: 15px 110px 15px 110px;">
	이용안내
    </a>
  </li>
  <li class="nav-item" style="margin-right: 0;">
    <a class="nav-link active"  href="${contextPath}/fboard/faqlist.do" style="padding: 15px 125px 15px 125px;">
    FAQ
    </a>
  </li>
  <li class="nav-item" style="margin-right: 0;">
  
	  <c:choose>
	   	<c:when test="${id != null}">
	    		<a class="nav-link active"  href="${contextPath}/qboard/qnaList.do" style="padding: 15px 90px 15px 90px;">
	    		나의 문의 내역
	    		</a>
	  		</c:when>
	  		<c:when test="${id == null}">
	  			<a class="nav-link active"  href="${contextPath}/member/login.do" style="padding: 15px 90px 15px 90px;">
	  			나의 문의 내역
	  			</a>
	  		</c:when>
	  	</c:choose>

  </li>
</ul>			





    <section class="container body-container py-5">
    	<!-- <div class="col-md-6 ftco-animate py-md-5"> -->
			<form action="${contextPath}/notice/insertNotice.do" class="center_writeForm" method="post">
              	<div class="form-group">
                	<input type="text" name="n_title" class="form-control" placeholder="제목" style="width: 100%;">
              	</div>
              	<div class="form-group">
              		<a>분류 : </a>
                	<select name="n_cate">
                		<option value="서비스 소식">서비스 소식</option>
                		<option value="서비스 점검">서비스 점검</option>
                		<option value="안내">안내</option>
                	</select>
              	</div>              
              	<div class="form-group">
               	 	<textarea name="n_content" cols="30" rows="7" class="form-control" placeholder="글 내용" style="width: 100%;"></textarea>
              	</div>
              	<div class="form-group">
                	<input type="submit" value="작성하기"  class="btn btn-primary py-2 px-5" style="background-color: fff; color: 000;">
                	<input type="button" value="취소하기" class="btn btn-primary py-2 px-5" onclick="history.back();">
				</div>
			</form>
 		<!-- </div> -->
 		
 		</section>
 		</div>
 		
	</section>
<!-- footer -->	
<jsp:include page="../include/footer.jsp"></jsp:include>
<!-- footer -->	
</body>
</html>