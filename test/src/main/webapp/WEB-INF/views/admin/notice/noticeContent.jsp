<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/inc/asset.jsp"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
		height: 100%;
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
		float: left;
	}
	
	#down{
		border: 0px solid black;
		margin-top: 180px;
	}
	
	#titleDown{
		border: 1px solid black;
		width: 150px;
		height: 35px;
		font-size: 20px;
		font-weight: bold;
		text-align: center;
		margin-top: 5px;
		float: left;
		margin-left: 49px;
	}
	
	#down input{
		height: 35px;
		font-size: 18px;
		margin-top: 5px;
		margin-left: 5px;
		text-align: center;
	}
	
	#fileBox{
		width: 740px;
	}
	
	#imgTotal{
		border: 0px solid black;
	}
	
	#titleImg{
		border: 1px solid black;
		width: 150px;
		height: 150px;
		font-size: 20px;
		font-weight: bold;
		text-align: center;
		float: left;
	}
	
	#titleImg span{
		border: 0px solid black;
		position: relative;
		top: 55px;
	}
	
	#box{
		border: 0px solid black;
		width: 730px;
		height: 150px;
		margin-left: 155px;
		text-align: center;
	}
	
	#imgBox{
		border: 0px solid black;
		width: 100px;
		height: 150px;
		background-color: white;
		margin-left: 10px;
		float: left;
	}
	
	#imgBox #showImg{
		width: 100%;
		height: 100%;
	}


	
</style>
<script>


/* 
		
$(function(){
	
	$(".imageShow").click(function(){
		console.log($(this).val());

		var name = $(this).val();
		
		
		$("#showImg").attr("src","/spring/images/notice/"+name);
		$("#imgBox").css("display","inline");
	});

	
})
 */

</script>

</head>
<body>
	<%@include file="/inc/top.jsp"%>
	<!-- content 몸통부분 -->
	<div id="container">
		<h1 class="menuTitle">공지사항</h1>
	</div>

	
	<div id="totalBox">
		
			
				<div id="mainBox">
					<div id="topBox">
						<div id="titleSubject">제목</div><input type="text" name="subject" id="subject" value="${noticeContent.noticeSubject}" readonly>
					</div>
					<div id="imgTotal">
					<div id="titleImg"><span>이미지</span></div>
						<div id="box" style="overflow: scroll;">
							<c:forEach items="${noticeContent.filelist}" var="dto">
								<c:if test="${dto.noticeFileType=='png'||dto.noticeFileType=='jpg'||dto.noticeFileType=='jpeg'||dto.noticeFileType=='gif'||dto.noticeFileType=='bmp'||dto.noticeFileType=='PNG'||dto.noticeFileType=='JPG'||dto.noticeFileType=='JPEG'||dto.noticeFileType=='GIF'||dto.noticeFileType=='BMP'}">
									<a href="/spring/images/notice/${dto.noticeFileName}"><div id="imgBox"><img id="showImg" name="showImg" src="/spring/images/notice/${dto.noticeFileName}"></div></a>
								</c:if>
							</c:forEach>
						</div>
					</div>
					<div id="middleBox">
						<div id="titleContent">
							<span>내용</span>
						</div>
						<div>
							<textarea name="content" id="content" readonly>${noticeContent.noticeContent}</textarea>
						</div>
						
					</div>
					<div id="titleTime">시간</div><input type="text" name="regdate" id="regdate" value="${noticeContent.noticeRegdate}" readonly>
					</div>
			
				<div id="down">
					<div id="titleDown">파일명</div>	
					<div id="fileBox" style="overflow: scroll;">
						<c:forEach items="${noticeContent.filelist}" var="dto">
							<c:if test="${dto.noticeFileType!='png'&&dto.noticeFileType!='jpg'&&dto.noticeFileType!='jpeg'&&dto.noticeFileType!='gif'&&dto.noticeFileType!='bmp'&&dto.noticeFileType!='PNG'&&dto.noticeFileType!='JPG'&&dto.noticeFileType!='JPEG'&&dto.noticeFileType!='GIF'&&dto.noticeFileType!='BMP'}">
								<a href="/spring/images/notice/${dto.noticeFileName}" download><input type="button" name="downLoad" id="downLoad${dto.noticeFileSeq}" value="${dto.noticeFileName}" readonly class="btn btn-primary imageShow"></a>
							</c:if>
						</c:forEach>
					</div>					
					</div>
			
	</div>
	
	
</body>
</html>