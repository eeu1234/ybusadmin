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
	
	#titleTime{
		border: 1px solid black;
		width: 150px;
		height: 35px;
		font-size: 20px;
		font-weight: bold;
		text-align: center;
		margin-top: 5px;
		float: left;
	}
	
	#regdate{
		height: 35px;
		font-size: 18px;
		margin-top: 5px;
		margin-left: 5px;
		text-align: center;
	}


	
</style>
<script>



</script>

</head>
<body>
	<%@include file="/inc/top.jsp"%>
	<!-- content 몸통부분 -->
	<div id="container">
		<h1 class="menuTitle">공지사항</h1>
	</div>

	
		<div id="totalBox">
		<form method="POST" action="/spring/admin/notice/noticeAddOk.action">
			<div id="mainBox">
				<div id="topBox">
					<div id="titleSubject">제목</div><input type="text" name="subject" id="subject" value="${subject}" readonly>
				</div>
				<div id="middleBox"><div id="titleContent"><span>내용</span></div><textarea name="content" id="content" readonly>${content}</textarea></div>
				<div id="titleTime">시간</div><input type="text" name="regdate" id="regdate" value="${regdate}" readonly>
			</div>
		</form>
	</div>
	
	
</body>
</html>