<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri ="http://java.sun.com/jsp/jstl/core" %>
<%@include file="/inc/asset.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/spring/css/bacisTheme.css">
<style>
#universityName{
	width : 300px;
}

#tbl{
	margin-top: 30px;
}

.new-device-text, .new-phone-text {
	text-indent: 20px;
	width: 30%;
	height: 34px;
	margin-right: 20px;
}

.new-school-text {
	width: 30%;
    padding-top: 4px;
	height: 34px;
	display: inline-block;
	margin-right: 20px;
}

.ok-btn {
	float: right;
}
</style>
<script>
	$().ready(function(){

		


	});
	
	
	//장비 임의추가 2019-05-11 gper 업데이트 
	function newDevice() {
		var result = true;
		
		if($('#newDeviceText').val() == "") {
			alert('기기명을 입력해주세요.');
			result = false;
			return false;
		}
		if($('#newPhoneText').val() == "") {
			alert('전화번호를 입력해주세요.');
			return false;
		}
		
		if($('#newSchoolText').val() == "-1") {
			alert('학교명을 입력해주세요.');
			return false;
		}
		
		$('.device-model').each(function(index, item) {
			console.log($(item).val());
			if($(item).val() == $('#newDeviceText').val()) {
				alert('장비명이 중복됩니다.');
				result = false;
				return false;
			}
		});
		if(result) {
			location.href="/spring/deviceInfoManage/addDevice.action?deviceModel="+ $('#newDeviceText').val() +"&deviceTel="+ $('#newPhoneText').val()+"&universitySel="+$('#newSchoolText').val();
			alert("추가완료!");
		}
	}
	function update(seq) {
		if($("#universitySel"+seq).val() == -1){
			alert("대학교를 선택해주세요");
			return false;
		}
		if(confirm("수정하시겠습니까?")){
			location.href="/spring/deviceInfoManage/updateDeviceInfoManage.action?seq="+seq+"&deviceModel="+ $("#deviceModel"+seq).val() +"&deviceTel="+ $("#deviceTel"+seq).val()+"&universitySel="+$("#universitySel"+seq).val();
		}

	}

	function deleteDevice(seq) {
		
		if(confirm("삭제하시겠습니까?")){
			location.href="/spring/deviceInfoManage/deleteDeviceInfoManage.action?seq="+seq;
		}

	}
	


</script>

</head>
<body>

	<%@include file="/inc/top.jsp"%>
	<h1 class="menuTitle">디바이스 관리 페이지</h1>
	<div id="newDeviceDiv" class="new-device-div">
		<input type="text" id="newDeviceText" class="new-device-text" placeholder="장비명을 입력해주세요."/>
		<input type="text" id="newPhoneText" class="new-phone-text" placeholder="전화번호를 입력해주세요."/>
		<select id="newSchoolText" class="form-control new-school-text">
			<option value="-1">대학교를 선택하세요</option>
			<option value="null">미배정</option>
			<c:forEach items="${universityList}" var="udto">
				<option value="${udto.universitySeq}">${udto.universityName}</option>
			</c:forEach>
		</select>
		<input type="button" id="newBtn" class="btn btn-primary ok-btn" value="추가" onclick="newDevice();">
	</div>
	<table id = "tbl" class="table table-striped">
		<tr>
			<th>기기번호</th>
			<th>기기명</th>
			<th>전화번호</th>
			<th>기존학교명</th>
			<th>수정학교명</th>
			<th>관리</th>
		</tr>
	<c:forEach items="${diviceList}" var ="dto">
		<tr>
			<td>${dto.deviceSeq}</td>
			<td><input type="text" class="form-control device-model" id="deviceModel${dto.deviceSeq}" value="${dto.deviceModel}"></td>
			<td><input type="text" class="form-control" id="deviceTel${dto.deviceSeq}" value="${dto.deviceTel}"></td>
			<td>${dto.universityName}</td>
			<td>
				<select id="universitySel${dto.deviceSeq}" class="form-control">
					<option value="-1">대학교를 선택하세요</option>
					<option value="null">미배정</option>
					<c:forEach items="${universityList}" var="udto">
						<option value="${udto.universitySeq}">${udto.universityName}</option>
					</c:forEach>
				</select>
			</td>
			<td>
				<input type="button" id = "sel${dto.deviceSeq}" value="적용" onclick="update(${dto.deviceSeq});" class="btn btn-primary" >
				<input type="button" id = "del${dto.deviceSeq}" value="삭제" onclick="deleteDevice(${dto.deviceSeq});" class="btn btn-danger" >
			</td>
		</tr>
	</c:forEach>
	</table>
</body>
</html>