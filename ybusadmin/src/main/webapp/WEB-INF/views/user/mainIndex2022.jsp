<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>

<html lang="ko">

<head>

<meta charset="UTF-8" />

<title>학교갈 땐 :: CAMBUS</title>
<script src="https://code.jquery.com/jquery-1.12.4.min.js" integrity="sha256-ZosEbRLbNQzLpnKIkEdrPv7lOy9C27hHQ+Xp8a4MxAQ=" crossorigin="anonymous"></script>
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0" />
<meta content="yes" name="apple-mobile-web-app-capable" />
<meta name=”apple-mobile-web-app-status-bar-style” content=”black” />


<meta name="format-detection" content="telephone=no" />

<link rel="apple-touch-icon" href="/spring/images/ico/favicon.ico">
<link rel="shortcut icon" href="/spring/images/ico/favicon.ico">
 <!-- Link Swiper's CSS -->
  <link rel="stylesheet" href="/spring/css/swiper.min.css">




<style>
/* 모바일 기본 설정 */
@charset "UTF-8";
/* mobile style */
*{-webkit-text-size-adjust:none}
body, form, div, p, h1, h2, h3, h4, h5, h6, dl, dt, dd, ul, ol, li, fieldset, th, td, input, textarea,button,select{margin:0;padding:0;font-family:'Malgun Gothic','맑은 고딕',dotum,'돋움',sans-serif;font-weight:normal}
body{-webkit-user-select:none;-webkit-touch-callout:none;-webkit-tap-highlight-color:rgba(0,0,0,0)}
li{list-style:none}
a{text-decoration:none}
a[href^="tel"]{ font-style:normal}
address, caption, em, var{font-style:normal;font-weight:normal}
input, textarea, select{letter-spacing:normal}
ol, ul, dl{list-style:none}
fieldset, img{border:0}
legend, caption{display:none}
img{border:0;vertical-align:top}
hr{display:none}
table{border-collapse:collapse;border-spacing:0}
br{letter-spacing:normal}
p{letter-spacing:normal}
input{vertical-align:middle}
input[type="text"], input[type="password"]{-webkit-appearance:none}
input[type="checkbox"]{-webkit-appearance:none;-webkit-border-radius:0}
input:checked[type="checkbox"]{-webkit-appearance:checkbox}
input[type="radio"]{border:none;-webkit-appearance:none}
button,input[type="button"],input[type="submit"],input[type="reset"],input[type="file"]{-webkit-appearance:button;border-radius:0}
textarea{-webkit-appearance:none}
select{-webkit-appearance:menulist-text}

/* 폰트 설정 */
@font-face {
	font-family: "notoFont-medium";
	src: url(/spring/css/fonts/NotoSansCJKkr-Medium.woff) format("truetype");
}

@font-face {
	font-family: "notoFont-bold";
	src: url(/spring/css/fonts/NotoSansCJKsc-Bold.woff) format("truetype");
}
@font-face {
	font-family: "notoFont-medium";
	src: url(/spring/css/fonts/NotoSansCJKkr-Medium.woff) format("truetype");
}

@font-face {
	font-family: "NotoSansCJKkr-DemiLight";
	src: url(/spring/css/fonts/NotoSansCJKkr-DemiLight.woff) format("truetype");
}
@font-face {
	font-family: "NotoSansCJKkr-Black";
	src: url(/spring/css/fonts/NotoSansCJKkr-Black.woff) format("truetype");
}
@font-face {
	font-family: "NotoSansCJKkr-Thin";
	src: url(/spring/css/fonts/NotoSansCJKkr-Thin.woff) format("truetype");
}
@font-face {
	font-family: "NotoSansCJKkr-Bold";
	src: url(/spring/css/fonts/NotoSansCJKkr-Bold.woff) format("truetype");
}

/* 모바일 수평 스크롤 금지 */
html, body {
max-width: 100%;
overflow-x: hidden;
}
body {
overflow: hidden;
width: 100%;
-webkit-box-sizing: border-box;
-moz-box-sizing: border-box;
box-sizing: border-box;
}



