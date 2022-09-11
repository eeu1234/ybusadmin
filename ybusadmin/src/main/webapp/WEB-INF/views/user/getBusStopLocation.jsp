<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"
   integrity="sha256-ZosEbRLbNQzLpnKIkEdrPv7lOy9C27hHQ+Xp8a4MxAQ="
   crossorigin="anonymous"></script>
   
<script async src="https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>

<script>
     (adsbygoogle = window.adsbygoogle || []).push({
          google_ad_client: "ca-pub-2370297300940223",
          enable_page_level_ads: true
     });
</script>

	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>Ybus</title>
    <link rel="stylesheet" href="/spring/css/2022css/busStopHeader.css">
    <link rel="stylesheet" href="/spring/css/2022css/busStopRoadMap.css">

<script>
//BusStopMapController에서 가져온 Seq값들
let universitySeq = '${universityDto.universitySeq}';
let busStopCategorySeq = '${busStopCategorySeq}';
let busStopDetailCategorySeq = '${busStopDetailCategorySeq}';
let busStopDetailCategoryName = '${bsdcList[0].busStopDetailCategoryName}';
let cityCirculationSeq = '${bsdcList[0].busStopDetailCategorySeq}';
let YeokbukDistrictSeq = '${bsdcList[1].busStopDetailCategorySeq}';

let busStopSeq = '${bsdto.busStopSeq}';

$(document).ready(function(){

	// 정류장 로드뷰 이동
	$(".busStopStatus").click(function(){
		location.href="/spring/getBusStopRoadView.action?universitySeq="+universitySeq+"&busStopCategorySeq="+busStopCategorySeq+"&busStopSeq="+$(this).attr("busStopSeq");
	});
	
	// 누르면 시내순환 버튼 활성화 및 라인 보여줌
	$(".viewBtn:eq(0)").click(function(){
		// 역북지구 버튼 css를 시내순환 버튼으로 옮김
		$(".viewBtnName:eq(1)").removeAttr('id', 'selectedBtn');
		$(".viewBtnName:eq(0)").attr('id', "selectedBtn");
		
		// 시내순환 Seq 값으로 Location 페이지 다시 부름
		location.href="/spring/getBusStopLocation.action?universitySeq="+universitySeq+"&busStopCategorySeq="+busStopCategorySeq+"&busStopDetailCategorySeq="+cityCirculationSeq;
	});
	
	// 누르면 역북지구 버튼 활성화 및 라인 보여줌
	$(".viewBtn:eq(1)").click(function(){
		// 시내순환 버튼 css를 역북지구 버튼으로 옮김
		$(".viewBtnName:eq(0)").removeAttr('id', 'selectedBtn');
		$(".viewBtnName:eq(1)").attr('id', "selectedBtn");
		
		// 역북지구 Seq 값으로 Location 페이지 다시 부름
		location.href="/spring/getBusStopLocation.action?universitySeq="+universitySeq+"&busStopCategorySeq="+busStopCategorySeq+"&busStopDetailCategorySeq="+YeokbukDistrictSeq;
	});
	
	// 뒤로가기
	$("#backBtn").click(function(){
		location.href="/spring/getBusStopLine.action?universitySeq="+universitySeq+"&busStopCategorySeq="+busStopCategorySeq;
	});
	
	// 홈
	$("#button_Home").click(function(){
		location.href="/spring/index.action?universitySeq="+universitySeq;
	});
});

