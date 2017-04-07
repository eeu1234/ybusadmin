<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
[
	<c:forEach items="${time}" var="dto" varStatus="num">
	{
		"busScheduleSeq" : "${dto.busScheduleSeq}",
		"courseName" : "${dto.courseName}",
		"busTime" : "${dto.busTime}"
	}
	<c:if test="${num.count < time.size()}">,</c:if>
	</c:forEach>
]
