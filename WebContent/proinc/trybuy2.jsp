<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function sel() {
		var selectdate = $("#search").val();
		alert(selectdate);
		
		$.ajax({
			type : "post",
			async: false,
			url : "${contextPath}/Proser/itemselect.do?date="+selectdate,
			success : function(data,textStatus) {
				var jsoninfo = JSON.parse(data);
				
				var info = "<tr>";
				
				for(var i in jsoninfo.members){
					info += jsoninfo.members[i].name + "<br>";
					info += jsoninfo.members[i].age + "<br>";
					info += jsoninfo.members[i].gender + "<br>";
					info += jsoninfo.members[i].nickname + "<br>";
				}
				
				$("#partview").html(info);
			},
			error:function(){
				alert("에러");
			}
		});
		
		document.getElementById("fullview").style.display = "none";
		document.getElementById("partview").style.display = "block";
	}
		
	
</script>
<style type="text/css">

#import{
	width: 800px;
	margin-left: auto;
	margin-right: auto;
	margin-top: 50px;
}

#import tr{
	text-align: center;
}

#part{
	width: 800px;
	margin-left: auto;
	margin-right: auto;
	margin-top: 50px;
}

#part tr{
	text-align: center;
}


#search{
	margin-top: 50px;
	margin-left: 65%;
}

</style>
</head>
<body>
<div style="clear: both;"></div>
<div>
   	<input type="date" id="search" onchange="sel()">
   	<div id="partview"><table id="part" border="1"></table></div>
   	<div id="fullview">
	<table id="import" border="1">
			<tr>
				<td>No.</td>
				<td>공연명</td>
				<td>공연날짜</td>
				<td>시작시간</td>
				<td>잔여좌석</td>
				<td>좌석수</td>
				<td>공연장</td>
				<td>예약하기</td>
				<td>수정하기</td>
				<td>삭제하기</td>
			</tr>
			<c:choose>
				<c:when test="${empty detail}">
					<tr>
						<td colspan="10">등록된 콘서트가 없습니다.</td>
					</tr>
				</c:when>
				<c:when test="${!empty detail}">
			
					<c:forEach var="det" items="${detail}" varStatus="status">
						<tr>
							<fmt:formatNumber value="${det.seat}" type="number" var="seat" />
							<fmt:formatNumber value="${det.reservation}" type="number" var="reserved" />
							<td>${status.count}</td>
							<td>${Bean.subject}</td>
							<td>${det.today}</td>
							<td>${det.starttime}</td>
							<td>${seat-reserved}</td>
							<td>${det.seat}</td>
							<td>${det.place}</td>
							<td><input type="button" value="예매하기" onclick="location.href='${contextPath}/Proser/prepare.do?pronum=${Bean.pronum}&detailnum=${det.detnum}'"></td>
							<td><input type="button" value="수정하기" onclick="location.href='${contextPath}/Proser/redetails.do?pronum=${Bean.pronum}&detailnum=${det.detnum}'"></td>
							<td><input type="button" value="삭제하기" onclick="location.href='${contextPath}/Proser/deletedetails.do?pronum=${Bean.pronum}&detailnum=${det.detnum}'"></td>
						</tr>
					</c:forEach>
			</c:when>
		</c:choose>
			
		</table>
		</div>
	<!-- <input type="text" id="testDatepicker" style="margin-left: 50%;"> -->
</div>

</body>
</html>