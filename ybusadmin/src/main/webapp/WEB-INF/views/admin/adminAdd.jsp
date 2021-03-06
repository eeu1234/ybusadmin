<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/inc/asset.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset=UTF-8">
<title>Insert title here</title>

<script>
	var isCheckId = false;
	var isCheckPw = false;
	
	$().ready(function(){

		//아이디 유효성 체크
		$("#adminID").change(function(){
			
			var adminId = $("#adminID").val();
			//입력된 아이디 길이가 0 이면 사용 불가
			if(adminId.length != 0){
				
				$.ajax({
					type: "GET",
					url: "/spring/admin/adminIdCheck.action",
					data: "adminID="+adminId,
					success:function(date){
						if(date==1){
							$("#checkID").text("사용 불가능한 아이디 입니다.").css("color","red");
							isCheckId = false;
						}else{
							$("#checkID").text("사용 가능한 아이디 입니다.").css("color","blue");
							isCheckId = true;
						}
					},
					
					error:function(data){
						alert(data)
					}
					
				});//아이디유효성 ajax
				
			}else{
				$("#checkID").text("");
			}//if
				
		});//adminId change 함수
		
		//새로운 비밀번호 비교확인
		$("#pw1").change(function(){
			var pw1 = $("#pw1").val();
			var pw2 = $("#pw2").val();

			if(pw1 != "" && pw2 != "" && pw1 != null && pw2 != null){
				if(pw1 == pw2){
					afterCheck = true;
					$("#checkPw").text("비밀번호 일치").css("color","blue");
				}else{
					afterCheck = false;
					$("#checkPw").text("비밀번호 비일치").css("color","red");
					$("#pw2").val("");
				}
			}else{
				$("#checkPw").text("비밀번호 공백").css("color","red");
				afterCheck = false;
			}

		});
		
		//비밀번호 유효성 체크
		$("#pw2").change(function(){
			var pw1 = $("#pw1").val();
			var pw2 = $("#pw2").val();

			if(pw1 != "" && pw2 != "" && pw1 != null && pw2 != null){
				if(pw1 == pw2){
					isCheckPw = true;
					$("#checkPw").text("비밀번호 일치").css("color","blue");
				}else{
					$("#pw2").val("");
					isCheckPw = false;
					$("#checkPw").text("비밀번호를 다시 확인해주세요").css("color","red");
				}
			}else{
				$("#checkPw").text("비밀번호 공백").css("color","red");
				afterCheck = false;
			}
		});//비밀번호 유효성 체크
		
	});//ready

	//계정 추가하는 함수, 아이디 유효성, 비밀번호 체크 둘 다 해야함.
	function add(){
		
		if(isCheckId && isCheckPw){

			var adminName = $("#adminName").val().length;
			var adminLevel = $("#adminLevel").val().length;
			var adminDepartment = $("#adminDepartment").val().length;
			//빈 공간 없을 시 submit 실행
			if(adminName != 0 && adminLevel != 0 && adminDepartment != 0){
				$("#adminAdd").submit();
			}else{
				if(adminName == 0){
					alert("이름을 입력하세요");
					$("#adminName").focus();
				}else if(adminDepartment == 0){
					alert("부서를 입력하세요");
					$("#adminDepartment").focus();
				}else if(adminLevel == 0){
					alert("직급을 입력하세요");
					$("#adminLevel").focus();
				}
			}
			
			
		}else{
			alert("아이디, 비밀번호 확인해주세요");
		}
		
	}//계정 추가 함수
	
</script>
<style>


#content{
	position:relative;
	width:100%;
	max-width: 600px;
	margin:0 auto;
	text-align:center;
	margin-top:10%;
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

#submitBtn{
	width:100%;
	text-align:center;
}
</style>
</head>
<body>
	<%@include file="/inc/top.jsp"%>

	<!-- content 몸통부분 -->
	<div id="content">
		<form id="adminAdd" action="/spring/admin/adminAddOk.action" method="POST">
			<h1>계정 추가</h1>
			<table id="tbl1" class="table-striped">
				<tr>
					<th>대학선택</th>
					<td>
						<select name="universitySeq" class="form-control">
							<c:forEach items="${ulist }" var="dto">
							<option value="${dto.universitySeq}">${dto.universityName}</option>
							</c:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<th>아이디</th>
					<td>
						<input type="text" id="adminID" name="adminID" required class="form form-control">
						<span id="checkID"></span>
					</td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input type="password" id="pw1" required class="form form-control"></td>
				</tr>
				<tr>
					<th>비밀번호 확인</th>
					<td>
						<input type="password" id="pw2" name="adminPassword" class="form form-control" required>
						<span id="checkPw"></span>
					</td>
				</tr>
				<tr>
					<th>이름</th>
					<td><input type="text" id="adminName" name="adminName" required  class="form form-control"></td>
				</tr>
				<tr>
					<th>부서</th>
					<td><input type="text" id="adminDepartment" name="adminDepartment" required class="form form-control"></td>
				</tr>
				<tr>
					<th>직급</th>
					<td><input type="text" id="adminLevel" name="adminLevel" required class="form form-control"></td>
				</tr>
			
			</table>
					<div id="submitBtn">
						<input type="button" value="되돌아가기" onclick="history.back();" class="btn btn-default"/>
						<input type="button" value="계정생성하기" onclick="add();" class="btn btn-primary"	 />
						</div>
		</form>
	</div><!-- content -->
	
</body>
</html>