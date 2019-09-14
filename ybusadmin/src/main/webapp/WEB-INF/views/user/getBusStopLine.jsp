<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script async src="https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<script>
     (adsbygoogle = window.adsbygoogle || []).push({
          google_ad_client: "ca-pub-2370297300940223",
          enable_page_level_ads: true
     });
</script>
<meta charset="UTF-8">
<title>Cambus</title>
<%@include file="/inc/userAsset.jsp" %>

<style>


.busNum	img {
	width: 90%;
	height: 90%;
}
.busIcon img {
	width: 70%;
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
	background-color: white;
}

#top {
	position: fixed;
	max-width: 480px;
	width: 100%;
	height: 25%;
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
	padding-top: 4%;
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
	height: 90%;
	margin: 0;
	padding: 0;
	padding-top:55%;
	text-align:left;
	background-color: white;
}
/* 아이폰5 */
@media(max-width:320px) { 
 #contents{
 padding-top:65%;
 } 
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

.busBox{
	width:100%;
	height:100%;
	position:absolute;
	
	
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
	position: absolute;
	width: 50%;
	height: 90%;
	padding-left:48%;
	padding-top:4%;
	text-align:left;
}

.busNum {
	position: absolute;
	float: left;
	width: 50%;
	height: 90%;
	text-align: right;
	padding-top:4%;
	
}

.busTxt {
	position: absolute;
	width: 70%;
	height: 35%;
	font-size: 0.3em;
	padding-top: 17%;
	padding-left: 10px;
	<%-- background-image: url('/spring/images/timeLine/busNum.png'); --%>
	
}

#footer {
	position: relative;
	width: 95%;
	height: 25%;
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
var universitySeq = '${universityDto.universitySeq}';
$(document).ready(function(){
	
	$(".stopName").click(function(){
		var busStopCategorySeq = $("#busStopCategorySeq").val();
		location.href="/spring/getBusStopRoadView.action?universitySeq="+universitySeq+"&busStopCategorySeq="+busStopCategorySeq+"&busStopSeq="+$(this).attr("busStopSeq");
	});
	
	$("#detailLocationSel").change(function(){
		var bsdcSeq = $(this).val();
		//alert($("#busStopCategorySeq").val());
		//alert($("#busStopCategorySeq").attr("value"))
		var busStopCategorySeq = $("#busStopCategorySeq").val();
		location.href="/spring/getBusStopLine.action?universitySeq="+universitySeq+"&busStopCategorySeq="+busStopCategorySeq+"&busStopDetailCategorySeq="+bsdcSeq;
	});
});

function refresh(){
	var bsdcSeq = $("#detailLocationSel").val();
	var busStopCategorySeq = $("#busStopCategorySeq").val();
	location.href="/spring/getBusStopLine.action?universitySeq="+universitySeq+"&busStopCategorySeq="+busStopCategorySeq+"&busStopDetailCategorySeq="+bsdcSeq;
}

function moveMap(){
	var bsdcSeq = $("#detailLocationSel").val();
	var busStopCategorySeq = $("#busStopCategorySeq").val();
	location.href="/spring/getBusStopLocation.action?universitySeq="+universitySeq+"&busStopCategorySeq="+busStopCategorySeq+"&busStopDetailCategorySeq="+bsdcSeq;
}
	
</script>

