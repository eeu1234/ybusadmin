<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no, target-densitydpi=medium-dpi" />

<meta name="mobile-web-app-capable" content="yes">

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

<html>
  <head>
    <style type="text/css">
      html, body { height: 100%; margin: 0; padding: 0; }
      #map { height: 100%; }
    </style>
  </head>
  <body>
    <div id="mapAP"></div>
    <script type="text/javascript">

var mapAP;
var marker;

function initMap() {
  
	mapAP = new google.maps.Map(document.getElementById('mapAP'), {
	
    center: {lat: ${bsdto.busStopLatitude}, lng: ${bsdto.busStopLongitude}},
    zoom: 18
  	});
	
	
	<c:forEach items="${apList}" var="apdto">
		var infowindow${apdto.aroundPlaceSeq} = new google.maps.InfoWindow({
			content:'${apdto.aroundPlaceName}',
		});
		
		marker${apdto.aroundPlaceSeq} = new google.maps.Marker({
		    map: mapAP,
		    draggable: true,
		    animation: google.maps.Animation.DROP,
		    info: '${apdto.aroundPlaceName}',
		    title: '${apdto.aroundPlaceName}',
		    position: {lat: ${apdto.aroundPlaceLatitude}, lng: ${apdto.aroundPlaceLongitude}}
		});
		marker${apdto.aroundPlaceSeq}.addListener('click', function(){
			infowindow${apdto.aroundPlaceSeq}.open(mapAP,marker${apdto.aroundPlaceSeq});
		});
			
	</c:forEach>

}





    </script>
    <script async defer
      src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBk_ju7pwO5Gb-Q49o6-t2KvJ8erqmfgiY&callback=initMap">
    </script>
  </body>
</html>