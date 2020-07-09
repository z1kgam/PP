<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<input type="hidden" id="contextPath" value="${contextPath}">
	<input type="button" value="댓글쓰기" class="submit" onclick="openreply()" style="margin-left: 65%;margin-top: 30px;">
	<form action="${contextPath}/Proser/reply.do" name="frmReply" method="post">
		<input type="hidden" name="pronum" value="${Bean.num}">
		<input type="hidden" name="parentsnum">
		<table border="1" align="center" style="margin-top: 30px;">
			<tr id="write" style="display: none;">
				<td align="center"><input type="text" value="${sessionScope.id}" name="id"></td>
				<td align="center"><textarea rows="5" cols="30" name="content"></textarea></td>
				<td align="center">
				<input type="submit" value="댓글등록"><br>
				<input type="button" value="댓글취소" onclick="hide()">
				</td>
			</tr>
		</table>
	</form>
	<form action="${contextPath}/Proser/updatereply.do" name="upReply" method="post">
		<input type="hidden" name="replynum">
		<input type="hidden" name="pnum" value="${Bean.num}">
		<table border="1" align="center" style="margin-top: 30px;">
			<tr id="upwrite" style="display: none;">
				<td align="center"><textarea rows="5" cols="30" name="upcontent"></textarea></td>
				<td align="center">
				<input type="submit" value="댓글수정"><br>
				<input type="button" value="수정취소" onclick="uphide()">
				</td>
			</tr>
		</table>
	</form>
	<table border="1" align="center" style="margin-top: 30px; clear: both;">
		<c:choose>
			<c:when test="${empty List}">
				<tr>
					<td colspan="4" width="500" align="center">등록된 댓글이 없습니다.</td>
				</tr>
			</c:when>
			<c:when test="${!empty List}">
				<c:forEach var="memberVO" items="${List}">
					<input type="hidden" name="parents">
					<c:choose>
						<c:when test="${memberVO.parentsnum == 0}">
							<tr>
								<td width="100" align="center" style="background-color: palegreen;">ID</td>
								<td width="200" align="center" style="background-color: palegreen;">내용</td>
								<c:choose>
									<c:when test="${memberVO.content == '관리자나 본인에 의해 삭제된 댓글입니다.'}">
										<td width="100" align="center" style="background-color: palegreen;">삭제한 날짜</td>
									</c:when>
									<c:when test="${memberVO.content != '관리자나 본인에 의해 삭제된 댓글입니다.'}">
										<td width="100" align="center" style="background-color: palegreen;">업로드날짜</td>
									</c:when>
								</c:choose>
								<td width="100" align="center" style="background-color: palegreen;"></td>
							</tr>
							<tr>
								<td width="100" align="center">${memberVO.id}</td>
								<td width="200" align="center">${memberVO.content}</td>
								<td width="100" align="center">${memberVO.date}</td>
								<td width="100" align="center">
								<c:choose>
									<c:when test="${memberVO.content != '관리자나 본인에 의해 삭제된 댓글입니다.'}">
											<input type="button" value="댓글쓰기"
												onclick="doublereply(${memberVO.replynum})">
											<input type="button" value="댓글수정"
												onclick="updatereply(${memberVO.replynum})">
											<input type="button" value="댓글삭제"
												onclick="location.href='${contextPath}/Proser/fatedelete.do?pronum=${memberVO.productnum}&replynum=${memberVO.replynum}'">
										</c:when>
								</c:choose>
									
									<input type="button" value="댓글삭제" onclick="location.href='${contextPath}/Proser/alldelete.do?pronum=${memberVO.productnum}&replynum=${memberVO.replynum}'">
								</td>
							</tr>

							<c:forEach var="VO" items="${List}">
								<c:choose>
									<c:when test="${memberVO.replynum == VO.parentsnum}">
										<tr>
											<td width="100" align="center" style="background-color: yellow;">ID</td>
											<td width="200" align="center" style="background-color: yellow;">내용</td>
											<c:choose>
												<c:when test="${VO.content == '관리자나 본인에 의해 삭제된 댓글입니다.'}">
													<td width="100" align="center" style="background-color: yellow;">삭제된날짜</td>
												</c:when>
												<c:when test="${VO.content != '관리자나 본인에 의해 삭제된 댓글입니다.'}">
													<td width="100" align="center" style="background-color: yellow;">업로드날짜</td>
												</c:when>
											</c:choose>
											<td width="100" align="center" style="background-color: yellow;"></td>
										</tr>
										<tr>
											<td width="100" align="center">${VO.id}</td>
											<td width="200" align="center">${VO.content}</td>
											<td width="100" align="center">${VO.date}</td>
											<td align="center">
											<c:choose>
												<c:when test="${VO.content != '관리자나 본인에 의해 삭제된 댓글입니다.'}">
													<input type="button" value="댓글수정" onclick="updatereply(${VO.replynum})"> 
													<input type="button" value="댓글삭제"onclick="location.href='${contextPath}/Proser/fatedelete.do?pronum=${VO.productnum}&replynum=${VO.replynum}'">
												</c:when>
											</c:choose>
											
											<input type="button" value="댓글삭제"onclick="location.href='${contextPath}/Proser/replydelete.do?pronum=${VO.productnum}&replynum=${VO.replynum}'">
											</td>
										</tr>
									</c:when>
								</c:choose>
							</c:forEach>
						</c:when>
					</c:choose>
				</c:forEach>
			</c:when>
		</c:choose>
	</table>
</body> 
</html>