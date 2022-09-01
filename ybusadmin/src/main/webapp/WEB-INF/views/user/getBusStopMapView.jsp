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
    <link rel="stylesheet" href="/spring/css/2022css/busStopRoadMap.css">
    <!--
    <link rel="stylesheet" href="/spring/css/2022css/busStopRoadMapInfo.css">
    -->
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=c5wa0CTc7jalj6c4Y0tw&submodules=panorama"></script>

<script src="https://code.jquery.com/jquery-1.12.4.min.js"
   integrity="sha256-ZosEbRLbNQzLpnKIkEdrPv7lOy9C27hHQ+Xp8a4MxAQ="
   crossorigin="anonymous"></script>  

<script>
let universitySeq = '${universityDto.universitySeq}';
let busStopCategorySeq = '${busStopCategorySeq}';
let busStopSeq = '${bsdto.busStopSeq}';

$(document).ready(function(){
	$(".viewBtn:eq(0)").click(function(){
		location.href="/spring/getBusStopRoadView.action?universitySeq="+universitySeq+"&busStopCategorySeq="+busStopCategorySeq+"&busStopSeq="+busStopSeq;
	});
	
	$(".viewBtn:eq(1)").click(function(){
		location.href="/spring/getBusStopMapView.action?universitySeq="+universitySeq+"&busStopCategorySeq="+busStopCategorySeq+"&busStopSeq="+busStopSeq;
	});

	$("#backBtn").click(function(){
		location.href="/spring/getBusStopLine.action?universitySeq="+universitySeq+"&busStopCategorySeq="+busStopCategorySeq;
	});
});

/*
function refresh(){
	let bsdcSeq = $("#detailLocationSel").val();
	let busStopCategorySeq = $("#busStopCategorySeq").val();
	location.href="/spring/getBusStopLine.action?universitySeq="+universitySeq+"&busStopCategorySeq="+busStopCategorySeq+"&busStopDetailCategorySeq="+bsdcSeq;
}

function moveMap(){
	let bsdcSeq = $("#detailLocationSel").val();
	let busStopCategorySeq = $("#busStopCategorySeq").val();
	location.href="/spring/getBusStopLocation.action?universitySeq="+universitySeq+"&busStopCategorySeq="+busStopCategorySeq+"&busStopDetailCategorySeq="+bsdcSeq;
}
*/
</script>
</head>
<body>
<div id="container">
    <div id="header">
    	<input type="hidden" id="busStopCategorySeq" value="${busStopCategorySeq}">
    	<input type="hidden" id="busStopSeq" value="${busStopSeq}">
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
                <div class="viewBtnName" onclick="location.href='/spring/getBusStopRoadView.action?busStopCategorySeq='+${busStopCategorySeq}+'&busStopSeq='+busStopSeq='+${bsdto.busStopSeq}">
                    정류장 거리뷰
                </div>
            </div>
            <div class="viewBtn">
                <div class="viewBtnName" id="selectedBtn" onclick="location.href='/spring/getBusStopMapView.action?busStopCategorySeq='+${busStopCategorySeq}+'&busStopSeq='+busStopSeq='+${bsdto.busStopSeq}">
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
                    <div id="backBtn">
                    
                    </div>
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
        
        <!-- 엣날 지도-->
        <div id="infoAround">
			<div id="infoTitle">
				<div id="infoTitleText">Around place  ${bsdto.busStop}</div>
			</div>
			<div id="mapAP">
			
			</div>
		    <script async defer
		      src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBvu3Ngel84QlOc4Lc4BAszD3UeSMEiWgM&callback=initMap">
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
			mapNormal = new google.maps.Map(document.getElementById('roadView_Map'), {
				
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
</body>
</html>