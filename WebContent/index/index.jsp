<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- JSTL 사용을 위해 선언 -->    
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
  <head>
    <title>Meditative - Free Bootstrap 4 Template by Colorlib</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
  <script src="https://code.jquery.com/jquery-latest.js"></script>
  
  
  <!-- The Modal -->
    <div id="myModal" class="modal" style="display: none; /* Hidden by default */
            position: fixed; /* Stay in place */
            z-index: 1; /* Sit on top */
            left: 0;
            top: 0;
            width: 100%; /* Full width */
            height: 100%; /* Full height */
            overflow: auto; /* Enable scroll if needed */
            background-color: rgb(0,0,0); /* Fallback color */
            background-color: rgba(0,0,0,0.4); /* Black w/ opacity */">
 
      <!-- Modal content -->
      <div class="modal-content" style="background-color: #fefefe;
            margin: 15% auto; /* 15% from the top and centered */
            padding: 20px;
            border: 1px solid #888;
            width: 25%;
            
            
             /* Could be more or less, depending on screen size */        ">
                <a href="../blog.jsp" ><p style="text-align: center; font-color: #000;" ><b>
                <span style="font-size: 24pt; color: #000;">최신 콘서트 보러가기</span></b></span></p></a>
                
               
                <!-- <img src="../images/concert2.jpg" alt="프로필 이미지" ><a href="../about.jsp">프로필 이미지</a> -->
                <a href="../blog.jsp" ><img src="../images/concert2.jpg" alt="프로필 이미지" style="max-width: 100%; width: auto; height: 600px; display: table;"></a>
                

           		<br>
                <a href="../blog.jsp" ><p style="text-align: center; font-color: #000;" ><b>
                <span style="font-size: 24pt; color: #000;">예약하러가기</span></b></span></p></a>
                <br>
                <br>
                <br>
               
              
                
            <div style="cursor:pointer;background-color:#002545;text-align: center; padding-bottom: 10px;padding-top: 10px; margin-top: -50px" onClick="close_pop();">
                <span class="pop_bt" style="font-size: 15pt; color: #fff; " >
                     닫기
                </span>
            </div>
      </div>
 
    </div>
        <!--End Modal-->
 
 
    <script type="text/javascript">
      
        jQuery(document).ready(function() {
                $('#myModal').show();
        });
        //팝업 Close 기능
        function close_pop(flag) {
             $('#myModal').hide();
        };
        
      </script>
 
  
  
  
  
  
  
  
  
  
  
  
  
  </head>
 

  

  
  
  <body>
<jsp:include page="../include/indexheader.jsp" />