/*
function refresh(){
	let bsdcSeq = $("#detailLocationSel").val();
	location.href="/spring/getBusStopLine.action?universitySeq="+universitySeq+"&busStopCategorySeq="+busStopCategorySeq+"&busStopDetailCategorySeq="+bsdcSeq;
}

function moveMap(){
	let bsdcSeq = $("#detailLocationSel").val();
	location.href="/spring/getBusStopLocation.action?universitySeq="+universitySeq+"&busStopCategorySeq="+busStopCategorySeq+"&busStopDetailCategorySeq="+bsdcSeq;
}
*/
</script>
<script type="text/javascript" src="/spring/js/headerTopChange.js"></script>
<script type="text/javascript" src="/spring/js/getPageHeaderButtons.js"></script>
</head>
<body>
<body>
<div id="container">
    <div id="header">
	    <input type="hidden" id="busStopCategorySeq" value="${busStopCategorySeq}">
        <div id="hedaerTop">
			<div id="headerTopContents">
			    <div id="busTypeZone">
			    
			    	<c:choose>
						<c:when test="${busStopCategorySeq == 18}">
							<div id="busType">
							    시내 버스
							</div>
						</c:when>
						<c:when test="${busStopCategorySeq == 36}">
							<div id="busType">
							    노랑 버스
							</div>
						</c:when>
						<c:otherwise>
							<div id="busType">
							    통학 버스
							</div>
						</c:otherwise>
					</c:choose>

			    </div>
			    <div id="button_Home_Zone">
					<div id="button_Home">
						
					</div>
				</div>
			    <div id="buttonsZone">
			        <div id="buttons">
    			        <div id="btnBusScheduleZone">
			                <div id="btnBusSchedule">
			                </div>
			            </div>
			            <div id="btnRouteMapZone">
			                <div id="btnRouteMap">
			                </div>
			            </div>
			        </div>
			    </div>
			</div>
        </div>
        <div id="busStopNotification">
            <div id="busStopNotice" >
                <div id="noticeIconZone" class="busNotice">
                    <div id="noticeIcon">
                    	<!-- css background에 이미지 들어있음 -->
                    </div>
                </div>
                <div id="busNoticeContents" class="busNotice">
                    버스 노선도를 보여주는 페이지입니다.
                </div>
                <div style="clear: both"></div>
            </div>
        </div>
        <c:if test="${busStopCategorySeq == 18}">
	        <c:if test = "${busStopDetailCategorySeq == bsdcList[0].busStopDetailCategorySeq}">
		        <div id="viewType">
		            <div class="viewBtn">
		                <div class="viewBtnName" id="selectedBtn">
		                    시내순환
		                </div>
		            </div>
		            <div class="viewBtn">
		                <div class="viewBtnName">
		                    역북지구
		                </div>
		            </div>
		            <div style="clear: both"></div>
		        </div>
	        </c:if>
	        <c:if test = "${busStopDetailCategorySeq == bsdcList[1].busStopDetailCategorySeq}">
		        <div id="viewType">
		            <div class="viewBtn">
		                <div class="viewBtnName">
		                    시내순환
		                </div>
		            </div>
		            <div class="viewBtn">
		                <div class="viewBtnName" id="selectedBtn">
		                    역북지구
		                </div>
		            </div>
		            <div style="clear: both"></div>
		        </div>
	        </c:if>
		</c:if>
    </div>
    <div id="contents">
        <div id="busStop">
            <div id="busStopContents">
                <div id="backBtnZone" class="busStopContents">
                    <div id="backBtn">
                    
                    </div>
                </div>
                <div id="busStopName" class="busStopContents">
                    버스 노선도
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
		var zoomLevel;
		function initMap() {
			var distancekilometer = ${distancekilometer};
			if(distancekilometer < 10){
				zoomLevel=13;
			}else if(distancekilometer >= 10 && distancekilometer < 20){
				zoomLevel=12;
			}else if(distancekilometer >= 20 && distancekilometer < 30){
				zoomLevel=11;
			}else if(distancekilometer >= 30 && distancekilometer < 40){
				zoomLevel=10;
			}else{
				zoomLevel=9;
			}
			
		mapAP = new google.maps.Map(document.getElementById('roadView_Map'), {
		
		center: {lat: ${avgBSdto.avgLat}, lng: ${avgBSdto.avgLon}},
		zoom: zoomLevel
			});
		
		
		<c:forEach items="${bsList}" var="bsdto">
			var infowindowBS${bsdto.busStopSeq} = new google.maps.InfoWindow({
				content:'${bsdto.busStop}',
			});
			
			markerBS${bsdto.busStopSeq} = new google.maps.Marker({
			    map: mapAP,
			    draggable: false,
			    animation: google.maps.Animation.DROP,
			    icon: '/spring/images/timeLine/busStopMaker.png',
			    zIndex:1,
			    info: '${bsdto.busStop}',
			    title: '${bsdto.busStop}',
			    position: {lat: ${bsdto.busStopLatitude}, lng: ${bsdto.busStopLongitude}}
			});
			markerBS${bsdto.busStopSeq}.addListener('click', function(){
				infowindowBS${bsdto.busStopSeq}.open(mapAP,markerBS${bsdto.busStopSeq});
			});
				
		</c:forEach>
			<c:forEach items="${cblList}" var="cbldto">
				var infowindowCBL${cbldto.businfoSeq} = new google.maps.InfoWindow({
					content:'${cbldto.businfoName}',
				});
				
				markerCBL${cbldto.businfoSeq} = new google.maps.Marker({
				    map: mapAP,
				    draggable: false,
				    animation: google.maps.Animation.DROP,
				    icon:'/spring/images/timeLine/busMaker.png',
				    title: '${cbldto.businfoName}',
				    zIndex:100,
				    position: {lat: ${cbldto.locationLatitude}, lng: ${cbldto.locationLongitude}}
				    
				});
				markerCBL${cbldto.businfoSeq}.addListener('click', function(){
					infowindowCBL${cbldto.businfoSeq}.open(mapAP,markerCBL${cbldto.businfoSeq});
				});		
			</c:forEach>
		}
    </script>
    <script async defer
      src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBvu3Ngel84QlOc4Lc4BAszD3UeSMEiWgM&callback=initMap">
    </script>
</body>
</html>