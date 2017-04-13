<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="/inc/asset.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/spring/css/bacisTheme.css" />
<style>
#viewTable{
	vertical-align: middle;
	text-align: left;
}
#viewTable tbody  td{
	vertical-align: middle;
	text-align: left;
}
#busTimeTable {
	width: 900px;
	margin: 0px auto;
}

#scheduleHead {
	width: 850px;
	margin: 0px auto;
}

#scheduleHead div {
	width: 270px;
	float: left;
}

.timeContent {
	width: 850px;
}

.totalTable {
	margin: 0px auto;
}

.timeHeader {
	text-align: center;
	margin: 0px auto;
}

.timeLeft {
	width: 425px;
}

.btnSubmit {
	display: inline-block;
}

#nDelete{
	float:right;
	margin: 10px;
}
</style>
<script>

$(document).ready(function(){

	//dateType 24시간형태로 변경
/* 	$(".datetimepicker").datetimepicker({
        lang:'ko',
        format:'H:i'
    });
     */
	//카테고리 변경시 ajax 실행
	$("#category").change(function(){
		changeCategory();
	});
	
});

//대분류를 선택하면 소분류 가져오는 ajax 함수
function changeCategory(){
	
	var seq = $("#category").val();
	
	$.ajax({
		type:"POST",
		url:"/spring/admin/adminGetDetailCategory.action",
		dataType:"json",
		data: "busStopCategorySeq="+seq,
		success: function(data){
			
			//디테일 셀박스 초기화
			$("#detailCategory").html("");
			
			$(data).each(function(index, dto){
				//1바퀴 -> 직원 1명 JSON Object
				
				$("#detailCategory").append("<option value='"+dto.busStopDetailCategorySeq+"'>"+dto.busStopDetailCategoryName+"</option>");
				 
			});

		},error(request, status, error){
			console.log("code = "+ request.status + " message = " + request.responseText + " error = " + error);
		}
	});
}

//시간표 불러오기 누르면 실행되는 ajax 함수
function readSchedule(){
	
	var category = $("#category").val();
	var detailCategory = $("#detailCategory").val();
	var weekDays = $("#weekDays").val();
	
	$.ajax({
		type:"POST",
		url:"/spring/admin/adminGetBusSchedule.action",
		dataType:"json",
		data: "busStopDetailCategorySeq="+detailCategory+"&weekDays="+weekDays,
		success: function(data){
			
			//시간표 초기화
			$("#scheduleTable").html("");
			
			//시간표 추가
			$(data).each(function(index, dto){
				$("#scheduleTable").append("<tr><td>"+(index+1)+"</td>"
						+"<td>"+dto.busTime+"</td>"
						+"<td>"+dto.courseName+"</td>"
						+"<td><div class='btnSubmit'>"
						+"<form action='/spring/admin/adminDeleteSchedule.action' method='POST'>"
						+"<input type='hidden' class='busStopCategorySeq' name='busStopCategorySeq' value=''/>"
						+"<input type='hidden' class='busStopDetailCategorySeq' name='busStopDetailCategorySeq' value=''/>"
						+"<input type='hidden' class='weekDays' name='weekDays' value=''/>"
						+"<input type='hidden' class='busScheduleSeq' name='busScheduleSeq' value="+dto.busScheduleSeq+"/>"
						+"<input type='button' class='btn btn-danger' value='삭제' onclick='deleteOk();'/>"
						+"<td class='chk'><input type='checkbox' name='selSeq' value="+dto.busScheduleSeq+" /></td>"
						+"</form></div></td></tr>");
			});//추가 끝

			//hidden 태그들 val 수정
			$(".busStopCategorySeq").val(category);
			$(".busStopDetailCategorySeq").val(detailCategory);
			$(".weekDays").val(weekDays);
			
		},error(request, status, error){
			console.log("code = "+ request.status + " message = " + request.responseText + " error = " + error);
		}
	});
}//시간표 불러오는 함수

//삭제하는 함수
function deleteOk(){
	if(confirm("삭제하시겠습니까?")){
		$(event.srcElement).parent().submit();
	}
}

//체크된 시간표 삭제하는 함수
function deleteList(){

	//체크박스가 선택이 되어야 실행. 안되면 선택 안되어있다고 alert하기.
	if($(".chk :checked").size() > 0){
		//선택된 체크박스만큼 일괄삭제 form에 hidden으로 값 추가
		$(".chk :checked").each(function(){
			$("#selDelete").append("<input type='hidden' name='busScheduleSeq' value='"+$(this).val()+"'>");
		});

		//submit 실행
		$("#selDelete").submit();
		
	}else{
		alert("선택된 시간이 없습니다.");
	}
}

</script>


