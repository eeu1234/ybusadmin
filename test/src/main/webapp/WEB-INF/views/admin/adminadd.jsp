<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset=UTF-8">
<title>Insert title here</title>
<%@include file="/inc/asset.jsp" %>

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
					url: "/spring/admin/adminidcheck.action",
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

		//비밀번호 유효성 체크
		$("#pw2").change(function(){
			var pw1 = $("#pw1").val();
			var pw2 = $("#pw2").val();

			if(pw1 == pw2){
				isCheckPw = true;
				$("#checkPw").text("비밀번호 일치").css("color","blue");
			}else{
				$("#pw2").val("");
				isCheckPw = false;
				$("#checkPw").text("비밀번호를 다시 확인해주세요").css("color","red");
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
				$("#adminadd").submit();
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

</head>
<body>
	<!-- content 몸통부분 -->
	<div id="content">
		<form id="adminadd" action="/spring/admin/adminaddok.action" method="POST">
			<h1>계정 추가</h1>
			<table>
				<tr>
					<th>대학선택</th>
					<td>
						<select name="universitySeq">
							<c:forEach items="${ulist }" var="dto">
							<option value="${dto.universitySeq}">${dto.universityName}</option>
							</c:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<th>아이디</th>
					<td>
						<input type="text" id="adminID" name="adminID" required/>
						<span id="checkID"></span>
					</td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input type="password" id="pw1" required/></td>
				</tr>
				<tr>
					<th>비밀번호 확인</th>
					<td>
						<input type="password" id="pw2" name="adminPassword" required>
						<span id="checkPw"></span>
					</td>
				</tr>
				<tr>
					<th>이름</th>
					<td><input type="text" id="adminName" name="adminName" required></td>
				</tr>
				<tr>
					<th>부서</th>
					<td><input type="text" id="adminDepartment" name="adminDepartment" required></td>
				</tr>
				<tr>
					<th>직급</th>
					<td><input type="text" id="adminLevel" name="adminLevel" required></td>
				</tr>
				<tr>
					<td rowspan="2">
						<input type="button" value="계정생성하기" onclick="add();"/>
						<input type="button" value="되돌아가기" onclick="history.back();"/>
					</td>
				</tr>
			</table>
		</form>
	</div><!-- content -->
	
</body>
</html>