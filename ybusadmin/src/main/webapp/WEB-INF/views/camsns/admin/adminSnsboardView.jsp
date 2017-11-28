<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 각종 임포트 -->
<%@include file="/inc/asset.jsp"%>

<title>Sns</title>



<style>

html,body {
	position: relative;
	margin: 0 auto;
	width: 100%;
	height:100%;
	max-width: 1440px;
}

#subMenu {
	width: 90%;
	height: 50px;
	margin: 0 auto;
}



#container {
	position: relative;
	margin: 0 auto;
	width: 100%;
	height: 100%;
}



.backBlue {
	background-color: #337AB7;
	border-color: #337AB7;
}

.backRed {
	background-color: #D9534F;
	border-color: #D9534F;
}

.backYellow {
	background-color: #F0AD4E;
	border-color: #F0AD4E;
}

.backGreen {
	background-color: #5CB85C;
	border-color: #5CB85C;
}

.backSkyBlue {
	background-color: #5BC0DE;
	border-color: #5BC0DE;
}





.contentArea {
	position: relative;
	width: 90%;
	height:auto;
	background-color: #D5D5D5;
	margin: 0 auto;
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
}

.shareArea {
	float: left;
	position: relative;
	width: 13%;
	height: 35px;
}

.shareBtn {
	width: 90%;
	height: 90%;
	color: white;
	border: 0px;
}

.content {
	position: relative;
	width: 100%;
	height: 20%;
	min-height: 200px;
	background-color: white;
	padding: 8px;
	box-shadow: 0px 7px 10px 0 silver inset;
}

.contentPic {
	position: relative;
	margin: 10px auto;
	width: 50%;
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

.comment {
	position: relative;
	padding: 7px;
	width: 100%;
	height: 5%;
	min-height: 60px;
	font-size: 0.8em;
	border-bottom:2px solid  #bfbfbf;
}



.addComment {
	width: 100%;
	height: 30px;
	margin-bottom:10px;
}

.commentText {
	float: left;
	width: 88%;
	height: 30px;
}


#picUpBtn {
	position: relative;
	float: left;
	width: 10%;
	height: 30px;
	color: gray;
	margin-left: 5px;
}

.clear {
	both: clear;
}

img {
	width: 100%;
	height: auto;
}

#picUpBtn label {
	width: 100%;
	height: 100%;
	display: inline-block;
	color: #999;
	text-align: center;
	padding-top: 0.1em;
	font-size: 1.5em;
	line-height: normal;
	background-color: #fdfdfd;
	cursor: pointer;
	border: 1px solid #ebebeb;
	border-bottom-color: #e2e2e2;
	border-radius: .25em;
}

#picUpBtn input[type="file"] { /* 파일 필드 숨기기 */
	position: absolute;
	width: 1px;
	height: 1px;
	padding: 0;
	margin: -1px;
	overflow: hidden;
	clip: rect(0, 0, 0, 0);
	border: 0;
}




/* 코멘트 */

.commentArea{
	position:relative;
	width: 100%;
	height: 100;
	max-width: 1440px;
	margin-bottom:8%;
	background-color:#dadada;
	 
}


.commInfo{
	position:relative;
	float:left;
	width:100%;
	height:30%;
	font-size:1em;
		background-color: #dadada;
	
}
.userEmail{
	float:left;
	width:50%;
	height:100%;
	background-color: #dadada;

	padding-top:0.5%;
	padding-left:2%;
	color: #3b5998;
	
	
	border-left: 2px solid;
    border-radius: 25px 0px 0px 0px;
	
}
.commRegdate{
	float:left;
	width:30%;
	height:100%;
	text-align:right;
	background-color: #dadada;

	padding-top:0.5%;
	padding-right:2%;
	color: #666;
}

.commDel{
	float:left;
	width:20%;
	height:100%;
	text-align:right;
	background-color: #dadada;
	
	
	color: #bfbfbf;
}
.commContent{
	position:relative;
	float:left;
	width:100%;
	height:100%;
	min-height:100px;
	
	background-color: #f6f7f9;
	margin:0 auto;
	padding-left:2%;
	padding-top:2%;
	border-bottom:2px solid #e5e5e5;
}

.commContent img{
	width:90%;
	height:auto;

}

</style>
<script>
var index = 0; //글 5개씩 넘기기 위한 변수
var cntList = "${cntList}";// 총 글 갯수
var flag = false;//마지막 글 이후 ajax 요청 안하기위한 flag
var alertFlag =false;//마지막글 alert 창 1번만띄우는 flag


$(function() {


	
	
});






function share(){
	/* 카카오톡 글 url 보내기 */
	$(".shareBtn")
			.click(
					function() {
						var name = $(this).attr('name');
						
						var boardSeq = $(this).val();
						var hostUrl = "http://cambus.kr/spring";
//						var hostUrl = "http://eeu1234.iptime.org:8090";
						var shareUrl = "/camsns/snsboard/snsboardview.action?boardSeq="	+ boardSeq;
						var url = hostUrl +shareUrl
						
						//함수실행
						sendLink(url,name);
						
					})
}


