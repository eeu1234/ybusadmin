<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="/inc/asset.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/spring/css/bacisTheme.css" />
<style>
#viewTable{
	vertical-align: middle;
	text-align: left;
}
#viewTable tbody  td{
	vertical-align: middle;
	text-align: left;
}
#busTimeTable {
	width: 900px;
	margin: 0px auto;
}

#scheduleHead {
	width: 850px;
	margin: 0px auto;
}

#scheduleHead div {
	width: 270px;
	float: left;
}

.timeContent {
	width: 850px;
}

.totalTable {
	margin: 0px auto;
}

.timeHeader {
	text-align: center;
	margin: 0px auto;
}

.timeLeft {
	width: 425px;
}

.btnSubmit {
	display: inline-block;
}
</style>
<script>

$(document).ready(function(){

	//dateType 24시간형태로 변경
/* 	$(".datetimepicker").datetimepicker({
        lang:'ko',
        format:'H:i'
    });
     */
	//카테고리 변경시 ajax 실행
	$("#category").change(function(){
		changeCategory();
	});
	
});

//대분류를 선택하면 소분류 가져오는 ajax 함수
function changeCategory(){
	
	var seq = $("#category").val();
	
	$.ajax({
		type:"POST",
		url:"/spring/admin/adminGetDetailCategory.action",
		dataType:"json",
		data: "busStopCategorySeq="+seq,
		success: function(data){
			
			//디테일 셀박스 초기화
			$("#detailCategory").html("");
			
			$(data).each(function(index, dto){
				
				$("#detailCategory").append("<option value='"+dto.busStopDetailCategorySeq+"'>"+dto.busStopDetailCategoryName+"</option>");
				 
			});

		},error(request, status, error){
			console.log("code = "+ request.status + " message = " + request.responseText + " error = " + error);
		}
	});
}

</script>


</head>
<body>
	<%@include file="/inc/top.jsp"%>
	<!-- 사용자 화면은 학교 주소로 들어오면 곧바로 해당 학교 seq를 session으로 고정 -->
	<h1></h1>
	<div id="container">
		<!-- 버스 시간표 -->
		<div id="busTimeTable">
			노선이 존재하지 않습니다. 노선을 추가해주세요.
		</div>
	</div><!-- container  -->
</body>
</html>