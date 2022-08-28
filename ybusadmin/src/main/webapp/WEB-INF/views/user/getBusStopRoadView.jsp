<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="ko">
<head>
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
<div id="container">
    <div id="header">
        <div id="hedaerTop" style='background-image: url("./images/2022busStop/통학버스_배경(낮).png")'>
            <div id="hedaerTopBackGround">
                <div id="headerTopContents">
                    <div id="busTypeZone">
                        <div id="busType">
                            통학 버스
                        </div>
                    </div>
                    <div id="buttonsZone">
                        <div id="buttons">
                            <div id="btnRouteMapZone">
                                <div id="btnRouteMap">
                                </div>
                            </div>
                            <div id="btnBusScheduleZone">
                                <div id="btnBusSchedule">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div id="busStopNotification">
            <div id="busStopNotice" >
                <div id="noticeIconZone" class="busNotice">
                    <div id="noticeIcon"></div>
                </div>
                <div id="busNoticeContents" class="busNotice">
                    정류장을 클릭하면 해당 위치 로드뷰를 확인 할 수 있습니다.
                </div>
                <div style="clear: both"></div>
            </div>
        </div>
        <div id="viewType">
            <div class="viewBtn">
                <div class="viewBtnName" id="selectedBtn">
                    정류장 거리뷰
                </div>
            </div>
            <div class="viewBtn">
                <div class="viewBtnName">
                    정류장 지도
                </div>
            </div>
            <div style="clear: both"></div>
        </div>
    </div>
    <div id="contents">
        <div id="busStop">
            <div id="busStopContents">
                <div id="backBtnZone" class="busStopContents">
                    <div id="backBtn"></div>
                </div>
                <div id="busStopName" class="busStopContents">
                    ${bsdto.busStop}
                </div>
                <div style="clear: both"></div>
            </div>
        </div>
        <div id="roadView_MapZone">
            <div id="roadView_Map">
				
            </div>
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
        
        <!-- 엣날 지도
        <div id="infoAround">
			<div id="infoTitle">
				<div id="infoTitleText">Around place  ${bsdto.busStop}</div>
			</div>
			<div id="mapAP">
			
			</div>
			
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
			            document.getElementById('roadView_Map'),
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
		 -->
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