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
    <div id="map"></div>
    <script type="text/javascript">

var map;
var marker;
function initMap() {
  
	map = new google.maps.Map(document.getElementById('map'), {
	
    center: {lat: ${unidto.universityLatitude}, lng: ${unidto.universityLongitude}},
    zoom: 13
  	});
	
	//에이작스로 요청보냄 (학교시퀀스) -> 정류장 리스트를 받음
	//c forEach로 아래 구문 생성
	//marker+${정류장seq}
	//position({lat: ${위}, lng: ${경}})
	
	marker1 = new google.maps.Marker({
	    map: map,
	    draggable: true,
	    animation: google.maps.Animation.DROP,
	    position: {lat: 37.228665, lng: 127.171749}
	});
	marker1.addListener('click', toggleBounce);
	marker2 = new google.maps.Marker({
	    map: map,
	    draggable: true,
	    animation: google.maps.Animation.DROP,
	    position: {lat: 37.237443, lng: 127.179417}
	});
	marker2.addListener('click', toggleBounce);
	marker3 = new google.maps.Marker({
	    map: map,
	    draggable: true,
	    animation: google.maps.Animation.DROP,
	    position: {lat: 37.235845, lng: 127.189926}
	});
	marker3.addListener('click', toggleBounce);
	marker4 = new google.maps.Marker({
	    map: map,
	    draggable: true,
	    animation: google.maps.Animation.DROP,
	    position: {lat: 37.234781, lng: 127.198239}
	});
	marker4.addListener('click', toggleBounce);
}

function toggleBounce() {
	  if (marker.getAnimation() !== null) {
	    marker.setAnimation(null);
	  } else {
	    marker.setAnimation(google.maps.Animation.BOUNCE);
	  }
	}


    </script>
    <script async defer
      src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBk_ju7pwO5Gb-Q49o6-t2KvJ8erqmfgiY&callback=initMap">
    </script>
  </body>
</html>