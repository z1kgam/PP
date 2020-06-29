<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
   
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
	request.setCharacterEncoding("UTF-8");
%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />
    
    
<!DOCTYPE html>
<html>
<head>

	<script type="text/javascript">
	
	//수정 함수
	function update(f) {
		console.debug(f);
		f.action = "${contextPath}/admin/MemberUpdate.do";
		f.submit();
	
	}
	
	function delete2(f) {
		console.debug(f);
		f.action = "${contextPath}/admin/MemberDelete.do";
		f.submit();
	
	}
	
	</script>


<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="page-wrapper">
	
			<!-- Header -->
			<jsp:include page="../include/header.jsp" />
		
			<!-- Main -->
				<div align="center">
				<div class="col-md-6 ftco-animate py-md-5">
            	<form action="#" class="contact-form" >
            	<div class="row">
            		<div class="col-md-6">
	                <div class="form-group">
	                  	아이디<input type="text" class="form-control" value="${memberInfo.id}"></td>
	                </div>
                </div>
                <div class="col-md-6">
	                <div class="form-group">
	                  	비밀번호<input type="text" class="form-control" value="${memberInfo.password}" >
	                </div>
	                </div>
	                <div class="col-md-6">
	                <div class="form-group">
	                  	이름<input type="text" class="form-control" value="${memberInfo.name}" >
	                </div>
	                </div>
	                <div class="col-md-6">
	                <div class="form-group">
	                  	휴대폰<input type="text" class="form-control" value="${memberInfo.phone}">
	                </div>
	                </div>
	                <div class="col-md-6">
	                <div class="form-group">
	                  	이메일<input type="text" class="form-control" value="${memberInfo.email}" >
	                </div>
	                </div>
	                <div class="form-group">
	                  	보유 포인트<input type="text" class="form-control" value="${memberInfo.point}" >
	                </div>
	                </div>
	                <div class="col-md-6">
	                <div class="form-group">
	                  	회원 상태<input type="text" class="form-control" value="${memberInfo.status}" >
	                </div>
	                </div>
	                <div class="col-md-6">
	                <div class="form-group">
	                  	관리자 권한<input type="text" class="form-control" value="${memberInfo.is_admin}" >
	                </div>
	                </div>
	                
              </div>
              <div class="col-md-6">
              		
              </div>
              <div class="form-group">
                	
                	
                	
              </div>
              <div class="form-group">
                <input type="button" onclick="update(this.form)" value="수정 하기" class="btn btn-primary py-3 px-5">
                <input type="button" onclick="delete2(this.form)"value="삭제 하기" class="btn btn-primary py-3 px-5">
              </div>
            </form>
          </div>
          </div>
					
	<jsp:include page="../include/footer.jsp" />				
</body>
</html>