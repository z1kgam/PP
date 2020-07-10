<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>여러개 마커 표시하기</title>
	<jsp:include page="../include/header.jsp"></jsp:include>
    
</head>
<body>
    <section class="hero-wrap hero-wrap-2" style="background-image: url('../images/bg_3.jpg');" data-stellar-background-ratio="0.5">
		<div class="overlay"></div>
			<div class="container">
        		<div class="row no-gutters slider-text js-fullheight align-items-center justify-content-center">
          			<div class="col-md-9 ftco-animate text-center">
						<h1 class="mb-3 bread">Contact Us</h1>
						<p class="breadcrumbs"><span class="mr-2"><a href="index.html">Home</a></span> <span>Contact</span></p>
					</div>
				</div>
			</div>
	</section>
<input type="button" value="서울" id="seoul">
<input type="button" value="부산" id="busan">
<div id="map" style="width:50%;height:400px;"></div>
<br>
<div id="map2" style="width:50%;height:400px;"></div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ed9791d0d9caeff08abc43ebd08003f0"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
    mapOption = { 
        center: new kakao.maps.LatLng(37.557717, 127.000502), // 지도의 중심좌표
        level: 7 // 지도의 확대 레벨
    };

var mapContainer2 = document.getElementById('map2'), // 지도를 표시할 div  
	mapOption2 = { 
	    center: new kakao.maps.LatLng(37.446483, 126.698035), // 지도의 중심좌표
	    level: 7 // 지도의 확대 레벨
};

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
var map2 = new kakao.maps.Map(mapContainer2, mapOption2); // 지도를 생성합니다
 
// 마커를 표시할 위치와 title 객체 배열입니다 
var positions = [
    {
        title: '서울문화회관 대극장', 
        latlng: new kakao.maps.LatLng(37.572451, 126.975812)
    },
    {
        title: '충무 아트센터', 
        latlng: new kakao.maps.LatLng(37.565965, 127.014642)
    },
    {
        title: '국립극장', 
        latlng: new kakao.maps.LatLng(37.552505, 126.999641)
    },
    {
        title: '홍익대학교 대학로 아트센터',
        latlng: new kakao.maps.LatLng(37.576480, 127.001426)
    }
];

var positions2 = [
    {
        title: '부산 시민회관', 
        latlng: new kakao.maps.LatLng(35.138752, 129.065271)
    },
    {
        title: '부산 문화회관', 
        latlng: new kakao.maps.LatLng(35.127237, 129.093500)
    },
    {
        title: '영화의 전당', 
        latlng: new kakao.maps.LatLng(35.171064, 129.127110)
    },
    {
        title: 'KBS 부산홀',
        latlng: new kakao.maps.LatLng(35.145050, 129.109045)
    }
];

// 마커 이미지의 이미지 주소입니다
var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 


	for (var i = 0; i < positions.length; i ++) {
	    
	    // 마커 이미지의 이미지 크기 입니다
	    var imageSize = new kakao.maps.Size(24, 35); 
	    
	    // 마커 이미지를 생성합니다    
	    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
	    
	    // 마커를 생성합니다
	    var marker = new kakao.maps.Marker({
	        map: map, // 마커를 표시할 지도
	        position: positions[i].latlng, // 마커를 표시할 위치
	        title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
	        image : markerImage // 마커 이미지 
	    });
	    
	}
	for (var j = 0; j < positions2.length; j ++) {
	    
	    // 마커 이미지의 이미지 크기 입니다
	    var imageSize = new kakao.maps.Size(24, 35); 
	    
	    // 마커 이미지를 생성합니다    
	    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
	    
	    // 마커를 생성합니다
	    var marker = new kakao.maps.Marker({
	        map2: map2, // 마커를 표시할 지도
	        position2: positions2[i].latlng, // 마커를 표시할 위치
	        title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
	        image : markerImage // 마커 이미지 
	    });
	    
	}	


</script>

<jsp:include page="../include/footer.jsp"/>

</body>
</html>