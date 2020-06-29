<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- Bootstrap -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
    <!-- jQuery(부트스트랩의 자바스크립트 플러그인을 위해 필요)-->
    <script src="http://code.jquery.com/jquery.js"></script> 
    <!-- 모든 합쳐진 플러그인을 포함하거나 필요한 파일을 포함 -->
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <!-- Respond.js으로 IE8에서 반응형 기능활성화 -->
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
<title></title>
</head>
<body>


      <article class="container">
        <div class="page-header">
        <hr/>

        <div class="col-md-6 col-md-offset-3">
          <form role="form" action="${contextPath}/member/findPw.do" method="post" name="pwCheckForm">        
            <div class="form-group">
              	아이디는 <input type="text" class="form-control" readonly value="${id}" > 입니다.
            </div>
            <div class="form-group text-center">
              <input type="submit" class="btn btn-info" value="비밀번호 찾기">
              <button type="button" class="btn btn-warning" onclick="location.href='${contextPath}/member/login.do'">로그인하러 가기</button>
            </div>
          </form>
        </div>
      </article>

</body>
</html>