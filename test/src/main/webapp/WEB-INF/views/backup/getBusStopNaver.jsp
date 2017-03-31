<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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

<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=IVVqCpGsP6YXrl2ogm4R&submodules=panorama"></script>
<script>
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
<div id="pano" style="width:800px;height:400px;"></div>

</body>
</html>