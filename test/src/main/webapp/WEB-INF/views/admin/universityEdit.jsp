<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/inc/asset.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset=UTF-8">
<title>Insert title here</title>
<script>
	$().ready(function(){


		init();
		
		$(".tel").change(function(){


			if($("#universityTel1").val()!=""){
				$("#universityTel").val($("#universityTel1").val()+"-"+$("#universityTel2").val()+"-"+$("#universityTel3").val());
			} else {

				$("#universityTel").val($('#universityTel2').val()+"-"+$('#universityTel3').val());

			}
			
			
		});
		
	});

	function init(){

		var result="${udto.universityTel}";
		var utel = result.split("-");


		if(utel.length<3){
			$("#universityTel2").val(utel[0].toString());
			$("#universityTel3").val(utel[1].toString());
		} else{
			$("#universityTel1").val(utel[0].toString());
			$("#universityTel2").val(utel[1].toString());
			$("#universityTel3").val(utel[2].toString());
		}

	}

	

</script>

</head>
<body>
	<%@include file="/inc/top.jsp"%>
	<h1> 대학 편집하기 </h1>
	
	<form method="POST" action="/spring/admin/universityEditOk.action">
		학교번호 : ${udto.universitySeq}<br>
		이름 : <input type="text" name="universityName"  value="${udto.universityName}" required><br>
		전화번호 : <input type="text" name="universityTel1" id="universityTel1" class="tel">-<input type="text" name="universityTel2" id="universityTel2" class="tel" required>-<input type="text" name="universityTel3"  id="universityTel3" class="tel" required><br>
		<input type="hidden" name="universityTel" id="universityTel">
		위도 : <input type="text" name="universityLatitude" value="${udto.universityLatitude}" required>
		경도 : <input type="text" name="universityLongitude" value="${udto.universityLongitude}" required>
		<input type="hidden" name="universitySeq" id="universitySeq" value="${udto.universitySeq}">
		<input type="submit" value="작성 완료" class="btn btn-primary">
	</form>
	
</body>
</html>