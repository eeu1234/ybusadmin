<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/inc/asset.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset=UTF-8">
<title>Insert title here</title>

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
					url: "/spring/admin/selBusInfo.action",
					data: "seq=" + selCateSeq,
					dataType: "json",
					success: function(data) {

						$(sel).parent().parent().children("td").eq(3).html("");
						$(sel).parent().parent().children("td").eq(4).html("");

				
						$(sel).parent().parent().children("td").eq(3).text(data.busInfoName);
						console.log();
						$(sel).parent().parent().children("td").eq(4).text(data.busStopCategory);
						
		
		
					}, error: function(request,status,error){
						console.log("code = "+ request.status + " message = " + request.responseText + " error = " + error);

					}
		
				});
			} else{
				$(sel).parent().parent().children("td").eq(3).html("");
				$(sel).parent().parent().children("td").eq(4).html("");
			}



		});



	});

/*  	function add(size){

		var seq = new Array(size);
		var tel = new Array(size);
		var category = new Array(size);
		var busNumber = new Array(size);
		for(var i = 0; i< size; i++){
			seq[i] = $("#tblDevice tr:nth-child("+(i+2)+")").children("input").val();
			var k = i+1;
			tel[i]= $("#deviceTel"+k).val();
			category[i]=$("#busStopCategory"+k).val();
			busNumber[i]= $("#busNumber"+k).val();
			
		}

		location.href="/spring/admin/busStopCategoryAddOk.action?seq="+seq+"&category="+category+"&busNumber="+busNumber;

		
		
	}
*/
	function add(seq) {
		var busSeq= $("#busInfoNum"+seq).val();
		var tel = $("#deviceTel"+seq).val();

		location.href="/spring/admin/deviceBusAddOk.action?seq="+seq+"&busInfoSeq="+busSeq+"&deviceTel="+tel;

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
			<th>버스번호</th>
			<th>버스닉네임</th>
			<th>대분류</th>
			<th></th>
		</tr>
		
		<c:forEach items="${dvList}" var ="dvdto">
		<tr>
			
			
			<td>${dvdto.deviceModel}</td>
			<td><input type="text" id="deviceTel${dvdto.deviceSeq}" placeholder="${dvdto.deviceTel}" name="deviceTel"></td>
			
			<td>
			<select id = "busInfoNum${dvdto.deviceSeq}" class="busInfoNum" name="busNumber">
				<option value="-1">선택</option>
				<c:forEach items="${busList}" var ="busdto">
				<option value="${busdto.busInfoSeq}">${busdto.busInfoNum}</option>
				</c:forEach>
			</select>
			</td>
			
			<td>버스 닉네임</td>
			<td>이전 대분류</td>
			
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
	</table>

	
	
</body>
</html>