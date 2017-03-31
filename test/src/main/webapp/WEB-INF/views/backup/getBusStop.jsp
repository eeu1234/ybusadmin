<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cambus</title>


<!-- 모바일용웹 -->
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




<!-- ico 아이콘-->

<link rel="apple-touch-icon" href="/mobile/Image/favicon.ico">
<link rel="stylesheet" href="./css/newTimeline.css">

<script
  src="https://code.jquery.com/jquery-1.12.4.min.js"
  integrity="sha256-ZosEbRLbNQzLpnKIkEdrPv7lOy9C27hHQ+Xp8a4MxAQ="
  crossorigin="anonymous"></script>

    <script async defer
      src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBk_ju7pwO5Gb-Q49o6-t2KvJ8erqmfgiY&callback=initMap">
    </script>


</head>
<body>
	<div id="container">
		<div id="top">
			<div id="header">
				<div id="infoPage">
					<input type="button" value="<" style="color:white;position: absolute; font-size:1.5em;left: 3%;margin-top:1.5%; width: 8%; height: 50%;  background-color: transparent !important; border-color: transparent;	onclick="history.back()" />
					<div id="txtLogo">
					
					셔틀버스 위치조회
					
					</div>
					<img src="./images/timeLine/header_logo.png" id="logo" />
				</div>
			</div>

			<div id="btnArea">
				<div id="btnGroup">
					<div id="upBtn" class="goBtn">터미널 방면</div>
					<div id="downBtn" class="goBtn">용인대 방면</div>
				</div>
			</div>
					<div id="footer">
					<div style= "position:relative;width:85%;height:100%;padding-top:3%;">● 정류장을 터치하시면 위치 정보를 보실 수 있습니다.</div>	
					<img src="./images/timeLine/refreshBtn.png" id="refreshBtn"  />
				
					</div>
		</div>
		<div id="contents">
			<div id="lineArea">
				<!-- 
				
**********************설명***********************************
				
				<div class="busStop">
					<div class="way">
					
					
						<div class="downLine2"></div>    //타임라인 선을 정하는 div(EX:상하행,회차)

						

			************* 버스있으면 출력될 자료 부분
						<div class="busNum">
							<div class="busTxt">4949</div>
							<img src="./images/timeLine/busNum.png" alt="" />
						</div>
						<div class="busIcon">
							<img src="./images/timeLine/busIcon.png" alt="" />
						</div>
			*************			


					</div>
					<div class="stopName">
						<div class="txtName">명지대 사거리</div> //
					</div>
				</div>
				<div style="clear: both;"></div>
				
************************************************************
				
				
				
				
				
				 -->

				<!-- 1번  -->
				<div class="busStop">
					<div class="way" id="way1">
						<div id="startPoint">
							<img src="./images/timeLine/startImg.png" class="lineImg" />
						</div>

					</div>
					<div class="stopName">
						<div class="txtName">용인대학교</div>
					</div>
				</div>
				<div style="clear: both;"></div>





				<!-- 2번 -->
				<div class="busStop">
					<div class="way">
						<div class="upLine">
						<img src="./images/timeLine/upImg.png" class="lineImg" />
						</div>

					</div>
					<div class="stopName">
						<div class="txtName">진 입 로</div>
					</div>
				</div>
				<div style="clear: both;"></div>



				<!-- 3번 -->
				<div class="busStop">
					<div class="way">
						<div class="upLine">
						<img src="./images/timeLine/upImg.png" class="lineImg" />
						</div>
						
						<!-- 버스있으면 출력될 자료 부분 -->
						<div class="busNum">
							<div class="busTxt">4949</div>
							<img src="./images/timeLine/busNum.png" alt="" />
						</div>
						<div class="busIcon">
							<img src="./images/timeLine/busIcon.png" alt="" />
						</div>
						<!-- 끝 -->
						
					</div>
					<div class="stopName">
						<div class="txtName">명지대 사거리</div>
					</div>
				</div>
				<div style="clear: both;"></div>



				<!-- 4번 -->
				<div class="busStop">
					<div class="way">
						<div class="upLine">
						<img src="./images/timeLine/upImg.png" class="lineImg" />
						</div>
					</div>
					<div class="stopName">
						<div class="txtName">중앙지구대/이약국</div>
					</div>
				</div>
				<div style="clear: both;"></div>



				<!-- 5번 -->
				<div class="busStop">
					<div class="way">
						<div class="upLine">
						<img src="./images/timeLine/upImg.png" class="lineImg" />
						</div>
					</div>
					<div class="stopName">
						<div class="txtName">용인시내 / 롯데시네마</div>
					</div>
				</div>
				<div style="clear: both;"></div>



				<!-- 6번  회차-->
				<div class="busStop">
					<div class="way">
						<div class="downLine">
						<img src="./images/timeLine/downImg.png" class="lineImg" />
						</div>
					</div>
					<!-- 회차지점은 #turnArea로 바탕색 입힘 -->
					<div class="stopName">
						<div class="txtName">용인 터미널</div>
					</div>
				</div>
				<div style="clear: both;"></div>


				<!-- 7번 하행 -->
				<div class="busStop">
					<div class="way">
						<div class="downLine">
						<img src="./images/timeLine/downImg.png" class="lineImg" />
						</div>

					</div>
					<div class="stopName">
						<div class="txtName">명지대 사거리</div>
					</div>
				</div>
				<div style="clear: both;"></div>



				<!-- 7번 하행 -->
				<div class="busStop">
					<div class="way">
						<div id="endPoint">
						<img src="./images/timeLine/endImg.png" class="lineImg" />
						</div>

					</div>
					<div class="stopName">
						<div class="txtName">용인대학교</div>
					</div>
				</div>
				<div style="clear: both;"></div>



			</div>
			<!-- lineArea  -->

		</div>
		
	</div>
</body>
</html>