/* 페이지 디자인 시작 */


body {
	position: relative;
	margin: 0 auto;
	width: 100%;
	height: 100%;
	max-width: 600px;
	 overflow: auto; 
	 -webkit-overflow-scrolling: touch;
	 
}


#container{
	position:relative;
	margin:0 auto;
	width:100%;
	
}



/* 로고  컨테이너*/
#logo_head{
	position:relative;
	width:100%;
	padding-top:10px;
	padding-bottom:10px;
	
}

.icon_box{
	float:left;
	width:10%;
	
	text-align:center;


}
#icon_box_left{
	margin-left:2%;

}
#icon_box_right{
	margin-right:2%;
}

.icon_box img{
	width:100%;
	height:auto;

}
#logo_box{
	float:left;
	width:76%;
	
	text-align:center;
}


#logo{
	positon:relative;
	width:70%;
	
	margin:0 auto;

	
}

#logo img{

	width:50%;
	height:auto;
	margin-top:3%;
	margin-bottom:3%;
	
}
/* 공지사항  컨테이너*/
#notice_container{
	position:relative;
	width:96%;
	height:20px;
	background-color:#d9f6fb;
	
	margin-top:5px;
	padding-left:2%;
	padding-right:2%;
	padding-top:2%;
	padding-bottom:1%;
}

#notice_icon_box{
	float:left;
	width:auto;
	height:80%;
}
#notice_icon_box img{

	width:auto;
	height:100%;
}
#notice_text_box{
	float:left;
	width:85%;
	height:auto;
	text-overflow: ellipsis;
	white-space: nowrap;
	overflow: hidden;
	
	margin-left:4%;
	margin-top: 1px;
	
	font-size:0.8em;
	font-family: 'NotoSansCJKkr-DemiLight';
}
ul,li{
	width:100%;
	height:auto;
	text-overflow: ellipsis;
	white-space: nowrap;
	word-wrap: normal;
	overflow: hidden;
	margin: 0 auto;
}
a:link,a:visited,a:active,a:hover{
	text-decoration: none; 
	color:#464342;
}
/* 광고 컨테이너*/
#ad_container{
	position:relative;
	width:96%;
	height:250px;
	margin-top:15px;
	margin-bottom:20px;
	margin-left:2%;
	margin-right:2%;
	

}


.swiper-container {
      width: 100%;
      height: 100%;
}
.swiper-slide {
      text-align: center;
      font-size: 18px;
      background: #fff;
      /* Center slide text vertically */
      display: -webkit-box;
      display: -ms-flexbox;
      display: -webkit-flex;
      display: flex;
      -webkit-box-pack: center;
      -ms-flex-pack: center;
      -webkit-justify-content: center;
      justify-content: center;
      -webkit-box-align: center;
      -ms-flex-align: center;
      -webkit-align-items: center;
      align-items: center;
}
.swiper-slide img{
	width:100%;
	height:130px;
}
/* 버스 아이콘 컨테이너*/
#bus_icon_container{
	position:relative;
	margin-top:15px;
	width:100%;
	height:300px;
	
}

.bus_icon_box{
	position:relative;
	width:95%;
	height:135px;
	
	margin-left:2.5%;
	margin-right:2.5%;
	margin-bottom:15px;
	
}

.bus_icon{
	
	height:100%;
	
}
.bus_icon_left{
	float:left;
	width:48.75%;
}
.bus_icon_right{
	float:right;
	width:48.75%;
}

#bus_icon1{
	background-image:url("/spring/images/mainImage/bus_icon_background_1.png");
	background-repeat: no-repeat;
	background-size: cover;
}
#bus_icon2{
	background-image:url("/spring/images/mainImage/bus_icon_background_2.png");
	background-repeat: no-repeat;
	background-size: cover;
}
#bus_icon3{
	background-image:url("/spring/images/mainImage/bus_icon_background_3.png");
	background-repeat: no-repeat;
	background-size: cover;
}
#bus_icon4{
	background-image:url("/spring/images/mainImage/bus_icon_background_4.png");
	background-repeat: no-repeat;
	background-size: cover;
}

