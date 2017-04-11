<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/inc/asset.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset=UTF-8">
<title>Insert title here</title>

<style>

#tblDevice{
	margin-top: 30px;
}

.busInfoNum{
	width : 200px;
}
</style>
<script>
	$().ready(function(){
		$(".busInfoNum").change(function(){

			var selCateSeq = $(this).val();
			var sel = $(this); 
//			alert($(this).parent().parent().children("td").eq(3).html());
//			alert($(this).parent().parent().children("td").eq(4).html());
			var busInfoName;
			var busStopCategory;
			if(selCateSeq != -1){
				$.ajax({
					type:"GET",
					url: "/spring/device/selBusInfo.action",
					data: "seq=" + selCateSeq,
					dataType: "json",
					success: function(data) {

						$(sel).parent().parent().children("td").eq(4).html("");
						$(sel).parent().parent().children("td").eq(5).html("");

				
						$(sel).parent().parent().children("td").eq(4).text(data.busInfoName);
						console.log();
						$(sel).parent().parent().children("td").eq(5).text(data.busStopCategory);
						
		
		
					}, error: function(request,status,error){
						console.log("code = "+ request.status + " message = " + request.responseText + " error = " + error);

					}
		
				});
			} else{
				$(sel).parent().parent().children("td").eq(4).html("");
				$(sel).parent().parent().children("td").eq(5).html("");
			}



		});



	});


	function add(seq) {
		var busSeq= $("#busInfoNum"+seq).val();
		var tel = $("#deviceTel"+seq).val();

		location.href="/spring/device/deviceBusAddOk.action?seq="+seq+"&busInfoSeq="+busSeq+"&deviceTel="+tel;

	}

</script>


</head>
<body>
	<%@include file="/inc/top.jsp" %>
	<h1>디바이스 리스트</h1>

	<table id="tblDevice"  class="table table-striped" >
		<tr>
			<th>기기번호</th>
			<th>전화번호</th>
			<th>기존버스</th>
			<th>버스번호</th>
			<th>버스닉네임</th>
			<th>대분류</th>
			<th>관리</th>
		</tr>
		
		<c:forEach items="${dvList}" var ="dvdto">
		<tr>
			
			
			<td>${dvdto.deviceModel}</td>
			<td><input type="text" id="deviceTel${dvdto.deviceSeq}" placeholder="${dvdto.deviceTel}" name="deviceTel" class="form-control"></td>
			<td>${dvdto.busInfoName}</td>
			<td>
			<select id = "busInfoNum${dvdto.deviceSeq}" class="busInfoNum form-control" name="busNumber">
				<option value="-1">선택</option>
				<c:forEach items="${busList}" var ="busdto">
				<%-- <c:if test="${dbdto.busInfoName}==${busdto.busInfoName}">
					equals();
				</c:if> --%>
				<option value="${busdto.busInfoSeq}">${busdto.busInfoNum}</option>
				</c:forEach>
			</select>
			</td>
			
			<td></td>
			<td></td>
			
			<%-- 
			<td>
			<select id="busStopCategory${dvdto.deviceSeq}" class="busStopCategory" name="busStopCategory">
				<option value="-1">카테고리 선택</option>
				<c:forEach items="${bsclist}" var="bsdto">
				<option value="${bsdto.busStopCategorySeq}">${bsdto.busStopCategory}</option>
				</c:forEach>
			</select>
			</td>
			--%>
			<td><input type="button" value = "확인" onclick="add(${dvdto.deviceSeq});" class="btn btn-primary"></td>
		</tr>
		</c:forEach>
		
		<c:forEach items="${dNList}" var ="dndto">
		<tr>
			
			
			<td>${dndto.deviceModel}</td>
			<td><input type="text" id="deviceTel${dndto.deviceSeq}" placeholder="${dndto.deviceTel}" name="deviceTel" class="form-control"></td>
			<td>${dndto.busInfoName}</td>
			<td>
			<select id = "busInfoNum${dndto.deviceSeq}" class="busInfoNum form-control" name="busNumber">
				<option value="-1">선택</option>
				<c:forEach items="${busList}" var ="busdto">
				<option value="${busdto.busInfoSeq}">${busdto.busInfoNum}</option>
				</c:forEach>
			</select>
			</td>
			
			<td></td>
			<td></td>
			
			<%-- 
			<td>
			<select id="busStopCategory${dvdto.deviceSeq}" class="busStopCategory" name="busStopCategory">
				<option value="-1">카테고리 선택</option>
				<c:forEach items="${bsclist}" var="bsdto">
				<option value="${bsdto.busStopCategorySeq}">${bsdto.busStopCategory}</option>
				</c:forEach>
			</select>
			</td>
			--%>
			<td><input type="button" value = "확인" onclick="add(${dndto.deviceSeq});" class="btn btn-primary"></td>
		</tr>
		</c:forEach>
		
	</table>

	
	
</body>
</html>