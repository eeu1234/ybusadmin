<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="/inc/asset.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset=UTF-8">
<title>Insert title here</title>
<script>
	$().ready(function(){
/* 
		$(".busStopCategory").change(function(){
			var b=$(this).val(); 

			if(b != -1){
				$.ajax({
					type:"GET",
					url: "/spring/admin/busstopdetailcategory.action",
					data: "seq=" + b,
					success: function(data) {

						
						
						var bsdclist = $(data).find("item");

						$(".busStopDetailCategory").html("<option value='-1'>세부분류</option>");
					
						$(bsdclist).each(function(index, item){
							
							var seq = $(item).find("busStopDetailCategorySeq").text();
							var name = $(item).find("busStopDetailCategoryName").text();
		
							$(".busStopDetailCategory").append("<option value = "+seq+">"+name+"</option>");
		
						});
		
		
					},error: function (){
						alert("실패");
					}
		
				});
			}
		}); */
		
		
	});

	function busList(){

		location.href = "/spring/admin/deviceBusList.action";
	}

	function detailSave(seq){
		
		location.href="/spring/admin/busStopCategoryAddOk.action?seq="+seq+"&category="+$("#busStopCategory"+seq).val();

		/* "&dcategory="+$("#busStopDetailCategory"+seq); */

	}
	
	function clickSave(size){

		var seq = new Array(size);
		var category = new Array(size);
		for(var i = 0; i< size; i++){
			seq[i] = $("#tblDevice tr:nth-child("+(i+2)+")").children("input").val();
			var k = i+1;
			category[i]=$("#busStopCategory"+k).val();
		}

		location.href="/spring/admin/busStopCategoryAddOk.action?seq="+seq+"&category="+category;


	}
	

</script>
</head>
<body>
	
	<%@include file="/inc/top.jsp" %>
	
	<h1>디바이스 - 버스 관리</h1>
	<input type="button" value="리스트" onclick="busList();" >
	
	<table class="table table-striped" id = "tblDevice">
		<tr>
			<th>기기번호</th>
			<th>전화번호</th>
			<th>버스번호</th>
			<th>버스닉네임</th>
			<th>기존 대분류</th>
			<th>대분류</th>
			<!-- <th>중분류</th> -->
			
		</tr>
		<c:forEach items="${dbilist}" var= "dbdto">
		<tr>
			<input type="hidden" id = "busInfoSeq" name="busInfoSeq" value="${dbdto.busInfoSeq}">
			<td>${dbdto.deviceModel}</td>
			
			
			<td><input type="text" value="${dbdto.deviceTel}"/></td>
			<td><select name="" id="">
				<option value="${dbdto.busInfoNum}">${dbdto.busInfoNum}</option>
			</select></td>
			
			
			<td>${dbdto.busInfoName}</td>
			<td>${dbdto.busStopCategory}</td>
			<td>
			<select id="busStopCategory${dbdto.busInfoSeq}" name="busStopCategory" class="busStopCategory">
			<option value="-1">카테고리 선택</option>
			<c:forEach items="${bsclist}" var="bsdto">
				<option value="${bsdto.busStopCategorySeq}">${bsdto.busStopCategory}</option>
			</c:forEach>
			</select>
<%-- 			</td>
			<td>
			
			<select id="busStopDetailCategory${dbdto.busInfoSeq}" name="busStopDetailCategory" class="busStopDetailCategory">
			<option value='-1'>세부분류</option>
			
			</select>
			</td> --%>
			<%-- <input type="button" value = "확인" onclick="detailSave(${dbdto.busInfoSeq});"> --%>
		</tr>
		</c:forEach>
	</table>
	
	<input type="button" value= "확인" onclick = "clickSave(${dbilist.size()});">
	
	
	
</body>
</html>