.iconBox{
	position:relative;
	width:60%;
	
	margin-left:20%;
	margin-right:20%;
	margin-top:20%;
	margin-bottom:0%;
	
	text-align:center;	
}
.iconImg {
	height:45px;
}
.iconImg img{
	width:auto;
	height:90%;
}

.iconInfo{
	margin-top:2px;
	font-family: 'NotoSansCJKkr-Bold';
	font-size:0.8em;
	color:#464342;	
}
	
	
	
	
	
	
/*앱등록 컨테이너*/
#app_register_box{
	position:relative;
	
	width:95%;
	height:auto;
	
	margin-left:2.5%;
	margin-right:2.5%;
	margin-bottom:20px;
}
#app_register_box img{
	
	width:100%;
	height:auto;
}


/*another 컨테이너 */
#another_container{
	width:100%;
	height:auto;

}

#another_text{
	position:relative;
	width:95%;
	height:auto;
	margin-left:2.5%;
	margin-right:2.5%;
	margin-bottom:-10px;
	
	font-family: 'NotoSansCJKkr-Black';
	font-size:2em;
	color:#a6c4fb;
	
	
	
}
#another_text img{
	width:100%;
	height:auto;

}

#another_contents{
	position:relative;
	width:100%;
	height:auto;

	background-color:#a6c4fb;
	padding-top:5px;
	padding-bottom:25px;
	
}

.another_box{
	width:95%;
	margin-top:10px;
	margin-left:2.5%;
	margin-right:2.5%;
	
	padding-top:10px;
	padding-bottom:10px;
	

	
}


.another_box img{
	width:100%;

}


.another_box1{
	background-image:url("/spring/images/mainImage/another_box_background_1.png");
	background-repeat: no-repeat;
	background-size: cover;
}
.another_box2{
	background-image:url("/spring/images/mainImage/another_box_background_2.png");
	background-repeat: no-repeat;
	background-size: cover;
}
.another_box3{
	background-image:url("/spring/images/mainImage/another_box_background_3.png");
	background-repeat: no-repeat;
	background-size: cover;
}
.another_box4{
	background-image:url("/spring/images/mainImage/another_box_background_4.png");
	background-repeat: no-repeat;
	background-size: cover;
}
.another_icon_container{
	float:left;
	margin-left:10%;
	width:10%;
	height:100%;
}

.another_icon_container img{
	width:90%;
	padding-top:5px;
	padding-bottom:10px;
	
}

.another_text_container{
	float:left;
	margin-left:10%;
	margin-top:14px;
	width:70%;
	height:100%;
	font-family: 'NotoSansCJKkr-Bold';
	font-size:0.8em;
	
}









/* 푸터 컨테이너 */
#footer_container{
	position:relative;
	width:100%;
	
	color: white;
	text-align: center;
	
	font-size: 0.8em;
	font-family:'NotoSansCJKkr-Thin';
	
}
</style>

<script>
$(function(){
	
	//날씨받기
	getWeather();
	


});
</script>




<!-- Analitics -->
<script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','https://www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-93928507-2', 'auto');
  ga('send', 'pageview');

</script>
<script type="text/javascript" src="http://wcs.naver.net/wcslog.js"></script>
<script type="text/javascript">
if(!wcs_add) var wcs_add = {};
wcs_add["wa"] = "171aefb65e5675";
wcs_do();
</script>

</head>

<body>

