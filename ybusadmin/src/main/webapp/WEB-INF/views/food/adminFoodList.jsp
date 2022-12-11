<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/inc/asset.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset=UTF-8">
<title>YBUS :: 학식메뉴</title>
 <link rel="stylesheet" type="text/css" href="/spring/css/bacisTheme.css" />
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

	<%@include file="/inc/top.jsp"%>
	
	<h1 class="menuTitle">학식 정보 관리</h1>
	<select id="category" class="form-control" style="float:right;width:200px; height:50px; margin:15px;">인성관</select>	
	<table id="tbl1" class="table table-striped">
		
		<tr>
			<th>글번호</th>
			<th>날짜</th>
			<th>조회수</th>
			<th>최종 수정일</th>
			<th>수정자</th>
		</tr>
		
		<c:if test="${empty foodInfo || foodInfo.size() == 0}">
				<tr>
					<td colspan="5">게시물이 존재하지 않습니다.</td>
				</tr>
			</c:if>

					<c:forEach items="${foodInfo}" var="dto" varStatus="stat">
					<tr>
						<td>${dto.menuSeq}</td>
						<td>${dto.date}</td>
						<td>${dto.menuCorner}</td>
						<td>${dto.workDate}</td>
						<td>${dto.worker}</td>
						
						<%-- <c:if test="${adto.adminLevel == '9999'}">
						<td>
							<div id="btnSel">
							<form method="POST" action="/spring/admin/notice/noticeUpdate.action">
								<input type="submit" value="수정" class="btn btn-warning" id="btnEdit"/>
								<input type="hidden" value="${dto.noticeSeq}" name="seq">
							</form>
							
	
								<input type="button" value="삭제" onclick="noticeDelete(${dto.noticeSeq});" class="btn btn-danger" id="btnDel"/>
							
							</div>
						</td>
						</c:if> --%>
					</tr>
					</c:forEach>
	</table>
	<div id="pageBar" style="text-align: center;">
			${pageBar}
	</div>
	
	
	<!-- content 몸통부분 -->
	
</body>
</html>