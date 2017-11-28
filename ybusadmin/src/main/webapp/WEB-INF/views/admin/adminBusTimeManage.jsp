<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/spring/css/bacisTheme.css" />
<%@include file="/inc/asset.jsp"%>
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

#leftAdd{
	float: left;
}
#rightSave{
	float: right;
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
     //처음에 평일값 부여
     $("#firstWeekDays").val($("#weekDays").val());
     
	//카테고리 변경시 ajax 실행
	$("#category").change(function(){
		changeCategory();
	});
	
	$("#allSeq").change(function(){
		deleteAll();
	});
	
});

//대분류를 선택하면 중분류 가져오는 ajax 함수
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
			
			if(data == ""){
				$("#detailCategory").append("<option value='-1'>중분류가 없습니다</option>");
			}
			
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

	console.log("111111111111111111111");

	if(detailCategory == -1){
		alert("중분류가 없습니다.");
	}else{
		console.log("222222222222222222222");
		$.ajax({
			type:"POST",
			url:"/spring/admin/adminGetBusSchedule.action",
			dataType:"json",
			data: "busStopDetailCategorySeq="+detailCategory+"&weekDays="+weekDays,
			success: function(data){

				console.log("3333333333333333333");
				//시간표 초기화
				$("#scheduleTable").html("");
				
				//hidden 태그들 val 수정
				$(".busStopCategorySeq").val(category);
				$(".busStopDetailCategorySeq").val(detailCategory);
				$(".weekDays").val(weekDays);

				console.log("444444444444444444444444");
				//시간표 추가
				$(data).each(function(index, dto){
					console.log("555555555555555555555");
					$("#scheduleTable").append("<tr><td>"+(index+1)+"</td>"
							+"<td>"+dto.busTime+"</td>"
							+"<td>"+dto.courseName+"</td>"
							+"<td><div class='btnSubmit'>"
							+"<form action='/spring/admin/adminDeleteSchedule.action' method='POST'>"
							+"<input type='hidden' class='busStopCategorySeq' name='busStopCategorySeq' value=''/>"
							+"<input type='hidden' class='busStopDetailCategorySeq' name='busStopDetailCategorySeq' value=''/>"
							+"<input type='hidden' class='weekDays' name='weekDays' value='"+weekDays+"'/>"
							+"<input type='hidden' class='busScheduleSeq' name='busScheduleSeq' value="+dto.busScheduleSeq+"/>"
							+"<input type='button' class='btn btn-danger' value='삭제' onclick='deleteOk();'/>"
							+"<td class='chk'><input type='checkbox' name='selSeq' value="+dto.busScheduleSeq+" /></td>"
							+"</form></div></td></tr>");
				});//추가 끝
				
			},error(request, status, error){
				console.log("7777777777777777777");
				console.log("code = "+ request.status + " message = " + request.responseText + " error = " + error);
			}
		});
	}
}//시간표 불러오는 함수

//삭제하는 함수
function deleteOk(){
	if(confirm("삭제하시겠습니까?")){
		$(event.srcElement).parent().submit();
	}
}

