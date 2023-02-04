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
	<link rel="stylesheet" href="/spring/css/rome.css">`
	<link rel="stylesheet" href="https://code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
  	<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
	<script src="/spring/js/bootstrap.min.js"></script>
	<script src="/spring/js/rome.js"></script>
	<script src="/spring/js/main.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js" integrity="sha512-T/tUfKSV1bihCnd+MxKD0Hm1uBBroVYBOYSk1knyvQ9VyZJpc/ALb4P0r6ubwVPSGB2GvjeoMAJJImBG12TiaQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.min.css" integrity="sha512-mSYUmp1HYZDFaVKK//63EcZq4iFWFjxSL+Z3T/aCt4IO9Cejm03q3NKKYN6pFQzY0SBOr8h+eCIAZHPXcpZaNw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
	<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/locales/bootstrap-datepicker.ko.min.js" integrity="sha512-L4qpL1ZotXZLLe8Oo0ZyHrj/SweV7CieswUODAAPN/tnqN3PA1P+4qPu5vIryNor6HQ5o22NujIcAZIfyVXwbQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
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

.sel {
	display: flex;
	width: 80%;
	height: 40%;
	margin: 1%;
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
	<div style="width:100%; float:left;">
	<div style="width:50%; float:left;"><h1 style="margin-left: 3%;"> <%= location %></h1></div>
        <div style="float: right; width: 50%; height: 8%;">
        	<form method="GET" action="/spring/admin/adminFoodDetail.action">
        	<div style="width: 80%; margin: 0;float: left;">
					<select name="menuLocation" id="menuLocation" class="sel" style="margin-left:auto">
					<option value="9999">식당을 선택해주세요</option>
	 				<option value="인성관">인성관</option>
	 				<option value="환과대">환과대</option>
	 				<option value="생활관">생활관</option>
					</select>
          			<input type="text" id="date-picker" autocomplete='off' aria-label="Search" placeholder="Select date" aria-describedby="basic-addon2" value="<%= date %>" name="date" class="sel" style="margin-left:auto">
          	</div>
          	<div style="width: 10%; margin: 0; float: left;">
          		<input style="float: right; margin:10px;" type="submit" value="확인">
          	</div>
          			
          	</form>  
     	</div>     
    </div>
    
    	<c:if test="${empty foodInfo[0] || foodInfo[0].size() == 0}">
		<div style="width:100%; float:left;">
		
		
		<h1>게시물이 존재하지 않습니다.</h1>
		<form method="GET" action="/spring/admin/adminFoodInsert.action">
							<td>
							<input type="hidden" value="<%= location %>" name="menuLocation">
							<input type="hidden" value="<%= date%>" name="date">
							<input style="float:right; width:120px; height:50px; margin:10px; font-size:30px; font-weight: 500;" type="submit" value="추가">
							</td>
		</form>
						
		</div>
	 	</c:if>
	 	
	 	<c:if test="${foodInfo[0].size() != 0}">
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
		</div>
		</c:if>
			
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

$(document).ready(function() {
    $('#date-picker').datepicker({
        format: "yyyy-m-dd",
        minViewMode: 0,
        daysOfWeekDisabled: "0,2,3,4,5,6",
        daysOfWeekHighlighted: "1",
        language: "ko",
        autoclose: true
    })

    $('#get-history').on('click', function() {
        const dateArr = $('#date-picker').val().split('-')
        location.href = '/history?year=' + dateArr[0] + '&month=' + dateArr[1]
    })
})

</script>
</body>
</html>