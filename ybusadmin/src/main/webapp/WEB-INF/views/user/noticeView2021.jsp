<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="/inc/asset.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset=UTF-8">
<title>CAMBUS::공지사항</title>
<link rel="stylesheet" href="/spring/css/busStop.css">
<style>





#container {
	position: relative;
	margin: 0 auto;
	width: 100%;
	height: 100%;
}


#contentArea {
	position: relative;
	width: 90%;
	height: auto;
	min-height: 300px;
	margin: 0 auto;
	margin-top:10%;
	margin-bottom: 10px;
	background-color: white;
	text-align: center;
}
#contentArea img{
	width:100%;
	height:auto;
}

.area {
	background-color: #D5D5D5;
	position: relative;
	margin-bottom: 20px;
}

.contentHeader {
	position: relative;
	width: 100%;
	height: 35px;
	color: white;
	border-radius: 4px;
}

.contentNum {
	float: left;
	position: relative;
	width: 20%;
	height: 35px;
	text-align: center;
	padding-top: 8px;
	margin: 0;
}

.title {
	float: left;
	position: relative;
	width: 67%;
	height: 35px;
	padding-top: 8px;
	margin: 0;
	font-weight: bold;
		text-overflow: ellipsis;
	white-space: nowrap;
	word-wrap: normal;
	overflow: hidden;
}




.content {
	position: relative;
	width: 100%;
	height: auto;
	min-height: 200px;
	text-align:left;
	background-color: white;
	padding: 8px;
	border-bottom:2px solid silver;
	box-shadow: 0px 7px 10px 0 silver inset;
}

.contentPic {
	position: relative;
	margin: 10px auto;
	width: 95%;
	height: auto;
}

.contentRegdate {
	position: relative;
	margin: 0px auto;
	width: 100%;
	height: auto;
	text-align: right;
	font-size: 0.7em;
	color: #888;
}

.showComment {
	position: relative;
	width: 100%;
	margin-top: 5px;
	padding: 5px;
	border: 0px;
	text-align: right;
	color: #888;
	padding: 5px;
}

.showComment:hover {
	position: relative;
	width: 100%;
	margin-top: 5px;
	padding: 5px;
	border: 0px;
	text-align: right;
	text-decoration: underline;
	color: #888;
	padding: 5px;
}

.clear {
	both: clear;
}

img {
	width: 100%;
	height: auto;
}
#logo{
opacity:0.6;
}
</style>
<script>
	
</script>

</head>
<body>
	<div id="header">
		<div id="infoPage">
			<input type="button" value="<" style=" color:white;position:
				absolute; font-size:1.5em;left: 3%;margin-top:2%; width: 8%; height: 55%;  background-color:
				transparent !important; border-color:
				transparent;"	onclick="location.href='/spring/index.action';" />
			<div id="txtLogo">공지사항</div>
			
			<img src="/spring/images/logo/${universityDto.universityImg}" id="logo" onerror="this.style.display='none'" alt=''   />
			
		</div>
	</div>
	<div id="container">

		<!-- 본문 글 쿼리 -->
		<div id="contentArea">
			<div class="area">

				<!-- 머리부분 -->
				<div class="contentHeader">
					<div class="contentNum">#${noticeContent.noticeSeq}</div>
					<div class="title">${noticeContent.noticeSubject}</div>
					<div class="clear"></div>
				</div>
				<div class="content">
					<div class="contentRegdate">${noticeContent.noticeRegdate}</div>
					<c:forEach items="${noticeContent.filelist}" var="dto">
							<c:if test="${dto.noticeFileType!='png'&&dto.noticeFileType!='jpg'&&dto.noticeFileType!='jpeg'&&dto.noticeFileType!='gif'&&dto.noticeFileType!='bmp'&&dto.noticeFileType!='PNG'&&dto.noticeFileType!='JPG'&&dto.noticeFileType!='JPEG'&&dto.noticeFileType!='GIF'&&dto.noticeFileType!='BMP'}">
						<div class="contentRegdate"><a href="/spring/images/notice/${dto.noticeFileName}" download>${dto.noticeFileName}</a></div>
							</c:if>
						</c:forEach>
					<c:forEach items="${noticeContent.filelist}" var="dto">
						<c:if test="${dto.noticeFileType=='png'||dto.noticeFileType=='jpg'||dto.noticeFileType=='jpeg'||dto.noticeFileType=='gif'||dto.noticeFileType=='bmp'||dto.noticeFileType=='PNG'||dto.noticeFileType=='JPG'||dto.noticeFileType=='JPEG'||dto.noticeFileType=='GIF'||dto.noticeFileType=='BMP'}">
							<a href="/spring/images/notice/${dto.noticeFileName}"><div id="imgBox"><img id="showImg" name="showImg" src="/spring/images/notice/${dto.noticeFileName}"></div></a>
						</c:if>
					</c:forEach>
					${noticeContent.noticeContent}
				</div>
			</div>
		</div>
	</div>
</body>
</html>