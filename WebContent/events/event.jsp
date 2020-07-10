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
<!-- 
<table >
	<c:set var="j" value="0"/>
	<c:if test="${list != null }">
	<c:forEach var="EventBean" items="${list}">
		<c:if test="j%3==0">
			<tr align="center">
		</c:if>
				<td>
					<a href="#" >
						
					</a><p>
					<font>
					제목 : 
					</font><br>
					<font>
					이벤트 기간 : 
					</font>
				</td>
				<c:set var="j" value="${j+1}"/>	
	</c:forEach>
		</c:if>
			</tr>
</table>	

	<div class="form-group text-center text-lg-right">
		<button type="button" class="btn btn-secondary" onclick="location.href='${contextPath}/event/eventWriteForm.do'">이벤트 등록</button>
	</div>
-->
<!-- 
  <section class="ftco-section">
    	<div class="container">
    	<input type="button" class="submit" value="이벤트등록" onclick="location.href='${contextPath}/event/eventWriteForm.do'">
        <div class="row">
				<c:if test="${list != null}">
					<c:forEach var="eventBean" items="${list}">
						<div class="col-md-3">
							<div class="classes  ftco-animate" style="border:1px solid;" >													
								<a href="${contextPath}/event/events.do?event_num=${eventBean.event_num}" class="img w-100 mb-3"
									style="background-image: url(../upload/${eventBean.event_image}); width:400px; height: 120px;" ></a>
								<div class="text  text-left" style="border:1px solid; text-align: left; font-size: 1em;">
									${eventBean.event_title}
								</div>
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
 -->

  <section class="ftco-section">
    	<div class="container">
    	<input type="button" class="submit" value="이벤트등록" onclick="location.href='${contextPath}/event/eventWriteForm.do'">
        <div class="row">
				<c:if test="${list != null}">
					<c:forEach var="eventBean" items="${list}">
						<div class="col-md-3">
							<div class="classes  ftco-animate"  >													
								<a href="${contextPath}/event/eventInfo.do?event_num=${eventBean.event_num}">
								<img src="../upload/${eventBean.event_image}" style="width:300px; height: 120px;">
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