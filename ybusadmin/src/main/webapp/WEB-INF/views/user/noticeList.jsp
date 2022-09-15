<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
	<meta name="viewport" content="width=device-width,initial-scale=1">
         <!-- import 시작 -->
<script src="https://code.jquery.com/jquery-1.12.4.min.js"
   integrity="sha256-ZosEbRLbNQzLpnKIkEdrPv7lOy9C27hHQ+Xp8a4MxAQ="
   crossorigin="anonymous"></script>
    <title>YBUS::공지사항</title>
	
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
		
		

        .clear {
            clear: both;
            margin: 0;
            padding: 0;
        }

        #container {
            position: relative;
            width: 100%;
            height:100%;
            margin: 0 auto;
            margin-top:5%;
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

        #searchContainer{
			position:relative;
            width:100%;
            height:85%;
			padding-top:1%;
            margin: 0 auto;
        }
		#contentsContainer{
			position:relative;
			height:7%;
			padding-top:6.5%;
		}
        #searchBox{
			position:relative;
			width:80%;
            height:80%;
			padding-left:5%;
			padding-right:5%;
			padding-top:5%;
            background-color:white;
            border-radius:15px;
            box-shadow: 5px 10px 30px #e0e0e0;
			margin:0 auto;

        }
		.contentsBox{
			position:relative;
			width:90%;
            background-color:white;
            border-radius:10px;
            box-shadow: 5px 10px 30px #e0e0e0;
			margin:0 auto;
		}
		.menu{
			float:left;
			height:100%;
			padding-top:5%;
			padding-bottom:5%;
			padding-left:5%;
			color:#B4B4B4;
			font-family : 'Pretendard-Bold';
			font-size:1.2em;
		}
		.menu_active{
			float:left;
			height:100%;
			padding-top:5%;
			padding-bottom:5%;
			padding-left:5%;
			font-family : 'Pretendard-Bold';
			color:#00264D;
			font-size:1.2em;
		}

        #search{
			position:relative;
			margin: 0 auto;
            height: 4.4%;
            background-color: #FAFAFC;
            border-radius:30px;
			padding-bottom:1%;
        }      
		#searchNotice{
			width:100%;
			padding-top:5%;
			padding-bottom:1.5%;
			border:transparent;
			background-color:transparent;
			font-size:0.9em;
			color : #142637;
			font-family : 'Pretendard-Medium';
			text-align:right;
        }
		#searchInput{
			width:100%;
			height:100%;
			border:transparent;
			background-color:transparent;
			font-size:0.78em;
			color : #142637;
			font-family : 'Pretendard-SemiBold';
			padding-bottom:5px;
		}	
		#searchInput::placeholder {		
			color: #142637;
			font-family : 'Pretendard-SemiBold';
		}
		.search_iconBox{
			postion:relative;
			float:left;
			width:10%;
			padding-top:3px;
			padding-left:3px;
			text-align:center;
			
		}
		.search_inputBox{
			postion:relative;
			float:left;
			width:85%;
			height:100%;

		}
		
		#search_icon{
			width:40%;
			margin:0 auto;
		}

		#postListBox{
			width:100%;
			border-top:1px solid #B4B4B4;
		}
		.postBox{
			width:100%;
			height:9%;
			padding-bottom:6%;
			border-bottom:1px solid #B4B4B4;
		}
		.postTitle{
			margin-top:6%;
			font-family : 'Pretendard-Bold';
			color:#00264D;
			font-size:0.95em;
		}
		.postInfo{
			color:#B4B4B4;
			font-size:0.8em;
			font-family : 'Pretendard-Medium';
		}

		.clear {
            both: clear;
        }
    </style>
    <script>
    $(function() {
	/* 검색 */
	$("#searchInput").keydown(function (key) {
		 
        if(key.keyCode == 13){//키가 13이면 실행 (엔터는 13)
			//검색 index 초기화
        	index = 0;        	
        	
	        var word = $(this).val();//검색어 가져옴
	        
	        search(word);//ajax
        }
 
	    });
    });
    function search(word){
    	location.href="/spring/user/noticeList.action?word="+word;

    }
    </script>
    
</head>
<body>
    <div id="header">
        <div id="infoPage">
            <div id="txtBox">
                <div id="txtType">
                    <img src="/spring/images/camsns/backBtn.png" style="height:20px;width:auto;margin-right:3%;" onclick="location.href='/spring/index.action'" />공지사항
                </div>
            </div>
            <div id="btnBox">
                <div id="btnType">
                   <button id="writeBtn" /><img id="miniLogo" src="/spring/images/mainImage/yiu_logo_mini.png">
				   <span style="padding-bottom:5px;">셔틀 공지사항</span></button>
                </div>
            </div>
            <div class="clear"></div>
        </div>
    </div>
	<div id="contentsContainer">
		<!-- 게시글 반복-->
		<div class="contentsBox">
			<div class="menu_active">공지사항</div>
<!-- 			<div class="menu">자주 묻는 질문</div>
			<div class="menu">도움말</div> -->
			<div class="clear"></div>
		</div>
		

	</div>
    <div id="container">
        <div id="searchContainer">
            <div id="searchBox">
                <div id="search">
					<div class="search_iconBox">
						<img src='/spring/images/mainImage/search_icon.png' id="search_icon">
					</div>
					<div class="search_inputBox">
					   <input type="text" id="searchInput" placeholder="키워드를 검색해 보세요.">
					</div>
					<div class="clear"></div>
                </div>
				<div id="searchNotice">
					총 ${fn:length(nList)}개
				</div>
				<div id="postListBox">
				<c:forEach items="${nList}" var="ndto">				
					<div class="postBox">
						<div class="postTitle"><a href="/spring/user/noticeView.action?noticeSeq=${ndto.noticeSeq}" class="aTitle">${ndto.noticeSubject}</a><img src='/spring/images/mainImage/newNotice.png'" style="margin-left:5px;width: 10%;"></div>
						<div class="postInfo">${ndto.noticeRegdate} | 조회수 ${ndto.noticeReadCount}</div>
					</div>
					</c:forEach>

				</div>
            </div>
        </div>

    </div>
</body>
</html>