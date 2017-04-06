<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="/inc/asset.jsp"%>
<style>
#content {
	position: relative;
	width: 100%;
	max-width: 600px;
	margin: 0 auto;
	text-align: center;
	margin-top: 10%;
}

#tbl1 {
	width: 100%;
	margin: 30px auto;
}

#tbl1 th, #tbl1 td {
	text-align: center;
}

#tbl1 th {
	width: 50%;
}

#tbl1 td {
	width: 50%;
}

#submitBtn {
	width: 100%;
	text-align: center;
}
</style>

<script>

var beforeCheck = false;
var afterCheck = false;

$(document).ready(function(){
	
	//기존 비밀번호 확인
	$("#beforeCheck").change(function(){
		
		var pw = $("#beforeCheck").val();
		console.log(pw);
		$.ajax({
			type:"GET",
			url:"/spring/admin/adminBeforePwCheck.action",
			data:"checkPw="+pw,
			success:function(data){
				if(data == 1){
					beforeCheck = true;
				}else{
					beforeCheck = false;
				}
			},error(){
				alert("비밀번호 확인 에러");
			}
		});

	});
	
	//새로운 비밀번호 비교확인
	$("#afterPw1").change(function(){
		
		var pw = $("#afterPw1").val();
		var pw2 = $("#afterPw2").val();
		
		if(pw == pw2){
			afterCheck = true;
			$("#checkPw").text("비밀번호 일치").css("color","blue");
		}else{
			afterCheck = false;
			$("#checkPw").text("비밀번호 비일치").css("color","red");
		}

	});
	
	//새로운 비밀번호 비교확인
	$("#afterPw2").change(function(){
		
		var pw = $("#afterPw1").val();
		var pw2 = $("#afterPw2").val();
		
		if(pw == pw2){
			afterCheck = true;
			$("#checkPw").text("비밀번호 일치").css("color","blue");
		}else{
			afterCheck = false;
			$("#checkPw").text("비밀번호 비일치").css("color","red");
			$("#afterPw2").val("");
		}

	});

	
});

//기존, 새로운 둘 다 true 경우 수정 시작
function updateOk(){

	if(beforeCheck && afterCheck){
		if(confirm("수정하시겠습니까?")){
			$("#updateForm").submit();
		}
	}else{
		alert("비밀번호를 다시 확인해주세요.");
	}
	
}

</script>

</head>
<body>
	<%@include file="/inc/top.jsp"%>
	<div id="content">
		<form id="updateForm" action="/spring/admin/adminUpdateOk.action" method="POST">
			<h1>회원정보 수정</h1>
			<table id="tbl1" class="table table-striped">
				<tr>
					<th>아이디</th>
					<td>${dto.adminID}<input type="hidden" value="${dto.adminID}"
						name="adminID" />
					</td>
				</tr>
				<tr>
					<th>기존 비밀번호</th>
					<td><input type="password" value=""
						id="beforeCheck" class="form-control" required/></td>
				</tr>
				<tr>
					<th>새로운 비밀번호</th>
					<td><input type="password" value=""
						id="afterPw1" class="form-control" required/></td>
				</tr>
				<tr>
					<th>새로운 비밀번호 확인</th>
					<td><input type="password" value=""
						id="afterPw2" name="adminPassword" class="form-control" required />
						<span id="checkPw"></span></td>
				<tr>
					<th>이름</th>
					<td><input type="text" value="${dto.adminName}"
						class="form form-control" name="adminName" required/></td>
				</tr>
				<tr>
					<th>부서</th>
					<td><input type="text" value="${dto.adminDepartment}"
						class="form form-control" name="adminDepartment" required/></td>
				</tr>
				<tr>
					<th>등급</th>
					<td><input type="text" value="${dto.adminLevel}"
						class="form form-control" name="adminLevel" required/></td>
				</tr>
			</table>
			<div id="submitBtn">
				<input type="button" value="되돌아가기" onclick="history.back();"
					class="btn btn-default" /> 
				<input type="button" value="수정하기"
					class="btn btn-primary" onclick="updateOk();"/>
			</div>
		</form>
	</div>
	<!-- content -->

</body>
</html>