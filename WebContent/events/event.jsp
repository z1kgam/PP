<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%
	//한글처리
	request.setCharacterEncoding("UTF-8");
%>

<jsp:useBean id="event" class="event.EventBean"/>

<%-- 컨텍스트 주소 얻기 --%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이벤트 페이지</title>


</head>
<body>
<!-- header -->
<jsp:include page="../include/header.jsp"/>
<!-- header -->


  <section class="ftco-section">
    	<div class="container">
    	<input type="button" class="submit" value="이벤트등록" onclick="location.href='${contextPath}/event/eventWriteForm.do'">
        <div class="row">
				<c:if test="${list != null}">
					<c:forEach var="eventBean" items="${list}">
						<div class="col-md-3">
							<div class="classes  ftco-animate"  >													
								<a href="${contextPath}/event/eventInfo.do?event_num=${eventBean.event_num}">
								<img src="../upload/${eventBean.event_timage}" style="width:300px; height: 120px;">
								<div class="text  text-left" style="text-align: left; font-size: 1em;">
									${eventBean.event_title}
								</div></a>
								<div class="text  text-left" style="text-align: left; font-size: 1em;">
									${eventBean.event_startdate} ~ ${eventBean.event_enddate}
								</div>
							</div>	
						</div>

					</c:forEach>

				</c:if>
        	</div>
        </div>
    	</div>
    </section>

	
<!-- footer -->
<jsp:include page="../include/footer.jsp"/>
<!-- footer -->	
</body>
</html>