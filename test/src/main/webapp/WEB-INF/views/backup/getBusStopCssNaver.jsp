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


<script src="/spring/js/tabMenu.js"></script>

<!-- ico 아이콘-->
<link rel="apple-touch-icon" href="/mobile/images/favicon.ico">


<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=IVVqCpGsP6YXrl2ogm4R&submodules=panorama"></script>

<script
  src="https://code.jquery.com/jquery-1.12.4.min.js"
  integrity="sha256-ZosEbRLbNQzLpnKIkEdrPv7lOy9C27hHQ+Xp8a4MxAQ="
  crossorigin="anonymous"></script>

<link rel="stylesheet" href="/spring/css/busStop.css">


<style>

</style>
<script>
	$(function() {

		busStopview.click();
	});

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

	var marker = new naver.maps.Marker({
	position: new naver.maps.LatLng(${bsdto.busStopLatitude}, ${bsdto.busStopLongitude}),
	icon: { // 레티나 디스플레이 대응 마커 아이콘
	    url: HOME_PATH +"/img/example/pin_map.png", // 110x72 크기의 원본 이미지
	    size: new naver.maps.Size(55, 36),
	    anchor: new naver.maps.Point(28, 36),
	    origin: new naver.maps.Point(0, 0),
	    scaledSize: new naver.maps.Size(55, 36)
	}
	});

	naver.maps.Event.addListener(marker, "click", function(e) {
	alert("marker clicked");
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
</script>
</head>
<body>
	<div id="container">

		<div id="headArea">

			명지대 사거리 <img src="/images/busStop/topLogo.png" style="position: absolute; right: 0;height:100%;width:auto;" />
		</div>


		<div id="contents">
			<div class="tab">
				<a href="javascript:void(0)" class="tablinks" onclick="openCity(event, 'London')" id="busStopview">정류장 뷰</a> 
				<a href="javascript:void(0)" style="border-left: 1px solid #003140; border-right: 1px solid #003140;" class="tablinks" onclick="openCity(event, 'Paris')">정류장 지도</a>
				<a href="javascript:void(0)" class="tablinks" onclick="openCity(event, 'Tokyo')">정류장 약도</a>
			</div>
			<div id="London" class="tabcontent">
				<div id="pano" style="width:800px;height:400px;"></div>
			</div>

			<div id="Paris" class="tabcontent">
			정류장 지도
			</div>

			<div id="Tokyo" class="tabcontent">
				정류장 약도
			</div>


			<div id="infoAround">
				<div id="infoTitle">
					<img src="/images/busStop/infoIcon.png" alt="주변정류장 이미지" style="width: 4%; height: 70%;margin-left: 8%;float:left;" /> 
					<div style="width:50%;height:80%;float:left;margin-left:3%;padding-top:1.5%;">명지대 사거리</div>
				</div>
				<div id="infoNameCase">
					<div class="infoName">1. 아름이네 한잔어때</div>
					<div class="infoName">2. 도영산업</div>
					<div class="infoName">3. 술필원 주식회사</div>
					<div class="infoName">4. (주)캠버스</div>
					<div class="infoName">5.갓아름의 작품</div>
					<img src="/images/busStop/infoNameImg.png"
						style="width: 100%; height: auto;margin:0;padding:0;" />
				</div>
			</div>
		</div>




	</div>




</body>
</html>