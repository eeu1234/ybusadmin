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
// BusStopMapController에서 가져온 Seq값들
let universitySeq = '${universityDto.universitySeq}';
let busStopCategorySeq = '${busStopCategorySeq}';
let busStopDetailCategorySeq = '${busStopDetailCategorySeq}';
let busStopDetailCategoryName = '${bsdcList[0].busStopDetailCategoryName}';
let cityCirculationSeq = '${bsdcList[0].busStopDetailCategorySeq}';
let YeokbukDistrictSeq = '${bsdcList[1].busStopDetailCategorySeq}';

$(document).ready(function(){
	
	if(busStopCategorySeq == 18){
	      $(".busBox").css("background-image", "url('/spring/images/2022busStop/Box_BlueBus.png')");      
	   }
	   else if(busStopCategorySeq == 36){
	      $(".busBox").css("background-image", "url('/spring/images/2022busStop/Box_YellowBus.png')");      
	   }

	// 정류장 로드뷰 이동
	$(".busStopStatus").click(function(){
		location.href="/spring/getBusStopRoadView.action?universitySeq="+universitySeq+"&busStopCategorySeq="+busStopCategorySeq+"&busStopSeq="+$(this).attr("busStopSeq");
	});
	
	// 누르면 시내순환 버튼 활성화 및 라인 보여줌
	$(".viewBtn:eq(0)").click(function(){
		// 역북지구 버튼 css를 시내순환 버튼으로 옮김
		$(".viewBtnName:eq(1)").removeAttr('id', 'selectedBtn');
		$(".viewBtnName:eq(0)").attr('id', "selectedBtn");
		
		// 시내순환 Seq 값으로 Line 페이지 다시 부름
		location.href="/spring/getBusStopLine.action?universitySeq="+universitySeq+"&busStopCategorySeq="+busStopCategorySeq+"&busStopDetailCategorySeq="+cityCirculationSeq;
	});
	
	// 누르면 역북지구 버튼 활성화 및 라인 보여줌
	$(".viewBtn:eq(1)").click(function(){
		// 시내순환 버튼 css를 역북지구 버튼으로 옮김
		$(".viewBtnName:eq(0)").removeAttr('id', 'selectedBtn');
		$(".viewBtnName:eq(1)").attr('id', "selectedBtn");
		
		// 역북지구 Seq 값으로 Line 페이지 다시 부름
		location.href="/spring/getBusStopLine.action?universitySeq="+universitySeq+"&busStopCategorySeq="+busStopCategorySeq+"&busStopDetailCategorySeq="+YeokbukDistrictSeq;
	});
	
	/*
	if(busStopCategorySeq == 18){
		$(".busBox").css($({"background": "url('/spring/images/2022busStop/Box_YellowBus.png')"}));		
	}
	*/
	/*
	else {
		$(".busBox").css(background: url("/spring/images/2022busStop/Box_YellowBus.png") no-repeat center 0px;);
	}
	*/
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
<div id="container">
    <div id="header">
	    <input type="hidden" id="busStopCategorySeq" value="${busStopCategorySeq}">
        <div id="hedaerTop">
			<div id="headerTopContents">
				<div id="button_Home_Zone">
					<div id="button_Home" onclick="location.href='/spring/user/seoulBus.action'">
						
					</div>
				</div>
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
                    정류장을 클릭하면 해당 위치 로드뷰를 확인 할 수 있습니다.
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
        <div id="lineArea">
        
			<c:forEach items="${bsList}" var="dto" varStatus="status">	
				<c:choose>
					<c:when test="${status.first}">
						<div class="busStop" id="startPoint">
							<div class="busStopLeft">
								<div class="lineImgZone">
			                        <div class="lineImg">
			
			                        </div>
			                        <div class="lineImg" style="background-image: url('/spring/images/2022busStop/Line_Bus_Stop.png')">
			
			                        </div>
			                        <div class="lineMark">
			                            <div class="markName">
			                            	기점
			                            </div>
			                        </div>
			                    </div>
									
								<c:forEach items='${cblList}' var='cbldto'>
									<c:if test="${cbldto.busStopSeq==dto.busStopSeq}">
										<div class="busBox">
											<div class="busStatus">
												<div class="busNumber">
													${cbldto.businfoName}
												</div>
												<div class="busRefreshTime">
													
												</div>
											</div>
										</div>
									</c:if>
								</c:forEach>
								
							</div>
							<div class="busStopRight">
								<div class="busStopStatus"  busStopSeq='${dto.busStopSeq}'>
									<div class="busStopName">
										${dto.busStop}
									</div>
									<div class="busStopCondition">
										<div class="busStopInfo">
											<!-- 도착/출발 -->
										</div>
										<div class="Estimated-Time-Remaining">
											<!-- 5분 남음 -->
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
								<div class="lineImgZone">
			                        <div class="lineImg" style="background-image: url('/spring/images/2022busStop/Line_Bus_Stop.png')">
			
			                        </div>
			                        <div class="lineImg">
			
			                        </div>
			                        <div class="lineMark">
			                            <div class="markName">
			                            	종점
			                            </div>
			                        </div>
			                    </div>
																	
								<c:forEach items='${cblList}' var='cbldto'>
								<c:if test="${cbldto.busStopSeq==dto.busStopSeq}">
								
									<div class="busBox">
										<div class="busStatus">
											<div class="busNumber">
												${cbldto.businfoName}
											</div>
											<div class="busRefreshTime">
												<!-- 15:57 갱신 -->
											</div>
										</div>
									</div>
									
									</c:if>
								</c:forEach>
							</div>
							<div class="busStopRight">
								<div class="busStopStatus"  busStopSeq='${dto.busStopSeq}'>
									<div class="busStopName">
										${dto.busStop}
									</div>
									<div class="busStopCondition">
										<div class="busStopInfo">

										</div>
										<div class="Estimated-Time-Remaining">
											<!-- 5분 남음 -->
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
									<div class="lineImgZone">
				                        <div class="lineImg" style="background-image: url('/spring/images/2022busStop/Line_Bus_Stop.png')">
				
				                        </div>
				                        <div class="lineImg" style="background-image: url('/spring/images/2022busStop/Line_Bus_Stop.png')">
				
				                        </div>
			                        </div>
								</c:if>
								<c:if test="${dto.busStopLine == 'down'}">
									<div class="lineImgZone">
				                        <div class="lineImg" style="background-image: url('/spring/images/2022busStop/Line_Bus_Stop.png')">
				
				                        </div>
				                        <div class="lineImg" style="background-image: url('/spring/images/2022busStop/Line_Bus_Stop.png')">
				
				                        </div>
			                        </div>
								</c:if>
								<c:if test="${dto.busStopLine == 'turn'}">
									<div class="lineImgZone">
				                        <div class="lineImg" style="background-image: url('/spring/images/2022busStop/Line_Bus_Stop.png')">
				
				                        </div>
				                        <div class="lineImg" style="background-image: url('/spring/images/2022busStop/Line_Bus_Stop.png')">
				
				                        </div>
				                        <div class="lineMark">
				                            <div class="markName">
			                            		회차
			                            	</div>
				                        </div>
			                        </div>
								</c:if>
								<c:if test="${dto.busStopLine == 'pass'}">
									<div class="lineImgZone">
				                        <div class="lineImg" style="background-image: url('/spring/images/2022busStop/Line_Bus_Pass.png')">
				
				                        </div>
				                        <div class="lineImg" style="background-image: url('/spring/images/2022busStop/Line_Bus_Pass.png')">
				
				                        </div>
			                        </div>
								</c:if>
								<c:forEach items='${cblList}' var='cbldto'>
									<c:if test="${cbldto.busStopSeq==dto.busStopSeq}">
										<div class="busBox">
											<div class="busStatus">
												<div class="busNumber">
													${cbldto.businfoName}
												</div>
												<div class="busRefreshTime">
													<!-- 15:57 갱신 -->
												</div>
											</div>
										</div>
									</c:if>
								</c:forEach>
								
							</div>
							<div class="busStopRight">
								<div class="busStopStatus"  busStopSeq='${dto.busStopSeq}'>
									<div class="busStopName">
										${dto.busStop}
									</div>
									<div class="busStopCondition">
										<div class="busStopInfo">

										</div>
										<div class="Estimated-Time-Remaining">
											<!-- 5분 남음 -->
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
	<!-- container -->
</div>
</body>
</html>