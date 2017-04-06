<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset=UTF-8">
<title>Insert title here</title>

<script type="text/javascript" src="http://code.jquery.com/jquery-1.12.4.min.js"></script>

<script>
   $(document).ready(function(){
      <c:if test="${result1 == 1}">
         alert("가상정류장 수정 완료");
         location.href="/spring/virtual/virtualBusStop.action";
      </c:if>
      <c:if test="${result1 == 0}">
         alert("정류장 수정 실패");
         history.back();
      </c:if>
   });
   
   
</script>

</head>
<body>
   
   
</body>