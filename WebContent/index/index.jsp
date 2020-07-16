<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!-- PP dagyo -->
<!-- JSTL 사용을 위해 선언 -->    
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<link href="//fonts.googleapis.com/earlyaccess/nanumgothic.css" rel="stylesheet" type="text/css">



<!-- 챗봇 -->
<script>
  (function() {
    var w = window;
    if (w.ChannelIO) {
      return (window.console.error || window.console.log || function(){})('ChannelIO script included twice.');
    }
    var d = window.document;
    var ch = function() {
      ch.c(arguments);
    };
    ch.q = [];
    ch.c = function(args) {
      ch.q.push(args);
    };
    w.ChannelIO = ch;
    function l() {
      if (w.ChannelIOInitialized) {
        return;
      }
      w.ChannelIOInitialized = true;
      var s = document.createElement('script');
      s.type = 'text/javascript';
      s.async = true;
      s.src = 'https://cdn.channel.io/plugin/ch-plugin-web.js';
      s.charset = 'UTF-8';
      var x = document.getElementsByTagName('script')[0];
      x.parentNode.insertBefore(s, x);
    }
    if (document.readyState === 'complete') {
      l();
    } else if (window.attachEvent) {
      window.attachEvent('onload', l);
    } else {
      window.addEventListener('DOMContentLoaded', l, false);
      window.addEventListener('load', l, false);
    }
  })();
  ChannelIO('boot', {
    "pluginKey": "93c11d3e-a14d-4123-a8fd-2391ad9fe0fc"
  });
</script>
<!-- 챗봇 -->




<!-- 00후 로그아웃 -->
<script>
var tid;
var cnt = parseInt(3000);//초기값(초단위)
function counter_init() {
	tid = setInterval("counter_run()", 1000);
}

function counter_reset() {
	clearInterval(tid);
	cnt = parseInt(3000);
	counter_init();
}

function counter_run() {
	document.all.counter.innerText = time_format(cnt);
	cnt--;
	if(cnt < 0) {
		clearInterval(tid);
		location.href = "${contextPath}/member/logout.do";
	}
}
function time_format(s) {
	var nHour=0;
	var nMin=0;
	var nSec=0;
	if(s>0) {
		nMin = parseInt(s/60);
		nSec = s%60;

		if(nMin>60) {
			nHour = parseInt(nMin/60);
			nMin = nMin%60;
		}
	} 
	if(nSec<10) nSec = "0"+nSec;
	if(nMin<10) nMin = "0"+nMin;

	return ""+nHour+":"+nMin+":"+nSec;
}
</script>




<!DOCTYPE html>
<html>
  <head>
  <style>

.news {
	border: 1px solid #e7e7e7; 
	box-sizing: content-box; 
	padding: 0 0 0 0px;
	position: relative;  
	background-color:;
	width: auto;}
.news1{
margin: 10px;}
.photo{width:106px; float:left;
    margin-top: 2px;
    margin-right: 17px }

</style>
    <title>Meditative - Free Bootstrap 4 Template by Colorlib</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
  
  
  
  <!-- 모달창 -->
  
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
 
  <!-- 모달창 --> 
  
  
  
  
  
  
  
  
  
  
  
  </head> 
  <body>
<jsp:include page="../include/indexheader.jsp" />




<section class="ftco-section bg-light" style="position: relative; top: 50px;">
      <div class="container"  style="position: relative; left: 50px; ">
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
                <h3 class="heading mt-2"><a href="#" style="font-family:나눔고딕;">공연/전시 소식</a></h3>
				    <div class="news" >	
				
					<div class="news1" >
							<c:forEach var="i" items="${list}">
								${i}
							</c:forEach>
						</div>
					</div>
                <table align="center" font-size="30px"  style="width:100%; border-collapse: separate;
    border-spacing: 1px;" >
                
                </table>
              
              </div>
            </div>
          </div>
          <div class="col-md-4 d-flex ftco-animate" >
          	<div class="blog-entry justify-content-end">
              
              <div class="text w-100 mt-3">
              	<div class="meta">
                  <div><a href="#">July. 14, 2019</a></div>
                  <div><a href="#">Admin</a></div>
                  <div><a href="#" class="meta-chat"><span class="icon-chat"></span> 3</a></div>
                </div>
                <h3 class="heading mt-2"><a href="#" style="font-family:나눔고딕;">For You</a></h3>
                <p>당신을 위한 맞춤 공연</p>
              	  <p>나에게 딱 맞는 공연 추천과
				           공연 스케줄 관리를 시작해보세요!</p>
				      <a href="../images/prefer.PNG" class="gallery image-popup img d-flex align-items-center" style="background-image: url(../images/prefer.PNG);">
							<div class="icon mb-4 d-flex align-items-center justify-content-center" style="background-color: #00E7D6 !important;">
    						<span class="icon-instagram" ></span>
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
                <h3 class="heading mt-2"><a href="#" style="font-family:나눔고딕;">랭킹</a></h3>
                <table align="center" font-size="30px"  style="width:100%; border-collapse: separate;
    border-spacing: 1px;" >
                
                <tr height="10" align="center" bgcolor="#D8FF54" style="width: 155px;
    padding: 10px; font-weight: bold; color: #fff;">
                <th>
               	1. 오패라 하우스 
               	
               	 
                </th>
                </tr>
                
                <tr height="10" align="center" bgcolor="#D8FF54" style="width: 155px;
    padding: 10px; font-weight: bold; color: #fff;">
                <th>
               	2. 레배카
               	 
                </th>
                </tr>
                
                <tr height="10" align="center" bgcolor="#D8FF54" style="width: 155px;
    padding: 10px; font-weight: bold; color: #fff;">
                <th>
               	3. 헤드윅
               	 
                </th>
                </tr>
<!--                 	<div class="news" >	 -->

<!-- 		<div class="news1" > -->
<%-- 			<c:forEach var="k" items="${list2}"> --%>
<%-- 				${k} --%>
<%-- 			</c:forEach> --%>
<!-- 		</div> -->
<!-- 	</div>   -->
                
                </table>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>



    
   

   
    
<jsp:include page="../include/footer.jsp" />
		
	
  </body>
</html>