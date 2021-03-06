<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/inc/asset.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/spring/css/bacisTheme.css" />
<style>

	
	#tbl1 { width: 1440px; margin: 30px auto;}
	#tbl1 th, #tbl1 td { text-align: center; }
	 
	
	#tbl1 th:nth-child(1) { width: 10%;}
	#tbl1 th:nth-child(2) { width: 10%; }
	#tbl1 th:nth-child(3) { width: 10%; } 
	#tbl1 th:nth-child(4) { width: 15%; }
	#tbl1 th:nth-child(5) { width: 15%; }
	#tbl1 th:nth-child(6) { width:20%; }
	
	#tbl2 { width: 500px; margin: 20px auto; }
	#tbl2 td { padding: 0px 2px; }
	#tbl2 td:nth-child(1) { width: 120px; }
	#tbl2 td:nth-child(2) { width: 280px; }
	#tbl2 td:nth-child(3) { width: 100px; }
	
	#searchMsg { text-align: center; }
	
</style>
<script>

	//계정 수정하는 함수
	function update(adminID){
		location.href="/spring/admin/adminUpdate.action?adminID="+adminID;
	}

	//계정 추가하는 함수
	function adminAdd(){
		location.href="/spring/admin/adminAdd.action"
	}
	
	//로그인 한 level 이 9999 이면 삭제 함수 생성
	<c:if test="${adto.adminLevel == 9999}">
	function adminDelete(adminID){
		if(confirm("삭제하시겠습니까?")){
			location.href="/spring/admin/adminDelete.action?adminID="+adminID;
		}
	}
	</c:if>

</script>

</head>
<body>
	<%@include file="/inc/top.jsp"%>
	<!-- content 몸통부분 -->
	<div id="container">
		<h1 class="menuTitle">관리자 관리</h1>
		최고관리자 : 9999   // 일반관리자 : 300
		<table id="tbl1" class="table table-striped">
			<tr>
				<th>아이디</th>
				<th>이름</th>
				<th>부서</th>
				<th>직급</th>
				<th>소속대학</th>
				<th>관리</th>
			</tr>
			<c:if test="${empty alist || alist.size() == 0}">
				<tr>
					<td colspan="5">게시물이 존재하지 않습니다.</td>
				</tr>
			</c:if>
			<c:forEach items="${alist}" var="dto">
			<tr>
				<td>${dto.adminID}</td>
				<td>${dto.adminName}</td>
				<td>${dto.adminDepartment}</td>
				<td>${dto.adminLevel}</td>
				<td>${dto.universityName}</td>
				<td>
					<input type="button" value="수정" onclick="update('${dto.adminID}')" class="btn btn-info"/>
						<input type="button" value="삭제" onclick="adminDelete('${dto.adminID}')" class="btn btn-danger"/>
				</td>
			</tr>
			</c:forEach>
			
		</table>
		<div style="width:100%;text-align:right;">
		<input type="button" value="계정 추가" onclick="adminAdd();" class="btn btn-primary"/>
		</div>
		<div id="pageBar" style="text-align: center;">
			${pageBar}
		</div>
		<div id="search">
			<!-- 자기 자신을 호출 -->
			<form method="GET" action="/spring/admin/adminManage.action">
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
						<td><input type="submit" value="검색하기" class="btn btn-info"></td>
					</tr>
				</table>
			</form>
		</div>
	</div><!-- content -->
	
	
</body>
</html>