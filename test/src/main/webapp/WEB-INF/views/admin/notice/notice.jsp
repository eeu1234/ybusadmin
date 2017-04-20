<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/inc/asset.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset=UTF-8">
<title>공지사항</title>
<link rel="stylesheet" type="text/css" href="/spring/css/bacisTheme.css" />
<style>

	
	#tbl1 { width: 1440px; margin: 30px auto;}
	#tbl1 th, #tbl1 td { text-align: center; }
	 
	#tbl1 th:nth-child(1) { width: 5%;}
	#tbl1 th:nth-child(2) { width: 45%; }
	#tbl1 th:nth-child(3) { width: 15%; } 
	#tbl1 th:nth-child(4) { width: 10%; }
	#tbl1 th:nth-child(5) { width: 5%; }
	#tbl1 th:nth-child(6) { width: 5%; }
	#tbl1 th:nth-child(7) { width: 15%; }
	
	#tbl2 { width: 500px; margin: 20px auto; margin-bottom: 100px;}
	
	#searchMsg { text-align: center; }
	
	#btnSubject{
		background-color: window;
		border: 0px solid white;
	}
	
	#btnSubject:hover{
		color: orange;
		cursor: pointer;
	}
	
	#btnSel{
		border: 0px solid black;
		width: 150px;
		height: 30px;
		margin-left: 20px;
		text-align: center;
	}
	
	#btnEdit{
		position: relative;
		height: 30px;
		top: 0px;
		left: -20px;
	}
	
	#btnDel{
		position: relative;
		height: 30px;
		top: -46px;
		left: 40px;
	}
	
</style>
<script>
	
	
	//로그인 한 level 이 9999 이면 추가 함수 생성
	<c:if test="${adto.adminLevel == 9999}">
	function noticeAdd(){
		location.href="/spring/admin/notice/noticeAdd.action"
	}
	</c:if>

	//로그인 한 level 이 9999 이면 삭제 함수 생성
	<c:if test="${adto.adminLevel == 9999}">
	function noticeDelete(noticeSeq){
		if(confirm("삭제하시겠습니까?")){
			location.href="/spring/admin/notice/noticeDelete.action?noticeSeq="+noticeSeq;
		} else {

			}
	};
	</c:if>

</script>

</head>
<body>
	<%@include file="/inc/top.jsp"%>
	<!-- content 몸통부분 -->
	<div id="container">
		<h1 class="menuTitle">공지사항</h1>
		<table id="tbl1" class="table table-striped">
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성일자</th>
				<th>글쓴이</th>
				<th>조회수</th>
				<th>상태값</th>
				<th>관리</th>
			</tr>
			<c:if test="${empty alist || alist.size() == 0}">
				<tr>
					<td colspan="5">게시물이 존재하지 않습니다.</td>
				</tr>
			</c:if>

					<c:forEach items="${alist}" var="dto" varStatus="stat">
					<tr>
						<td>${dto.noticeSeq}</td>
			<form method="GET" action="/spring/admin/notice/noticeContent.action">
						<td ><input type="submit" value="${dto.noticeSubject}" name="subject" readonly id="btnSubject"></td>
						<input type="hidden" value="${dto.noticeSeq}" name="seq">
			</form>
						<td>${dto.noticeRegdate}</td>
						<td>${dto.adminID}</td>
						<td>${dto.noticeReadCount}</td>
						<td>${dto.noticeStatus}</td>
						
						<c:if test="${adto.adminLevel == '9999'}">
						<td>
							<div id="btnSel">
							<form method="POST" action="/spring/admin/notice/noticeUpdate.action">
								<input type="submit" value="수정" class="btn btn-warning" id="btnEdit"/>
								<input type="hidden" value="${dto.noticeSeq}" name="seq">
							</form>
							
	
								<input type="button" value="삭제" onclick="noticeDelete(${dto.noticeSeq});" class="btn btn-danger" id="btnDel"/>
							
							</div>
						</td>
						</c:if>
					</tr>
					</c:forEach>
			
		</table>
		<c:if test="${adto.adminLevel == '9999'}">
				<div style="width:100%;text-align:right;">
								<input type="button" value="글쓰기" onclick="noticeAdd();" class="btn btn-primary"/>
			</div>
		</c:if>
		<div id="pageBar" style="text-align: center;">
			${pageBar}
		</div>
		<div id="search">
			<!-- 자기 자신을 호출 -->
			<form method="GET" action="/spring/admin/notice/notice.action">
				<table id="tbl2">
					<tr>
						<td>
							<select name="column" id="column" class="form-control">
									<option value="-1">검색조건</option>
									<option 
									value="noticeRegdate"
									<c:if test="${sdto.column == 'noticeRegdate'}">selected</c:if>
									>작성일자
								</option>
								<option 
									value="noticeSubject"
									<c:if test="${sdto.column == 'noticeSubject'}">selected</c:if>
									>제목
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