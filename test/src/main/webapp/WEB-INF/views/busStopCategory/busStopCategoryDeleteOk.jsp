<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/inc/asset.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset=UTF-8">
<title>Insert title here</title>
<script>
	$().ready(function(){
		<c:if test="${result==1}">
			alert("삭제 성공");
			location.href="/spring/busStopCategory/busStopCategoryAdd.action"
		</c:if>
		<c:if test="${result==0}">
			alert("해당 하위 분류의 값이 남아있어 삭제할 수 없습니다.");
			history.back();
		</c:if>
	});
</script>
</head>
<body>

</body>
</html>