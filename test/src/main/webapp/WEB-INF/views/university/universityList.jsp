<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/inc/asset.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset=UTF-8">
<title>Insert title here</title>
 <link rel="stylesheet" type="text/css" href="/spring/css/bacisTheme.css" />
<style>
#tbl1 {
	width: 100%;
	margin: 30px auto;
	line-height:50px;
}

#tbl1 th, #tbl1 td {
	text-align: center;
}



</style>
<script>

	$().ready(function(){

		$("#univAdd").click(function(){

			location.href="/spring/university/universityAdd.action";
			
		});
	});

	
	function edit(seq){

		location.href="/spring/university/universityEdit.action?seq="+seq;
		
		
	}

	function del(seq, name){
		
		if(confirm(name + "을 삭제하겠습니까?")){
			location.href="/spring/university/universityDel.action?seq="+seq;
		}

	}


	
</script>

</head>
<body>
	<%@include file="/inc/top.jsp"%>
	<h1 class="menuTitle">대학 목록</h1>
	<div id="container">
	
	<table id="tbl1" class="table-striped">
		<tr>
			<th>
			순번
			</th>
			<th>
			학교명
			</th>
			<th>
			전화번호
			</th>
			<th>
			위도
			</th>
			<th>
			경도
			</th>
			<th>
			도메인
			</th>
			<th>
			대학로고
			</th>
			<th colspan="2">
			버튼
			</th>
		</tr>
	<c:forEach items="${ulist}" var="udto" varStatus="status">
		<tr>
			<td>${status.count}</td>
			<td>${udto.universityName}</td>
			<td>${udto.universityTel}</td>
			<td>${udto.universityLatitude}</td>
			<td>${udto.universityLongitude}</td>
			<td>${udto.universityDomain}</td>
			<td>${udto.universityImg}</td>
		<td colspan="2"><input type="button" value="수정" class="btn btn-info" onclick="edit(${udto.universitySeq});">
		<input type="button" value="삭제"  class="btn btn-danger" onclick="del(${udto.universitySeq}, '${udto.universityName}');"></td>
		</tr>
	</c:forEach>
	</table>
		<div class="btnForm">
			<input type="button" id="univAdd" value="대학추가" class="btn btn-primary">
		</div>
	</div>
</body>
</html>