<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/inc/asset.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset=UTF-8">
<title>공지사항</title>
<link rel="stylesheet" type="text/css" href="/spring/css/bacisTheme.css" />
<style>
	#totalBox{
		border: 1px solid black;
		width: 1000px;
		margin: 0px auto;
		height: 700px;
	}
	
	#totalBox #mainBox{
		border: 0px solid black;
		width: 900px;
		margin: 10px auto;
		height: 550px;
	}
	
	
	#totalBox #mainBox #topBox{
		margin-top: 10px;
		height: 50px;
	}
	
	#totalBox #mainBox #topBox #titleSubject{
		border: 1px solid black;
		width: 150px;
		height: 35px;
		font-size: 20px;
		font-weight: bold;
		text-align: center;
		margin-top: 5px;
		float: left;	
	}
	
	#totalBox #mainBox #topBox #subject{
		width: 730px;
		height: 35px;
		font-size: 18px;
		font-weight: bold;
		text-align: center;
		margin-top: 5px;
		margin-left: 5px;
	}
	
	#totalBox #mainBox #middleBox{
		margin-top: 10px;
		height: 470px;
	}
	
	#totalBox #mainBox #middleBox #titleContent{
		border: 1px solid black;
		width: 150px;
		height: 450px;
		font-size: 20px;
		font-weight: bold;
		text-align: center;
		margin-top: 5px;
		float: left;
	}
	
	#totalBox #mainBox #middleBox #titleContent span{
		border: 0px solid black;
		position: relative;
		top: 200px;
	}
	
	#totalBox #mainBox #middleBox #content{
		width: 730px;
		height: 450px;
		font-size: 18px;
		margin-top: 5px;
		margin-left: 5px;
	}

	#stuatsBox #titleStatus{
		border: 1px solid black;
		width: 150px;
		height: 35px;
		font-size: 20px;
		font-weight: bold;
		text-align: center;
		margin-top: 5px;
		float: left;	
	}
	
	#stuatsBox #statusSel{
		width: 200px;
		height: 35px;
		margin-top: 5px;
		margin-left: 5px;
		font-size: 20px;
		font-weight: bold;
		text-align: center;
		cursor: pointer;
	}
	
	#stuatsBox .btn{
		float: right;
		width: 80px;
		margin-right: 20px;
	}
	


	
</style>
<script>
$(document).ready(function() {

	
	$("#subject").focus();
	
 	$("#subject").keypress(function(e){
    	if(e.keyCode==13) return false;
 	 });


	
});
</script>

<!-- --------------------------------날짜/시간------------------------------------------------ -->

<link rel="stylesheet" href="/spring/css/jquery.simple-dtpicker.css">
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
<script src="//mugifly.github.io/jquery-simple-datetimepicker/jquery.simple-dtpicker.js"></script>
<script>
$(function(){
    $('.datetimepicker').appendDtpicker({'locale':'ko'});

   
});
</script>

</head>
<body>
	<%@include file="/inc/top.jsp"%>
	<!-- content 몸통부분 -->
	<div id="container">
		<h1 class="menuTitle">공지사항-글 수정하기</h1>
	</div>
	
	<div id="totalBox">
		<form method="POST" action="/spring/admin/notice/noticeUpdateOk.action">
			<div id="mainBox">
				<div id="topBox">
					<div id="titleSubject">제목</div><input type="text" name="subject" id="subject" value="${subject}">
				</div>
				<div id="middleBox"><div id="titleContent"><span>내용</span></div><textarea name="content" id="content">${content}</textarea></div>
				<div id="stuatsBox">
				<div id="titleStatus">상태값(${status})</div>
				
					<select id="statusSel" name="status">
						<option value="hide">hide</option>
						<option value="show">show</option>
					</select>
					<input type="submit" value="수정" class="btn btn-primary">
					<input type="hidden" value="${noticeSeq}" name="noticeSeq">
				</div>
			</div>
		</form>
	</div>
	
</body>
</html>