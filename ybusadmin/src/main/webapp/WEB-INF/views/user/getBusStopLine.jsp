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
    <link rel="stylesheet" href="/spring/css/2022css/busStopLine.css">

<script>

let universitySeq = '${universityDto.universitySeq}';
$(document).ready(function(){
	
	$(".busStopName").click(function(){
		let busStopCategorySeq = $("#busStopCategorySeq").val();
		location.href="/spring/getBusStopRoadView.action?universitySeq="+universitySeq+"&busStopCategorySeq="+busStopCategorySeq+"&busStopSeq="+$(this).attr("busStopSeq");
	});
	
	$("#detailLocationSel").change(function(){
		let bsdcSeq = $(this).val();
		//alert($("#busStopCategorySeq").val());
		//alert($("#busStopCategorySeq").attr("value"))
		let busStopCategorySeq = $("#busStopCategorySeq").val();
		location.href="/spring/getBusStopLine.action?universitySeq="+universitySeq+"&busStopCategorySeq="+busStopCategorySeq+"&busStopDetailCategorySeq="+bsdcSeq;
	});
});

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

</script>

</head>
<body>
<div id="container">
    <div id="header">
        <div id="hedaerTop" style='background-image: url("./images/2022busStop/시내버스_배경(낮).png")'>
            <div id="hedaerTopBackGround">
                <div id="headerTopContents">
                    <div id="busTypeZone">
                        <div id="busType">
                            시내 버스
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
                <div id="selectedBtn" class="viewBtnName">
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
    </div>
    <div id="contents">
        <div id="lineArea">
				
				<c:forEach items="${bsList}" var="dto" varStatus="status">	
					<c:choose>
						<c:when test="${status.first}">
							<div class="busStop" id="startPoint">
								<div class="busStopLeft">
									<img src="./images/2022busStop/기점.png" id="startPointImage" class="lineImg">
																		
									<c:forEach items='${cblList}' var='cbldto'>
									<c:if test="${cbldto.busStopSeq==dto.busStopSeq}">
										<div class="busBox">
											<div class="busStatus">
												<div class="busNumber">
													${cbldto.businfoName}
												</div>
												<div class="busRefreshTime">
													15:57 갱신
												</div>
											</div>
										</div>
										</c:if>
									</c:forEach>
								</div>
								<div class="busStopRight">
									<div class="busStopStatus">
										<div class="busStopName" busStopSeq='${dto.busStopSeq}'>
											${dto.busStop}
										</div>
										<div class="busStopCondition">
											<div class="busStopInfo">
												도착/출발
											</div>
											<div class="Estimated-Time-Remaining">
												5분 남음
											</div>
										</div>
									</div>
								</div>
							</div>
							<div style="clear: both;"></div>
						</c:when>
						<c:when test="${status.last}">
							<div class="busStop"  id="endPoint">
								<div class="busStopLeft">
									<img src="./images/2022busStop/종점.png" id="endPointImg" class="lineImg">
																		
									<c:forEach items='${cblList}' var='cbldto'>
									<c:if test="${cbldto.busStopSeq==dto.busStopSeq}">
										<div class="busBox">
											<div class="busStatus">
												<div class="busNumber">
													${cbldto.businfoName}
												</div>
												<div class="busRefreshTime">
													15:57 갱신
												</div>
											</div>
										</div>
										</c:if>
									</c:forEach>
								</div>
								<div class="busStopRight">
									<div class="busStopStatus">
										<div class="busStopName" busStopSeq='${dto.busStopSeq}'>
											${dto.busStop}
										</div>
										<div class="busStopCondition">
											<div class="busStopInfo">

											</div>
											<div class="Estimated-Time-Remaining">
												5분 남음
											</div>
										</div>
									</div>
								</div>
							</div>
							<div style="clear: both;"></div>
						</c:when>
						<c:otherwise>
							<div class="busStop">
								<div class="busStopLeft">
									<c:if test="${dto.busStopLine == 'up'}">
										<img src="/spring/images/2022busStop/버스라인.png" class="lineImg">
									</c:if>
									<c:if test="${dto.busStopLine == 'down'}">
										<img src="/spring/images/2022busStop/버스라인.png" class="lineImg">
									</c:if>
									<c:if test="${dto.busStopLine == 'turn'}">
										<img src="/spring/images/2022busStop/회차.png" class="lineImg">
									</c:if>
									<c:if test="${dto.busStopLine == 'pass'}">
										<img src="/spring/images/2022busStop/미정차.png" class="lineImg">
									</c:if>
									<c:forEach items='${cblList}' var='cbldto'>
										<c:if test="${cbldto.busStopSeq==dto.busStopSeq}">
											<div class="busBox">
												<div class="busStatus">
													<div class="busNumber">
														${cbldto.businfoName}
													</div>
													<div class="busRefreshTime">
														15:57 갱신
													</div>
												</div>
											</div>
										</c:if>
									</c:forEach>
								</div>
								<div class="busStopRight">
									<div class="busStopStatus">
										<div class="busStopName" busStopSeq='${dto.busStopSeq}'>
											${dto.busStop}
										</div>
										<div class="busStopCondition">
											<div class="busStopInfo">

											</div>
											<div class="Estimated-Time-Remaining">
												5분 남음
											</div>
										</div>
									</div>
								</div>
							</div>
							<div style="clear: both;"></div>
						</c:otherwise>
					</c:choose>
				</c:forEach>
			</div>
    <!-- lineArea  -->
	<!-- google adsense -->
    <div style="position:relative;width:100%;margin:0 auto;margin-top:15px;">
		<script async src="https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
		<ins class="adsbygoogle"
		     style="display:block"
		     data-ad-client="ca-pub-2370297300940223"
		     data-ad-slot="9489841046"
		     data-ad-format="auto"
		     data-full-width-responsive="true">
	     </ins>
		<script>
		     (adsbygoogle = window.adsbygoogle || []).push({});
		</script>
	</div>
</div>
</body>
</html>