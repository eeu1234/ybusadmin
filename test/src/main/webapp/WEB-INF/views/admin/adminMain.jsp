<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/inc/asset.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset=UTF-8">
<title>CAMBUS :: 대학선택</title>
 <link rel="stylesheet" type="text/css" href="/spring/css/bacisTheme.css" />
<style>
#universitySearch{
	width:50%;
	margin:0 auto;
	margin-top:10%;	
}
#universitySel{
	float:left;
	width:70%;
}
</style>
<script>

	function universitycrud(){
		location.href = "/spring/admin/universityCrud.action"
	}

	$(document).ready(function(){

		function search(){
		}

		 $("#universitySel").change(function(){
		      var b = $(this).val();
		      
		      if(b != -1){
		         
		         //선택한 학교명 받아오기
		         $.ajax({
		            type : "GET",
		            url : "/spring/polyline/universityMap.action",
		            data : "seq="+b,
		            success : function(data){

		               var list = $(data).find("item");

		               $(list).each(function(index,item){
		            	  name = $(item).find("name").text();
		            	  $(".nav .noDeco").text(name);
		               });
		               

		            },
		            error : function(){
		               alert("데이터 가져오는데 실패하였습니다.");
		            }

		         });//ajax

		      }//if

		 });//$("#universitySel").change(function()
		
	});

</script>
</head>

<body>

	<%@include file="/inc/top.jsp"%>
	
	
	<!-- content 몸통부분 -->
	<h1 class="menuTitle">관리자 학교 선택 화면</h1>

	<div id="container">
		<form method="POST" action="/spring/admin/adminMain1.action">
			<div id="universitySearch">
							<c:if test="${adto.adminLevel == '9999'}">
								<select id="universitySel" class="form-control" name="schoolName">
									<option value="-1">대학교를 선택하세요.</option>
									<c:forEach items="${university}" var="dto">
										<option value="${dto.universitySeq},${dto.universityName}">${dto.universityName}</option>
									</c:forEach>
								</select>
								<input type="submit" value="검색" onclick="search();" class="btn btn-primary" style="margin-left:5%;;">
							</c:if>
				</div>
		</form>
	</div>
</body>
</html>