<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@include file="/inc/asset.jsp"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="initial-scale=1.0, user-scalable=no">
<meta charset="utf-8">
<title>학교 갈 땐 CAMBUS</title>
<!-- <link rel="stylesheet" type="text/css" href="/spring/css/bacisTheme.css" /> -->

<style>
html, body {
   width: 100%;
   height: 100%;
   margin: 0 auto;
   padding: 0;
}

#title {
   text-align: center;
   width:90%;
   
   margin: 10 auto;
}

#mapForm {
   width: 90%;
   height: 50%;
   margin: 0px auto;
}

#map {
   float: left;
   width: 75%;
   height: 100%;
}

#pano {
   float: left;
   width: 25%;
   height: 100%;
   position: relative;
   background-color:#eee;
}

#tbl {
   width: 90%;
   margin: 0 auto;
   margin-top: 5%;
}


#searchForm {
   border: 0px solid gray;
   width: 90%;
   height: auto;
   margin: 0 auto;
}

#searchForm h2 {
   text-align: center;
}

#searchForm select {
   margin-top: 10px;
}

 #university {
   float: left;
   width: 35%;
   height: 80px;
}

 #buscategory {
   float: left;
   width: 35%;
   height: 80px;
}

#detailCategory {
   float: left;
   width: 30%;
   height: 80px;
}

 .btnForm {
   width: 95%;
   height: 60px;
   text-align:right;
   margin-top:10%;
}

#tbl tbody tr{
	background-color: !important;
}

#tbl thead th{
	cursor: auto;
}

#tbl tbody td{
	cursor: s-resize;
}

</style>

<script type="text/javascript" src="/spring/js/jquery.tablednd.js"></script>


<script type="text/javascript">
   
$().ready(function(){
	$("#tbl").tableDnD();
	
	$("#tbl tr").mouseup(function(){
		//console.log($(this).children().eq(1).text());
		//console.log($("#tbl tbody tr").length);
		//테이블 tr사이즈만큼 돌리면서 순서대로 순서를 채워넣는다
		var trLength = $("#tbl tbody tr").length;

		//마우스를 떌떄마다 순서를 1 ~ 테이블 갯수만큼 초기화 해준다.
		for(var i=0; i<trLength ; i++){

			$("#tbl tbody tr").eq(i).children().eq(1).text(i+1);
		
		}

	});
	$("#tbl tbody tr").mouseup(function(){
		//$(this).css("background-color","white");

		$("#tbl tbody tr").css("background-color","");
	});
	
	$("#tbl tbody tr").mousedown(function(){
		$(this).css("background-color","orange");
	});
	

	//수정버튼을 누르면
	$("#frm").submit(function(){

		//테이블의 값들을 json으로 묶어서 컨트롤러로 보내야한다.
		//전체를 담아줄 객체를 설정

        var busStopList = new Array();

        //테이블 tr의 갯수만큼 포문을 돈다.
        for (var i = 1; i <= $("#tbl tbody tr").length; i++) {

           //하나의 정보를 저장할 JSONObject를 설정

           var busStop = new Object();

           busStop.seq = $( "#tbl tbody tr:nth-child(" + i + ")").children().eq(0).val();
           busStop.order = $("#tbl tbody tr:nth-child("+ i + ")").children().eq(1).text();
           busStop.name = $("#tbl tbody tr:nth-child("+ i + ")").children().eq(2).text();
           busStop.lat = $("#tbl tbody tr:nth-child(" + i + ")").children().eq(3).text();
           busStop.lng = $("#tbl tbody tr:nth-child(" + i + ")").children().eq(4).text();
           busStop.line = $("#tbl tbody tr:nth-child(" + i + ")").children().eq(5).text();
           busStopList.push(busStop);

        }

        //전체 JSONObject를저장할 메인JSONObjec객체를 설정하여 저장(키,벨류)
        //테이블의 값들 JSON
        var jsonInfo = JSON.stringify(busStopList);

        $("#frm").append("<input type='hidden' name='jsonInfo' value='"+ jsonInfo +"'>");
        $("#frm").append("<input type='hidden' name='detailCategorySelect' value='"+ ${seq} +"'>");

        //alert(jsonInfo);
        //alert(${seq});
		
	});
})



</script>



</head>

<body>
   <%@include file="/inc/top.jsp"%>
   <h1 class="menuTitle">${adto.universityName} 버스 정류장 관리페이지</h1>

   <form id="frm" method="POST" action="/spring/busStop/updateOrder.action">
   
   
   
      <table id="tbl" class="table table-striped">
         <thead>
            <tr>
               <th>정류장순서</th>
               <th>이름</th>
               <th>위도</th>
               <th>경도</th>
               <th>라인</th>
            </tr>
         </thead>
         <tbody>
         	<c:forEach items="${busStopList}" var="dto">
         		<tr>
         			<input type="hidden" name="seq${dto.busStopSeq}" value="${dto.busStopSeq}">
         			<td>${dto.busStopOrder}</td>
         			<td>${dto.busStop}</td>
         			<td>${dto.busStopLatitude}</td>
         			<td>${dto.busStopLongitude}</td>
         			<td>${dto.busStopLine}</td>
         		</tr>
         	</c:forEach>
         </tbody>
      </table>

   
      <div class="btnForm">
         <input type="submit" value="수정" class="btn btn-success" >
         <input type="button" value="돌아가기" class="btn btn-success" onclick="location.href='/spring/busStop/busStop.action'">        
      </div>

   </form>
</body>
</html>