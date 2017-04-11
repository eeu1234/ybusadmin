<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="/inc/asset.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset=UTF-8">
<title>운행시간표</title>
<link rel="stylesheet" href="/spring/css/busStop.css">
<style>
	#busTimeTable{
		
		width: 100%;
		margin:0px auto;
		margin-top:5%;
	}
	#scheduleHead{
		width: 100%;
		margin:0px auto;
		margin-top:5%;
		text-align:center;
	}
	.timeContent{
		position:relative;
		width: 100%;
		margin-top:10%;
		border-bottom:1px solid grey;
	}
	.totalTable{
	 	width:100%;
	 	height:auto;
		margin:0px auto;
	}
	
	.timeHeader{
		position:relative;
		width:100%;
		background-color:#555555;
		color:white;
		text-align: center;
		margin: 0px auto;
	}
	.timeLeft, .timeRight{
		position:relative;
		float:left;
		width:50%;
		line-height:50px;
		text-align: center;
	}
	.busTime{
		float:left;
		width:30%;
		text-overflow: ellipsis;
		white-space: nowrap;
		word-wrap: normal;
		overflow: hidden;
		background-color: #CECDCD;
		border-bottom:1px solid #eee; 
		display:inline-block;
	}
	.busTimeName{
		float:left;
		width:70%;
		background-color:white;
		text-overflow: ellipsis;
		white-space: nowrap;
		word-wrap: normal;
		overflow: hidden;
		border-bottom:1px solid #eee;
		display:inline-block;
	}
</style>
<script>
$(document).ready(function(){
	//선택된 평일/주말 값
	var weekDays = $("#weekDays").val();
   $("#weekDays").change(function(){
      weekDays = $("#weekDays").val();
      location.href="/spring/busSchedule/busTimeTable.action?busStopCategorySeq=${busStopCategorySeq}&weekDays="+weekDays;
   });

 	//시간 가져오는 Date()선언
	var now = new Date();	
	var hour = now.getHours(); // 시
	var minute = now.getMinutes(); // 분
	var day = 0;

	//평일(1~5)이면 day는 1
	if(now.getDay() >= 1 && now.getDay() <= 5){
		day = 1;
	}else{
		//주말이면 2의 값을 가진다.
		day = 2;
	}

	//현재 시각은 시간*60+분으로 계산.
	var sum = Number(hour*60) + now.getMinutes();
	//console.log(sum);
	
	//버스시간과 이름 가져오기
	var time = $(".busTime");
	var name = $(".busTimeName");

	//깜빡이용 Boolean 선언
	var shown = true;
	
	var busTime = new Array(time.length);
	var busTimeName = new Array(name.length);

	//중복된 시간이 있기에 배열로 선언
	var result = new Array();
	//result index 0부터 시작
	var intResult = 0;

	//깜빡이여야 되는 칸 알아내는 반복문
	for(var k=0;k<time.length;k++){
		//split으로 시, 분으로 나눈 작업
		busTimeSum = time.eq(k).text().split(":");
		//console.log(busTimeSum[0]+":"+busTimeSum[1]);
		
		//나눈 시간을 60*시+분 으로 합산
		busTime[k] = Number(60*busTimeSum[0]) + Number(busTimeSum[1]);
		//같이 깜빡이는 버스노선명
		busTimeName[k] = name.eq(k).text();
		//console.log(busTime[k] +"-"+sum+"="+(busTime[k] - sum));
		
		//현재 시간과 비교하여 5분이하 1분이상인 경우에만 깜빡이기 시작
		if((busTime[k] - sum) >= 1 && (busTime[k] - sum) <= 5){
			//result[] 배열에 td 인덱스 넣기
			result[intResult] = k;
			console.log("result는 "+result[intResult]);
			intResult++;
		}
	}

	//인터벌 실행, 선택한 값이 주말/평일에 따라 실행
	if(weekDays == 'weekends' && day == 2){
		interval = setInterval(toggle, 500);
	}else if(weekDays == 'normal' && day == 1){
		interval = setInterval(toggle, 500);
	}

	//5분 뒤 인터벌 종료
	setTimeout(function(){
	    clearInterval(interval);
	},300000);
	
	//현재 버스시간 깜빡이는 토글
	function toggle(){//깜빡이는 효과
	   if(shown) {
		   for(var i=0;i<result.length;i++){
			   //console.log("i는 "+i+" shown는 "+shown+" result[i]는 "+result[i]);
			   time.eq(result[i]).css("background-color","");
			   name.eq(result[i]).css("background-color","");
		   }
		   shown = false;
	   } else {
		   for(var i=0;i<result.length;i++){
			   //console.log("i는 "+i+" shown는 "+shown+" result[i]는 "+result[i]);
			   time.eq(result[i]).css("background-color","green");
			   name.eq(result[i]).css("background-color","green");
		   }
		   shown = true;
	   }
	}
	
});

