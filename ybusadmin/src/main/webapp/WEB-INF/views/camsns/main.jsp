<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1">
<!-- import 시작 -->
<script src="https://code.jquery.com/jquery-1.12.4.min.js"
	integrity="sha256-ZosEbRLbNQzLpnKIkEdrPv7lOy9C27hHQ+Xp8a4MxAQ="
	crossorigin="anonymous"></script>
<title>자유게시판</title>

 <style>    
	@font-face {
	font-family: "Pretendard-Bold";
	src:url(/spring/css/2022css/2022/Pretendard-Bold.subset.woff2) format("truetype");
    }
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
            color: #222;
            background-color: #FAFAFC;
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
            margin-top:6%;
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
            width: 60%;
            
        }
        #btnBox {
            position: relative;
            float:left;
            width: 40%;
            text-align:right;
		}
        #txtType{
            position: relative;
            font-weight: bold;
            color : #142637;
            text-align: left;
            font-size: 2em;
			padding-top:0.5%;
			padding-bottom:0.5%;
			font-family: "Pretendard-Bold";

			
        }
        #btnType{
            position: relative;
            font-weight: bold;
            color : #142637;
            text-align: right;            
        }


        #writeBtn{
			border:0;
			outline:0;
            postion : relative;
            width:50%;
            padding-top:8%;
            padding-bottom:8%;
            background-color:#142637;
            color:white;
            font-size:0.8em;
            border-radius: 50px;
			font-family : 'Pretendard-SemiBold';

        }

        #searchContainer{
			position:relative;
            width:100%;
			padding-top:1%;
            margin: 0 auto;
        }
		#contentsContainer{
			position:relative;
			padding-top:5%;
			padding-bottom:3.5%;
			
		}
        #searchBox{
			position:relative;
			width:80%;
            height:80%;
			padding:3% 5%;
            background-color:white;
            border-radius:15px;
            box-shadow: 5px 10px 30px #e0e0e0;
			margin:0 auto;

        }
		.contentsBox{
			position:relative;
			width:90%;
            height:161.4px;
			padding-top:20px;
            background-color:white;
            border-radius:10px;
            box-shadow: 5px 10px 30px #e0e0e0;
			margin:0 auto;
			margin-bottom:5%;
			
		}
		.content_category{
			position:relative;
			width:14%;
            height:16px;
			margin-left:5%;
			margin-right:5%;
			text-align:center;
		}
        #search{
			position:relative;
			margin: 0 auto;
            background-color: #FAFAFC;
            border-radius:30px;
			padding:2% 0;
        }      
		#searchNotice{
			position:relative;
			margin: 0 auto;
            height: 35%;        
			padding-top:3%;			
        }
		#searchInput{
			width:100%;
			height:100%;
			font-family : 'Pretendard-Medium';
		}	
		#searchInput::placeholder {
			width:100%;
			height:100%;
			color: #142637;
			font-family : 'Pretendard-Medium';
		}
		.search_iconBox{
			float:left;
			width:11px;
			padding:1.5px 1.3% 1.5px 3.3%;
		}
		.search_iconBox_notice{
			postion:relative;
			float:left;
			width:10%;
			text-align:center;
			
		}
		.search_inputBox{
			float:left;
			width:86%;
		}
		
		#search_icon{
			width:100%;
		}		 
		#notice_icon{
			width:45%;
			margin:0 auto;
		}
		#searchInput{
			border:transparent;
			background-color:transparent;
			font-size:0.7em;
		    color : #142637;
			font-weight:bold;
			
		}
		#searchInputBoxNotice{
			
			padding-top:0.5%;
			border:transparent;
			background-color:transparent;
			font-size:0.8em;
		    color : #767676;
			font-family : 'Pretendard-Medium';
			
		}
		.postNoImg{
			position:relative;
			width:100%;
			height:100%;
		}
		.postNo{
			height:16px;
			line-height:16px;
			background:url("/spring/images/camsns/postNo.png");
			background-size: 100% 100%;
            background-position: center center;
            background-repeat: no-repeat;
			color:#142637;
			font-weight:bold;
			font-size:0.5em;
			text-align:center;
			font-family : 'Pretendard-Medium';
			max-width:50px;
		}
		
		.content_title{
			font-family : 'Pretendard-SemiBold';
			position:relative;
			width:90%;
            height:79.4px;
            margin:12px 5%;
			text-align:left;
		}
		.postTitle{
			float:left;
			width:85%;
			font-size:1em;
			font-family : 'Pretendard-Bold';
			color:#00264D;
			
		}
		.postShare{
			position:relative;
			height:25%;	
			width:10%;
			float:right;
			text-align:right;
		}	
		.postShareImg{
			height:16px;	
			
		}
		.postDate{
			font-size:0.8em;
			font-family : 'Pretendard-Medium';
			color:#B4B4B4;
		}
        .postContents{
			padding-top:15.2px;
			padding-bottom:15.2px;
			font-size:0.8em;
			color:#142637;
			font-family : 'Pretendard-Medium';
			height:15.2px;
			display:block;
			overflow:hidden;
			
		}
		.postContents > p {
			width:95%;
			white-space: no-wrap;
			overflow: hidden;
			text-overflow: ellipsis;
		}
		
		.content_bottom{
			width:90%;
			height:30px;
			padding-top:12px;
			padding-left:5%;
			padding-right:5%;
			background-color:#FAFAFC;
			border-radius: 0 0 10px 10px;
			font-size:0.75em;
			color: #142637;
		}
		.comment_preview{
			float:left;
			width:86%;
			padding-bottom:2%;

		}	
		.comment_cnt{
			float:right;
			text-align:right;
		}
		
		.img_padding{
			float:left;
			height:19px;
		}
		.txt_padding{
			float:left;
			width:80%;
			height:19px;
			padding-left:5px;
			color:#848484;
			font-family : 'Pretendard-Medium';
			line-height:19px;
			display:block;
			overflow:hidden;
			white-space:nowrap;
		}	
		.txt_padding > p{
			word-wrap:break-word; word-break:break-all; text-overflow:ellipsis; overflow:hidden;
			width:100%;
		}		
		.img_comment_padding{
			float:left;
			padding-top:5%;
		}
		.txt_comment_padding{
			float:left;
			padding-top:5%;
			padding-bottom:1%;
			padding-left:5px;
			color:#848484;
			font-family : 'Pretendard-Medium';
		}
		.clear {
            both: clear;
        }
        .backBlue {
			background:url("/spring/images/camsns/backBlue.png");
			background-size: 100% 100%;
            background-position: center center;
            background-repeat: no-repeat;
		}
		
		.backRed {
			background:url("/spring/images/camsns/backRed.png");
			background-size: 100% 100%;
            background-position: center center;
            background-repeat: no-repeat;
		}
		
		.backYellow {
			background:url("/spring/images/camsns/backYellow.png");
			background-size: 100% 100%;
            background-position: center center;
            background-repeat: no-repeat;
		}
		
		.backGreen {
			background:url("/spring/images/camsns/backGreen.png");
			background-size: 100% 100%;
            background-position: center center;
            background-repeat: no-repeat;
		}
		
		.backSkyBlue {
			background:url("/spring/images/camsns/backSkyBlue.png");
			background-size: 100% 100%;
            background-position: center center;
            background-repeat: no-repeat;
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
		
		
		//검색
		function search(word){
			location.href="/spring/camsns/snsMain.action?word="+word;
		}


    })//onload

    </script>
