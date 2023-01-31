<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/inc/asset.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="minimum-scale=1080px">
<link rel="stylesheet" type="text/css" href="/spring/css/bacisTheme.css" />
    <link rel="stylesheet" href="/spring/fonts/icomoon/style.css">
    <link rel="stylesheet" href="/spring/css/rome.css">`
	<link rel="stylesheet" href="https://code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
  	<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
	<!-- <script src="/spring/js/popper.min.js"></script> -->
	<script src="/spring/js/bootstrap.min.js"></script>
	<script src="/spring/js/rome.js"></script>
	<script src="/spring/js/main.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js" integrity="sha512-T/tUfKSV1bihCnd+MxKD0Hm1uBBroVYBOYSk1knyvQ9VyZJpc/ALb4P0r6ubwVPSGB2GvjeoMAJJImBG12TiaQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.min.css" integrity="sha512-mSYUmp1HYZDFaVKK//63EcZq4iFWFjxSL+Z3T/aCt4IO9Cejm03q3NKKYN6pFQzY0SBOr8h+eCIAZHPXcpZaNw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
	<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/locales/bootstrap-datepicker.ko.min.js" integrity="sha512-L4qpL1ZotXZLLe8Oo0ZyHrj/SweV7CieswUODAAPN/tnqN3PA1P+4qPu5vIryNor6HQ5o22NujIcAZIfyVXwbQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

<title>YBUS :: 학식메뉴</title>
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
</style>

</head>

<body>
<% 
	String location = request.getParameter("menuLocation");
%>
	<%@include file="/inc/top.jsp"%>
	
	<h1 class="menuTitle">학식 정보 관리</h1>
	<h1 style="float:right;width:100%; height:75px; margin:30px;text-align:right; ">
		
	</h1>	
	
	<div id="container1">
		
	
	</div>
		
	<div class="content">
    
    	<div class="container text-center">
      
      		<div class="row justify-content-center" style=" margin-left : 10%;">
        		<div class="col-md-10 text-center">
        		<form method="GET" action="/spring/admin/adminFoodDetail.action">
			<select name="menuLocation" class = "form-control w-25 mx-auto mb-3" id="menuLocation" class="form-control">
				<option value="9999">식당을 선택해주세요</option>
	 			<option value="인성관">인성관</option>
	 			<option value="환과대">환과대</option>
	 			<option value="생활관">생활관</option>
			</select>
          		<input type="text" id="date-picker" class="form-control bg-white border-0 small" aria-label="Search" placeholder="Select date" aria-describedby="basic-addon2" th:value="|${year}-${month}-${day}|" name="date">
          		
          	
          		<input style="margin:100px;"type="submit" value="확인">
          		

          	</form>
          
        </div>
      </div>
          
    </div>
  </div>
  <!-- 우선 body 부분에 input tag를 하나 만들어준다. -->
   <!-- 시작시 기본 날짜 설정은 value를 이용 -->
   	
		

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