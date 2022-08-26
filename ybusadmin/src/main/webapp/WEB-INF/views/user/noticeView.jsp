<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
	<meta name="viewport" content="width=device-width,initial-scale=1">
    <title>공지사항::내용</title>
	
    <style>
		@font-face {
		font-family: "Pretendard-Bold";
		src:url(/spring/css/fonts/Pretendard-Bold.woff) format("truetype");
		}
		}
		@font-face {
		font-family: "Pretendard-ExtraLight";
		src:url(/spring/css/fonts/Pretendard-ExtraLight.woff) format("truetype");
		}
		@font-face {
		font-family: "Pretendard-Medium";
		src:url(/spring/css/fonts/Pretendard-Medium.woff) format("truetype");
		}
		@font-face {
		font-family: "Pretendard-SemiBold";
		src:url(/spring/css/fonts/Pretendard-SemiBold.woff) format("truetype");
		}
        body, html, p, ul, img, span, div, a {
            margin: 0;
            padding: 0;
        }
		

        body, html {
			min-width:375px;
			max-width:600px;
            position: relative;
            height: 100%;
            width: 100%;
            margin: 0 auto;
            font-family: 'notoFont-bold';
            color: #222;
            background-color: #FAFAFC;
        }

        .clear {
            clear: both;
            margin: 0;
            padding: 0;
        }

		a {
		  color:black;
		  text-decoration: none;
		}
		a:visited {
		  color:black;
		  text-decoration: none;
		}
		a:linked {
		  color:black;
		  text-decoration: none;
		}
		a:hover {
		  color:black;
		  text-decoration: none;
		}
        #container {
            position: relative;
            width: 100%;
            height:100%;
            margin: 0 auto;
            margin-top:4%;
        }

        #header {
            position: relative;
            margin-top:5%;
            width: 100%;
            text-align: center;
            color: white;
	

        }
        #infoPage {
            position: relative;
			width:90%;
			padding-top:5%;
			padding-left:5%;
			padding-right:5%;
        }
        #txtBox {
            position: relative;
            float:left;
            width: 45%;
            
        }
        #btnBox {
            position: relative;
            float:right;
            width: 46%;
            text-align:center;
		}
        #txtType{
            position: relative;
            color : #142637;
            text-align: left;
            font-size: 1.8em;
			padding-top:0.5%;
			padding-bottom:0.5%;
			font-family : 'Pretendard-Bold';

			
        }
        #btnType{
            position: relative;
            font-weight: bold;
            color : #142637;
            text-align: right;            
			padding-bottom:3%;
        }



        #writeBtn{
			outline:0;
			border: 0;
            postion : relative;
            width:80%;
            background-color:#142637;
            color:white;
            font-size:0.83em;
            border-radius: 50px;
			font-family : 'Pretendard-SemiBold';
			padding-bottom:5.2%;
			padding-top:5.2%;
			padding-left:6%;
			
			
        }
        #miniLogo{
			padding-top:3px;
			padding-left:4px;
            width:13%;
			float:left;
        }

        #titleContainer{
			position:relative;
            width:90%;
            
			padding-top:1%;
            margin: 0 auto;
			font-family : 'Pretendard-SemiBold';
			background-color:white;
            border-radius:15px;
            box-shadow: 5px 10px 30px #e0e0e0;
			
			
        }

        #titleBox{
			position:relative;
			width:90%;
            height:10%;
			padding-left:5%;
			padding-right:5%;
			padding-top:4%;

			margin:0 auto;

        }


        #title{
			position:relative;
			margin: 0 auto;
			margin-top:1%;
			text-align:left;
			font-family : 'Pretendard-Bold'; 
			font-size : 1.15em;
			color:#00264D;
        }      
		#titleInfo{
			padding-top:3px;
			padding-bottom:6%;
			color:#B4B4B4;
			font-family: "Pretendard-Medium";
			font-size:0.8em;
			border-bottom: 1px solid #B4B4B4;
			
		}
		#contentsBox{
			height:74%;
			margin:3%;
			margin-top:5%;	
			margin-bottom:5%;	
			word-break: break-word;
		}
		#imgBox{
			width:80%;
		}
		#footerContents{
			width:100%;
			height:10%;
			margin-bottom:5%;
			background-color:#FAFAFC;
			border-radius: 0 0 15px 15px;
		}
		#btnFooterGroup{
			width:100%;
			height:100%;
		}
		.footerBtn{
			float:left;
			height:100%;
			padding-top:7%;
			padding-bottom:7%;
			color:#142637;
			font-family : 'Pretendard-Bold'; 
			font-size : 0.8em;
			
		}
		#leftFooter{width:20%;padding-left:7%;}
		#midFooter{width:45%;}
		#rightFooter{width:20%;padding-right:7%;text-align:right;}
	
		.clear {
            both: clear;
        }
    </style>
    <script>
    	//url복사버튼
	    function clip(){
	
	    	var url = '';
	    	var textarea = document.createElement("textarea");
	    	document.body.appendChild(textarea);
	    	url = window.document.location.href;
	    	textarea.value = url;
	    	textarea.select();
	    	document.execCommand("copy");
	    	document.body.removeChild(textarea);
	    	alert("URL이 복사되었습니다.")
	    }
    </script>
