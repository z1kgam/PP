<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />


<style>
#login:hover {color: #fff;}

 
</style>


<!DOCTYPE html>
<html>
<head>


    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>bootstrap template</title>






     <!-- Bootstrap -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
    <!-- jQuery(부트스트랩의 자바스크립트 플러그인을 위해 필요)-->
    <script src="http://code.jquery.com/jquery.js"></script> 
    <!-- 모든 합쳐진 플러그인을 포함하거나 필요한 파일을 포함 -->
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <!-- Respond.js으로 IE8에서 반응형 기능활성화 -->
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
	<script src="../js/login.js"></script>
	





<script type="text/javascript">

$(document).ready(function(){
	
	var key = getCookie("key");
	$("#InputId").val(key);
	
	if($("#InputId").val() != ""){
		$("#idSaveCheck").attr("checked",true);
	}
	
	$("#idSaveCheck").change(function(){
		if($("#idSaveCheck").is(":checked")){
			setCookie("key", $("#InputId").val(), 7);
		}else{
			deleteCookie("key");
		}
	});
	
	$("#InputId").keyup(function(){
		if($("#idSaveCheck").is(":checked")){
			setCookie("key", $("#InputId").val(), 7);
		}
	});
});

	function setCookie(cookieName, value, exdays){
		var exdate = new Date();
		exdate.setDate(exdate.getDate() + exdays);
		var cookieValue = escape(value) + ((exdays == null) ? "" : "; expires=" + exdate.toGMTString());
		document.cookie = cookieName + "=" + cookieValue;
	}
	
	function deleteCookie(cookieName){
		var expireDate = new Date();
		expireDate.setDate(expireDate.getDate() - 1);
		document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
	}
	
	function getCookie(cookieName){
		cookieName = cookieName + '=';
		var cookieData = document.cookie;
		var start = cookieData.indexOf(cookieName);
		var cookieValue = '';
		if(start != -1){
			start += cookieName.length;
			var end = cookieData.indexOf(';', start);
			if(end == -1)end = cookieData.length;
			cookieValue = cookieData.substring(start, end);
		}
		return unescape(cookieValue);
	}
 
</script>












</head>
<body>
<jsp:include page="../include/header.jsp" />
<div class="container">

	<div class="page-header" style="padding-top: 50px;">
	<hr/>
		<h2 style="margin-bottom: 50px;">Login Page </h2>
	</div>

	<div class="col-md-6 col-md-offset-3">
		<form action="${contextPath}/member/loginAction.do" method="post">
			<div class="form-group">
				<label for="username">아이디</label>
				<input type="text" name="id" id="InputId" class="form-control">
			</div>
			
			<div class="form-group">
				<label for="username">비밀번호</label>
				<input type="password" name="password" id="InputPassword" class="form-control">
			</div>
			
			<div class="form-group text-center">
				<input type="checkbox" class="checkbox" id="idSaveCheck">아이디 기억하기	
				<input type="submit" value="로그인" id="login" class="btn btn-primary" style="background-color: #00E7D6 !important; border-color: #00E7D6 !important;">
			</div>
			<label for="username"><a href="${contextPath}/member/findId.do" style="color: #3d435c; "><b>아이디/비밀번호 찾기</b></a></label><br>
			<label for="username" style=" padding-bottom: 50px;"><a href="${contextPath}/member/join.do" style="color: #3d435c;"><b>회원가입 하러 가기</b></a></label>
	</form>

</div>
</div>
<jsp:include page="../include/footer.jsp" />
</body>
</html>