<div id="container">
	<div id="logo_head">
		<div id="icon_box_left" class="icon_box"></div>
		
		<div id="logo_box" onClick="window.location.reload();">
			<div id="logo">
				<img src="/spring/images/mainImage/mainLogo.png">
			</div>
		</div>
		
		<div id="icon_box_right" class="icon_box"><img src="/spring/images/mainImage/kakao_icon.png" onclick="location.href='http://pf.kakao.com/_Rxkxjxeu'"> </div>
		<div style="clear:both;"></div>
		
	</div>
	
	<div id="notice_container">
		<div id="notice_icon_box"><img src="/spring/images/mainImage/notice_icon.png"></div>
		<div id="notice_text_box">
			<ul>
				<c:forEach items="${nList}" var="ndto">
					<li class="nContent" value="${ndto.noticeSeq}"><a href="/spring/user/noticeView.action?noticeSeq=${ndto.noticeSeq}">${ndto.noticeSubject}</a></li>
				</c:forEach>
			</ul>
		</div>
		<div style="clear:both;"></div>
	</div>

	
	
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
		

	
	
	
	<div id="bus_icon_container">
	
		<div class="bus_icon_box" id="bus_icon_box1">
			<div class="bus_icon bus_icon_left " id="bus_icon1">
				<div class="iconBox BSC1">
				
				</div>
			</div>
			<div class="bus_icon bus_icon_right " id="bus_icon2">
				<div class="iconBox BSC2" <c:if test="${universityDto.universitySeq==10020}"> onclick="location.href='/spring/camsns/snsMain.action?universitySeq=${universityDto.universitySeq}';"> <!-- 명지대 처리용 --><div class="iconImg"><img src="/spring/images/mainImage/icon_route.png" alt="등교루트" /></div><div class="iconInfo">등교길<br>게시판</div></c:if><c:if test="${universityDto.universitySeq!=10020}">></c:if>
				<!-- 
					<div class="iconImg "><img src="/spring/images/mainImage/icon_secondBus.png" alt="시외버스" /></div>
					<div class="iconInfo">노란버스<br>조회하기</div>
				 --> 
				 
			
				</div>
			</div>
			<div style="clear:both;"></div>
		</div>
		
		<div class="bus_icon_box"  id="bus_icon_box2">
			<div class="bus_icon bus_icon_left" id="bus_icon3" onclick="location.href='/spring/user/seoulBus.action'">
				<div class="iconBox">
					<div class="iconImg "><img src="/spring/images/mainImage/icon_cityBus.png" alt="시외버스" /></div>
					<div class="iconInfo">시외버스<br>조회하기</div>
				</div>
			</div>
			
			<div class="bus_icon bus_icon_right" id="bus_icon4" onclick="location.href='/spring/busSchedule/busTimeTable.action';">
					<div class="iconBox">
					<div class="iconImg "><img src="/spring/images/mainImage/icon_timeTable.png" alt="시간표" /></div>
					<div class="iconInfo">셔틀버스<br>시간표</div>
				</div>
			</div>
			<div style="clear:both;"></div>
		</div>
		
	</div>
	
	<!-- 어플 등록-->
	<div id="app_register_box" onclick="location.href='/spring/user/makeIcon.action'">
		<img src="/spring/images/mainImage/howtoapp.png">
	</div>
	
	<div id="another_container">
		<div id="another_text">ANOTHER</div>
		<div id="another_contents">
	
			<c:choose>
				<c:when test="${universityDto.universitySeq==1}">
							
					<!--용인대-->
					<!--  
					<div class="another_box another_box1" onclick="location.href='/spring/user/yiuFood.action'">
						<div class="another_icon_container"><img src="/spring/images/mainImage/another_icon_food.png"></div>
						<div class="another_text_container">학식 메뉴보기</div>
						<div style="clear:both;"></div>
					</div>
					-->
					<div class="another_box another_box1" onclick="location.href='/spring/camsns/snsboard/camsnsNews';">
						<div class="another_icon_container"><img src="/spring/images/mainImage/another_icon_yiu.png"></div>
						<div class="another_text_container">오늘의 용인뉴스</div>
						<div style="clear:both;"></div>
					</div>
					<div class="another_box another_box2" onclick="location.href='/spring/camsns/snsMain.action?universitySeq=${universityDto.universitySeq}';">
						<div class="another_icon_container"><img src="/spring/images/mainImage/another_icon_route.png"></div>
						<div class="another_text_container">등교길 게시판</div>
						<div style="clear:both;"></div>
					</div>
					<div class="another_box another_box3" onclick="location.href='https://total.yongin.ac.kr'">
						<div class="another_icon_container"><img src="/spring/images/mainImage/another_icon_yiu.png"></div>
						<div class="another_text_container">용인대 종합정보서비스</div>
						<div style="clear:both;"></div>
					</div>
					<div class="another_box another_box4" onclick="location.href='/spring/cambus.action'">
						<div class="another_icon_container"><img src="/spring/images/mainImage/another_icon_cambus.png"></div>
						<div class="another_text_container" style="font-size: 0.7em;">ABOUT CAMBUS</div>
						<div style="clear:both;"></div>
					</div>
						
				
			
				</c:when>
				<c:when test="${universityDto.universitySeq==10020}">
			
					<!--명지대-->
					
				
					<div class="another_box another_box1" onclick="location.href='/spring/user/mjuFood.action'">
						<div class="another_icon_container"><img src="/spring/images/mainImage/another_icon_food.png"></div>
						<div class="another_text_container">학식 메뉴보기</div>
						<div style="clear:both;"></div>
					</div>
					<div class="another_box another_box2" onclick="location.href='https://sso.mju.ac.kr/swift/login/login_myiweb.jsp?RSP=myiweb.mju.ac.kr&RelayState=index_SSO.jsp'">
						<div class="another_icon_container"><img src="/spring/images/mainImage/another_icon_mju.png"></div>
						<div class="another_text_container">명지대 마이아이웹</div>
						<div style="clear:both;"></div>
					</div>
					<div class="another_box another_box3" onclick="location.href='http://www.mju.ac.kr/mbs/mjukr/index.jsp?SWIFT_SESSION_CHK=false'">
						<div class="another_icon_container"><img src="/spring/images/mainImage/another_icon_mju.png"></div>
						<div class="another_text_container">명지대학교 홈페이지</div>
						<div style="clear:both;"></div>
					</div>
					<div class="another_box another_box4" onclick="location.href='/spring/cambus.action'">
						<div class="another_icon_container"><img src="/spring/images/mainImage/another_icon_cambus.png"></div>
						<div class="another_text_container" style="font-size: 0.7em;">ABOUT CAMBUS</div>
						<div style="clear:both;"></div>
					</div>
						
					
				</c:when>
				<c:when test="${universityDto.universitySeq==10028}">
						
					<!--몽골국제대-->
					<div class="another_box another_box1" onclick="location.href='http://http://miu.edu.mn/'">
						<div class="another_icon_container"><img src="/spring/images/mainImage/another_icon_miu.png"></div>
						<div class="another_text_container"> MIU page</div>
						<div style="clear:both;"></div>
					</div>
					<div class="another_box another_box2" onclick="location.href='http://http://wise.miu.edu.mn/common/login/login_form.php'">
						<div class="another_icon_container"><img src="/spring/images/mainImage/another_icon_miu.png"></div>
						<div class="another_text_container">MIU::W.I.S.E</div>
						<div style="clear:both;"></div>
					</div>
					<div class="another_box another_box3" onclick="location.href='/spring/cambus.action'">
						<div class="another_icon_container"><img src="/spring/images/mainImage/another_icon_cambus.png"></div>
						<div class="another_text_container" style="font-size: 0.7em;">ABOUT CAMBUS</div>
						<div style="clear:both;"></div>
					</div>
				</c:when>
			</c:choose>
							
		
		
		
			
		
			
			
			
			
		</div>
	
	</div>
	
	
	

		<div id="footer_container">
		
			<div style="font-size:0.8em;padding-top:10px;padding-bottom:30px;color:#bdbdbd;width:100%;background-color:#3e3e3e;text-align:center;	padding-top:20px;">
				<a href="http://cambus.kr">
				<img src="/spring/images/mainImage/footer_cambus.png" style="width:25%;padding-bottom:10px;"></a><br>
		
				The UNIV BIS::CAMBUS made by Cambus Team.2016 All right ⒞ reserved. <br>
				KAKAO : @CAMBUS<br>
				
				<a href="mailto:eeu4327@gmail.com" style="color: #bdbdbd;text-decoration-line:underline;">Mail : CAMBUS</a><br>
				<a href="/spring/uploadUniversity.action?universitySeq=${universityDto.universitySeq}&oldVersion='yes'" style="color: #bdbdbd;text-decoration-line:underline;">2017버전으로 보기</a><br>
				 
		 


		<br>
			</div>
		
		
		</div>
	
	
	
	
	
	
