<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cambus</title>
<%@include file="/inc/userAsset.jsp" %>


<style>
img {
	width: 60%;
	height: auto;
}

body, html {
	position: relative;
	width: 100%;
	max-width: 480px;
	height: 100%;
	font-family: 'notoFont-bold';
	color: #222;
	background-color: white;
	overflow-x: hidden;
	height: 100%;
	margin: 0 auto;
	/* -webkit-overflow-scrolling: touch; 터치부드럽게 상단고정해더가 늦게움직이는현상발생*/
}

#container {
	position: relative;
	width: 100%;
	max-width: 480px;
	height: 568px;
	margin: 0 auto;

}

#top {
	position: relative;
	max-width: 480px;
	width: 100%;
	height: 15%;
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


#logo {
	position: absolute;
	top: 0;
	right: 0;
	height: 100%;
	width: auto;
}

#btnArea {
	position: relative;
	width: 100%;
	height: 60px;
	background-color: #dfdfdf;
	padding-top: 30px;
}

#btnGroup {
	position: relative;
	width: 90%;
	height: 40px;
	margin: 0 auto;
	width: 90%;
}

.goBtn {
	width: 45%;
	height: 70%;
	margin: 0 auto;
	text-align: center;
	background-color: #ffffff;
	padding-top: 1.5%;
	color: black;
}

#upBtn {
	float: left;
	border-bottom: 5px solid #003d4f;
}

#downBtn {
	float: right;
	border-bottom: 5px solid #eb6100;
}

/* contents 부분 시작*/
#contents {
	position: relative;
	width: 100%;
	height: 75%;
	margin: 0;
	padding: 0;
	padding-top:4%;

	background-color: white;
}
/* 아이폰5 */
@media(max-width:320px) { 
	}
/* 정류장 타임라인 틀 시작 */
#lineArea {
	position: relative;
	width: 100%;
	height: 100%;
}

.busStop {
	position: relative;
	width: 100%;
	height: 50px;
	background-color: white;
	border-bottom: 2px solid #b2b2b2;
}


/* 정류장 선 */
.way {
	position: relative;
	float: left;
	width: 35%;
	height: 100%;
}
/* 타임라인 시작 정류장  */
#startPoint {
	position: absolute;
/* 	background-image: url("./images/timeLine/startPoint.png");
	background-repeat: no-repeat;
	background-size: cover;
 */	width: 100%;
	height: 100%;
}
/* 타임라인 마지막 정류장  */
#endPoint {
	position: absolute;
	top: 0;
	left: 0;
	/* background-image: url("./images/timeLine/endPoint.png");
	background-repeat: no-repeat;
	background-size: cover;
	 */width: 100%;
	height: 100%;
}
/* 상행선*/
.upLine {
	position: absolute;
	top: 0;
	left: 0;

	width: 100%;
	height: 100%;
}
/* 하행선 */
.downLine {
	position: absolute;
	top: 0;
	left: 0;
	
	width: 100%;
	height: 100%;
}
/* 회차  */
.turnLine {
	position: absolute;
	top: 0;
	left: 0;

	width: 100%;
	height: 100%;
}


#turnPoint {
	position: absolute;
	top: 0;
	left: 0;
/* 	background-image: url("./images/timeLine/turnPoint.png");
	background-repeat: no-repeat;
	background-size: cover; */
	width: 100%;
	height: 100%;
}
.lineImg{
	width:auto;
	height:105%;
	float:right;
	margin-right:25%;
	z-index:10;
	
}



.stopName {
	
	float: left;
	width: 65%;
	height: 100%;
}

.txtName {
	margin-top: 6%;
}

/* 버스 아이콘 관련 시작 */
.busIcon {

	width: 50%;
	height: 90%;
	
	padding-top:4%;
}

.busNum {

	
	width: 50%;
	height: 90%;
	text-align: right;
	padding-top:4%;
	
}

