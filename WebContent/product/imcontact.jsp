<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
  <head>
    <title>공연목록</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700&display=swap" rel="stylesheet">

    <link href="https://fonts.googleapis.com/css?family=EB+Garamond:400,400i,500,500i,600,600i,700,700i&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="${contextPath}/css/open-iconic-bootstrap.min.css">
    <link rel="stylesheet" href="${contextPath}/css/animate.css">
    
    <link rel="stylesheet" href="${contextPath}/css/owl.carousel.min.css">
    <link rel="stylesheet" href="${contextPath}/css/owl.theme.default.min.css">
    <link rel="stylesheet" href="${contextPath}/css/magnific-popup.css">

    <link rel="stylesheet" href="${contextPath}/css/aos.css">

    <link rel="stylesheet" href="${contextPath}/css/ionicons.min.css">

    <link rel="stylesheet" href="${contextPath}/css/bootstrap-datepicker.css">
    <link rel="stylesheet" href="${contextPath}/css/jquery.timepicker.css">

    
    <link rel="stylesheet" href="${contextPath}/css/flaticon.css">
    <link rel="stylesheet" href="${contextPath}/css/icomoon.css">
    <link rel="stylesheet" href="${contextPath}/css/style.css">
  </head>
  <body>
  	<jsp:include page="../include/header.jsp" />
    <!-- END nav -->

 

    <section class="ftco-section">
    	<div class="container">
    	
    	
    	<div class="page-header" style="margin-top: 50px;">
          
        <h1>Check</h1>
        </div>
        <hr/>
    	
    	<p>제품 등록 페이지입니다.</p>
    	
    	<input type="button" class="submit" style="background-color: #00E7D6 !important; border-color: #00E7D6 !important; color: #fff !important; margin-bottom: 50px;" value="제품등록" onclick="location.href='${contextPath}/Proser/write.do'">
        <div class="row">
				<c:if test="${List != null}">
					<c:forEach var="VO" items="${List}">
					<c:if test="${VO.runstatus == 0}">
						<div class="col-md-3">
							<div class="classes w-100 ftco-animate">
								<a href="${contextPath}/Proser/content.do?num=${VO.num}&name=${VO.name}" class="img w-100 mb-3"
									style="background-image: url(${contextPath}/consert/${VO.image}); height: 350px;"></a>
								<div class="text w-100 text-center">
									<h3>
										${VO.name}
									</h3>

								</div>
							</div>
						</div>
					</c:if>
				</c:forEach>

				</c:if>
        	</div>
        </div>
    </section>
  <jsp:include page="../include/footer.jsp" />
 
  </body>
</html>