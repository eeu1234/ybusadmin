<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/inc/asset.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset=UTF-8">
<title>대학 추가</title>
<link rel="stylesheet" type="text/css" href="/spring/css/bacisTheme.css" />
<style>

#tblUniver{
	width:50%;
	margin:0 auto;
	text-align:center;
	line-height:50px;
}

	
	#tblUniver td:nth-child(1) { width: 10%;}
	#tblUniver td:nth-child(2) { width: 20%; }
	#tblUniver td:nth-child(3) { width: 5%; } 
	#tblUniver td:nth-child(4) { width: 20%; }
	#tblUniver td:nth-child(5) { width: 5%; }
	#tblUniver td:nth-child(6) { width:20%; }


</style>
<script>
	$().ready(
			function() {

				$(".tel").change(
						function() {
							if ($("#universityTel1").val() != "") {
								$("#universityTel").val(
										$("#universityTel1").val() + "-"
												+ $("#universityTel2").val()
												+ "-"
												+ $("#universityTel3").val());
							} else {

								$("#universityTel").val(
										$('#universityTel2').val() + "-"
												+ $('#universityTel3').val());

							}
			});
	});



	
</script>

</head>
<body>
	<%@include file="/inc/top.jsp"%>
	<h1 class="menuTitle">대학 추가하기</h1>
	
	<div id="container">
	<form method="POST" action="/spring/university/universityAddOk.action" enctype="multipart/form-data">
		<table id="tblUniver" class="table-striped">
			<tr>
			<td>대학명 :</td>
			<td colspan="5"><input type="text" name="universityName" id="universityName" required
				class="form-control"></td>
			</tr>
			
			<tr>
			<td>전화번호 :</td>
			<td><input type="text" name="universityTel1" id="universityTel1"
				class="tel form-control" maxlength="3"></td>
				<td>
				-
				</td>
			<td>	<input type="text" name="universityTel2" id="universityTel2"
				class="tel form-control" maxlength="4"  required></td>
				<td>
				-
				</td>
			<td>	<input type="text" name="universityTel3" id="universityTel3"
				class="tel form-control" maxlength="4" required>
				
				
				<input type="hidden" name="universityTel" id="universityTel"
				class="form-control"> 
				</td>
			</tr>
			<br> 
			
			<tr>
			<td>
				위도 :
			</td>
			<td colspan="5">
			<input type="text" name="universityLatitude" required
				class="form-control">
			
			</td>
			</tr>
			<tr>
			<td>
					 경도 :
				
			</td>
			
			<td colspan="5"><input type="text" name="universityLongitude"
					required class="form-control"></td>
			</tr>
		
			<br>
			<tr>
			<td>
				도메인 : 
			</td>
			<td colspan="5"><input type="text" name = "universityDomain" class="form-control"></td>
			</tr>
			<br>
			<tr>
			<td>
				로고 : 
			</td>
			<td colspan="5"><input type="file" name = "universityImg" class="form-control"></td>
			</tr>
			<br>
		</table>
		<div class="btnForm">
				<input type="button" value="되돌아가기" onclick="history.back();"
					class="btn btn-default" />
			<input type="submit" value="작성 완료" class="btn btn-primary">
		</div>
	</form>
</div>
</body>
</html>