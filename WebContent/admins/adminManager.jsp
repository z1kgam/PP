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
  <!-- 제이쿼리는 스크립트 안에서 그냥 사용하면 되는구나 ...ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ -->
<script src="//code.jquery.com/jquery.min.js"></script>

	<script type="text/javascript">
	
	function delete(){     
		 	alert("호출");
         	document.frm1.action=${contextPath}+"/admin/MemberDel.do";      
         	document.frm1.submit();
	}
    
	
	function update() {
		frm1.action="/${contextPath}admin/MemberMod.do";      	
	}
	
	
	//삭제 메소드
// 	function del() {
		
// 		if (confirm("정말 삭제 하시겠습니까??") == true){ //확인
// 		if($("input[name='check']").prop("checked") == true) {
// 			document.membersList.submit();
// 		}else {
// 			alert("먼저 선택을 해주세요.");
// 			return;
// 		 }
// 		}else{   
// 		    return;
// 		}
// 	}
	
	//수정 메소드
// 	function mod() {
		
// 		if (confirm("정말 수정 하시겠습니까??") == true){ //확인
// 		if($("input[name='check']").prop("checked") == true) {
// 			document.membersList.submit();
// 		}else {
// 			alert("먼저 선택을 해주세요.");
// 			return;
// 		 }
// 		}else{  
// 		    return;
// 		}
// 	}
		
	
	</script>

  	
  </head>
  <body>
 	 <!-- 해더 부분 -->
  	<jsp:include page="../include/header.jsp" />
 	 <!-- 해더 부분 -->
    <!-- END nav -->

    <section class="hero-wrap hero-wrap-2" style="background-image: ${contextPath}/url('images/bg_3.jpg');" data-stellar-background-ratio="0.5">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text js-fullheight align-items-center justify-content-center">
          <div class="col-md-9 ftco-animate text-center">
            <h1 class="mb-3 bread">Blog Single</h1>
            <p class="breadcrumbs"><span class="mr-2"><a href="index.jsp">Home</a></span> <span class="mr-2"><a href="${contextPath}/blog.jsp">Blog</a></span> <span>Blog Single</span></p>
          </div>
        </div>
      </div>
    </section>

    <section class="ftco-section">
      <div class="container">
        <div class="row">
          <div class="col-lg-8 ftco-animate">
    <!-- 총회원수 출력 -->        
  	<section class="ftco-counter img" id="section-counter" style="background-image: ${contextPath}/url(images/bg_3.jpg);" data-stellar-background-ratio="0.5">
			<div class="overlay"></div>
      <div class="container">
        <div class="row justify-content-center">
        	<div class="col-md-10">
        		<div class="row">
		          <div class="col-md-6 col-lg-3 d-flex justify-content-center counter-wrap ftco-animate">
		            <div class="block-18 text-center">
		              <div class="text">
		              	<strong class="number" data-number="${total}">;</strong>
		              	<span>총 회원 수</span>
		              </div>
		            </div>
		          </div>
		          <div class="col-md-6 col-lg-3 d-flex justify-content-center counter-wrap ftco-animate">
		            <div class="block-18 text-center">
		              <div class="text">
		              	<strong class="number" data-number="100">0</strong>
		              	<span>당월 가입자 수</span>
		              </div>
		            </div>
		          </div>
		          <div class="col-md-6 col-lg-3 d-flex justify-content-center counter-wrap ftco-animate">
		            <div class="block-18 text-center">
		              <div class="text">
		              	<strong class="number" data-number="100">0</strong>
		              	<span>한주 가입자 수</span>
		              </div>
		            </div>
		          </div>
		          <div class="col-md-6 col-lg-3 d-flex justify-content-center counter-wrap ftco-animate">
		            <div class="block-18 text-center">
		              <div class="text">
		              	<strong class="number" data-number="100">0</strong>
		              	<span>당일 가입자 수</span>
		              </div>
		            </div>
		          </div>
		        </div>
		      </div>
        </div>
      </div>
    </section>
            
            <!-- 회원 정보 뿌려주는 테이블 -->
            <form action="#" name="frm1" method="post" id="frm1">
            <table align="center" border="1" with="100%" font-size="20px">
			<tr height="10" align="center" bgcolor="lightpink">
            		<th>아이디</th>
            		<th>비밀번호</th>
            		<th>이름</th>
            		<th>이메일</th>
            		<th>우편번호</th>
            		<th>주소1</th>
            		<th>주소2</th>
            		<th>휴대폰 번호</th>
            		<th>포인트</th>
            		<th>가입 날짜</th>
            		<th>선 택</th>
            	</tr>
            	<c:forEach var="memberlist" items="${list}" varStatus="membersNum">
            	<tr>
            		<td><a href="${contextPath}/admin/MemberView.do?id=${memberlist.id}" class="nav-link">${memberlist.id}</a></td>
            		<td>${memberlist.password}</td>
            		<td with="20%">${memberlist.name}</td>
            		<td with="20%">${memberlist.email}</td>
            		<td>${memberlist.zipcode}</td>
            		<td with="35%">${memberlist.address1}</td>
            		<td with="35%">${memberlist.address2}</td>
            		<td with="15%">${memberlist.phone}</td>
            		<td>${memberlist.point}</td>
            		<td with="15%">${memberlist.reg_date}</td>
            		<td>${memberlist.id}</td>
            		
            		
            	</tr>
            	</c:forEach>
            </table>
            </form>