//일괄 삭제 체크 하는 함수
function deleteAll(){
	if($("#allSeq").prop("checked")){
		console.log("true");
		$("input[name=selSeq]:checkbox").prop("checked", true);
	}else{
		console.log("false");
		$("input[name=selSeq]:checkbox").prop("checked", false);
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

//시간표 추가하는 함수, 중분류가 없으면 실행 안되게 해야함.
function addBusSchedule(){
	
	var detail = $("#busStopDetailCategorySeq").val();
	
	var hour = $(".hour");
	var minute = $(".minute");
	var courseName = $(".courseName");
	
	var checkText = false;
	
	for(var i=0;i<hour.length;i++){
		var h = hour.eq(i).val();
		var m = minute.eq(i).val();
		if(h < 0 || h > 23 || m < 0 || m > 59){
			
			alert("시간을 다시 입력해주세요.");
			//함수 실행을 멈춘다.
			return;
		}
	}
	console.log("시간 길이 : "+hour.length);
	for(var i=0;i<hour.length;i++){	
		var h = hour.eq(i).val();
		var m = minute.eq(i).val();
		var c = courseName.eq(i).val();
		console.log(h +" : "+ m +" : "+ c);
		if(h == "" || m == "" || c == ""){
			checkText = false;
			console.log("빈칸?? : "+checkText);
			break;
		}else{
			checkText = true;
			console.log("빈칸 아니다 : "+checkText);
		}
	}
	
	if(detail == -1){
		alert("중분류가 없습니다.");
	}else{
		console.log("checkText : "+checkText);
		if(checkText == false){
			alert("빈칸이 있습니다.");
		}else{
			$("#addBusSchedule").submit();
		}
	}
	
}

//버스 시간표 스케쥴 라인 하나 추가하는 함수
function addScheduleLine(){
	$("#addScheduleTbl").append("<tr><td><input type='number' name='hour' min='0' max='23' required class='hour form-control' placeholder='시' /></td><td><input type='number' name='minute' min='0' max='59' required class='minute form-control' placeholder='분''' /></td> <td><input type='text' name='courseName' required class='courseName form-control' placeholder='목적지' /></td><td><input type='button' value='삭제' onclick='delLine();' class='btn btn-danger' /></td></tr>");
}

//버스 시간표 스케쥴 라인 하나 삭제하는 함수
function delLine(){
	//input button의 부모 td의 부모 tr을 초기화
	$(event.srcElement).parent().parent().html("");
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
							<th>노선 중분류선택</th>
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
									<c:if test="${detail == 0 }">
										<option value="-1">중분류가 없습니다.</option>
									</c:if>
									<c:if test="${detail == 1 }">
										<c:forEach items="${dlist }" var="detail">
											<option value="${detail.busStopDetailCategorySeq}"
												<c:if test="${Search.busStopDetailCategorySeq == detail.busStopDetailCategorySeq}">selected</c:if>>${detail.busStopDetailCategoryName}</option>
										</c:forEach>
									</c:if>
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
				<hr>
				
				<!-- 시간표 추가하는 form -->
				<form id="addBusSchedule" action="/spring/admin/adminAddSchedule.action" method="POST">
				<h2>시간표 추가하기</h2>
				
					<table class="table table-striped">
						<tr>
							<td>
								<input type="button" id="leftAdd" value="추가" onclick="addScheduleLine();" class="btn btn-warning" />
								<input type="button" id="rightSave" value="시간표 저장하기" onclick="addBusSchedule();" class="btn btn-primary" />
							</td>
						</tr>
					</table>
					
					<div id="addTable">
						<table id="addScheduleTbl" class="table table-striped">
							<tr>
								<td><input type="number" name="hour" min="0" maxlength="2"
									max="23" required class="hour form-control" placeholder="시" /></td>
								<td><input type="number" name="minute" min="0" maxlength="2"
									max="59" required class="minute form-control" placeholder="분" /></td>
								<td><input type="text" name="courseName" required
									class="courseName form-control" placeholder="목적지" /></td>
								<td>
									<c:if test="${Search.busStopCategorySeq != null }">
										<input type="hidden" class="busStopCategorySeq" name="busStopCategorySeq" value="${Search.busStopCategorySeq }" /> 
										<input type="hidden" id="busStopDetailCategorySeq" class="busStopDetailCategorySeq" name="busStopDetailCategorySeq" value="${Search.busStopDetailCategorySeq}" /> 
										<input type="hidden" id="firstWeekDays" class="weekDays" name="weekDays" value="${Search.weekDays}" />
									</c:if>
									<c:if test="${Search.busStopCategorySeq == null }">
										<input type="hidden" class="busStopCategorySeq" name="busStopCategorySeq" value="${blist.get(0).busStopCategorySeq }" /> 
										<input type="hidden" id="busStopDetailCategorySeq" class="busStopDetailCategorySeq" name="busStopDetailCategorySeq" 
											<c:if test="${detail == 0 }">value="-1"</c:if>
											<c:if test="${detail == 1 }">value="${dlist.get(0).busStopDetailCategorySeq}"</c:if> /> 
										<input type="hidden" id="firstWeekDays" class="weekDays" name="weekDays" value="${Search.weekDays }" />
									</c:if>
								</td>
							</tr>

						</table>
					</div>
				</form>
				<!-- 시간표 추가 끝 -->
				
				<!-- 선택 된 시간표 출력 -->
				<div id="timeTable">
					<h2 style="background-color:#eee;margin-top:5%;">시간표 출력</h2>
					<table id="viewTable" class="table table-striped">
						<thead>
							<tr>
								<th>순번</th>
								<th>시간</th>
								<th>행선지</th>
								<th>단일삭제</th>
								<th>				<input type="checkbox" id="allSeq" />
								</th>
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
										<input type="checkbox" class="chkCheck" name="selSeq" value="${time.busScheduleSeq}" />
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
	
				
	
			</div>
		</div><!-- container  -->
</body>
</html>













