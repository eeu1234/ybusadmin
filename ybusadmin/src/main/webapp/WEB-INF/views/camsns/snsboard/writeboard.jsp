<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
    <meta charset="UTF-8">
	<meta name="viewport" content="width=device-width,initial-scale=1">
    <title>자유게시판::글쓰기</title>
    <!-- import 시작 -->
<script src="https://code.jquery.com/jquery-1.12.4.min.js"
   integrity="sha256-ZosEbRLbNQzLpnKIkEdrPv7lOy9C27hHQ+Xp8a4MxAQ="
   crossorigin="anonymous"></script>
   <!-- ck에디터 -->
<script src="/spring/util/ckeditor/ckeditor.js"></script>

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
		font-family: "Pretendard-Regular";
		src:url(/spring/css/2022css/2022/Pretendard-Regular.subset.woff2) format("truetype");
		}	@font-face {
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
            margin-top:3%;
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
			height:34px;
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
			padding-top:2%;
		}
        #txtType{
            position: relative;
            font-weight: bold;
            color : #142637;
            text-align: left;
            font-size: 2em;
			padding-top:0.5%;
			padding-bottom:0.5%;
			font-family : 'Pretendard-Bold';

			
        }
        #btnType{
            position: relative;
            color : #142637;
            height:22px;
            margin-top:12px;
            float:right;
        }


        #writeCancel{
			border:0;
			outline:0;
			float:left;
			width:44px;
			height:22px;
            background-color:white;
            color:#142637;
            font-size:0.7em;
            border-radius: 50px;
			font-family : 'Pretendard-Medium';

        }
        #writeBlank{
        	float:left;
        	width:8px;
        	height:100%;
        }
		#writeConfirm{
			border:0;
			outline:0;
			float:left;
			width:44px;
			height:22px;
            background-color:#142637;
            color:white;
            font-size:0.7em;
            border-radius: 50px;
			font-family : 'Pretendard-Medium';

        }

        #searchContainer{
			position:relative;
            width:100%;
            
			padding-top:1%;
            margin: 0 auto;
        }
		#contentsContainer{
			position:relative;
			
			padding-top:3.5%;
		}
        #searchBox{
			position:relative;
			width:80%;
            height:500px;
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
		}
		.content_category{
			position:relative;
			width:14%;
            height:11.5%;
			margin-left:5%;
			margin-right:5%;
			text-align:center;
		}
		#search{
			position:relative;
			margin: 0 auto;
				
		}

		.search_inputBox{
			postion:relative;
			width:100%;
			background-color: #FAFAFC;
			border-radius:10px;
		}
		
		#selectCate{
			width:100%;
			height:100%;
			min-height:28px;
			border:transparent;
			background-color:transparent;
			font-size:0.7em;
		    color : #142637;
			font-weight:bold;
		}
		#titleBox{
			height:11%;
		}
		#titleInput{
			width:100%;
			height:100%;
			min-height:28px;
			border:transparent;
			background-color:transparent;
			font-size:0.7em;
		    color : #142637;
			font-weight:bold;
		}
		#titleInput::placeholder {
			width:100%;
			height:100%;
			color: #CBCBCB;
			font-family : 'Pretendard-Regular';
			padding-left:5%;
		}
		#contentsBox{
			height:85%;
			margin-top:4%;
		}
		#contentsInput{
			width:100%;
			height:100%;
			border:transparent;
			background-color:transparent;
			font-size:0.7em;
		    color : #142637;
			font-weight:bold;
		  	overflow: hidden;
		}
		#contentsInput::placeholder {
			padding-top:5%;
			width:100%;
			height:100%;
			color: #CBCBCB;
			font-family : 'Pretendard-Regular';
			padding-left:5%;
		}
		#floatAddImg{
			position:absolute;
			background-color:white;
			box-shadow: 0px 0px 10px #0F296B29;
			padding-top:2%;
			padding-bottom:1%;
			text-align:center;
			max-width:70px;
			top:78%;
			right:7%;
			width:22%;
			height:6%;
			border-radius:15px;
			color:#142637;
			font-size:0.8em;
			font-family : 'Pretendard-Medium';

		}		
		#addImgIcon{
			margin-left:12px;
			float:left;
			padding-top:2%;
		}		
		#addImgTxt{
			float:left;
			margin-left:5px;
			padding-top:2%;
		}
		#policy_box{
			width:90%;
			padding-left: 5%;
			padding-right: 5%;
			padding-top: 5%;
		}
		.policy_title{
			color:#00264D;
			font-family : 'Pretendard-Bold';
			font-size:0.7em;

		}
		.policy_contents{
			margin-top:1%;
			color:#707070;
			font-size:0.5em;
			font-family : 'Pretendard-Medium';
		}


		.filebox {
			position: relative;
			width: 90%;
			min-height: 80px;
			margin: 0 auto;
		}
		
		.filebox label {
			width: 100%;
			text-align: center;
			color: #999;
			font-size: inherit;
			line-height: normal;
			vertical-align: middle;
			background-color: #fdfdfd;


		}
		
		.filebox input[type="file"] { /* 파일 필드 숨기기 */
			position: absolute;
			width: 1px;
			height: 1px;
			padding: 0;
			margin: -1px;
			overflow: hidden;
			clip: rect(0, 0, 0, 0);
			border: 0;
		}
		
		.filebox.bs3-success label {
			background-color:white;
			box-shadow: 0px 0px 10px #0F296B29;
			padding-top:2%;
			padding-bottom:1%;
			text-align:center;
			bottom:5%;
			right:7%;
			width:22%;
			height:6%;
			border-radius:15px;
			color:#142637;
			font-size:0.8em;
			font-family : 'Pretendard-Medium';
		}

		#captcha{
			position: relative;
			margin:20px auto;
			text-align: center;
		}
		.clear {
            both: clear;
        }
    </style>
    <script>
	$(function() {
		
		
		$("#writeConfirm").click(function(){
			if($('#contentsInput').val() == null){
				alert("내용을 입력해 주세요.");
				return;
			}else{
				$('#contentsInput').val(); 
				$("#frm").submit();
			}
		})
		
	});
	
	//자동가입 방지문자 refresh
	function imgRefresh(){
		    $("#captchaImg").attr("src", "<%=request.getContextPath() %>/camsns/captcha?id=" + Math.random());
		}