<%--             <form action="${contextPath}/admin/MemberMod.do" name="membersList2" >  --%>
<%--             	<c:forEach var="memberlist" items="${list}" varStatus="membersNum2"> --%>
<!--             	<tr> -->
<%--             		<td><input type="hidden" class="form-control" id="InputId" name="id" value="${memberlist.id}"></td> --%>
<%--             		<td><input type="hidden" class="form-control" id="Inputpw" name="password" value="${memberlist.password}"></td> --%>
<%--             		<td><input type="hidden" class="form-control" id="Inputname" name="name" value="${memberlist.name}"></td> --%>
<%--             		<td with="20%"><input type="hidden" class="form-control" id="Inputemail" name="email" value="${memberlist.email}"></td> --%>
<%--             		<td><input type="hidden" class="form-control" id="Inputzipcode" name="zipcode" value="${memberlist.zipcode}"></td> --%>
<%--             		<td with="35%"><input type="hidden" class="form-control" id="Inputaddress1" name="address1" value="${memberlist.address1}"></td> --%>
<%--             		<td with="35%"><input type="hidden" class="form-control" id="Inputaddress2" name="address2" value="${memberlist.address2}"></td> --%>
<%--             		<td with="15%"><input type="hidden" class="form-control" id="Inputphone" name="phone" value="${memberlist.phone}"></td> --%>
<%--             		<td><input type="hidden" class="form-control" id="Inputpoint" name="point" value="${memberlist.point}"></td> --%>
<%--             		<td with="15%"><input type="hidden" class="form-control" id="Inputreg_date" name="reg_date" value="${memberlist.reg_date}"></td> --%>
<%--             		<td><input type="checkbox" name="check" value="${memberlist.id}"/></td> --%>
<!--             	</tr> -->
<%--             	</c:forEach> --%>
<!--             </form> -->
            <!-- 회원 정보 뿌려주는 테이블 끝 -->
			
			<div align="center">
			<c:if test="${nowpage>blocksize}">
				<a href="${contextPath}/admin/MemberMan.do?nowpage=${blockfirst-blocksize}">[이전]</a>
			</c:if>
			<c:forEach begin="${blockfirst}" end="${blocklast}" var="i">
				<a href="${contextPath}/admin/MemberMan.do?nowpage=${i}">${i}</a>
			</c:forEach>
			<c:if test="${blocklast != totalPage }">
				<a href="${contextPath}/admin/MemberMan.do?nowpage=${blocklast+1}">[다음]</a>
			</c:if>
			</div>
			
			<div align="right">
			<!-- 삭제 버튼 -->
			
			
			</div>
          </div> <!-- .col-md-8 -->
          <div class="col-lg-4 sidebar ftco-animate">
            <div class="sidebar-box">
              <form action="#" class="search-form">
                <div class="form-group">
                	<div class="icon">
	                  <span class="icon-search"></span>
	                </div>
	                
                  <input type="text" class="form-control" placeholder="Type a keyword and hit enter">
                </div>
              </form>
            </div>
            <div class="sidebar-box ftco-animate">
              <div class="categories">
                <h3 class="heading-2">관리자 목 록</h3>
                <li><a href="${contextPath}/admin/MemberMan.do">전체 회원 관리 <span>(12)</span></a></li>
                <li><a href="#">공연 상품 관리 <span>(22)</span></a></li>
                <li><a href="#">이벤트 관리 <span>(37)</span></a></li>
                <li><a href="#">공지 사항 관리 <span>(42)</span></a></li>
                <li><a href="#">### <span>(14)</span></a></li>
                <li><a href="#">### <span>(140)</span></a></li>
              </div>
            </div>

            

           

            

        </div>
      </div>
    </section> <!-- .section -->

<!-- 푸터 부분 -->
  <jsp:include page="../include/footer.jsp" />
<!-- 푸터 부분 -->    
  </body>
</html>