</head>
<body>
	<div id="container">
		<div id="top">
			<div id="header">
			<input type="hidden" id = "busStopCategorySeq" value="${busStopCategorySeq}">
				<div id="infoPage">
					<input type="button" value="<" style="color:white;position: absolute; font-size:1.5em;left: 3%;margin-top:2%; width: 8%; height: 50%;  background-color: transparent !important; border-color: transparent;"	onclick="location.href='/spring/mainIndex.action';" />
					<div id="txtLogo">
					
					현재 버스 위치
					
					</div>
					<img src="/spring/images/logo/${universityDto.universityImg}" id="logo" onerror="this.style.display='none'"/>
				</div>
			</div>

			<div id="btnArea">
				<div id="btnGroup">
					<div id="upBtn" class="goBtn">상행</div>
					<div id="downBtn" class="goBtn">하행</div>
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
					<img src="/spring/images/timeLine/mapIamge.png" id="changeMap" onclick="moveMap();" />
					<img src="/spring/images/timeLine/refreshBtn.png" id="refreshBtn" onclick="window.location.reload();" />
				
					</div>
		</div>
		
		
		<div id="contents">
			<div id="lineArea">
				
				<c:forEach items="${bsList}" var="dto" varStatus="status">	
					<c:choose>
						<c:when test="${status.first}">
							
							<div class="busStop">
								<div class="way">
									<div id="startPoint">
										<img src="/spring/images/timeLine/startImg.png" class="lineImg" />
									</div>
			
								<c:forEach items='${cblList}' var='cbldto'>
									<c:if test="${cbldto.busStopSeq==dto.busStopSeq}">
										<div class="busNum">
											<div class="busTxt">${cbldto.businfoName} </div>
											<img src='/spring/images/timeLine/busNum.png'>
										</div>
										<div class="busIcon">
											<img src="/spring/images/timeLine/busIcon.png" alt="" />
										</div>
									</c:if>
								</c:forEach>
								</div>
								<div class="stopName" busStopSeq='${dto.busStopSeq}'>
									<div class="txtName">${dto.busStop}</div>
								</div>
							</div>
							<div style="clear: both;"></div>
						</c:when>
						<c:when test="${status.last}">
							<div class="busStop">
								<div class="way">
									<div id="endPoint">
									<img src="/spring/images/timeLine/endImg.png" class="lineImg" />
									</div>
									<c:forEach items='${cblList }' var='cbldto'>
									<c:if test="${cbldto.busStopSeq==dto.busStopSeq}">
										<div class="busNum">
											<div class="busTxt">${cbldto.businfoName} </div>
											<img src="/spring/images/timeLine/busNum.png" alt="" />
										</div>
										<div class="busIcon">
											<img src="/spring/images/timeLine/busIcon.png" alt="" />
										</div>
									</c:if>
								</c:forEach>
								</div>
								<div class="stopName" busStopSeq='${dto.busStopSeq}'>
									<div class="txtName">${dto.busStop}</div>
								</div>
							</div>
							<div style="clear: both;"></div>
						</c:when>
						<c:otherwise>
							<div class="busStop">
								<div class="way">
									<c:if test="${dto.busStopLine == 'up'}">
										<div class="upLine">
										<img src="/spring/images/timeLine/upImg.png" class="lineImg" />
										</div>
									</c:if>
									<c:if test="${dto.busStopLine == 'down'}">
										<div class="downLine">
										<img src="/spring/images/timeLine/downImg.png" class="lineImg" />
										</div>
									</c:if>
									<c:if test="${dto.busStopLine == 'turn'}">
										<div class="turnLine">
										<img src="/spring/images/timeLine/turnImg.png" class="lineImg" />
										</div>
									</c:if>
									<c:if test="${dto.busStopLine == 'pass'}">
										<div class="turnLine">
										<img src="/spring/images/timeLine/passImg.png" class="lineImg" />
										</div>
									</c:if>
								<c:forEach items='${cblList }' var='cbldto'>
									<c:if test="${cbldto.busStopSeq==dto.busStopSeq}">
										<div class="busBox">
											<div class="busNum">
												<div class="busTxt">${cbldto.businfoName} </div>
												<img src="/spring/images/timeLine/busNum.png" alt="" />
											</div>
											<div class="busIcon">
												<img src="/spring/images/timeLine/busIcon.png" alt="" />
											</div>
										</div>
									</c:if>
								</c:forEach>
								</div>
								<div class="stopName" busStopSeq='${dto.busStopSeq}'>
									<div class="txtName">${dto.busStop}</div>
								</div>
							</div>
							<div style="clear: both;"></div>
						</c:otherwise>
					</c:choose>
				</c:forEach>	
					
			</div>
			<!-- lineArea  -->

		</div>
		<div style="position:relative;width:100%;margin:0 auto;margin-top:15px;">
		<script async src="https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
		<!-- 학교선택화면 -->
		<ins class="adsbygoogle"
		     style="display:block"
		     data-ad-client="ca-pub-2370297300940223"
		     data-ad-slot="9489841046"
		     data-ad-format="auto"
		     data-full-width-responsive="true"></ins>
		<script>
		     (adsbygoogle = window.adsbygoogle || []).push({});
		</script>
	</div>
	</div>
	
</body>
</html>