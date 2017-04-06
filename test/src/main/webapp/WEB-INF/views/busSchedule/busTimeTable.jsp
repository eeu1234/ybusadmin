<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="/inc/asset.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset=UTF-8">
<title>Insert title here</title>
<style>

	#busTimeTable{
		width: 900px;
		margin:0px auto;
	}
	#scheduleHead{
		width: 850px;
		margin:0px auto;
	}
	#scheduleHead div{
		width: 270px;
		float:left;
	}
	
	.timeContent{
		width: 850px;
	}
	.totalTable{
		margin:0px auto;
	}
	
	.timeHeader{
		text-align: center;
		margin: 0px auto;
	}
	.timeLeft, .timeRight{
		float:left;
		width: 425px;
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
   <%@include file="/inc/top.jsp"%> 
	<!-- 사용자 화면은 학교 주소로 들어오면 곧바로 해당 학교 seq를 session으로 고정 -->
	<h1>버스 시간표</h1>
	<!-- 버스 시간표 -->
	<div id="busTimeTable">
		<!-- 통학, 셔틀, 노랑 등 선택 -->
		<div>
			<select id="weekDays">
				<option value="normal" <c:if test="${weekDays == 'normal'}">selected</c:if>>평일</option>
				<option value="weekends" <c:if test="${weekDays == 'weekends'}">selected</c:if>>주말</option>
			</select>
		</div>
		<div id="scheduleHead">
			<c:forEach items="${clist }" var="category">
				<div class="busStopCategory" onclick="schedule(${category.busStopCategorySeq});">${category.busStopCategory}</div>
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
			<div class="totalTable">
				<div class="timeLeft">
				<c:forEach items="${slist}" var="slist" varStatus="in">
				<c:if test="${out.count == in.count }">
					<c:forEach items="${slist.timeList}" var="dto" varStatus="stat">
						<c:if test="${stat.index < slist.timeList.size()/2 }">
						<div>${dto.busTime} ${dto.courseName }</div>
						</c:if>
					</c:forEach>
				</div>
				<div class="timeRight">
					<c:forEach items="${slist.timeList}" var="dto" varStatus="stat">
						<c:if test="${stat.index >= slist.timeList.size()/2 }">
						<div>${dto.busTime} ${dto.courseName }</div>
						</c:if>
					</c:forEach>
				</c:if>
				</c:forEach>
				</div>
			</div>
			<div style="clear:both;"></div>
		</div><!-- timeContent -->
		</c:forEach>
	
	</div>
	
	
</body>
</html>