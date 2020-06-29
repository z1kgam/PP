 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    

<%
// 한글처리 
 request.setCharacterEncoding("UTF-8"); 
 %>

 <%-- 컨텍스트 주소 얻기 --%>     
 <c:set var="contextPath" value="${pageContext.request.contextPath }"/>
    
    
    
 <!DOCTYPE html> 
 <html> 
 <head> 
 <meta charset="UTF-8"> 
 <title>Insert title here</title> 
 </head> 
 <body> 
	${articlesList.size()}
	${count}
 	 	<table> 
 					<tr> 
 						<th>Num</th> 
 						<th>카테</th> 
 						<th>제목</th> 
 					</tr> 
 				
 				<tbody> 

					<c:if test="${count > 0}">
						<c:forEach var="articlesList" items="${articlesList}" varStatus="articlesNum">
 						<tr> 
 							<td> 
								${articlesList.faq_num}
								<small>${articlesList.faq_num}</small>
 							</td> 
							<td>${articlesList.faq_cate}</td>
 							<td> 
								${articlesListfaq_title}
 							</td> 
							
 						</tr> 
 						<tr> 
 							<td colspan="5"> 
								<div>${articlesList.faq_contents}</div>
 							</td> 
 						</tr> 
					
					</c:forEach>
					</c:if> 
					<c:if test="${count == 0 }">
 						<tr> 
 							<td colspan="4">등록된 수영장이 없습니다.</td> 
 						</tr> 
					</c:if>
 				</tbody> 
 			</table> 
	
	
 </body> 
 </html> 