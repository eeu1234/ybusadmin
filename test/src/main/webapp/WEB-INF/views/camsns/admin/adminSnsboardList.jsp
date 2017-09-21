<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset=UTF-8">
<title>Insert title here</title>
<%@include file="/inc/asset.jsp"%>

<style>
	body{
	position:relative;
	width:100%;
	max-widht:1440px;
	height:100%;
	overflow:auto;
	
	}
	

	#tbl1 { width: 1440px; margin: 30px auto;}
	#tbl1 th, #tbl1 td { text-align: center; }
	
	#tbl1 td:nth-child(2) { text-align: center; }
	
	#tbl1 th:nth-child(1) { width: 80px;}
	#tbl1 th:nth-child(2) { width: 300px; }
	#tbl1 th:nth-child(3) { width: 100px; }
	#tbl1 th:nth-child(4) { width: 50px; }
	#tbl1 th:nth-child(5) { width: 150px; }
	#tbl1 th:nth-child(6) { width: 100px; }
	#tbl1 th:nth-child(7) { width: 100px; }
	
	#tbl2 { width: 500px; margin: 20px auto; }
	#tbl2 td { padding: 0px 2px; }
	#tbl2 td:nth-child(1) { width: 120px; }
	#tbl2 td:nth-child(2) { width: 280px; }
	#tbl2 td:nth-child(3) { width: 100px; }
	
	#searchMsg { text-align: center; }
	
</style>
<script>

	//계정 수정하는 함수
	function snsBoardUpdate(snsBoardSeq){
		location.href="/spring/admin/adminupdate.action?adminID="+adminID;
	}

	
	

	
	
	$(function(){
		
		$(".onOffBtn").change(function(){
			var boardSeq = $(this).parents().parents("tr").children("td:nth-child(1)").text() + "";			
		
			 if($(this).prop("checked") == true){
			       //run code
				//킬때
			//	console.log("킬때");
				valueSend('onOffBtn','show',boardSeq);
			       
			       
				
			    }else{
			       //run code
			       //끌때
			    	valueSend('onOffBtn','hide',boardSeq);
				       
		    	
			    }
		
		});
		
		$(".blindBtn").change(function(){
			var boardSeq = $(this).parents().parents("tr").children("td:nth-child(1)").text() + "";
	
			if($(this).prop("checked") == true){
			       //run code
				//킬때
			//	console.log("킬때");
				valueSend('blindBtn','y',boardSeq);
			       
				
			    }else{
			       //run code
			       //끌때
					valueSend('blindBtn','n',boardSeq);
			    }
		});
		
		
		
		
	});
		function valueSend(type,value,boardSeq){
			$.ajax({
				type : "GET",
				url : "/spring/camsns/admin/changeBoard.action",
				dataType: "json",
				data : "type=" + type + "&value=" + value + "&boardSeq=" + boardSeq ,
				
				success: function(result){
					 
				
				
				}
			
			
			});
		}
	
	
	
</script>

</head>
<body>
	<%@include file="/inc/top.jsp"%>
	<h1>관리자 관리</h1>
	<table id="tbl1" class="table table-striped">
		<tr>
			<th>순번</th>
			<th>제목</th>
			<th>작성자</th>
			<th>소속</th>
			<th>등록날짜</th>
			<th>Blind</th>
			<th>보이기</th>
		</tr>
		<c:if test="${empty boardlist || boardlist.size() == 0}">
			<tr>
				<td colspan="5">게시물이 존재하지 않습니다.</td>
			</tr>
		</c:if>
		<c:forEach items="${boardlist}" var="dto">
		<tr>
			<td>${dto.snsboardSeq}</td>
			<td><a href="/spring/camsns/admin/adminSnsboardView.action?boardSeq=${dto.snsboardSeq}">${dto.snsboardSubject}</a></td>
			<td>${dto.userEmailIdFk}</td>
			<td>${dto.universityName}</td>
			<td>${dto.snsboardRegdate}</td>
			<td>
			<c:choose>
		   	   <c:when test="${dto.snsboardBlind == 'y'}">
		          	<input type="checkbox" checked data-toggle="toggle" data-onstyle="danger" class="blindBtn" value="${dto.snsboardSeq}">	
		       </c:when>
		       <c:when test="${dto.snsboardBlind == 'n'}">
		          	<input type="checkbox"  data-toggle="toggle" data-onstyle="danger" class="blindBtn" value="${dto.snsboardSeq}">	
		       </c:when>
		   </c:choose>
			

			
			</td>
			<td>
				
		<!-- 	${dto.snsboardStat} -->
			
		<c:choose>
	   	   <c:when test="${dto.snsboardStat == 'show'}">
	          	<input type="checkbox" checked data-toggle="toggle" class="onOffBtn" value="${dto.snsboardSeq}">	
	       </c:when>
	       <c:when test="${dto.snsboardStat == 'hide'}">
	          	<input type="checkbox"  data-toggle="toggle" class="onOffBtn" value="${dto.snsboardSeq}">	
	       </c:when>
	   </c:choose>


			</td>
			
		</tr>
		</c:forEach>
		
	</table>
	<div id="pagebar" style="text-align: center;">
		${pagebar}
	</div>
	<div id="search">
		<!-- 자기 자신을 호출 -->
		<form method="GET" action="/spring/camsns/admin/adminSnsboardList.action">
			<table id="tbl2">
				<tr>
					<td>
						<select name="column" id="column" class="form-control">
							<option 
								value="adminID" 
								<c:if test="${sdto.column == 'adminID'}">selected</c:if>
								>아이디
							</option>
							<option 
								value="adminName"
								<c:if test="${sdto.column == 'adminName'}">selected</c:if>
								>이름
							</option>
							<option 
								value="adminDepartment"
								<c:if test="${sdto.column == 'adminDepartment'}">selected</c:if>
								>부서
							</option>
							<option 
								value="universityName"
								<c:if test="${sdto.column == 'universityName'}">selected</c:if>
								>소속대학
							</option>
						</select>
					</td>
					<td><input type="text" name="word" id="word" class="form-control" required placeholder="검색어를 입력하세요." value="${sdto.word}"></td>
					<td><input type="submit" value="검색하기" class="btn btn-warning"></td>
				</tr>
			</table>
		</form>
	</div>
	
	
</body>
</html>