</script>
</head>
<body>
    <div id="header">
        <div id="infoPage">
            <div id="txtBox">
                <div id="txtType">
                    글쓰기
                </div>
            </div>
            
                <div id="btnType">
                   <input type="button" value="취소" id="writeCancel" onclick="location.href='/spring/camsns/snsMain.action?universitySeq=1'" />
                   <div id = "writeBlank"></div>
                   <input type="button" value="완료" id="writeConfirm" />
                   <div class="clear"></div>
                </div>

            <div class="clear"></div>
        </div>
    </div>
    <div id="container">
    		<form action="/spring/camsns/snsboard/writeBoardOk.action" method="POST" id="frm"
			enctype="multipart/form-data">
        <div id="searchContainer">
            <div id="searchBox">
                <div id="search">
          			<select name="categoryVal" id="selectCate">
							<option value="">- 카테고리 선택 -</option>
							<c:forEach items="${categoryDtoList}" var="categorydto">
								<option value="${categorydto.categorySeq}">${categorydto.categoryName}</option>
							</c:forEach>
					</select> 
					<div class="search_inputBox" id="titleBox">
					   <input type="text" id="titleInput" name="subject"  maxlength="10" placeholder="제목">
					</div>
					<div class="search_inputBox" id="contentsBox">
					   <textarea id="contentsInput" placeholder="내용" rows="5" cols="30" name="content" ></textarea>
					</div>
					<div id="floatAddImg">

						<div class="filebox bs3-success">
							<label for="imgFileUpload">
								<div id="addImgIcon"><img src="/spring/images/camsns/addImgBtn.png" ></div>
								<div id="addImgTxt">첨부</div></label> 
							<input type="file"	id="imgFileUpload" name="imgFile">
						</div>
						<div class="clear"></div>
					</div>
                </div>
                
                
                <div id="captcha">
				<img src="/spring/camsns/captcha" id="captchaImg" alt="captcha img">
			
			
				<div id="typeCaptcha" style="height:50px;margin-top:10px;padding-left:10%;">
				 <div style="float:left;width:75%;height:100%;text-align:right;"><input type="text" placeholder="보안문자를 입력하세요" name="captcha" style="width:100%;height:30px;"></div> 
				 <div style="float:left;height:100%;"><img src="/spring/images/camsns/snsUtil/refreshBtn.png" style="margin-left:10px;height:35px;" onclick="imgRefresh()"></div>
				 <div class="clear"></div>
				</div>
				
				 <input type="hidden" name="userId" value="">
			</div>
            </div>
            </form>
            
        </div>
        
		<div id="policy_box">
			<div class="policy_title">
				자유게시판 이용수칙
			</div>
			<div class="policy_contents">
				셔틀버스 노선 외 지역 통학노선을 서로 공유하는 페이지입니다.<br>
				같은 지역의 학우들을 위해 바쁘시더라도 알고 있는 최강 루트를 공유해주시면 <br> 감사하겠습니다.
			</div>
			<br>
			<div class="policy_title">
				규칙 위반 사항
			</div>
			<div class="policy_contents">
				- 홍보 및 판매 관련 행위 금지<br>
				- 타인의 권리를 침해하거나 불쾌감을 주는 행위 금지<br>
				- 욕설, 비하, 차별, 혐오, 폭력 관련 내용을 포함하는 게시물 작성 금지<br>
			</div>
		</div>

    </div>
    <script>
	CKEDITOR.replace('contentsInput');
	</script>
</body>
</html>