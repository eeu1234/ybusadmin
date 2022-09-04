<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="UTF-8">
	<meta name="viewport" content="width=device-width,initial-scale=1">
    <title>공지사항::글쓰기</title>
	<!-- import 시작 -->
<script src="https://code.jquery.com/jquery-1.12.4.min.js"
	integrity="sha256-ZosEbRLbNQzLpnKIkEdrPv7lOy9C27hHQ+Xp8a4MxAQ="
	crossorigin="anonymous"></script>
	<!-- ck에디터 -->
<script src="/spring/util/ckeditor/ckeditor.js"></script>
    <style>
		@font-face {
		font-family: "Pretendard-Bold";
		src:url(/spring/css//fonts/2022/Pretendard-Bold.woff) format("truetype");
		}
		}
		@font-face {
		font-family: "Pretendard-ExtraLight";
		src:url(/spring/css//fonts/2022/Pretendard-ExtraLight.woff) format("truetype");
		}
		@font-face {
		font-family: "Pretendard-Medium";
		src:url(/spring/css//fonts/2022/Pretendard-Medium.woff) format("truetype"); 
		}
		@font-face {
		font-family: "Pretendard-SemiBold";
		src:url(/spring/css//fonts/2022/Pretendard-SemiBold.woff) format("truetype");
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

        #container {
            position: relative;
            width: 90%;
            margin: 0 auto;
            margin-top:4%;
            background-color:white;
            border-radius:15px;
            box-shadow:5px 10px 30px #e0e0e0;
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

        #titleContainer{
        	padding:4% 5% 0 5%;
        }

        #titleBox{

        }
		#postNo{
			height:16px;
			line-height:16px;
			color:#142637;
			font-weight:bold;
			font-size:0.5em;
			text-align:center;
			font-family : 'Pretendard-Medium';
			max-width:50px;
		}
		#postCateBgImg{
			height:100%;
		}
		#noComent{
			font-family : 'Pretendard-Medium';
			text-align:center;
			font-size:0.9em;
		}
		
        #title{
			position:relative;
			margin: 0 auto;
			margin-top:1%;
			text-align:left;
			font-family : 'Pretendard-Bold'; 
			font-size : 0.9em;
			color:#00264D;
        }      
		#titleInfo{
			padding-top:3px;
			padding-bottom:6%;
			color:#B4B4B4;
			font-family: "Pretendard-Medium";
			font-size:0.8em;
			
		}
		#contentsBox{
			font-size:0.8em;
			margin-bottom:5%;	
			font-family: "Pretendard-Medium";
		}

		#commentBox{
			float:right;
			width:18%;
		}
		#commentImg{float:left;margin-right:8%;}
		#commentCnt{float:left;font-size:0.75em;color:#142637;font-family: "Pretendard-Medium";}
		.commentContentsBox{margin-top:15%;padding:4% 5%;border-top: 1px solid #0F296B1F;}
		.commentWriter{color:#00264D;font-family : 'Pretendard-Bold'; font-size : 0.9em;padding-bottom:3px;}
		.commentContents{float:left;color:#707070;font-family : 'Pretendard-Medium'; font-size : 0.85em;}
		.commentDate{float:right;color:#707070;font-family : 'Pretendard-Medium'; font-size : 0.7em;}
		.mainComment{width:100%;margin-bottom:2%;padding-bottom:3%;border-bottom: 1px solid #0F296B1F;}
		#footerContents{
			width:100%;
			padding-top:2%;
			padding-bottom:2%;
			background-color:#FAFAFC;
			border-radius: 0 0 15px 15px;

		}
		#btnFooterGroup{
			width:100%;
			height:100%;
		}

		#leftFooter{position:relative;width:90%;padding:5%;}
				
		.titleInput{
			width:90%;
			height:35px;
			border:transparent;
			background-color:white;
			font-size:0.7em;
		    color : #142637;
			font-weight:bold;
			border-radius:10px;
			padding:1px 0;
			border-radius:10px 0 0 10px;
		}
		#titleInput::placeholder {
			width:100%;
			height:100%;
			color: #CBCBCB;
			font-family : 'Pretendard-Regular';
			padding-left:5%;
		}
		.sendButton{
			float:right;
			width:10%;
			height:37px;
			text-align:center;
			background-color:white;
			border-radius: 0 10px 10px 0;
		}
	
		.clear {
            clear: both;
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
    
      <script>
	$(function() {
		

		
		$("#commConfirm").click(function(){
			//if(CKEDITOR.instances.content.getData().length < 1){
				if($('#content').val().length < 1){
				alert("내용을 입력해 주세요.");
				return;
			}else{
				$("#content").val(); 
				$("#frm").submit();
			}
			
		});
		
	});
		 </script>
		
		

</head>
<body>
    <div id="header">
        <div id="infoPage">
            <div id="txtBox">
                <div id="txtType">
                    <img src="/spring/images/camsns/backBtn.png" style="height:20px;width:auto;" onclick="location.href='/spring/camsns/snsMain.action'" /> 자유게시판
                </div>
            </div>
            <div id="btnBox">
                <div id="btnType">
                   <input type="button" value="글쓰기" id="writeBtn"	onclick="location.href='/spring/camsns/snsboard/writeBoard.action'" />
                </div>
            </div>
            <div class="clear"></div>
        </div>
    </div>
    <div id="container">
        <div id="titleContainer">
            <div id="titleBox">
				<div id="postNo" class = "${boardDto.categoryType}">
					#${boardDto.snsboardSeq}
				</div>
				<div id="title">${boardDto.snsboardSubject}
					<img src="/spring/images/camsns/postShare.png" style="float:right;width: 6%;" onclick="clip(); return false;">
				</div>
				<div id="titleInfo">${boardDto.snsboardRegdate}</div>
            </div>
			<div id="contentsBox">
				<c:forEach items="${listFile}" var="fileDto">
				<img src="/spring/images/camsns/board/${fileDto.snsboardfileFileName}" style="width:80%;height:auto;"><br><br>
				 
				</c:forEach>
				${boardDto.snsboardContent}
			</div>
			<div id="commentBox">
				<div id="commentImg"><img src="/spring/images/camsns/comment_icon.png"></div>
				<div id="commentCnt">${boardDto.commentCnt}개</div>
				<div class="clear"></div>
			</div>
			<div id="clear"></div>			
			<div class="commentContentsBox">
				<c:if test = "${clist.size() == 0}">
					<div id = "noComent">
						댓글이 없습니다. 댓글을 달아보세요!
					</div>
				</c:if>
				<c:forEach items="${clist}" var="cdto">
					<div class="mainComment">
					<div class="commentWriter">관리자</div>
					<div class="commentContents">
					<c:if test="${cdto.snscommentFilename != null}">
					 	<c:if test="${cdto.snscommentFilename != ''}"> 
							<div style="width:100%;text-align:center;margin-bottom:10spx;">
								<img src="/spring/images/camsns/comment/${cdto.snscommentFilename}" style="margin-top:10px;margin-bottom:10px;" />
							</div>
					 	</c:if> 
				 	</c:if> 
					${cdto.snscommentContent}
					</div>
					<div class="commentDate">${cdto.snscommentRegdate}</div><div class="clear"></div>
					</div>
				</c:forEach>
				</div>
				
			</div>			

			
			
			<div id="footerContents">
				<div id="btnFooterGroup">
					<div  id="leftFooter">
					<form  action="/spring/snsboard/addComment.action" method="POST"  enctype="multipart/form-data" id="frm">
						<input type="hidden" value="${boardDto.snsboardSeq}" name="snsboardSeqFk">
						<input type="textarea" class='titleInput'id="content" name="snscommentContent" placeholder="내용을 입력하세요">
						<div class = "sendButton" id="commConfirm">
							<img src="/spring/images/camsns/sendBtn.png" style='height:22px;margin-top:7.5px;'></div>
						</div>
					<div class="clear"></div>
					</form>
				</div>
			</div>
        </div>


    </div>
    <script>
/*
    CKEDITOR.replace('content',{
		width:'100%',
		height:'35px',
		toolbar :['/']
	});
	*/
	</script>
</body>	

</html>