<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
    <%--로그인유무 확인 --%>

    
<!DOCTYPE html>
<html>
<head>

<style>
p.a {font-size: 15px;
font-weight: bold;	}


</style>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<c:if test="${detailList.place != null}">
	<c:choose>
		<c:when test="${detailList.place == 'KSPO DOME (올림픽공원 체조경기장)'}">
			<c:set var="k" value="서울 송파구 올림픽로 424"/>
		</c:when>
		<c:when test="${detailList.place == '잠실종합운동장 주경기장'}">
			<c:set var="k" value="서울 송파구 올림픽로 25 서울종합운동장"/>
		</c:when>
		<c:when test="${detailList.place == '블루스퀘어 아이마켓홀'}">
			<c:set var="k" value="서울 용산구 이태원로 294"/>
		</c:when>
		<c:when test="${detailList.place == '의정부 종합운동장'}">
			<c:set var="k" value="의정부시 체육로 90"/>
		</c:when>
		<c:when test="${detailList.place == '예술의전당'}">
			<c:set var="k" value="서울 서초구 서초동 산144-4"/>
		</c:when>
		<c:when test="${detailList.place == '연세대학교 노천극장'}">
			<c:set var="k" value="서울 서대문구 연세로 50"/>
		</c:when>
	</c:choose>
</c:if>

<div>
	<p class="a">${detailList.place} ></p>
	
	${k}
</div>
 
<br>
<p class="a">공연장 위치</p>
<div id="map" style="width:650px;height:600px;"></div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ed9791d0d9caeff08abc43ebd08003f0&libraries=services"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(37.510324, 127.063729), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 


// 지도 확대 축소를 제어할 수 있는 줌 커트롤을 생성합니다
var zoomControl = new kakao.maps.ZoomControl();
map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);

// 주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();

// 주소로 좌표를 검색합니다
geocoder.addressSearch('${k}',  function(result, status) {

    // 정상적으로 검색이 완료됐으면 
     if (status === kakao.maps.services.Status.OK) {

        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

        // 결과값으로 받은 위치를 마커로 표시합니다
        var marker = new kakao.maps.Marker({
            map: map,
            position: coords
        });

        // 인포윈도우로 장소에 대한 설명을 표시합니다
        var infowindow = new kakao.maps.InfoWindow({
            content: '<div style="width:150px;text-align:center;padding:0px 0;">${detailList.place}</div>'
        });
        infowindow.open(map, marker);

        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
        map.setCenter(coords);
    } 
});    
</script>	
	
</body>
</html>