</head>
<body>
	<%@include file="/inc/top.jsp"%>
	<!-- 사용자 화면은 학교 주소로 들어오면 곧바로 해당 학교 seq를 session으로 고정 -->
	<h1></h1>
	<div id="container">
		<h1 class="menuTitle">운행 시간표 관리</h1>
		<!-- 버스 시간표 -->
		<div id="busTimeTable">

			<!-- 대학seq는 로그인한 관리자 대학seq session으로 대체 -->
			<!-- 통학, 셔틀, 노랑 등 선택 -->
			<div id="scheduleHead">

				<table class="table table-striped" style="text-align: center;">

					<tr>
						<th>노선 대분류선택</th>
						<th>노선 소분류선택</th>
						<th>평일/주말선택</th>
						<th></th>
					</tr>
					<tr>
						<td><select id="category" class="form-control">
								<c:forEach items="${blist }" var="category">
									<option value="${category.busStopCategorySeq}"
										<c:if test="${Search.busStopCategorySeq == category.busStopCategorySeq}">selected</c:if>>${category.busStopCategory}</option>
								</c:forEach>
						</select></td>
						<td><select id="detailCategory" class="form-control">
								<c:forEach items="${dlist }" var="detail">
									<option value="${detail.busStopDetailCategorySeq}"
										<c:if test="${Search.busStopDetailCategorySeq == detail.busStopDetailCategorySeq}">selected</c:if>>${detail.busStopDetailCategoryName}</option>
								</c:forEach>
						</select></td>
						<td><select id="weekDays" class="form-control">
								<option value="normal"
									<c:if test="${Search.weekDays == 'normal'}">selected</c:if>>평일</option>
								<option value="weekends"
									<c:if test="${Search.weekDays == 'weekends'}">selected</c:if>>주말</option>
						</select></td>
						<td><input type="button" value="검색" onclick="readSchedule();"
							class="btn btn-primary"></td>
					</tr>
				</table>
			</div>
			<!-- 통학, 셔틀, 노랑 등 선택 끝 -->
			<hr />
			<!-- 선택 된 시간표 출력 -->
			<div id="timeTable">
				<h2 style="background-color:#eee;margin-top:5%;">시간표 출력</h2>
				<table id="viewTable" class="table table-striped">
					<thead>
						<tr>
							<th>순번</th>
							<th>시간</th>
							<th>노선명</th>
							<th>단일삭제</th>
							<th>삭제체크</th>
						</tr>
					</thead>

					<tbody id="scheduleTable">
						<c:forEach items="${slist }" var="time" varStatus="stat">
							<tr>
								<td>${stat.count }</td>
								<td>${time.busTime}</td>
								<td>${time.courseName}</td>
								<td>
									<div class="btnSubmit">
										<form action="/spring/admin/adminDeleteSchedule.action"
											method="POST">
											<input type="hidden" class="busStopCategorySeq" name="busStopCategorySeq" value="${Search.busStopCategorySeq}" /> 
											<input type="hidden" class="busStopDetailCategorySeq" name="busStopDetailCategorySeq" value="${Search.busStopDetailCategorySeq}" /> 
											<input type="hidden" class="weekDays" name="weekDays" value="${Search.weekDays}" /> 
											<input type="hidden" class="busScheduleSeq" name="busScheduleSeq" value="${time.busScheduleSeq}" /> 
											<input type="button" class="btn btn-danger" value="삭제" onclick="deleteOk();" />
										</form>
									</div>
								</td>
								<td class="chk">
									<input type="checkbox" name="selSeq" value="${time.busScheduleSeq}" />
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<form id="selDelete" action="/spring/admin/adminDeleteSchedule.action" method="POST">
					<input type="button" id="nDelete" class="btn btn-danger" value="일괄삭제" onclick="deleteList();"/>
				</form>
				<div style="clear:both;"></div>
			</div>
			<!-- 선택 된 시간표 출력 끝-->

			<!-- 시간표 추가하는 form -->
			<form action="/spring/admin/adminAddSchedule.action" method="POST">
				<div id="addTable">
					<table class="table table-striped">
						<tr>
							<td><input type="number" id="hour" name="hour" min="0"
								max="23" required class="form-control" placeholder="시" /></td>
							<td><input type="number" id="minute" name="minute" min="0"
								max="59" required class="form-control" placeholder="분" /></td>
							<td><input type="text" name="courseName" required
								class="form-control" placeholder="목적지" /></td>
							<td><input type="hidden" class="busStopCategorySeq"
								name="busStopCategorySeq"
								value="${blist.get(0).busStopCategorySeq }" /> <input
								type="hidden" class="busStopDetailCategorySeq"
								name="busStopDetailCategorySeq"
								value="${dlist.get(0).busStopDetailCategorySeq}" /> <input
								type="hidden" class="weekDays" name="weekDays"
								value="${Search.weekDays }" /> <input type="submit" value="추가"
								class="btn btn-primary" /></td>
						</tr>
					</table>
				</div>
			</form>
			<!-- 시간표 추가 끝 -->

		</div>
		</div><!-- container  -->
</body>
</html>