</div>

</body>

</html>
 <!-- Swiper JS -->
  <script src="/spring/js/swiper.min.js"></script>

  <!-- Initialize Swiper -->
  <script>
    var swiper = new Swiper('.swiper-container', {
		autoplay: {
		    delay: 3000,
		  },
		fadeEffect: {
		    crossFade: true
		 },
		 pagination: {
		   el: '.swiper-pagination',
		 },
    });
  </script>

<script>

function appendCategory(){
	
	<c:forEach items="${bscList}" var="bscDto" varStatus="status">
		var iconImg = document.createElement("div");
		iconImg.setAttribute("class","iconImg");
		
		var img = document.createElement("img");
		<c:choose>
			<c:when test="${status.count==1}">
				img.setAttribute("src","./images/mainImage/icon_firstBus.png");
			</c:when> 
			<c:when test="${status.count==2}">
			img.setAttribute("src","./images/mainImage/icon_secondBus.png");
			</c:when>
			
		</c:choose>
		
		
	<c:if test="${status.count<=2}">
	






		var iconInfo = document.createElement("div");
		iconInfo.setAttribute("class","iconInfo");
	
		var iconBox = document.createElement("div");
		//iconBox.setAttribute("class","iconBox");
		iconBox.setAttribute("class","bscs${status.count} mvpage");
		//var text = document.createElement("span");
		//text.innerText="Location";
		
		iconImg.appendChild(img);
		iconInfo.innerText = "${bscDto.busStopCategory}";
		iconInfo.innerText += "\n";
		iconInfo.innerText += "조회하기";
		
		
		iconBox.appendChild(iconImg);
		iconBox.appendChild(iconInfo);
		//iconBox.appendChild(text);
	
		$(".BSC${status.count}").append(iconBox);
		
		$("#bus_icon${status.count}").attr("value","${bscDto.busStopCategorySeq}");
		$("#bus_icon${status.count}").addClass("bus_button");
		//$("#firstBox").append(iconBox);
		//$(iconBox).appendTo($("#firstBox"));
		//$("#firstBox").append("<a>test</a>");
		
		
	</c:if>
	</c:forEach>
	 
	
	
}


