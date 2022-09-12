<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>YBUS</title>


<!-- 모바일용웹 -->
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no, target-densitydpi=medium-dpi" />

<meta name="mobile-web-app-capable" content="yes">

<!-- import 시작 -->
<script src="https://code.jquery.com/jquery-1.12.4.min.js"
	integrity="sha256-ZosEbRLbNQzLpnKIkEdrPv7lOy9C27hHQ+Xp8a4MxAQ="
	crossorigin="anonymous"></script>

<link
	href="https://gitcdn.github.io/bootstrap-toggle/2.2.2/css/bootstrap-toggle.min.css"
	rel="stylesheet">
<script
	src="https://gitcdn.github.io/bootstrap-toggle/2.2.2/js/bootstrap-toggle.min.js"></script>




<!-- ico 아이콘-->




<script
  src="https://code.jquery.com/jquery-1.12.4.min.js"
  integrity="sha256-ZosEbRLbNQzLpnKIkEdrPv7lOy9C27hHQ+Xp8a4MxAQ="
  crossorigin="anonymous"></script>


<style>

@font-face {
font-family: "Pretendard-Bold";
src:url(/spring/css//fonts/2022/Pretendard-Bold.woff) format("truetype");
}
@font-face {
font-family: "Pretendard-SemiBold";
src:url(/spring/css//fonts//2022/Pretendard-SemiBold.woff) format("truetype");
}
@font-face {
font-family: "Pretendard-Medium";
src:url(/spring/css//fonts//2022/Pretendard-Medium.woff) format("truetype");
}

body, p, div, li, ul, span, img {
	margin: 0;
	padding: 0;
}

img {
	width: 60%;
	height: auto;
}

body, html {
	position: relative;
	width: 100%;
	max-width: 480px;
	height: 100%;
	margin: 0 auto;
	/* -webkit-overflow-scrolling: touch; 터치부드럽게 상단고정해더가 늦게움직이는현상발생*/
}

#container {
	position: relative;
	width: 100%;
	max-width: 480px;
	margin: 0 auto;
	background-color:#FAFAFC;
}

#title{
	font-family: "Pretendard-Bold";
	font-size:1.5em;
	padding:15% 0 1% 5%;
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
	background-color: white;
}
#main_footer{
    width:90%;
    padding:0 5%;
    background-color:gray;
    color:white;
}
#logo{
    width:23.2%;
    padding:7.2% 0;
}
#prevVersion{
    font-family:"Pretendard-semiBold";
    font-size:0.7em;
}
#info{
    width:100%;
    padding-top:12.8px;
    padding-bottom:25.6px;
    font-family:"Pretendard-Medium";
    font-size:0.7em;
    letter-spacing:-0.5px;
}
#info_left{
    width:80%;
    float:left;
}
#info_right{
    width:20%;
    float:left;
}
#info_right_gmail{
    width:45%;
    margin-right:10%;
    float:left;
    content:url("/spring/images/mainIndex/gmail_logo.png");
}
#info_right_kakao{
    width:45%;
    float:left;
    content:url("/spring/images/mainIndex/kakao.png");
}

/* 아이폰5 */
@media(max-width:320px) { 
 #contents{
 padding-top:15%;
 } 
}
#txtType{
    position: relative;
    font-weight: bold;
    color : #142637;
    text-align: left;
    font-size: 2em;
	padding-top:5.5%;
	padding-bottom:5.5%;
	font-family: "Pretendard-Bold";
	height:35px;
	width:90%;
	padding-left:5%;
	padding-right:5%;
	
			
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

#top{
	position: fixed;
	width: 100%;
	height: 7%;
	z-index: 3;
}
#infoImg{
	width:100%;
}
#logo{
	opacity:0.6;
}

</style>

<script>
$(document).ready(function(){
	$(".stopName").click(function(){
		
		location.href="/spring/getBusStopRoadView.action?busStopSeq="+$(this).attr("busStopSeq");
	});
	
	$("#detailLocationSel").change(function(){
		var bsdcSeq = $(this).val();
		location.href="/spring/getBusStopLine.action?busStopDetailCategorySeq="+bsdcSeq;
	});
});

function refresh(){
	var bsdcSeq = $("#detailLocationSel").val();
	location.href="/spring/getBusStopLine.action?busStopDetailCategorySeq="+bsdcSeq;
}

function moveMap(){
	var bsdcSeq = $("#detailLocationSel").val();
	location.href="/spring/getBusStopLocation.action?busStopDetailCategorySeq="+bsdcSeq;
}
	
</script>

</head>
<body>
	<div id="container">
		
	 		<div id="txtType">
				<div style="float:left;height:38px;">자유게시판</div>
				<div style="float:left;height:38px;margin-left:5px;padding-left:2px;"><img src="/spring/images/mainIndex/home_btn_navy.png" style="height:35px;width:auto;" onclick="location.href='/spring/index.action'" /></div>
				<div class="clear"></div> 
			</div>
		
		<div id="contents">
			<div id="lineArea">
				<img src="/spring/images/info.png" id="infoImg">
			</div>
		</div>
	</div>
	<div id = "main_footer">
           <div id = "logo">
              <a href= "/spring/admin/adminLogin.action">
              <img style= "width:100%;" src="/spring/images/mainIndex/YBUS_footer.png"  >
            </a>           
           </div>
           <div id = "prevVersion">
               <span>이전 버전으로 </span>
           </div>
           <div id = "info">
               <div id = "info_left">
                   <div>
                       <span>The UNIV BUS::YBUS made by YBUS Team</span>
                   </div>
                   <div>
                       <span>2022 All right (C) reserved.</span>
                   </div>
               </div>
               <div id = "info_right">
                   <div id = "info_right_gmail" onclick = "location.href='mailto:eeu4327@gmail.com'"></div>
                   <div id = "info_right_kakao" onclick="location.href='http://pf.kakao.com/_Rxkxjxeu'"></div>
               </div>
               <div style ="clear:both;"></div>
           </div>
       </div>
</body>
</html>