<%@page import="Product.ProductDAO"%>
<%@page import="Product.ProductBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../css/default.css" rel="stylesheet" type="text/css">
<link href="../css/subpage.css" rel="stylesheet" type="text/css">

<style type="text/css">
h1{font-family: "Times New Roman";
font-size: 40px; color: #CCC; margin : 50px;
font-weight: normal; text-align: center;
}

td img{
	width : 200px; height:250px;
}
td{
	word-break:break-all;
	text-align: center;
	width : 200px;
	height : 50px;
} 

table{
	border-collapse: separate;
	border-spacing: 50px 0;
}

.co{
	word-break:break-all;
	text-align: center;
	font-weight:bold;
	border-style: solid;
	font-size: 15px;
	height: auto;
	width : 200px
}

a{
	text-decoration: none;
	color: #333;
}

.submit{
	height: 30px; width: 150px; border: 1px solid #666;
	border-radius:10px; box-shadow:3px 3px 2px #CCC;
	font-size: 14px;
	background-image: url("../images/member/submit_back.jpg");
	background-repeat: repeat-x;
	background-position: center center;
	color: #fff;
	margin-left: 600px;
}
</style>

</head>
<%
	String id = (String)session.getAttribute("id");
	
	int line = 0;
	
	int count = (Integer) request.getAttribute("count");

	int pageSize = (Integer) request.getAttribute("pageSize");

	int pageNum = (Integer) request.getAttribute("pageNum");

	int currentPage = (Integer) request.getAttribute("currentPage");

	int startRow = (Integer) request.getAttribute("startRow");

	List<ProductBean> list = (List) request.getAttribute("List"); 

	String[] image = new String[2];
%>
<body>
<div id="wrap">



<div id="resou"></div>

<h1>PRODUCT[Total : <%=count%>]</h1>

<table align="center">
		<%
			if(id != null){
				if(id.equals("admin")){
		%>
		<tr>
			<td colspan="3">
				<input type="button" class="submit" value="제품등록" 
				onclick="location.href='${contextPath}/Proser/write.do'">
			</td>
		</tr>
		<%	
				}
			}
		%>
	
	<tr>
		<td colspan="3"></td>
	</tr>
	
	<%
		if(count>0){
			for(int i=0;i<list.size();i++){
				ProductBean bean = list.get(i);
				if(bean.getImage() != ","){
					image = bean.getImage().split(",");
				}
				if(line==0){
					out.print("<tr>");
				}
				line++;
				%>
					<td class="co"><a href="${contextPath}/Proser/content.do?num=<%=bean.getNum()%>&pageNum=<%=pageNum%>">
					<img src="../consert/<%=image[0]%>"></a>
					<br><p><%=bean.getName()%></p></td>
				<%
				
				if(line%3==0){
					
					out.print("</tr>");
					line = 0;
					%>
						<tr>
							<td colspan="3"></td>
						</tr>
					<% 
				}	
			}
			
		}else{
			%>
			<tr>
				<td colspan="3">등록된 제품이 없습니다.</td>
			</tr>
			<%
		}
	
	%>
	<tr>
		<td colspan="3"></td>
	</tr>
	
</table>


<div class="clear"></div>

<div id="page_control">
<%
	if(count>0){
		//전체 페이지수 구하기   글20개   한페이지에 보여줄 글수 10개  => 2페이지
		//                 글25개  한페이지에 보여줄 글수 10개 => 3페이지
		//조건 삼항 연산자    조건 ? 참 : 거짓
		//전체 페이지수  = 전체글수 / 한페이지에 보여줄 글수  + (전체글수를 한페이지에 보여줄 글수로 나눈 나머지값)
		int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
		
		//한블럭에 묶여질 페이지번호수 설정
		int pageBlock = 1;
		
		//시작페이지 번호 구하기
		//1 ~ 10 =>  1  ,   11~20 => 11 ,  21~30 => 21
		//( (선택한 페이지번호 / 한블럭에 보여지는 페이지번호수) - 
		//	(선택한페이지번호를 한화면에 보여줄 페이지수로 나눈나머지값)) * 한블럭에 보여줄 페이지수 + 1;
		int startPage = ((currentPage/pageBlock) - (currentPage % pageBlock == 0 ? 1 : 0 )) * pageBlock + 1;

		//끝페이지 번호 구하기   1~10 => 10 ,   11~20 => 20,  21~30 => 30
		//시작페이지번호 + 현재블럭에 보여줄 페이지수 - 1
		int endPage = startPage + pageBlock - 1;
		
		//끝페이지 번호가 전체페이지수보다 클때
		if(endPage > pageCount){
			//끝페이지 번호를 전체페이지수로 저장
			endPage = pageCount;
		}
		
		//[이전] 시작페이지 번호가  한화면에 보여줄 페이지수보다 클때...
		if(startPage > pageBlock){
%>
		<a href="${contextPath}/Proser/imcontact.do?pageNum=<%=startPage-pageBlock%>" style="font-size:20px;">[이전]</a>			
<%			
		}	
		//[1][2][3]...[10]
		for(int i=startPage;  i<=endPage; i++){
%>
		<a href="${contextPath}/Proser/imcontact.do?pageNum=<%=i%>" style="font-size:20px;">[<%=i%>]</a>			
<%			
		}
		//[다음] 끝페이지 번호가 전체 페이지수보다 작을때..
		if(endPage < pageCount){
%>
		<a href="${contextPath}/Proser/imcontact.do?pageNum=<%=startPage+pageBlock%>" style="font-size:20px;">[다음]</a>
<%			
		}	
	}
%>
</div>


</div>
</body>
</html>