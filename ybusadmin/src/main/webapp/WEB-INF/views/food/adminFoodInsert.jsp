<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/inc/asset.jsp"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
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


</style>

</head>

<body>

	<%@include file="/inc/top.jsp"%>
	<% 
	Calendar cal = Calendar.getInstance();
	DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
	Date nDate = null;
	String date = request.getParameter("date");
	nDate = df.parse(date);
	cal.setTime(nDate);
	int i = 0;
	String location = request.getParameter("menuLocation");
	String[] dayOfWeek = {"월", "화", "수", "목", "금"};
	String[] corner = {"A", "B", "C", "D"};
	%>
	
	<h1 class="menuTitle">학식 정보 관리</h1>
	<h1 id="category" style="float:right; width:200px; height:50px; margin:15px; text-align:center;"><%= location %></h1>
	
		<div style="float: left; width: 99%; margin: 5px;">
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
			
			<form method="GET" action="/spring/admin/adminFoodInsertCheck.action">
			<c:forEach var="i" begin="0" end="4">
			<div id="col" style="width:18%;">
				<% i = 0; %>
				<h3 id="row" style="height:4%;"><%=df.format(cal.getTime()) %></h3>
					<c:forEach var="j" begin="0" end="3">
						<div id="row" style="flex-direction: column;">
							<input type="hidden" value="<%=df.format(cal.getTime()) %>" name="date">
							<input type="hidden" value="<%=corner[i]%>" name="menuCorner">
							<input type="hidden" value="<%= location %>" name="menuLocation">
							<input id="input" type="text" value="" name="menu1">
							<input id="input" type="text" value="" name="menu2">
							<input id="input" type="text" value="" name="menu3">
							<input id="input" type="text" value="" name="menu4">
							<input id="input" type="text" value="" name="menu5">
							
						</div>
						<%i++; %>
					</c:forEach>
					<% cal.add(Calendar.DATE, 1);%>
			</div>
			</c:forEach>
			<button type="submit" style="float:right; width:120px; height:50px; margin:10px;"><h2 style="margin:5px;">수정</h2></button>
			</form>
			<button style="float:right; width:120px; height:50px; margin:10px;"><h2 style="margin:5px;" onclick="location.href='/spring/admin/adminFoodList.action?menuLocation=<%= location %>';">목록</h2></button>
		</div>
		
	
	
	
			
<script>
/* $('#autoComplete').autocomplete({
	source : function(request, response) { //source: 입력시 보일 목록
	     $.ajax({
	           url : "/ajax/autocomplete.do"   
	         , type : "POST"
	         , dataType: "JSON"
	         , data : {value: request.term}	// 검색 키워드
	         , success : function(data){ 	// 성공
	             response(
	                 $.map(data.resultList, function(item) {
	                     return {
	                    	     label : item.SEARCH_WORD    	// 목록에 표시되는 값
	                           , value : item.SEARCH_WORD 		// 선택 시 input창에 표시되는 값
	                           , idx : item.SEQ // index
	                     };
	                 })
	             );    //response
	         }
	         ,error : function(){ //실패
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
}); */
</script>	
</body>
</html>