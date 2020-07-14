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
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>

<script>

	console.log("처음로드"); 
	
	function noRefresh() 
	{
		/* CTRL + N키 막음. */ 
		if ((event.keyCode == 78) && (event.ctrlKey == true)) 
		{
			event.keyCode = 0; 
			return false; 
		} 
		/* F5 번키 막음. */ 
		if(event.keyCode == 116) 
		{ 
			event.keyCode = 0; 
			return false; 
			} 
		} document.onkeydown = noRefresh; 

</script>



</head>
<body>
<!-- header -->
<jsp:include page="../include/header.jsp"/>
<!-- header -->

<!-- 
  <section class="ftco-section">
    	<div class="container">
    	<input type="button" class="submit" value="이벤트등록" formmethod="post" onclick="location.href='${contextPath}/event/eventWriteForm.do'">
        <div class="row">
        	<c:choose>	
        		<c:when test="${empty list}">등록된 이벤트가 없습니다.</c:when>
        		<c:otherwise>
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
				</c:otherwise>
				</c:choose>
        	</div>
        </div>
    	</div>
    </section>
 -->    
    
    
    <section>
    <div>
    <input type="button" class="submit" value="이벤트등록" formmethod="post" onclick="location.href='${contextPath}/event/eventWriteForm.do'">
	<c:set var="i" value="0" />
    <c:set var="j" value="3" />
    <table border="1" style="">    
    	<c:forEach var="eventBean" items="${list}">
<!--     	<c:choose>
    		<c:when test="${empty list}">
    			<tr>
    				<td>등록된 이벤트가 없습니다.</td>
    			</tr>
    		</c:when>  
    		<c:when test="${!empty list}">    -->		
    			<c:if test="${i%j == 0}">
    				<tr>
    			</c:if>	    					
   						<td style="width:300px; height: 150px;">
    						<a href="${contextPath}/event/eventInfo.do?event_num=${eventBean.event_num}">
							<img src="../upload/${eventBean.event_timage}" style="width:300px; height: 120px;">
							<div class="text  text-left" style="text-align: left; font-size: 1em;">
								${eventBean.event_title}
							</div></a>
							<div class="text  text-left" style="text-align: left; font-size: 1em;">
								${eventBean.event_startdate} ~ ${eventBean.event_enddate}
							</div>
						</td>	
    			<c:if test="${i%j == j-1}">
    				</tr>
    			</c:if>
    			<c:set var="i" value="${i+1}" />	
    			
    <!--		</c:when>
    </c:choose> --> 	
    	</c:forEach>
    </table>
    </div>
    	<c:if test="${blockFirst!=1}">
    		<a href="${contextPath}/event/events.do?nowPage=${blockFirst-blockSize}"></a>
    	</c:if>
    	<c:forEach var="i" begin="${blockFirst}" end="${blockLast}" step="1">
    		<a href="${contextPath}/event/events.do?nowPage=${i}">${i}</a>
    	</c:forEach>
    	<c:if test="${blockLast!=totalPage}">
    		<a href="${contextPath}/event/events.do?nowPage=${blockLast+1}"></a>
    	</c:if>
    	
    </section>
 	 
	
<!-- footer -->
<jsp:include page="../include/footer.jsp"/>
<!-- footer -->	
</body>
</html>