<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<title>Cambus</title>



<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no, target-densitydpi=medium-dpi" />

<meta name="mobile-web-app-capable" content="yes">
<!-- import 시작 -->
<script src="https://code.jquery.com/jquery-1.12.4.min.js"
	integrity="sha256-ZosEbRLbNQzLpnKIkEdrPv7lOy9C27hHQ+Xp8a4MxAQ="
	crossorigin="anonymous"></script>
<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<link
	href="https://gitcdn.github.io/bootstrap-toggle/2.2.2/css/bootstrap-toggle.min.css"
	rel="stylesheet">
<script
	src="https://gitcdn.github.io/bootstrap-toggle/2.2.2/js/bootstrap-toggle.min.js"></script>




<!-- ico 아이콘-->
<link rel="apple-touch-icon" href="/mobile/images/favicon.ico">


<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=IVVqCpGsP6YXrl2ogm4R&submodules=panorama"></script>

<script
  src="https://code.jquery.com/jquery-1.12.4.min.js"
  integrity="sha256-ZosEbRLbNQzLpnKIkEdrPv7lOy9C27hHQ+Xp8a4MxAQ="
  crossorigin="anonymous"></script>

<link rel="stylesheet" href="/spring/css/busStop.css">
    <script async defer
      src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBk_ju7pwO5Gb-Q49o6-t2KvJ8erqmfgiY&callback=initMap">
    </script>

<style>

#mapAP { 
	height: 100%;
	width:100%;
}
#mapNormal { 
	  height: 400px;
      width:100% 
}
#container {
	position: relative;
	width: 100%;
	max-width: 480px;
	height: 568px;
	margin: 0 auto;

}

#top{
	position: relative;
	width: 100%;
	height: 7%;
	z-index: 3;
}
#header {
	position: relative;
	width: 100%;
	height: 50px;
	background-color: #003d4f;
	text-align: center;
	color: white;
	background-color: #003d4f;
}
#infoPage {
	position: relative;
	width: 100%;
	height: 100%;
	background-color: #003d4f;
}
#txtLogo {
	position: relative;
	width: 60%;
	height: 80%;
	padding-top: 2.5%;
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
</style>
<script>

	////////////////////////////////////////////////////
	
	
	
</script>
</head>
<body>
	<div id="container">
		<div id ="top">
			<div id="header">
			<input type="hidden" id = "busStopCategorySeq" value="${busStopCategorySeq}">
				<div id="infoPage">
					<input type="button" value="<" style="color:white;position: absolute; font-size:1.5em;left: 3%;margin-top:1%; width: 8%; height: 55%;  background-color: transparent !important; border-color: transparent;"	onclick="history.back();" />
					<div id="txtLogo">
					
						${bsdto.busStop} 
					
					</div>
				
					<img src="/spring/images/timeLine/header_logo.png" id="logo" />
				</div>
			</div>
		</div>


		<div id="contents">
			<div class="tab">
				<a href="javascript:void(0)" class="tablinks" style="border-left: 1px solid #003140; " id="busStopview" onclick="location.href='/spring/getBusStopRoadView.action?busStopSeq='+${bsdto.busStopSeq}">정류장 뷰</a> 
				<a href="javascript:void(0)" style="border-left: 1px solid #003140;border-bottom: 5px solid #003d4f; border-right: 1px solid #003140;" class="tablinks" onclick="location.href='/spring/getBusStopMapView.action?busStopSeq='+${bsdto.busStopSeq}">정류장 지도</a>
				
			</div>
			
			
			

			<div id="mapNormal"></div>


			<div id="Tokyo" class="tabcontent">
				정류장 약도
			</div>


			<div id="infoAround">
				<div id="infoTitle">
					 
					<div style="width:50%;height:80%;float:left;margin-left:3%;padding-top:1.5%;">${bsdto.busStop} </div>
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
  	
	mapAP = new google.maps.Map(document.getElementById('mapAP'), {
		
	    center: {lat: ${bsdto.busStopLatitude}, lng: ${bsdto.busStopLongitude}},
	    zoom: 15
	});	
	mapNormal = new google.maps.Map(document.getElementById('mapNormal'), {
		
	    center: {lat: ${bsdto.busStopLatitude}, lng: ${bsdto.busStopLongitude}},
	    zoom: 15
	});
	
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
	
	
	
	markerNormal = new google.maps.Marker({
	    map: mapNormal,
	    draggable: false,
	    animation: google.maps.Animation.DROP,
	    position: {lat: ${bsdto.busStopLatitude}, lng: ${bsdto.busStopLongitude}}
	});

	

	
}



    </script>



</body>
</html>