</script>

<script>

/*
Vertical News Ticker 1.21

Original by: Tadas Juozapaitis ( kasp3rito [eta] gmail (dot) com )
             https://github.com/kasp3r/vTicker

Forked/Modified by: Richard Hollis @richhollis - richhollis.co.uk
*/

	  

(function($) {
	appendCategory();
	
	//alert(${universityDto.universitySeq});
	
	
	
	$(".bus_button").click(function(){
		
		
		 
		var busStopCategorySeq = $(this).attr("value");
		//alert(busStopCategorySeq);
		
		
		//alert(busStopCategorySeq);
		location.href="/spring/getBusStopLine.action?universitySeq="+${universityDto.universitySeq}+"&busStopCategorySeq="+busStopCategorySeq;
	})
	
var defaults, internal, methods;
defaults = {
  speed: 150,
  pause: 3000,
  showItems: 1,
  mousePause: true,
  height: '100%',
  animate: true,
  margin: 0,
  padding: 0,
  startPaused: false,
  autoAppend: true
};
internal = {
  moveUp: function(state, attribs) {
    return internal.showNextItem(state, attribs, 'up');
  },
  moveDown: function(state, attribs) {
    return internal.showNextItem(state, attribs, 'down');
  },
  nextItemState: function(state, dir) {
    var height, obj;
    obj = state.element.children('ul');
    height = state.itemHeight;
    if (state.options.height > 0) {
      height = obj.children('li:first').height();
    }
    height += state.options.margin + state.options.padding * 2;
    return {
      height: height,
      options: state.options,
      el: state.element,
      obj: obj,
      selector: dir === 'up' ? 'li:first' : 'li:last',
      dir: dir
    };
  },
  showNextItem: function(state, attribs, dir) {
    var clone, nis;
    nis = internal.nextItemState(state, dir);
    nis.el.trigger('vticker.beforeTick');
    clone = nis.obj.children(nis.selector).clone(true);
    if (nis.dir === 'down') {
      nis.obj.css('top', '-' + nis.height + 'px').prepend(clone);
    }
    if (attribs && attribs.animate) {
      if (!state.animating) {
        internal.animateNextItem(nis, state);
      }
    } else {
      internal.nonAnimatedNextItem(nis);
    }
    if (nis.dir === 'up' && state.options.autoAppend) {
      clone.appendTo(nis.obj);
    }
    return nis.el.trigger('vticker.afterTick');
  },
  animateNextItem: function(nis, state) {
    var opts;
    state.animating = true;
    opts = nis.dir === 'up' ? {
      top: '-=' + nis.height + 'px'
    } : {
      top: 0
    };
    return nis.obj.animate(opts, state.options.speed, function() {
      $(nis.obj).children(nis.selector).remove();
      $(nis.obj).css('top', '0px');
      return state.animating = false;
    });
  },
  nonAnimatedNextItem: function(nis) {
    nis.obj.children(nis.selector).remove();
    return nis.obj.css('top', '0px');
  },
  nextUsePause: function() {
    var options, state;
    state = $(this).data('state');
    options = state.options;
    if (state.isPaused || internal.hasSingleItem(state)) {
      return;
    }
    return methods.next.call(this, {
      animate: options.animate
    });
  },
  startInterval: function() {
    var options, state;
    state = $(this).data('state');
    options = state.options;
    return state.intervalId = setInterval((function(_this) {
      return function() {
        return internal.nextUsePause.call(_this);
      };
    })(this), options.pause);
  },
  stopInterval: function() {
    var state;
    if (!(state = $(this).data('state'))) {
      return;
    }
    if (state.intervalId) {
      clearInterval(state.intervalId);
    }
    return state.intervalId = void 0;
  },
  restartInterval: function() {
    internal.stopInterval.call(this);
    return internal.startInterval.call(this);
  },
  getState: function(from, elem) {
    var state;
    if (!(state = $(elem).data('state'))) {
      throw new Error("vTicker: No state available from " + from);
    }
    return state;
  },
  isAnimatingOrSingleItem: function(state) {
    return state.animating || this.hasSingleItem(state);
  },
  hasMultipleItems: function(state) {
    return state.itemCount > 1;
  },
  hasSingleItem: function(state) {
    return !internal.hasMultipleItems(state);
  },
  bindMousePausing: (function(_this) {
    return function(el, state) {
      return el.bind('mouseenter', function() {
        if (state.isPaused) {
          return;
        }
        state.pausedByCode = true;
        internal.stopInterval.call(this);
        return methods.pause.call(this, true);
      }).bind('mouseleave', function() {
        if (state.isPaused && !state.pausedByCode) {
          return;
        }
        state.pausedByCode = false;
        methods.pause.call(this, false);
        return internal.startInterval.call(this);
      });
    };
  })(this),
  setItemLayout: function(el, state, options) {
    var box;
    el.css({
      overflow: 'hidden',
      position: 'relative'
    }).children('ul').css({
      position: 'absolute',
      margin: 0,
      padding: 0
    }).children('li').css({
      margin: options.margin,
      padding: options.padding
    });
    if (isNaN(options.height) || options.height === 0) {
      el.children('ul').children('li').each(function() {
        if ($(this).height() > state.itemHeight) {
          return state.itemHeight = $(this).height();
        }
      });
      el.children('ul').children('li').each(function() {
        return $(this).height(state.itemHeight);
      });
      box = options.margin + options.padding * 2;
      return el.height((state.itemHeight + box) * options.showItems + options.margin);
    } else {
      return el.height(options.height);
    }
  },
  defaultStateAttribs: function(el, options) {
    return {
      itemCount: el.children('ul').children('li').length,
      itemHeight: 0,
      itemMargin: 0,
      element: el,
      animating: false,
      options: options,
      isPaused: options.startPaused,
      pausedByCode: false
    };
  }
};
methods = {
  init: function(options) {
    var clonedDefaults, el, state;
    if (state = $(this).data('state')) {
      methods.stop.call(this);
    }
    state = null;
    clonedDefaults = jQuery.extend({}, defaults);
    options = $.extend(clonedDefaults, options);
    el = $(this);
    state = internal.defaultStateAttribs(el, options);
    $(this).data('state', state);
    internal.setItemLayout(el, state, options);
    if (!options.startPaused) {
      internal.startInterval.call(this);
    }
    if (options.mousePause) {
      return internal.bindMousePausing(el, state);
    }
  },
  pause: function(pauseState) {
    var el, state;
    state = internal.getState('pause', this);
    if (!internal.hasMultipleItems(state)) {
      return false;
    }
    state.isPaused = pauseState;
    el = state.element;
    if (pauseState) {
      $(this).addClass('paused');
      return el.trigger('vticker.pause');
    } else {
      $(this).removeClass('paused');
      return el.trigger('vticker.resume');
    }
  },
  next: function(attribs) {
    var state;
    state = internal.getState('next', this);
    if (internal.isAnimatingOrSingleItem(state)) {
      return false;
    }
    internal.restartInterval.call(this);
    return internal.moveUp(state, attribs);
  },
  prev: function(attribs) {
    var state;
    state = internal.getState('prev', this);
    if (internal.isAnimatingOrSingleItem(state)) {
      return false;
    }
    internal.restartInterval.call(this);
    return internal.moveDown(state, attribs);
  },
  stop: function() {
    var state;
    state = internal.getState('stop', this);
    return internal.stopInterval.call(this);
  },
  remove: function() {
    var el, state;
    state = internal.getState('remove', this);
    internal.stopInterval.call(this);
    el = state.element;
    el.unbind();
    return el.remove();
  }
};
return $.fn.vTicker = function(method) {
  if (methods[method]) {
    return methods[method].apply(this, Array.prototype.slice.call(arguments, 1));
  }
  if (typeof method === 'object' || !method) {
    return methods.init.apply(this, arguments);
  }
  return $.error('Method ' + method + ' does not exist on jQuery.vTicker');
};
})(jQuery);

	$(function() {
		$('#notice_text_box').vTicker();//공지사항 회전
	});


</script>



<script>
function getWeather() {
	  var url = 'http://api.openweathermap.org/data/2.5/weather?lat=${universityDto.universityLatitude}&lon=${universityDto.universityLongitude}&APPID=62790597231fb6fa089bb576c8f8b650';
	  $.ajax({
	    dataType: "jsonp",
	    url: url,
	    jsonCallback: 'jsonp',
	
	    cache: false,
	    success: function (data) {
	    	var iconName = data.weather[0].icon;
	    	$("#icon_box_left").append('<img src="/spring/images/mainImage/weather/'+iconName+'.png">');
	     	//console.log('<img src="/spring/images/mainImage/weather/'+iconName+'.png"');
	    	//날씨 나타내기
	    	//$("#frontTemp").text(Math.round(data.main.temp-273.15));
	    	//$("#weatherTxt").text(data.weather[0].main);
	   		
	    	//data.weather[0].main
	
	     //console.log(data.weather[0].main);
	     //   console.log(data);
	    }
	  });
	}
      </script>