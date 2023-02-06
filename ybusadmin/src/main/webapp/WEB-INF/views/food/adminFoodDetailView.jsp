<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/inc/asset.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset=UTF-8">
<title>CAMBUS :: 대학선택</title>
 <link rel="stylesheet" type="text/css" href="/spring/css/bacisTheme.css" />
 <link rel="stylesheet" href="/spring/fonts/icomoon/style.css">
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
        <div style="float: right; width: 50%; height: 8%;">
        	<form method="GET" action="/spring/admin/adminFoodDetail.action">
        	<div style="width: 80%; margin: 0;float: left;">
					<select name="menuLocation" id="menuLocation" class="sel" style="margin-left:auto">
	 				<option value="인성관">인성관</option>
	 				<option value="환과대">환과대</option>
	 				<option value="생활관">생활관</option>
					</select>
          			<input type="text" id="date-picker" autocomplete='off' aria-label="Search" placeholder="Select date" aria-describedby="basic-addon2" th:value="|${year}-${month}-${day}|" name="date" class="sel" style="margin-left:auto">
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
	<div style="float: left; width: 100%; min-width: 1080px;">
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
			
			<c:forEach items="${foodInfo}" var="dto" varStatus="var">
			<div id="col" style="width:18%;">
				<h3 id="row" style="height:4%;">${dto[0].date}
				<c:if test="${dto[0].dayOfWeek eq '2'}">(월)</c:if>
				<c:if test="${dto[0].dayOfWeek eq '3'}">(화)</c:if>
				<c:if test="${dto[0].dayOfWeek eq '4'}">(수)</c:if>
				<c:if test="${dto[0].dayOfWeek eq '5'}">(목)</c:if>
				<c:if test="${dto[0].dayOfWeek eq '6'}">(금)</c:if>
				</h3>
					
						<c:forEach items="${dto}" var="food" varStatus="var">
						<div id="row" style="flex-direction: column;">
							<h4>${food.menu1}</h4>
							<h4>${food.menu2}</h4>
							<h4>${food.menu3}</h4>
							<h4>${food.menu4}</h4>
							<h4>${food.menu5}</h4>
						</div>
						</c:forEach>
					
			</div>
			</c:forEach>
		</div>
		</div>
		<form method="GET" action="/spring/admin/adminFoodUpdate.action">
							<td>
							<input type="hidden" value="<%= location %>" name="menuLocation">
							<input type="hidden" value="<%= date%>" name="date">
							<input style="float:right; width:120px; height:50px; margin:10px; font-size:30px; font-weight: 500;" type="submit" value="수정">
							</td>
		</form>
		</c:if>
		
	
	
	<!-- content 몸통부분 -->
<script>
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