</head>
<body>


 <div id="header">
        <div id="infoPage">
            <div id="txtBox">
                <div id="txtType">
					<div style="float:left;width:70%;height:38px;">자유게시판</div>
					<div style="float:left;height:38px;"><img src="/spring/images/mainIndex/home_btn_navy.png" style="padding-top:2px;height:35px;width:auto;" onclick="location.href='/spring/index.action'" /></div>
					<div class="clear"></div> 
                </div>
            </div>
            <div id="btnBox">
                <div id="btnType">
                   <input type="button" value="글쓰기" id="writeBtn" onclick="location.href='/spring/camsns/snsboard/writeBoard.action'" />
                </div>
            </div>
            <div class="clear"></div>
        </div>
    </div>
    <div id="container">
        <div id="searchContainer">
            <div id="searchBox">
                <div id="search">
					<div class="search_iconBox">
						<img src='/spring/images/camsns/search_icon.png' id="search_icon">
					</div>
					<div class="search_inputBox">
					   <input type="text" id="searchInput" placeholder="키워드를 검색해 보세요.">
					</div>
					<div class="clear"></div>
                </div>
				<div id="searchNotice">
					<div class="search_iconBox_notice">
						<img src='/spring/images/camsns/searchNotice.png' id="notice_icon">
					</div>
					<div class="search_inputBox" id="searchInputBoxNotice">
					   셔틀버스 관련 정보를 서로 공유하는 페이지입니다.
					</div>
					<div class="clear"></div>
				</div>
            </div>
        </div>
		<div id="contentsContainer">
			<c:forEach items="${boardDtoList}" var="boardDtoList">
			<!-- 게시글 반복-->
			<div class="contentsBox">
				<!-- 글번호-->
				<div class="content_category" onclick = "location.href='/spring/camsns/snsboard/snsboardview.action?boardSeq=${boardDtoList.snsboardSeq}'">
					<div class="postNo ${boardDtoList.categoryType}">#${boardDtoList.snsboardSeq}</div>
				</div>
				
				<!-- 글 제목-->
				<div class="content_title">
					<div class="postTitle" onclick="location.href='/spring/camsns/snsboard/snsboardview.action?boardSeq=${boardDtoList.snsboardSeq}'">${boardDtoList.snsboardSubject}
					<div class="postDate">${boardDtoList.snsboardRegdate}</div>
					</div>
					<div class="postShare">
						<img src="/spring/images/camsns/postShare.png" value="${boardDtoList.snsboardSeq}" name="${boardDtoList.snsboardSeq}" class="postShareImg shareBtn" onclick="clip(); return false;">
					</div>
					<div class="clear"></div>
					<div class="postContents">
						${boardDtoList.snsboardContent}
					</div>
				</div>
				
				<!-- 글 하단 -->
				<div class="content_bottom" onclick = "location.href='/spring/camsns/snsboard/snsboardview.action?boardSeq=${boardDtoList.snsboardSeq}'">
					<div class="comment_preview">
						<c:if test="${boardDtoList.commentFirst == null}"><div class="txt_padding">댓글이 없습니다</div></c:if>
						<c:if test="${boardDtoList.commentFirst != null}"><div class="img_padding"><img src="/spring/images/camsns/new.png"></div><div class="txt_padding">${boardDtoList.commentFirst}</div></c:if>
						
						<div class="clear"></div>
					</div>
					<div class="comment_cnt">
						<div class="img_comment_padding"><img src="/spring/images/camsns/comment_icon.png"></div><div class="txt_comment_padding"> ${boardDtoList.commentCnt}개</div>
						<div class="clear"></div>
					</div>
					<div class="clear"></div>
				</div>
			</div>
			<!-- 게시글 반복 끝-->
			</c:forEach>
			
		</div>
		

    </div>



</body>
</html>