//버스 시간표 가져오는 함수
function schedule(seq){
	
	var weekDays = $("#weekDays").val();
	location.href="/spring/busSchedule/busTimeTable.action?busStopCategorySeq="+seq+"&weekDays="+weekDays;
	
}

</script>


</head>
<body>	

			<div id="header">
				<div id="infoPage">
					<input type="button" value="<" style="color:white;position: absolute; font-size:1.5em;left: 3%;margin-top:1%; width: 8%; height: 55%;  background-color: transparent !important; border-color: transparent;"	onclick="location.href='/spring/index.action';" />
					<div id="txtLogo">
					
						버스 시간표
					
					</div>
				
					<img src="/spring/images/logo/${universityDto.universityImg}" id="logo" />
				</div>
			</div>
<div id="container">



	
	
	<!-- 버스 시간표 -->
	<div id="busTimeTable">
		<!-- 통학, 셔틀, 노랑 등 선택 -->
		<div>
			<select id="weekDays" class="form-control">
				<option value="normal" <c:if test="${weekDays == 'normal'}">selected</c:if>>평일</option>
				<option value="weekends" <c:if test="${weekDays == 'weekends'}">selected</c:if>>주말</option>
			</select>
		</div>
		
		
		<div id="scheduleHead">
			<c:forEach items="${clist }" var="category" >
				<button class="btn busStopCategory" onclick="schedule(${category.busStopCategorySeq});">${category.busStopCategory}</button>
			</c:forEach>
		</div>
		<div style="clear:both;"></div>
		
		
               
               
               
		
		<!-- 선택된 버스노선 시간표 -->
		<c:forEach items="${dlist}" var="dlist" varStatus="out">
		<div class="timeContent">
			<div class="timeHeader">
				${dlist.busStopDetailCategoryName}  
				<c:if test="${weekDays == 'normal' }"> 평일시간표</c:if>
				<c:if test="${weekDays == 'weekends' }"> 주말시간표</c:if>
			</div>
				<!-- 시간없으면 출력하는 jstl if조건문 -->
				<c:forEach items="${slist}" var="slist" varStatus="in">
				<c:if test="${out.count == in.count }">
				<c:if test="${slist.timeList.size() == 0}">
	            	   <div style="position:absolute;width:100%;text-align:center;margin:0 auto;">시간표가 없습니다.</div>
	               </c:if>
				</c:if>
				</c:forEach>
				<div class="timeLeft">
				<c:forEach items="${slist}" var="slist" varStatus="in">
				<c:if test="${out.count == in.count }">
					
					<c:forEach items="${slist.timeList}" var="dto" varStatus="stat">
						<c:if test="${stat.index < slist.timeList.size()/2 }">
						<div class="busTime">${dto.busTime}</div>
						<div class="busTimeName">${dto.courseName }</div>
						</c:if>
					</c:forEach>
					
				</div>
				
				<div class="timeRight">
					<c:forEach items="${slist.timeList}" var="dto" varStatus="stat">
						<c:if test="${stat.index >= slist.timeList.size()/2 }">
							<div class="busTime">${dto.busTime}</div>
							<div class="busTimeName">${dto.courseName }</div>
						</c:if>
					</c:forEach>
				</c:if>
				</c:forEach>
				</div>
				
			<div style="clear:both;"></div>
		</div><!-- timeContent -->
		</c:forEach>
	
	</div>
	
	
	</div><!-- container -->
</body>
</html>