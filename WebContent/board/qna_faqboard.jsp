<%@page import="java.sql.Date"%>
<%@page import="team.faqboard.faqBean"%>
<%@page import="java.util.List"%>
<%@page import="team.faqboard.faqDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    

<%
	//한글처리
	request.setCharacterEncoding("UTF-8");

%>

<%--컨텍스트 주소 얻기 --%>    
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>

<!DOCTYPE html>



<script>
	//검색창
	function check(){
		//검색어를 입력하지 않았다면
		if(document.sr.search.value == ""){
			//경고메세지
			alert("검색어를 입력하세요.");
			//검색어 입력 공간에 포커스를 주어 검색어를 입력하도록 유도함.
			document.sr.search.focus();
			return;
		}
		//검색어를 입력 했다면 폼을 전송한다
		document.sr.submit();
	}
	
	
	
	
	
</script>



<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>공지 사항</title>

<link rel="stylesheet" href="../css/bootstrap.min.css" />
<link rel="stylesheet" href="../css/style.css" />

<script src="../js/jquery-3.4.1.min.js"></script>
<script src="../js/bootstrap.min.js"></script>

</head>
<body style="text-align: center;">
	<c:forEach items="${list}" var="A">
	<c:if test="${A.faq_num}>1">
		${A.faq_num}
	</c:if>
		
	</c:forEach>
	
	
<!-- 카테고리 클릭시 해당 카테고리 목록출력 -->
   <div class="btn-group w-100" style="width: 50%!important">
		<a href="${contextPath}/fboard/faqlist.do" class="btn btn-dark btn-lg bt">전체</a> 
		<a href="${contextPath}/fboard/faqlist.do?category=&search=티켓예매" class="btn btn-dark btn-lg bt">티켓예매</a> 
		<a href="${contextPath}/fboard/faqlist.do?category=&search=취소/환불" class="btn btn-dark btn-lg bt">취소/환불</a> 
		<a href="${contextPath}/fboard/faqlist.do?category=&search=티켓수령"	class="btn btn-dark btn-lg bt">티켓수령</a> 
		<a href="${contextPath}/fboard/faqlist.do?category=&search=회원" class="btn btn-dark btn-lg bt">회원</a> 
		<a href="${contextPath}/fboard/faqlist.do?category=&search=이벤트" class="btn btn-dark btn-lg bt">이벤트</a>
	</div>
				
				
            
	

	<section class="container body-container py-5">
		<div class="row">
			<div class="col-12 col-lg-4">
				<h2> F A Q </h2>				
			</div>
			<div class="col-12 col-lg-8 text-right mt-lg-3">
				<small>클릭해서 상세정보를 확인하세요.</small>
				<button type="button" class="btn btn-sm btn-outline-secondary ml-3" onclick="hideContent()">모두 접기</button>
			</div>
		</div>
		<!-- 게시판 -->
		<article class="mt-3">
			<table class="table text-center" id="tb01">

				<colgroup class="d-lg-none">
					<col />
					<col style="width:54px"/>
					<col style="width:54px"/>
					<col style="width:54px"/>
				</colgroup>
				<colgroup class="d-none d-lg-table-column-group">
					<col style="width:240px"/>
					<col />
					<col style="width:160px"/>
					<col style="width:120px"/>
					<col style="width:120px"/>
				</colgroup>
				
					<tr>
						<th>NO.</th>
						<th>분류</th>
						<th>제목</th>
					</tr>
			
				<tbody>
					
					<c:if test="${count > 0}">
						<c:forEach var="articlesList" items="${articlesList}" varStatus="articlesNum">
						<tr onclick="toggleContent(this)" style="cursor:pointer">
							<td class="align-middle text-left">
								${articlesList.faq_num}
								<small class="d-block d-lg-none mt-1 text-muted">${articlesList.faq_num}</small>
							</td>
							<td class="align-middle d-none d-lg-table-cell text-left" id="fcate">${articlesList.faq_cate}</td>
							<td class="align-middle">
								${articlesList.faq_title}
							</td>
							
						</tr>
						<tr class="poolcontent" style="display:none">
							<td colspan="5" class="py-5">
								<div class="text-left break-all">${articlesList.faq_contents}</div>
								<%-- <%
									if (userId != null && userId.equals("admin")) {
								%>
									<div class="text-right mt-3">
										<button type="button" class="btn btn-sm btn-warning" onclick="location.href='poolUpdate.jsp?pageNum=<%=pageNum%>&poolNum=<%=poolNum%>'">수정</button>
										<button type="button" class="btn btn-sm btn-danger" onclick="location.href='poolDelete.jsp?pageNum=<%=pageNum%>&poolNum=<%=poolNum%>'">삭제</button>
									</div>
								<% 
									}
								%> --%>
								<div class="text-right mt-3">
										<button type="button" class="btn btn-sm btn-warning" 
												onclick="location.href='${contextPath}/fboard/faqUpdateForm.do?faq_num=${articlesList.faq_num}'">수정</button>
										<button type="button" class="btn btn-sm btn-danger" 
												onclick="location.href='${contextPath}/fboard/faqDelete.do?faq_num=${articlesList.faq_num}'">삭제</button>
								</div>
								
							</td>
						</tr>
					</c:forEach>
					</c:if> 
					<c:if test="${count == 0 }">
						<tr>
							<td colspan="4">등록된 글이 없습니다.</td>
						</tr>
					</c:if>
				</tbody>
			</table>
			<div class="row  my-5">
				<div class="col-12 col-lg-8">
					<form action="${contextPath}/fboard/faqlist.do" name="sr" class="form-inline justify-content-center justify-content-lg-start">
						<input type="hidden" name="category" value="" />
						<div class="input-group">
							<input type="text" name="search" size="24" maxlength="24" class="form-control">
							<div class="input-group-append">
								<button type="submit" class="btn btn-secondary" onClick="check()">검색</button>
							</div>
						</div>
					</form>
				</div>
				<div class="col-12 col-lg-4 mt-3 mt-lg-0">
				
						<div class="form-group text-center text-lg-right">
							<button type="button" class="btn btn-secondary" onclick="location.href='${contextPath}/fboard/fwriteForm.do'">글쓰기</button>
						</div>
					
				</div>
			</div>
			<div class="row">
				<div class="col-12">				
					<ul class="pagination justify-content-center">
					
		<%-- 페이징처리 --%>			
 		<c:if test="${nowpage > blocksize}">
			<li class="page-item">
				<a class="page-link" href="${contextPath}/fboard/faqlist.do?nowpage=${blockfirst - blocksize}&search=${search}">이전</a>
			</li>
		</c:if>
		<c:forEach begin="${blockfirst}" end="${blocklast}" step="1" var="li">
		<li class="page-item active">
			<a class="page-link" href="${contextPath}/fboard/faqlist.do?nowpage=${li}&search=${search}">${li}</a>
		</li>
		</c:forEach>
		
		<c:if test="${blocklast != totalpage}">
			<li class="page-item">
				<a class="page-link" href="${contextPath}/fboard/faqlist.do?nowpage=${blocklast + 1}&search=${search}">다음</a>
			</li>
		</c:if>
		
		
			
					</ul>
				</div>
			</div>
		</article>
		<!-- 게시판 -->
	</section>
<%-- 	<jsp:include page="../include/footer.jsp" /> --%>
	<script>
		function toggleContent(obj){
			$(obj).next().toggle();
		}
		function hideContent(){
			$(".poolcontent").hide();
		}
	</script>
	
</body>
</html>