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

function schedule(){


	
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
		<div id="scheduleHead">
			<c:forEach items="${clist }" var="category">
				<div class="busStopCategory" onclick="schedule();">${category.busStopCategory}</div>
			</c:forEach>
		</div>
		<div style="clear:both;"></div>
		<!-- 선택된 버스노선 시간표 -->
		<c:forEach items="${dlist}" var="dlist">
		<div class="timeContent">
			<div class="timeHeader">
				${dlist.busStopDetailCategoryName}  
				<c:if test="${weekDays == 'normal' }"> 평일시간표</c:if>
				<c:if test="${weekDays == 'weekends' }"> 주말시간표</c:if>
			</div>
			<div class="totalTable">
				<div class="timeLeft">
				<c:forEach items="${busSchedule}" var="time" varStatus="num">
				<c:if test="${time.busStopDetailCategorySeq == dlist.busStopDetailCategorySeq && num.count < busSchedule.size()/2 }">
					<div class="">${time.busTime} ${time.courseName}</div>
				</c:if>
				</c:forEach>
				</div>
				<div class="timeRight">
				<c:forEach items="${busSchedule}" var="time" varStatus="num">
				<c:if test="${time.busStopDetailCategorySeq == dlist.busStopDetailCategorySeq && num.count >= busSchedule.size()/2 }">
					<div class="timeTable">${time.busTime} ${time.courseName}</div>
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