<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="ko"><head>
 	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width,initial-scale=1">
    <title>Ybus</title>
    <link rel="stylesheet" href="/spring/css/2022css/busStopHeader.css">
    <link rel="stylesheet" href="/spring/css/2022css/busStopRoad.css">
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=c5wa0CTc7jalj6c4Y0tw&submodules=panorama"></script>

<script src="https://code.jquery.com/jquery-1.12.4.min.js"
   integrity="sha256-ZosEbRLbNQzLpnKIkEdrPv7lOy9C27hHQ+Xp8a4MxAQ="
   crossorigin="anonymous"></script>  
</head>
<body>
<!-- 
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
			<a href="javascript:void(0)" class="tablinks" style="border-left: 1px solid #003140; " id="busStopview" onclick="location.href='/spring/getBusStopRoadView.action?busStopSeq='+${bsdto.busStopSeq}">Stop View</a> 
			<a href="javascript:void(0)" style="border-left: 1px solid #003140;border-bottom: 5px solid #003d4f; border-right: 1px solid #003140;" class="tablinks" onclick="location.href='/spring/getBusStopMapView.action?busStopSeq='+${bsdto.busStopSeq}">Stop Map</a>
			
		</div>
		
		
		

		<div id="mapNormal"></div>


		<div id="Tokyo" class="tabcontent">
			정류장 약도
		</div>

	
	
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
			 
			<div style="width:50%;height:80%;float:left;margin-left:3%;padding-top:1.5%;">${bsdto.busStop} 주변정보 </div>
		</div>
		<div id="mapAP"></div>
  <script type="text/javascript">

  </script>

			
		</div>
	</div>




</div>
   <script type="text/javascript">
var mapAP;
var marker;
var mapNormal;
var markerNormal;
function initMap() {
  	
	//주변맛집 맵
	mapAP = new google.maps.Map(document.getElementById('mapAP'), {
		
	    center: {lat: ${bsdto.busStopLatitude}, lng: ${bsdto.busStopLongitude}},
	    zoom: 15
	});	
	
	//정류장 맵
	mapNormal = new google.maps.Map(document.getElementById('mapNormal'), {
		
	    center: {lat: ${bsdto.busStopLatitude}, lng: ${bsdto.busStopLongitude}},
	    zoom: 15
	});
	
	//주변맛집 마커
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
	//정류장 마커
	markerNormal = new google.maps.Marker({
	    map: mapNormal,
	    draggable: false,
	    icon: '/spring/images/timeLine/busStopMaker.png',
	    animation: google.maps.Animation.DROP,
	    position: {lat: ${bsdto.busStopLatitude}, lng: ${bsdto.busStopLongitude}}
	});

}//end initMap
  </script>
 -->


</body>
</html>