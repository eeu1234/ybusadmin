<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
    


<html>
<head>
<!-- 모바일용웹 -->
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no, target-densitydpi=medium-dpi" />


<meta name="mobile-web-app-capable" content="yes">

<!-- 안드로이드 홈화면추가시 상단 주소창 제거 -->
<meta name="mobile-web-app-capable" content="yes">
<link rel="icon" href="/spring/images/ico/favicon.ico">
<!-- ios홈화면추가시 상단 주소창 제거 -->
<meta name="apple-mobile-web-app-capable" content="yes">
<!-- ico 아이콘-->
<link rel="apple-touch-icon" href="/mobile/Image/favicon.ico">

<!--모바일 스플래스 //아이폰용-->
<link rel="apple-touch-startup-image" href="images/loading_yongin.png">


<script
	src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.2.2/jquery.min.js'></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"
	integrity="sha256-Qw82+bXyGq6MydymqBxNPYTaUXXq7c8v3CwiYwLLNXU="
	crossorigin="anonymous"></script>

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

	
<script>

	
	$(function(){
		$("#StudentHall").click(function(){
			  $.ajax({
			          type: 'get'
			        , url: '/spring/user/mjuFood.action'
			        , data : "searchValue=051002050000&typeValue=36337"
					, dataType : 'text'
			        , success: function(data) {
			        	$("#listDiv").html(data);
			          }
			  });	
		})		
})

	$(function(){
		$("#domitori").click(function(){
			  $.ajax({
			          type: 'get'
			        , url: '/spring/user/mjuFood.action'
                 	, data : "searchValue=051002020000&typeValue=36548"
					, dataType : 'html'
			        , success: function(data) {
			        	$("#listDiv").html(data);
			          }
			  });	
		})		
})

	$(function(){
		$("#Hwangyeong").click(function(){
			  $.ajax({
		          type: 'get'
	        	    , url: '/spring/user/mjuFood.action'
	        	    , data : "searchValue=051002030000&typeValue=36550"
					, dataType : 'html'
			        , success: function(data) {
			        	$("#listDiv").html(data);
			          }
			  });	
		})		
});

	
	$(function(){
		$("#mjuProf").click(function(){
			  $.ajax({
		          type: 'get'
	        	    , url: '/spring/user/mjuFood.action'
	        	    , data : "searchValue=051002040000&typeValue=	58976"
					, dataType : 'html'
			        , success: function(data) {
			        	$("#listDiv").html(data);
			          }
			  });	
		})		
});

</script>
	

<style>
	@font-face {
	font-family: "notoFont-medium";
	src: url(/spring/css/fonts/NotoSansCJKkr-Medium.woff) format("truetype");
	}
	body{
		margin:0px;
	
	}

	html {
		width: 100%;
		background-Color: #EB6F61;
		font-size: 0.6em;
		font-style: bold;
		
		background-repeat: no-repeat;
		background-size: cover;
	}
	#jb-header {

		top: 0;
		left: 0;
		width: 100%;
		height: 10%;
		background-color: white;
		
	
	}
	#jb-header img{
		margin-top:20px;	
		width:40%;
	}
	#jb-container {
		position: relative;
		top: 0;
		left: 0;
		width: 100%;
		margin: 0px auto;
		padding: 0;
		text-align: center;
	}

	#jb-content {
		width: 100%;
		float: left;
		height: 88%;
		margin: 0px;
	}
	#jb-footer {
		float: left;
		width: 100%;
		height: 8%;
		background-color: black;
		margin: 0px;
		padding: 0px;
	}
	table, tr {
		cellspacing: 0px;
		cellpadding: 0px;
	}
	td.head {
		font-style: bold;
		text-align: center;
	}
	td.second {
		width: 10px;
		background-Color: #ffe6f2;
		padding: 0px;
		spacing: 0px;
		text-align: center;
		color: grey;
	}
	td {
		color: black;
	}
	table {
		width: 100%;
		line-height: 21px;
		border-top: 1px solid #cccccc;
		border-left: 1px solid #cccccc;
		border-collapse: collapse;
	}
	table th, table td {
		color: #678197;
		border-right: 1px solid #cccccc;
		border-bottom: 1px solid #cccccc;
		padding-top: 10px;
		padding-bottom: 10px;
		background-color: #FFEEF4;
		font-style: bold;
		font-size: 0.7em;
	}
	.class td:nth-child(1) {
		font-size: 0.6em;
	}
}

</style>


<style>
#listDiv {
	width: 100%;
	height: auto;
	min-height: 100%;
	background-color: #EB6F61;
	margin: 0 auto;
	margin-top: 20%;
}



.btn_box{
	background-color: white;
	width: 90%;
	height: 12%; /*--버튼 크기---*/
	background-size: cover;
	background-repeat: no-repeat;
	margin:0 auto;
	margin-top: 1%;
	max-width: 500px;
	max-height: 80px;
	color:#464342;
	font-size: 2em;
	font-family: "notoFont-medium";
	font-weight: bold;
	text-shadow: 2px 2px #eee;
}
</style>

</head>

<body>
	<div id="jb-container">
		<div id="jb-header">
			<img src="/spring/images/mainImage/mainLogo.png">
		</div>
		<div id="jb-content">
			<div style="position:relative;text-align:center;">
				<img src="/spring/images/food/icon_food.png" style="height:auto;width:100%;">
			</div>
			<!--학생회관-->
			<div style="position:relative;">
				<input type="button" id="StudentHall" class="btn_box" value="명진당"/>
				<input type="button" id="domitori"  class="btn_box" value="학생회관"/> 
				<input type="button" id="Hwangyeong" class="btn_box" value="기숙사 스낵코너"/>
				<input type="button" id="mjuProf" class="btn_box" value="교직원식당"/>
			</div>
			<div id="listDiv"></div>


			<div id="footer" style="background-color: black; z-index: 900;">
				<img src="/spring/images/food/bottom_bar.png"
					style="width: 100%; height: 10%;&gt;
			&lt;/div&gt;
		&lt;/div&gt;
		&lt;div style="clear:both;">

			</div>
</body>

</html>



