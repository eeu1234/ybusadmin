<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/inc/asset.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="/spring/css/bacisTheme.css" />
    <!-- <link href="https://fonts.googleapis.com/css?family=Roboto:300,400&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500&display=swap" rel="stylesheet"> -->
    <link rel="stylesheet" href="/spring/fonts/icomoon/style.css">
    <link rel="stylesheet" href="/spring/css/rome.css">`
    
    <!-- Bootstrap CSS -->
    <!-- <link rel="stylesheet" href="/spring/css/bootstrap.min.css"> -->
    <!-- Style -->
    
    <!-- datepicker 는 jquery 1.7.1 이상 bootstrap 2.0.4 이상 버전이 필요함 -->
	<!-- jQuery가 먼저 로드 된 후 datepicker가 로드 되어야함.-->
	<!-- <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" > -->
	
	
	<link rel="stylesheet" href="https://code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
  	<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
	<!-- <script src="/spring/js/popper.min.js"></script> -->
	<script src="/spring/js/bootstrap.min.js"></script>
	<script src="/spring/js/rome.js"></script>
	<script src="/spring/js/main.js"></script>

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
		<%= location %>
	</h1>	
		
			<div class="content">
    
    <div class="container text-left">
      
      <div class="row justify-content-center">
        <div class="col-md-10 text-center">
          <form method="GET" action="/spring/admin/adminFoodDetail.action">
          	<input type="hidden" value="<%=location%>" name="menuLocation">
          	<input type="hidden" class="form-control w-25 mx-auto mb-3" id="result" value="" name="date">
          	<div id="inline_cal"></div>
          	<input style="margin:100px;"type="submit" value="확인">
          </form>
          
        </div>
      </div>
          
    </div>
  </div>
  <!-- 우선 body 부분에 input tag를 하나 만들어준다. -->
   <!-- 시작시 기본 날짜 설정은 value를 이용 -->
   	
		


</body>

</html>