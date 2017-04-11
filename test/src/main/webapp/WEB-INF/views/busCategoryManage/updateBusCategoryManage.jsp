<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/inc/asset.jsp"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="initial-scale=1.0, user-scalable=no">
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
html, body {
   width: 100%;
   height: 100%;
   margin: 0 auto;
   padding: 0;
}
#searchForm {
   border: 0px solid gray;
   width: 90%;
   height: auto;
   margin: 0 auto;
}
#searchForm select {
   margin-top: 10px;
}

 #buscategory {
   float: left;
   width: 35%;
   height: 80px;
}

</style>

<script>

$().ready(function(){

	$("#busCategorySel").change(function() {
             var b = $(this).val();

             if (b != -1) {
                //alert(b);
                //선택한 버스분류 seq를 서버에 전송 -> 노선분류 목록 받아오기
                $.ajax({
                	type : "GET",
                    url : "/spring/busCategoryManage/detailCategory.action",
                    data : "seq=" + b,
                    success : function(data) {

                         $("#busDetailCategorySel").html("<option value='-1'>중분류를 선택하세요</option>");
                         $("#busDetailCategorySel").append("<option value='null'>미배정</option>");

                         //jQuery XMl제어
                         //1. data : XMLDocument객체
                         //2. find() : 태그검색
                         var list = $(data).find("item");
                         //alert(list.length);

                         $(list).each(function(index,item) {
                               var seq = $(item).find("seq").text();
                               var name = $(item).find("name").text();
                               //alert(seq);
                               // alert(name);

                               $("#busDetailCategorySel").append("<option value='"+seq+"'>" + name + "</option>");

                         });

                      },
                         error : function() {
                            alert("중분류 가져오는데 실패하였습니다.");
                         }
                      });//ajax
             }//if
	});
		
});

function updateBusCategory(){

	var busCategorySel = $("#busCategorySel").val();
	var busDetailCategorySel = $("#busDetailCategorySel").val();

	if(busCategorySel == -1 || busDetailCategorySel == -1){
		alert('선택하지 않은 항목이 있습니다.');
	}
	else{
		location.href = "/spring/busCategoryManage/updateBusCategory.action?seq="+${busInfo.busInfoSeq}+"&busCategorySel="+busCategorySel+"&busDetailCategorySel="+busDetailCategorySel;
	}
	
}



</script>

</head>
<body>
	<%@include file="/inc/top.jsp"%>
	<h1>${adto.universityName} 버스 매핑 페이지</h1>
	
	<h2>show상태인 버스 리스트</h2>
	<table id="showTable" class="table table-striped">
		<tr>
			<th>구분</th>
			<th>내용</th>
		</tr>
		<tr>
			<td>번호</td>
			<td>${busInfo.busInfoSeq}</td>
		</tr>
		<tr>
			<td>버스번호</td>
			<td>${busInfo.busInfoNum}</td>
		</tr>
		<tr>
			<td>버스이름</td>
			<td>${busInfo.busInfoName}</td>
		</tr>
		<tr>
			<td>대분류(버스분류)</td>
			<td>
				<select id="busCategorySel" class="form-control">
					<option value="-1">대분류를 선택해 주세요</option>
					<option value="null">미배정</option>					
					<c:forEach items="${busStopCategory}" var="dto">
						<option value="${dto.busStopCategorySeq}">${dto.busStopCategory}</option>
					</c:forEach>
				</select>
			</td>
		</tr>
		<tr>
			<td>중분류(노선분류)</td>
			<td>
				<select id="busDetailCategorySel" class="form-control">
					<option value="-1">중분류를 선택해 주세요</option>
				</select>
			</td>
		</tr>
	</table>
	
	<input type="button" class="btn btn-primary" value="수정" onclick="updateBusCategory();">
	<input type="button" class="btn btn-primary" value="돌아가기" onclick="location.href='/spring/busCategoryManage/busCategoryManage.action';">
	
	
</body>
</html>