</script>
<script>
	$(function() {
		
		document.getElementById('picUpBtn').addEventListener("click", function() {
		    document.getElementById('snscommentFilename').click();
		}); 
		
		
		
		
		
		$(".blindBtn").change(function(){
			var commSeq = $(this).parents(".commentArea").children(".commentVal").text();
			
			if($(this).prop("checked") == true){
			       //run code
				//킬때
			//	console.log("킬때");
				valueSend('y',commSeq);
			       
				
			    }else{
			       //run code
			       //끌때
					valueSend('n',commSeq);
			    }
		});
		
		
		
		
	})
	
	function enterComment(seq){
		
		$(this).parent().parent().parent().submit();
	}
	
	
	
	
	//블라인드
	function valueSend(value,commSeq){
		$.ajax({
			type : "GET",
			url : "/spring/camsns/admin/commChangeBoard.action",
			dataType: "json",
			data : "value=" + value + "&commSeq=" + commSeq ,
			
			success: function(result){
				 
			
			
			}
		
		
		});
	}
</script>
</head>
<body>
	<%@include file="/inc/top.jsp"%>


	<div id="subMenu">
	<!-- 	<a href="javascript:location.href='/camsns/main.action'" id="newBoardBtn" class="glyphicon glyphicon-arrow-left"></a> --> 
		<a href="javascript:history.back()" id="newBoardBtn" class="glyphicon glyphicon-arrow-left"></a> 
	</div>
	<div id="container">
		<!-- 공지사항 -->
		<!-- 본문 글 쿼리 -->


		<div class="contentArea">

			<!-- 머리부분 -->
			<div class="contentHeader ${boardDto.categoryType}">
				<div class="contentNum">#${boardDto.snsboardSeq}</div>
				<div class="title">${boardDto.snsboardSubject}</div>

				<div class="shareArea">
				
				</div>

				<div class="clear"></div>
			</div>


			<div class="content">
				<div class="contentRegdate">${boardDto.snsboardRegdate}</div>
				<div class="contentPic">
					<!-- <img src="/images/ad1.JPG" /> -->
					<!-- 이미지있으면 띄우기 -->
				<c:forEach items="${listFile}" var="fileDto">
				<img src="/spring/images/camsns/board/${fileDto.snsboardfileFileName}" style="width:100%;height:auto;"><br><br>
				 
				</c:forEach> 
				</div>
				${boardDto.snsboardContent}
			</div>

			<div class="comment">
							<div class="addComment">
							<form  action="/spring/snsboard/addComment.action" method="POST"  enctype="multipart/form-data">
						
								<input type="hidden" value="${boardDto.snsboardSeq}" name="snsboardSeqFk">
								<input type="text" class="commentText form-control" id="content" name="snscommentContent" onkeydown="javascript: if(event.keyCode==13 ){enterComment(${boardDto.snsboardSeq});} "/>
	
		
								<div id="picUpBtn">
									<label for="ex_file" class="glyphicon glyphicon-camera">
									</label> <input type="file" id="snscommentFilename" name="snscommentFilename">
								</div>
							</form>
						</div>
			
						



	

		</div><!--comment  -->

 				 <c:forEach items="${clist}" var="cdto"> 
	
			<div class="commentArea">
				<div class="commentVal" style="display:none;">${cdto.snscommentSeq}</div>
				<div class="commInfo">
<!-- 					<div class="userEmail">${cdto.userEmailIdFk}</div> -->
					<div class="userEmail">Camsns</div>
					<div class="commRegdate">${cdto.snscommentRegdate}</div>
					<div class="commDel">
				<c:choose>
			   	   <c:when test="${cdto.snscommentBlind == 'y'}">
			          	<input type="checkbox" checked data-toggle="toggle" data-onstyle="danger" class="blindBtn" value="${dto.snsboardSeq}">	
			       </c:when>
			       <c:when test="${cdto.snscommentBlind == 'n'}">
			          	<input type="checkbox"  data-toggle="toggle" data-onstyle="danger" class="blindBtn" value="${dto.snsboardSeq}">	
			       </c:when>
			   </c:choose>
			   </div>
			   
						<!-- <button class="commDel">X</button> 삭제버튼--> 
					<div style="clear:both;"></div>
				</div>
				<div class="commContent">
				 <c:if test="${cdto.snscommentFilename != null}"> 
					<div style="width:100%;text-align:center;margin-bottom:10spx;">
									<img src="/images/comment/${cdto.snscommentFilename}" />
					</div>
				 </c:if> 
			 	<img src="/spring/images/camsns/comment/${cdto.snscommentFilename}" style="width:100px;height:auto;"><br><br>
				${cdto.snscommentContent}
				</div>
			</div>
			
		</c:forEach> 

	</div><!-- 컨텐츠아리아 -->



</div><!-- 컨테이너 -->
</body>
</html>