.busTxt {

	width: 50%;
	height: 30%;
	font-size: 0.8em;
	padding-top: 20%;
	padding-left: 22px;
}

#footer {
	position: relative;
	width: 95%;
	height: 65%;
	background-color: #bfbfbf;
	text-align: left;
	color: #272727;
	font-size: 0.5em;
	padding-left:5%;
}
#changeMap{
	position:absolute;
	 width:auto;
	 height:80%;
	 margin:0;
	 padding:0;
	 margin-right:17%;
	 top:10%;
	 right:0;
	 cursor:pointer;
	 
}#refreshBtn{
	position:absolute;
	 width:auto;
	 height:80%;
	 margin:0;
	 padding:0;
	 margin-right:5%;
	 top:10%;
	 right:0;
	 cursor:pointer;
}

      
    #mapAP { 
     height: 100%;
     width:100%;

 }
 
#detailLocationSel{

	 width:50%;
	 height:80%;
	 margin:0;
	 padding:0;
	 margin-right:5%;
	 margin-top:1%;


}
.selectBox{
	color:#555;
	background-color: #fff;
	border:1px solid #ccc;
	border-radius:4px;
	text-align:center;
}
</style>
<script>

	$(document).ready(function(){
		
		$("#detailLocationSel").change(function(){
			var bsdcSeq = $(this).val();
			var busStopCategorySeq = $("#busStopCategorySeq").val();
			location.href="/spring/getBusStopLocation.action?universitySeq="+${universityDto.universitySeq}+"&busStopCategorySeq="+busStopCategorySeq+"&busStopDetailCategorySeq="+bsdcSeq;
		});
		
	})

	function refresh(){
		var bsdcSeq = $("#detailLocationSel").val();
		var busStopCategorySeq = $("#busStopCategorySeq").val();
		location.href="/spring/getBusStopLocation.action?universitySeq="+${universityDto.universitySeq}+"&busStopCategorySeq="+busStopCategorySeq+"&busStopDetailCategorySeq="+bsdcSeq;
	}
	
	function back(){
		var bsdcSeq = $("#detailLocationSel").val();
		var busStopCategorySeq = $("#busStopCategorySeq").val();
		location.href="/spring/getBusStopLine.action?universitySeq="+${universityDto.universitySeq}+"&busStopCategorySeq="+busStopCategorySeq+"&busStopDetailCategorySeq="+bsdcSeq;
	}
	
</script>

</head>
<body>
	<div id="container">
		<div id="top">
			<div id="header">
			<input type="hidden" id = "busStopCategorySeq" value="${busStopCategorySeq}">
				<div id="infoPage">
					<input type="button" value="<" style="color:white;position: absolute; font-size:1.5em;left: 3%;margin-top:2%; width: 8%; height: 50%;  background-color: transparent !important; border-color: transparent;"	onclick="back();" />
					<div id="txtLogo">
					
					현재 버스 위치
					
					</div>
					<img src="/spring/images/logo/${universityDto.universityImg}" id="logo" onerror="this.style.display='none'"/>
				</div>
			</div>
			<div id="footer">
				
				<select id = "detailLocationSel" class="selectBox">
					<c:forEach items="${bsdcList}" var="bsdcDto">
						<c:choose>

							<c:when test="${bsdcDto.busStopDetailCategorySeq==busStopDetailCategorySeq}">
								<option value="${bsdcDto.busStopDetailCategorySeq}" selected>${bsdcDto.busStopDetailCategoryName}</option>
							</c:when>
							<c:otherwise>
								<option value="${bsdcDto.busStopDetailCategorySeq}">${bsdcDto.busStopDetailCategoryName}</option>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</select>
				<img src="/spring/images/timeLine/refreshBtn.png" id="refreshBtn" onclick="refresh();"/>
				
			</div>
		</div>
		<div id="contents">
			<div id="mapAP"></div>
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
	
mapAP = new google.maps.Map(document.getElementById('mapAP'), {

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
		
	</div>
</body>
</html>