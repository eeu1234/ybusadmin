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
	}
</style>
<script>
$(document).ready(function(){
	   $("#weekDays").change(function(){
	      var weekDays = $("#weekDays").val();
	      location.href="/spring/busSchedule/busTimeTable.action?busStopCategorySeq=${busStopCategorySeq}&weekDays="+weekDays;
	   });
	});
	
	
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