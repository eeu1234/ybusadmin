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
<link rel="stylesheet" href="/spring/css/2022css/busStop.css">
<style>

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
		<div id="header" style="background-image:/spring/images/2022busStop/시내버스_배경(낮).png">
		</div>
		<div id="contents">
			<div id="lineArea">
			</div>
		</div>
	<!--
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
			<!-- google adsense -->
		<div style="position:relative;width:100%;margin:0 auto;margin-top:15px;">
			<script async src="https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
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