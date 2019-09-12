<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<title>Cambus</title>
<%@include file="/inc/userAsset.jsp" %>

<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=c5wa0CTc7jalj6c4Y0tw&submodules=panorama"></script>


<style>
#txtLogo {
	position: relative;
	width: 60%;
	height: 80%;
	padding-top: 4%;
	margin: 0 auto;
	font-weight: bold;
}

#logo {
	position: absolute;
	top: 0;
	right: 0;
	height: 100%;
	width: auto;
}
#mapAP { 
	height: 100%;
	width:100%;
}



</style>
<script>
$(function() {

		
	});
	
	
</script>
</head>
<body>
	<div id="container">
		<div id ="top">
			<div id="header">
			<input type="hidden" id = "busStopCategorySeq" value="${busStopCategorySeq}">
				<div id="infoPage">
					<input type="button" value="<" style="color:white;position: absolute; font-size:1.5em;left: 3%;margin-top:2%; width: 8%; height: 55%;  background-color: transparent !important; border-color: transparent;"	onclick="history.back();" />
					<div id="txtLogo">
					
						${bsdto.busStop} 
					
					</div>
				
					<img src="/spring/images/logo/${universityDto.universityImg}" id="logo" onerror="this.style.display='none'" />
				</div>
			</div>
		</div>
		
		<div id="contents">
			<div class="tab">
				<a href="javascript:void(0)" class="tablinks" style="border-left: 1px solid #003140; border-bottom: 5px solid #003d4f;" id="busStopview" onclick="location.href='/spring/getBusStopRoadView.action?busStopSeq='+${bsdto.busStopSeq}">정류장 거리뷰</a> 
				<a href="javascript:void(0)" style="border-left: 1px solid #003140; border-right: 1px solid #003140;" class="tablinks" onclick="location.href='/spring/getBusStopMapView.action?busStopSeq='+${bsdto.busStopSeq}">정류장 지도</a>
				
			</div>
			
				<div id="street-view"style="width:100%;height:400px;"></div>




			<!-- 애드센스 -->
			<script async src="https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
			<ins class="adsbygoogle"
			     style="display:block"
			     data-ad-format="fluid"
			     data-ad-layout-key="-fb+5w+4e-db+86"
			     data-ad-client="ca-pub-2370297300940223"
			     data-ad-slot="8826360596"></ins>
			<script>
			     (adsbygoogle = window.adsbygoogle || []).push({});
			</script>






			<div id="infoAround">
				<div id="infoTitle">
					 
					<div style="width:50%;height:80%;float:left;margin-left:3%;padding-top:1.5%;">Aroung place ${bsdto.busStop}  </div>
				</div>
				<div id="mapAP"></div>
			    <script type="text/javascript">
			
					var mapAP;
					var marker;
					
					function initMap() {
					  	//정류장 맛집 맵
						mapAP = new google.maps.Map(document.getElementById('mapAP'), {
						
					    center: {lat: ${bsdto.busStopLatitude}, lng: ${bsdto.busStopLongitude}},
					    zoom: 15
					  	});
						
						//정류장 마커
						<c:forEach items="${apList}" var="apdto">
							var infowindow${apdto.aroundPlaceSeq} = new google.maps.InfoWindow({
								content:'${apdto.aroundPlaceName}',
							});
							
							marker${apdto.aroundPlaceSeq} = new google.maps.Marker({
							    map: mapAP,
							    draggable: false,
							    animation: google.maps.Animation.DROP,
							    info: '${apdto.aroundPlaceName}',
							    title: '${apdto.aroundPlaceName}',
							    position: {lat: ${apdto.aroundPlaceLatitude}, lng: ${apdto.aroundPlaceLongitude}}
							});
							marker${apdto.aroundPlaceSeq}.addListener('click', function(){
								infowindow${apdto.aroundPlaceSeq}.open(mapAP,marker${apdto.aroundPlaceSeq});
							});
								
						</c:forEach>
					
						
						
						/* 구글 스트리트뷰 */
						var panorama;
					   
				        panorama = new google.maps.StreetViewPanorama(
				            document.getElementById('street-view'),
				            {
				              position: {lat: ${bsdto.busStopLatitude}, lng: ${bsdto.busStopLongitude}},
				              pov: {heading: 165, pitch: 0},
				              zoom: 1
				         });
					     
				        
				     // Set up the markers on the map
				        var Marker = new google.maps.Marker({
				            position: {lat: ${bsdto.busStopLatitude}, lng: ${bsdto.busStopLongitude}},
				            map: panorama,
				            icon: '/spring/images/timeLine/busStopMaker2.png',
				            title: 'BusStop'
				        });
					}
	
			    </script>
			    <script async defer
			      src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBvu3Ngel84QlOc4Lc4BAszD3UeSMEiWgM&callback=initMap">
			    </script>
			</div>
		</div>




	</div>




</body>
<!-- 

	
	//네이버 로드뷰
	var HOME_PATH = window.HOME_PATH || '.',
	pano = null;

	function initPanorama() {
	pano = new naver.maps.Panorama("pano", {
	    position: new naver.maps.LatLng(${bsdto.busStopLatitude}, ${bsdto.busStopLongitude}),
	    pov: {
	        pan: -135,
	        tilt: 29,
	        fov: 100
	    }
	});

	naver.maps.Event.addListener(pano, "init", function() {
	    marker.setMap(pano);

	    var proj = pano.getProjection();
	    var lookAtPov = proj.fromCoordToPov(marker.getPosition());
	    if (lookAtPov) {
	        pano.setPov(lookAtPov);
	    }
	});
	}
	
	//네이버 로드뷰 마커
	var marker = new naver.maps.Marker({
	position: new naver.maps.LatLng(${bsdto.busStopLatitude}, ${bsdto.busStopLongitude}),
	icon: { // 레티나 디스플레이 대응 마커 아이콘
		  url: HOME_PATH +"/images/timeLine/busStopMaker2.png",
		    size: new naver.maps.Size(155, 106),
		    anchor: new naver.maps.Point(28, 100),
		    origin: new naver.maps.Point(0, 0),
		    scaledSize: new naver.maps.Size(55, 80)
	}
	});

	naver.maps.Event.addListener(marker, "click", function(e) {
	//alert("marker clicked");
	});

	$("#marker").on("click", function(e) {
	e.preventDefault();

	var el = $(this);

	if (marker.getMap()) {
	    marker.setMap(null);
	    el.val("Marker 추가").removeClass("control-on");
	} else {
	    marker.setMap(pano);
	    el.val("Marker 제거").addClass("control-on");
	}
	});

	naver.maps.onJSContentLoaded = initPanorama;
	
	

 -->

</html>