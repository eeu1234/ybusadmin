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
		height: 680px;
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
	
	#totalBox #mainBox #bottomBox .btn{
		width: 80px;
		float: right;
		margin-right: 20px;
	}
	
	#totalBox #mainBox #bottomBox #btnFile{
		border: 0px solid black;
		width: 250px;
		float: left;
		cursor: pointer;
	}
	
	.file #filename{
		cursor: pointer;
		font-weight: bold;	
	}

</style>
<script>
$(document).ready(function() {

	//제목 포커스
	$("#subject").focus();

	//엔터 제한
 	$("#subject").keypress(function(e){
    	if(e.keyCode==13) return false;
 	 });

  	//제목 제한
	$('#subject').on('keyup', function() {

			if ($(this).val().length > 15) {
				
				$(this).val($(this).val().substring(0, 15));
				alert("글자수가 초과하였습니다.(공백포함 최대 15자입니다.)");
			}
	});
	 
  	//내용 제한
	$('#content').on('keyup', function() {

			if ($(this).val().length > 2000) {

				$(this).val($(this).val().substring(0, 2000));
				alert("글자수가 초과하였습니다.(공백포함 최대 2000자입니다.)");

			}
		});
	
  	

});

  	//용량체크
    function fileCheck(fileValue)
    {
  		
    	if(CKEDITOR.instances.content.getData().length < 1){
			alert("내용을 입력해 주세요.");
			return;
		}else{
			$("#content").val(CKEDITOR.instances.content.getData()); 
			$("#frm").submit();
		}

        //확장자 체크
        var src = getFileType(fileValue);
  	
        if((src.toLowerCase() == "exe"))
        {
            alert("exe 파일로 올릴수 없습니다.");
            return;
        }
        
        //사이즈체크
        var maxSize  = 5242880;    //5MB 5 * 1024 * 1024
        var temp = 0;
        var fileSize = 0;
        
       	for(var i=0; i<filename.files.length; i++){
        temp = filename.files[i].size;
        	//alert(temp);        	
	    fileSize = fileSize + temp;
	        //alert(fileSize);        	
        }        
       	//alert(fileSize);
       	
        if(fileSize > maxSize) {
            alert("첨부파일 사이즈는 5MB 이내로 등록 가능합니다.");
            return;
        }
        
		if ($('#subject').val().length < 1) {
			alert("제목글의 글자수가 최소 1자리 이상 작성해주세요.(공백포함 최대 15자입니다.)");
			return;
		} else

		if ($('#content').val().length < 1) {
			alert("내용글의 글자수가 최소 1자리 이상 작성해주세요.(공백포함 최대 2000자입니다.)");
			return;
			
			
		} else {
			//alert(filename.files.length+"개의 파일을 업로드합니다."); 
       		frm.submit();
		}   
    }

    //◈◈ 파일 확장자 확인 ◈◈◈◈◈◈◈◈◈◈◈◈◈◈◈◈◈
    function getFileType(filePath)
    {
        var index = -1;
            index = filePath.lastIndexOf('.');
        var type = "";
        if(index != -1)
        {
            type = filePath.substring(index+1, filePath.len);
        }
        else
        {
            type = "";
        }
        return type;
    }

</script>

</head>
<body>
	<%@include file="/inc/top.jsp"%>
	<!-- content 몸통부분 -->
	<div id="container">
		<h1 class="menuTitle">공지사항-글쓰기</h1>
	</div>
	
	<div id="totalBox">
		<form method="POST" action="/spring/admin/notice/noticeAddOk.action" enctype="multipart/form-data" name="frm" id="frm">
			<div id="mainBox">
				<div id="topBox">
					<div id="titleSubject">제목</div><input type="text" name="subject" id="subject">
				</div>
				<div id="middleBox"><textarea name="content" id="content"></textarea></div>
				<div id="bottomBox">
		<div id="files">
			<div class="file"><input type="file" name="filename" id="filename" multiple="multiple"></div>
		</div>
		

					<input type="button" value="저장" class="btn btn-primary" onclick="fileCheck(document.frm.filename.value);">
					<a href="/spring/admin/notice/notice.action"><input type="button" value="돌아가기" class="btn btn-default"></a>
				</div>
			</div>
		</form>
	</div>
	<script>
	CKEDITOR.replace('content');
	</script>

</body>
</html>