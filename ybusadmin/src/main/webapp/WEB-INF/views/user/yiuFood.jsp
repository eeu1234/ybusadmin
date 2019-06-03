<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
    


<html>
<head>
<!-- 모바일용웹 -->
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no, target-densitydpi=medium-dpi" />


<meta name="mobile-web-app-capable" content="yes">

<!-- 안드로이드 홈화면추가시 상단 주소창 제거 -->
<meta name="mobile-web-app-capable" content="yes">
<link rel="icon" href="/spring/images/ico/favicon.ico">
<!-- ios홈화면추가시 상단 주소창 제거 -->
<meta name="apple-mobile-web-app-capable" content="yes">
<!-- ico 아이콘-->
<link rel="apple-touch-icon" href="/mobile/Image/favicon.ico">

<!--모바일 스플래스 //아이폰용-->
<link rel="apple-touch-startup-image" href="images/loading_yongin.png">


<script
	src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.2.2/jquery.min.js'></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"
	integrity="sha256-Qw82+bXyGq6MydymqBxNPYTaUXXq7c8v3CwiYwLLNXU="
	crossorigin="anonymous"></script>


	
<script>

<c:if test="${universityDto.universitySeq} == 1">

	$(function(){
		$("#StudentHall").click(function(){
			  $.ajax({
			          type: 'get'
			        , url: '/spring/user/yiuFood.action'
			        , data : "searchValue="+'1'+"&universitySeq=${universityDto.universitySeq}"
					, dataType : 'text'
			        , success: function(data) {
			        	$("#listDiv").html(data);
			          }
			  });	
		})		
})

	$(function(){
		$("#domitori").click(function(){
			  $.ajax({
			          type: 'get'
			        , url: '/spring/user/yiuFood.action'
			        , data : "searchValue="+'2'+"&universitySeq=${universityDto.universitySeq}"
					, dataType : 'html'
			        , success: function(data) {
			        	$("#listDiv").html(data);
			          }
			  });	
		})		
})

	$(function(){
		$("#Hwangyeong").click(function(){
			  $.ajax({
		          type: 'get'
	        	    , url: '/spring/user/yiuFood.action'
	        	    , data : "searchValue="+'3'+"&universitySeq=${universityDto.universitySeq}"
					, dataType : 'html'
			        , success: function(data) {
			        	$("#listDiv").html(data);
			          }
			  });	
		})		
});
</c:if>
<c:if test ="${universityDto.universitySeq} == 10020">
	
	$(function(){
		$("#StudentHall").click(function(){
			  $.ajax({
			          type: 'get'
			        , url: '/spring/user/yiuFood.action'
			        , data : "searchValue="+'051002050000'+"&universitySeq=${universityDto.universitySeq}&typeValue"+"36337"
					, dataType : 'text'
			        , success: function(data) {
			        	$("#listDiv").html(data);
			          }
			  });	
		})		
})

	$(function(){
		$("#domitori").click(function(){
			  $.ajax({
			          type: 'get'
			        , url: '/spring/user/yiuFood.action'
                 	, data : "searchValue="+'051002020000'+"&universitySeq=${universityDto.universitySeq}&typeValue"+"36548"
					, dataType : 'html'
			        , success: function(data) {
			        	$("#listDiv").html(data);
			          }
			  });	
		})		
})

	$(function(){
		$("#Hwangyeong").click(function(){
			  $.ajax({
		          type: 'get'
	        	    , url: '/spring/user/yiuFood.action'
	        	    , data : "searchValue="+'051002030000'+"&universitySeq=${universityDto.universitySeq}&typeValue"+"36550"
					, dataType : 'html'
			        , success: function(data) {
			        	$("#listDiv").html(data);
			          }
			  });	
		})		
});

	
	$(function(){
		$("#mjuProf").click(function(){
			  $.ajax({
		          type: 'get'
	        	    , url: '/spring/user/yiuFood.action'
	        	    , data : "searchValue="+'051002040000'+"&universitySeq=${universityDto.universitySeq}&typeValue"+"58976"
					, dataType : 'html'
			        , success: function(data) {
			        	$("#listDiv").html(data);
			          }
			  });	
		})		
});
	
