<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/inc/asset.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta id="_csrf" name="_csrf" th:content="${_csrf.token}" />
<meta id="_csrf_header" name="_csrf_header"
	th:content="${_csrf.headerName}" />
<meta charset=UTF-8">
<title>CAMBUS :: 대학선택</title>
 <link rel="stylesheet" type="text/css" href="/spring/css/bacisTheme.css" />
 <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<style>
#universitySearch{
	width:50%;
	margin:0 auto;
	margin-top:10%;	
}
#universitySel{
	float:left;
	width:70%;
}
#col{
	float: left; 
	height: 100%; 
	text-align:center;
	border: 1px solid;
}

#row{
	margin: 0 auto;
	height: 24%;
	border: 1px solid;
	display: flex;
	justify-content: center;
	align-items: center;
	
}

#input{
	margin: auto;
}
.ui-autocomplete {
z-index: 100;
}


</style>

</head>

<body>

	<%@include file="/inc/top.jsp"%>
	<% 
	String date = request.getParameter("date");
	String location = request.getParameter("menuLocation");
	String[] dayOfWeek = {"월", "화", "수", "목", "금"};
	%>
	
	<h1 class="menuTitle">학식 정보 관리</h1>
	<h1 id="category" style="float:right; width:200px; height:50px; margin:15px; text-align:center;">인성관</h1>	
	
		<div style="float: left; width: 99%; min-width: 1080px; margin: 5px;">
			<div id="col" style="width: 10%;">
				
				<h3 id="row" style="height:4%">코너/날짜</h3>
					<div id="row" style="background-color: #5580A2;">
						<h3 style="color: #EFEFEF">코너A</h3>
					</div>
					<div id="row" style="background-color: #5580A2;">
						<h3 style="color: #EFEFEF">코너B</h1>
					</div>
					<div id="row" style="background-color: #5580A2;">
						<h3 style="color: #EFEFEF">코너C</h1>
					</div>
					<div id="row" style="background-color: #5580A2;">
						<h3 style="color: #EFEFEF">코너D</h1>
					</div>
					
			</div>
			
			<form method="GET" action="/spring/admin/adminFoodUpdateCheck.action">
			<c:forEach items="${foodInfo}" var="dto" varStatus="var">
			<div id="col" style="width:18%;">
				<h3 id="row" style="height:4%;">${dto[0].date}</h3>
					<c:forEach items="${dto}" var="food" varStatus="var">
						<div id="row" style="flex-direction: column;">
							<input type="hidden" value="${food.date}" name="date">
							<input type="hidden" value="${food.menuCorner}" name="menuCorner">
							<input type="hidden" value="${food.menuLocation}" name="menuLocation">
							<input class="input" id="input" type="text" value="${food.menu1}" name="menu1">
							<input class="input" id="input" type="text" value="${food.menu2}" name="menu2">
							<input class="input" id="input" type="text" value="${food.menu3}" name="menu3">
							<input class="input" id="input" type="text" value="${food.menu4}" name="menu4">
							<input class="input" id="input" type="text" value="${food.menu5}" name="menu5">
							
						</div>
					</c:forEach>
			</div>
			</c:forEach>
			<button type="submit" style="float:right; width:120px; height:50px; margin:10px;"><h2 style="margin:5px;">수정</h2></button>
			</form>
			<button style="float:right; width:120px; height:50px; margin:10px;"><h2 style="margin:5px;" onclick="location.href='/spring/admin/adminFoodList.action?menuLocation=<%= location %>';">목록</h2></button>
		</div>
			
<script>
$('.input').autocomplete({
	source : function(request, response) { //source: 입력시 보일 목록
	     $.ajax({
	           url : "/spring/admin/wordSearchShow.action"   
	         , type : "GET"
	         , dataType: "JSON"
	         , data : {
	        	 value: request.term
	        	 }	// 검색 키워드
	         , success : function(data){  // 성공
	        	 console.log(data);
	        	 response(
	                 $.map(data, function(item) {
	                     return {
	                    	     label : item.value,   	// 목록에 표시되는 값
	                    	     value : item.value 		// 선택 시 input창에 표시되는 값
	                     };
	                 })
	             );    //response
	         }
	         ,error : function(data){ //실패
	        	 
	             alert("오류가 발생했습니다.");
	         }
	     });
	}
	,focus : function(event, ui) { // 방향키로 자동완성단어 선택 가능하게 만들어줌	
			return false;
	}
	,minLength: 1// 최소 글자수
	,autoFocus : true // true == 첫 번째 항목에 자동으로 초점이 맞춰짐
	,delay: 100	//autocomplete 딜레이 시간(ms)
	,select : function(evt, ui) { 
      	// 아이템 선택시 실행 ui.item 이 선택된 항목을 나타내는 객체, lavel/value/idx를 가짐
			console.log(ui.item.label);
			console.log(ui.item.idx);
	 }
});
</script>
</body>
</html>