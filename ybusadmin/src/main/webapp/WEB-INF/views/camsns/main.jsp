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
            height:12%;
			padding-top:1%;
            margin: 0 auto;
        }
		#contentsContainer{
			position:relative;
			padding-top:3.5%;
			padding-bottom:3.5%;
			
		}
        #searchBox{
			position:relative;
			width:80%;
            height:80%;
			padding-left:5%;
			padding-right:5%;
			padding-top:4%;
            background-color:white;
            border-radius:15px;
            box-shadow: 5px 10px 30px #e0e0e0;
			margin:0 auto;

        }
		.contentsBox{
			position:relative;
			width:90%;
            height:21%;
			padding-top:4%;
            background-color:white;
            border-radius:10px;
            box-shadow: 5px 10px 30px #e0e0e0;
			margin:0 auto;
			margin-bottom:5%;
			
		}
		.content_category{
			position:relative;
			width:14%;
            height:10.5%;
			margin-left:5%;
			margin-right:5%;
			text-align:center;
		}
        #search{
			position:relative;
			margin: 0 auto;
            height: 35%;
            background-color: #FAFAFC;
            border-radius:30px;
			padding-top:2%;
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
			postion:relative;
			float:left;
			width:10%;
			text-align:center;
			padding-top: 2px;
			padding-left: 5px;
		
		}
		.search_iconBox_notice{
			postion:relative;
			float:left;
			width:10%;
			text-align:center;
			
		}
		.search_inputBox{
			postion:relative;
			float:left;
			width:86%;
			

		}
		
		#search_icon{
			width:40%;
			margin:0 auto;
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
			font-size:0.3em;
		    color : #767676;
			font-family : 'Pretendard-Medium';
			
		}
		.postNoImg{
			position:relative;
			width:100%;
			height:100%;
		}
		.postNo{
			position:absolute;
			width:100%;
			top: 15%;
			text-align:center;
			color:#142637;
			font-weight:bold;
			font-size:0.5em;
			text-align:center;
			font-family : 'Pretendard-Medium';
		}
		
		.content_title{
			font-family : 'Pretendard-SemiBold';
			position:relative;
			width:90%;
            height:57%;
			text-align:left;
			margin-top:2%;
			margin-left:5%;
			margin-right:5%;
		}
		.postTitle{
			float:left;
			width:93%;
			font-size:1em;
			font-family : 'Pretendard-Bold';
			color:#00264D;
			
		}
		.postShare{
			position:relative;
			height:25%;	
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
			padding-top:5%;
			padding-bottom:5%;
			font-size:0.8em;
			color:#142637;
			font-family : 'Pretendard-Medium';
			
		}
		.postContents > p {
			width:95%;
			white-space: no-wrap;
			overflow: hidden;
			text-overflow: ellipsis;
		}
		
		.content_bottom{
			width:90%;
			padding-top:3%;
			padding-left:5%;
			padding-right:5%;
			background-color:#FAFAFC;
			border-radius: 0 0 10px 10px;
			height:21%;
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
			padding-top:1%;
			padding-bottom:1%;
			padding-left:5px;
			color:#848484;
			font-family : 'Pretendard-Medium';
			word-wrap:break-word; word-break:break-all; text-overflow:ellipsis; overflow:hidden;
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
    </style>
<script>
var index = 0; //글 5개씩 넘기기 위한 변수
var cntList = "${cntList}";// 총 글 갯수
var flag = false;//마지막 글 이후 ajax 요청 안하기위한 flag
var alertFlag =false;//마지막글 alert 창 1번만띄우는 flag


$(function() {
	if(cntList ==0){ $("#contentArea").html("글이 존재하지 않습니다.");}
	
	
	/* 검색 */
	$("#searchInput").keydown(function (key) {
		 
        if(key.keyCode == 13){//키가 13이면 실행 (엔터는 13)
			//검색 index 초기화
        	index = 0;        	
        	
	        var word = $(this).val();//검색어 가져옴
	        $("#contentsBox").html("");//기존 자료 초기화
	        search(word);//ajax
        }
 
    });


	share();//공유버튼인식
	

})//onload

function share(){
	/* 카카오톡 글 url 보내기 */
	$(".shareBtn")
			.click(
					function() {
						var name = $(this).attr('name');
						
						var boardSeq = $(this).val();
						var hostUrl = "http://ybus.kr";
						var shareUrl = "/spring/camsns/snsboard/snsboardview.action?boardSeq="	+ boardSeq;
						var url = hostUrl +shareUrl
						
						//함수실행
						sendLink(url,name);
						
					})
}

//검색
function search(word){
	location.href="/spring/camsns/snsMain.action?word="+word;
	
	/*
	$.ajax({
		type : "GET",
		url : "/spring/camsns/snsMain.action",
		dataType: "json",
		data : "word=" + word ,
		
		success: function(result){
			
			if (result.length != 0) {
			
				$.each(result, function(intValue, currentElement) {
					
						//console.log(intValue);
						//console.log(currentElement);
						//categoryType,boardSeq,boardCotent,boardRegdate,boardSubject
						//console.log(currentElement.boardCategoryName);
						//console.log(currentElement.boardCategoryName);
						var html ="";
						
						
						html += '<div class="area">';
						html += '<div class="contentHeader '+currentElement.category+'">';
						html += '<div class="contentNum">#'+currentElement.boardSeq+'</div>';
						html += '<div class="title">'+currentElement.boardSubject+'</div>';
						html += '<div class="shareArea">';
						html += '<button value="'+currentElement.boardSeq+'"'+'name="'+currentElement.boardSeq+'"';
						html += 'class="shareBtn glyphicon glyphicon-share-alt '+currentElement.category+' ">';
						html += '</button>';
						html += '</div>';
						html += '<div class="clear"></div>';
						html += '</div>';
						html += '<div class="content">';
						html += '<div class="contentRegdate">'+currentElement.boardRegdate+' </div>';
				

					 
						html += '<div class="contentPic">';
						
						
						 $.each(currentElement.fileList, function(key, file) {
								html += '	<img src="/spring/images/camsns/board/'+file.fileName+'" /> ';
							
							}); 
						
						
						
						
						html += '</div>';
					
						
						html += currentElement.boardContent;
						html += '</div>';
						html += '<div class="comment">';
						html += '<button class="showComment" onclick="location.href=\'/spring/camsns/snsboard/snsboardview.action?boardSeq='+currentElement.boardSeq+'\'">댓글 보기</button>';
						html += '</div>';
						html += '</div>';
						html += '</div>';
						

						$("#contentArea").append(html);
					

				});
				
			}else{//if(result!=0)
				$("#loading").hide();//값이없을경우
				$("#contentArea").html("결과가 없습니다.");
			}
		},//sucess
	    error: function(xhr, textStatus, error) {
		        alert('Error' + error);
	    }
	
		
	});//ajax
	*/
}
</script>
</head>
<body>


 <div id="header">
        <div id="infoPage">
            <div id="txtBox">
                <div id="txtType">
                    <img src="/spring/images/camsns/backBtn.png" style="height:20px;width:auto;" onclick="location.href='/spring/index.action'" /> 자유게시판
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
				</div>
            </div>
        </div>
		<div id="contentsContainer">
			<c:forEach items="${boardDtoList}" var="boardDtoList">
			<!-- 게시글 반복-->
			<div class="contentsBox">
				<!-- 글번호-->
				<div class="content_category">
					<img src="/spring/images/camsns/postNo.png" class="postNoImg">
					<div class="postNo">#${boardDtoList.snsboardSeq}</div>
				</div>
				
				<!-- 글 제목-->
				<div class="content_title">
					<div class="postTitle">${boardDtoList.snsboardSubject}
					<div class="postDate">${boardDtoList.snsboardRegdate}</div>
					</div>
					<div class="postShare">
						<img src="/spring/images/camsns/postShare.png" value="${boardDtoList.snsboardSeq}" name="${boardDtoList.snsboardSeq}" class="postShareImg shareBtn ${boardDtoList.categoryType}">
					</div>
					<div class="clear"></div>
					<div class="postContents">
						${boardDtoList.snsboardContent}
					</div>
				</div>
				
				<!-- 글 하단 -->
				<div class="content_bottom">
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




<script type="text/javascript">
//<![CDATA[
// 사용할 앱의 JavaScript 키를 설정해 주세요.
/* Kakao.init('497e3896cc14549676d2ada05a95e0fd'); */






  function sendLink(url,name) {
  Kakao.Link.sendTalkLink({
    label: '#'+name+'번째 이야기', // 공유할 메세지의 제목을 설정
			 image: {
    src: 'http://mud-kage.kakao.co.kr/14/dn/btqfJfuXWcY/P7iGH1pyo5w9X1pp8lf9Pk/o.jpg',
    width: '150',
    height: '150'
  } // 이건 썸네일을 설정 하는 겁니다.
			,
  webButton: {
    text: '글 보기',
     url : url // 각각의 포스팅 본문의 링크를 거는 코드입니다. 
  }
  });
}
//]]>
</script>
</body>
</html>