</c:if>	
</script>
	

<style>
	body{
		margin:0px;
		
	}

	html {
		width: 100%;
		background-Color: #EB6F61;
		font-size: 0.6em;
		font-style: bold;
		
		background-repeat: no-repeat;
		background-size: cover;
	}
	#jb-header {

		top: 0;
		left: 0;
		width: 100%;
		height: 10%;
		background-color: white;
		
	
	}
	#jb-header img{
		margin-top:20px;	
		width:40%;
	}
	#jb-container {
		position: relative;
		top: 0;
		left: 0;
		width: 100%;
		margin: 0px auto;
		padding: 0;
		text-align: center;
	}

	#jb-content {
		width: 100%;
		float: left;
		height: 88%;
		margin: 0px;
	}
	#jb-footer {
		float: left;
		width: 100%;
		height: 8%;
		background-color: black;
		margin: 0px;
		padding: 0px;
	}
	table, tr {
		cellspacing: 0px;
		cellpadding: 0px;
	}
	td.head {
		font-style: bold;
		text-align: center;
	}
	td.second {
		width: 10px;
		background-Color: #ffe6f2;
		padding: 0px;
		spacing: 0px;
		text-align: center;
		color: grey;
	}
	td {
		color: black;
	}
	table {
		width: 100%;
		line-height: 21px;
		border-top: 1px solid #cccccc;
		border-left: 1px solid #cccccc;
		border-collapse: collapse;
	}
	table th, table td {
		color: #678197;
		border-right: 1px solid #cccccc;
		border-bottom: 1px solid #cccccc;
		padding-top: 10px;
		padding-bottom: 10px;
		background-color: #FFEEF4;
		font-style: bold;
		font-size: 0.7em;
	}
	.class td:nth-child(1) {
		font-size: 0.6em;
	}
}

</style>

<script>/*
		$(function(){
		$('input').click(function(){
				setTimeout(function(){
					$td = $('tr>td');
					
					for(var i=0;i<$td.length;i++){
						console.log($td[i].attr('class',className));
						//var td = $td[i].attr('class');
						if(td == null){
							console.log(td);
						}
					}
					
				},1000);
				
		})
	
	})*/	
</script>

<style>
#listDiv {
	width: 100%;
	height: auto;
	min-height: 100%;
	background-color: #EB6F61;
	margin: 0 auto;
	margin-top: 20%;
}

#StudentHall, #domitori, #Hwangyeong {
	width: 90%;
	height: 12%; /*--버튼 크기---*/
	background-size: cover;
	background-repeat: no-repeat;
	margin:0 auto;
	margin-top: 1%;
	max-width: 500px;
	max-height: 80px;
}

#StudentHall {
	background-image: url("/spring/images/food/insung_dining.png");
	background-repeat: no-repeat;
	background-size: cover;
}

#domitori {
	background-image: url("/spring/images/food/domitory_dining.png");
	background-repeat: no-repeat;
	background-size: cover;
}

#Hwangyeong {
	background-image: url("/spring/images/food/hawn_dining.png");
	background-repeat: no-repeat;
	background-size: cover;
}
</style>
</head>

<body>
	<div id="jb-container">
		<div id="jb-header">
			<img src="/spring/images/mainImage/mainLogo.png">
		</div>
		<div id="jb-content">
			<div style="position:relative;text-align:center;">
				<img src="/spring/images/food/icon_food.png" style="height:auto;width:100%;">
			</div>
			<!--학생회관-->
			<div style="position:relative;">
				<input type="button" id="StudentHall" />
				<input type="button" id="domitori" /> 
				<input type="button" id="Hwangyeong" />
			</div>
			<div id="listDiv"></div>


			<div id="footer" style="background-color: black; z-index: 900;">
				<img src="/spring/images/food/bottom_bar.png"
					style="width: 100%; height: 10%;&gt;
			&lt;/div&gt;
		&lt;/div&gt;
		&lt;div style="clear:both;">

			</div>
</body>

</html>



