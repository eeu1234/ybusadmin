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
	text-align:center;
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
	padding-top: 2.5%;
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
	height: 75%;
	margin: 0;
	padding: 0;
	padding-top:23%;

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
	position: relative;
	width: 50%;
	height: 90%;
	float: left;
	padding-top:4%;
}

.busNum {
	position: relative;
	float: left;
	width: 50%;
	height: 90%;
	text-align: right;
	padding-top:4%;
	
}

.busTxt {
	position: absolute;
	width: 50%;
	height: 30%;
	font-size: 0.3em;
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
#selUni{
	width:100%;
	height:10%;
	margin:0;
	padding:0;
}
 
#universitySeq{

	 width:50%;
	 height:100%;
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

#cambusLogo{
	width:85%;
	height:auto;

}
</style>
<script>

	$(document).ready(function(){
		
		$("#universitySeq").change(function(){
			$("#selUni").submit();
		});
		
	})

	function move(){

		var uniSeq = $(this).val();
		location.href="/spring/mainIndex.action?universitySeq="+uniSeq;
	}
	
</script>

</head>
<body>
	<div id="container">
		<div id="top">
			<div id="header">
				<div id="infoPage">
					<div id="txtLogo">
						학교 선택
					</div>
					
				</div>
				
			</div>
			<img id="cambusLogo"src="/spring/images/logo.PNG" onerror="this.style.display='none'"/>
		</div>
		<div id="contents">
			<form id="selUni" action="/spring/mainIndex.action" method="GET">
				<select id = "universitySeq" name = "universitySeq" class="selectBox">
					<option value="9999">학교를 선택해주세요</option>
					<c:forEach items="${uniList}" var="uniDto">
						<option value="${uniDto.universitySeq}" onclick="move();">${uniDto.universityName}</option> 	
					</c:forEach>
				</select>
			</form>
		</div>

		
	</div>
</body>
</html>