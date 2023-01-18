<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
    <style>

    @font-face {
   font-family: "Pretendard-Bold";
   src:url(/spring/css/2022css/2022/Pretendard-Bold.subset.woff2) format("truetype");
    }
    @font-face {
   font-family: "Pretendard-ExtraLight";
   src:url(/spring/css/2022css/2022/Pretendard-ExtraLight.subset.woff2) format("truetype");
    }
    @font-face {
   font-family: "Pretendard-Medium";
   src:url(/spring/css/2022css/2022/Pretendard-Medium.subset.woff2) format("truetype");
    }
    @font-face {
   font-family: "Pretendard-SemiBold";
   src:url(/spring/css/2022css/2022/Pretendard-SemiBold.subset.woff2) format("truetype");
    }

    a {
        text-decoration: none;
        color:black;
    }   
    html,body{
        width: 100%;
        height: 100%;
        max-width:600px;
        min-width:375px;
        margin: auto;
        background-color: #EFEFEF;
    }
    
    #content{
        width:90.8%;
        position:relative;
        margin: 12.81% 4.611%;
        border-radius: 10px;
    }
    #header{
        width:100%;
        position:relative;
    }
    #selectBox{
    	position: absolute;
    	height: 100%;
    	width: 100px;
    	border-radius: 50px;
    	background-color: #000069;
    	padding: 10px;
    	color: #FFFFFF;
    }
    #btnstl{
    	width: 80%;
    	height: 10%;
    	margin: 20px;
    	font-size: 20px;
    	font-weight: bold;
    	border: white;
    	border-radius: 10px;
    	background-color: #00006EF;
    	color: white;
    }
    
    </style>
    
</head>
<body>
	<div id="content">
		<div id="header">
		<h1>식단표
			<select id="selectBox">
				<option disabled selected><img></img>인성</option>
				<option value="a">a</option>
			</select>
		</h1>
		</div>
	</div>
	
	<div id="content" style="background-color: white; height:80px;">
		
	</div>
	
	<div id="content" style="background-color: white; height:500px; text-align: center; ">
		<button id="btnstl">11월 11일 월요일</button>
		<button id="btnstl">11월 12일 화요일</button>
		<button id="btnstl">11월 13일 수요일</button>
		<button id="btnstl">11월 14일 목요일</button>
		<button id="btnstl">11월 15일 금요일</button>
	</div>

</body>
</html>