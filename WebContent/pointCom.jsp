<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="${contextPath}/mypage/css/bootstrap.css">
<link rel="stylesheet" href="${contextPath}/mypage/css/custom.css">
<meta charset="UTF-8">
<title>포인트충전</title>
<style type="text/css">
	a:hover{
		color:red;
	}
	
	a{
		color:blue;
		text-decoration: none;
	}
</style>
</head>
<body>
	<div class="container">
		<h2>포인트 확인</h2>
			<div class="row">
				<form action="${contextPath}/mycon/addpointCom.do" method="post">
					<table class="table" style="text-align: center; border: 1px solid #dddddd; max-width: 80%; " >
						<thead>
							<tr>
								<th style="background-color: #eeeeee; text-align: center;">입금자</th>
								<td>
									<label for="username">${sessionScope.name}</label>
								</td>
							</tr>
							<tr>
								<th style="background-color: #eeeeee; text-align: center;">충전금액</th>
								<td align="center">
									<input type="text" name="point" value="${point}" class="form-control" 
										style="width: 80%; text-align: center;" readonly="readonly">
								</td>
							</tr>
							<tr>
								<th style="background-color: #eeeeee; text-align: center;">입금할 은행명</th>
								<td>
									<label for="username">신한은행</label>
								</td>
							</tr>
							<tr>
								<th style="background-color: #eeeeee; text-align: center;">예금주</th>
								<td>
									<label for="username">티켓</label>
								</td>
							</tr>
							<tr>
								<th style="background-color: #eeeeee; text-align: center;">계좌번호</th>
								<td>
									<label for="username">123-4567-890123</label>
								</td>
							</tr>
						</thead>
					</table>
					<div class="form-group text-center">
						<input type="hidden" name="name" value="${sessionScope.name}">
						<input type="hidden" name="id" value="${sessionScope.id}">
						<input type="submit" value="입금확인완료" class="btn btn-primary">
						<button type="button" class="btn btn-success" onclick="location.href='${contextPath}'">메인으로</button>
					</div>
				</form>
			</div>
	</div>
</body>
</html>