<section class="ftco-section bg-light" style="position: relative; top: -300px;">
      <div class="container"  style="position: relative; left: 50px;">
        <div class="row justify-content-center mb-5 pb-3">
          <div class="col-md-7 heading-section ftco-animate text-center">
            <h2 class="mb-1" style="position: relative; left: -50px;">Recent Posts</h2>
          </div>
        </div>
        <div class="row d-flex">
          <div class="col-md-4 d-flex ftco-animate">
          	<div class="blog-entry justify-content-end">
              
              
              <div class="text w-100 mt-3">
              	<div class="meta">
                  <div><a href="#">July. 14, 2019</a></div>
                  <div><a href="#">Admin</a></div>
                  <div><a href="#" class="meta-chat"><span class="icon-chat"></span> 3</a></div>
                </div>
                <h3 class="heading mt-2"><a href="#">티켓 오픈 소식</a></h3>
                <table align="center" font-size="30px"  style="width:100%; border-collapse: separate;
    border-spacing: 1px;" >
                
                <tr height="10" align="center" bgcolor="#FFB5B5" style="width: 155px;
    padding: 10px; font-weight: bold; color: #fff;">
                <th>
               	 오패라 하우스 <br>
               	[오픈]2020.06/01
               	 
                </th>
                </tr>
                
                <tr height="10" align="center" bgcolor="#FFB5B5" style="width: 155px;
    padding: 10px; font-weight: bold; color: #fff;">
                <th>
               	 레배카<br>
               	[오픈]2020.06/02
               	 
                </th>
                </tr>
                
                <tr height="10" align="center" bgcolor="#FFB5B5" style="width: 155px;
    padding: 10px; font-weight: bold; color: #fff;">
                <th>
               	 헤드윅<br>
               	[오픈]2020.06/03
               	 
                </th>
                </tr>
                
                
                </table>
              
              </div>
            </div>
          </div>
          <div class="col-md-4 d-flex ftco-animate"  style="margin-left: -100px; margin-right: 100px;">
          	<div class="blog-entry justify-content-end">
              
              <div class="text w-100 mt-3">
              	<div class="meta">
                  <div><a href="#">July. 14, 2019</a></div>
                  <div><a href="#">Admin</a></div>
                  <div><a href="#" class="meta-chat"><span class="icon-chat"></span> 3</a></div>
                </div>
                <h3 class="heading mt-2"><a href="#">For You</a></h3>
                <p>당신을 위한 맞춤 공연</p>
              	  <p>나에게 딱 맞는 공연 추천과
				           공연 스케줄 관리를 시작해보세요!</p>
				      <a href="../images/prefer.PNG" class="gallery image-popup img d-flex align-items-center" style="background-image: url(../images/prefer.PNG);">
							<div class="icon mb-4 d-flex align-items-center justify-content-center">
    						<span class="icon-instagram"></span>
    					</div>
						</a>
				       
              </div>
            </div>
          </div>
          <div class="col-md-4 d-flex ftco-animate">
          	<div class="blog-entry">
              
              <div class="text w-100 mt-3">
              	<div class="meta">
                  <div><a href="#">July. 14, 2019</a></div>
                  <div><a href="#">Admin</a></div>
                  <div><a href="#" class="meta-chat"><span class="icon-chat"></span> 3</a></div>
                </div>
                <h3 class="heading mt-2"><a href="#">랭킹</a></h3>
                <table align="center" font-size="30px"  style="width:100%; border-collapse: separate;
    border-spacing: 1px;" >
                
                <tr height="10" align="center" bgcolor="#FFB5B5" style="width: 155px;
    padding: 10px; font-weight: bold; color: #fff;">
                <th>
               	1. 오패라 하우스 
               	
               	 
                </th>
                </tr>
                
                <tr height="10" align="center" bgcolor="#FFB5B5" style="width: 155px;
    padding: 10px; font-weight: bold; color: #fff;">
                <th>
               	2. 레배카
               	 
                </th>
                </tr>
                
                <tr height="10" align="center" bgcolor="#FFB5B5" style="width: 155px;
    padding: 10px; font-weight: bold; color: #fff;">
                <th>
               	3. 헤드윅
               	 
                </th>
                </tr>
                
                
                </table>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>












    

    <section class="ftco-section" style="position: relative; top: -300px;">
    	<div class="container">
    	
        
            <div class="col-md-12 heading-section ftco-animate text-center" style="margin-bottom: 100px;">
            <h2 class="mb-1">예매하기</h2>
            </div>
          
          
        <div class="row">
        	<div class="col-md-3">
        		<div class="classes w-100 ftco-animate">
        			<a href="#" class="img w-100 mb-3" style="background-image: url(../images/con1.jpg); height: 350px;"></a>
        			<div class="text w-100 text-center">
        				<h3><a href="#">2020 서울 파크 뮤직 페스티벌</a></h3>
        				
        			</div>
        		</div>
        	</div>
        	<div class="col-md-3">
        		<div class="classes w-100 ftco-animate">
        			<a href="#" class="img w-100 mb-3" style="background-image: url(../images/opera.jpg); height: 350px;"></a>
        			<div class="text w-100 text-center">
        				<h3><a href="#">오페라 하우스</a></h3>
        			
        			</div>
        		</div>
        	</div>
        	<div class="col-md-3">
        		<div class="classes w-100 ftco-animate">
        			<a href="#" class="img w-100 mb-3" style="background-image: url(../images/cats.jpg); height: 350px;"></a>
        			<div class="text w-100 text-center">
        				<h3><a href="#">캣츠</a></h3>
        				
        			</div>
        		</div>
        	</div>
        	<div class="col-md-3">
        		<div class="classes w-100 ftco-animate">
        			<a href="#" class="img w-100 mb-3" style="background-image: url(../images/hodu.jpg); height: 350px;"></a>
        			<div class="text w-100 text-center">
        				<h3><a href="#">호두깎이 인형</a></h3>
        				
        			</div>
        		</div>
        	</div>
        	<div class="col-md-3">
        		<div class="classes w-100 ftco-animate">
        			<a href="#" class="img w-100 mb-3" style="background-image: url(../images/headmu.jpg); height: 350px;"></a>
        			<div class="text w-100 text-center">
        				<h3><a href="#">헤드윅</a></h3>
        				
        			</div>
        		</div>
        	</div>
        	<div class="col-md-3">
        		<div class="classes w-100 ftco-animate">
        			<a href="#" class="img w-100 mb-3" style="background-image: url(../images/rebeca.jpg); height: 350px;"></a>
        			<div class="text w-100 text-center">
        				<h3><a href="#">레베카</a></h3>
        			
        			</div>
        			
        			
        		</div>
        	</div>
        </div>
    	</div>
    </section>

    
    
    
    
    
		

   
    
<jsp:include page="../include/footer.jsp" />
		
	
  </body>
</html>