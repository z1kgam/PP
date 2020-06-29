<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>

    <!-- Bootstrap -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
    <!-- jQuery(부트스트랩의 자바스크립트 플러그인을 위해 필요)-->
    <script src="http://code.jquery.com/jquery.js"></script> 
    <!-- 모든 합쳐진 플러그인을 포함하거나 필요한 파일을 포함 -->
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <!-- Respond.js으로 IE8에서 반응형 기능활성화 -->
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
	<script src="../js/usersearch.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>     		

      	
<!-- 본문 START -->
<div class="container">
		<div class="page-header">
          <hr/>
          <h1>비밀번호 찾기</h1>
        </div>
        <hr/>
	
	<div id="searchP">
	 <form action="${contextPath}/member/findPwAction.do" method="post" name="pwForm">
		<div class="form-group">
			<label for="username">아이디</label>
				<input type="text" class="form-control" name="id" id="id2" placeholder="아이디를 입력하세요.">
		</div>
		
		<div>
			<label for="username">이메일</label>
			<input type="email" class="form-control" name="email" id="email2" placeholder="Ex) Admin@google.com">
		</div>
		
		<div class="form-group text-center">
              <button type="button" class="btn btn-primary" id="searchBtn2" onclick="EmailCheck()">확인</button>
              <button type="button" class="btn btn-warning" onclick="location.href='${contextPath}'">메인으로</button>
        </div>
	  </form>
	</div>
</div>
</body>
</html>