</head>
<body>
    <div id="header">
        <div id="infoPage">
            <div id="txtBox">
                <div id="txtType">
                    공지사항
                </div>
            </div>
            <div id="btnBox">
                <div id="btnType">
				   <button id="writeBtn"  /><img id="miniLogo" src="/spring/images/mainImage/yiu_logo_mini.png">
				   <span style="padding-bottom:5px;">셔틀 공지사항</span></button>
                </div>
            </div>
            <div class="clear"></div>
        </div>
    </div>
    <div id="container">
        <div id="titleContainer">
            <div id="titleBox">
				<div id="title">${noticeContent.noticeSubject}
					<img src="/spring/images/mainImage/postShare.png" style="float:right; width: 6%; image-rendering:-webkit-optimize-contrast;transform:translateZ(0); backface-visibility:hidden;" onclick="clip(); return false;">
				</div>
				<div id="titleInfo">${noticeContent.noticeRegdate} | 조회수 ${noticeContent.noticeReadCount}</div>
            </div>
			<div id="contentsBox">
			<c:forEach items="${noticeContent.filelist}" var="dto">
				<c:if test="${dto.noticeFileType!='png'&&dto.noticeFileType!='jpg'&&dto.noticeFileType!='jpeg'&&dto.noticeFileType!='gif'&&dto.noticeFileType!='bmp'&&dto.noticeFileType!='PNG'&&dto.noticeFileType!='JPG'&&dto.noticeFileType!='JPEG'&&dto.noticeFileType!='GIF'&&dto.noticeFileType!='BMP'}">
					<a href="/spring/images/notice/${dto.noticeFileName}" download>${dto.noticeFileName}</a>
				</c:if>
			</c:forEach>
			<c:forEach items="${noticeContent.filelist}" var="dto">
				<c:if test="${dto.noticeFileType=='png'||dto.noticeFileType=='jpg'||dto.noticeFileType=='jpeg'||dto.noticeFileType=='gif'||dto.noticeFileType=='bmp'||dto.noticeFileType=='PNG'||dto.noticeFileType=='JPG'||dto.noticeFileType=='JPEG'||dto.noticeFileType=='GIF'||dto.noticeFileType=='BMP'}">
					<a href="/spring/images/notice/${dto.noticeFileName}"><div id="imgBox"><img id="showImg" name="showImg" src="/spring/images/notice/${dto.noticeFileName}"></div></a>
				</c:if>
			</c:forEach>
				${noticeContent.noticeContent}
			</div>
			<div id="footerContents">
				<div id="btnFooterGroup">
					<div class="footerBtn" id="leftFooter"><c:if test="${not empty prevNoticeSeq}"><a href="/spring/user/noticeView.action?noticeSeq=${prevNoticeSeq}" class="aTitle"><  이전글</a></c:if></div>
					<div class="footerBtn" id="midFooter"></div>
					<div class="footerBtn" id="rightFooter"><c:if test="${not empty afterNoticeSeq}"><a href="/spring/user/noticeView.action?noticeSeq=${afterNoticeSeq}" class="aTitle">다음글  ></a></c:if></div>
					<div class="clear"></div>
				</div>
			</div>
        </div>


    </div>
</body>
</html>