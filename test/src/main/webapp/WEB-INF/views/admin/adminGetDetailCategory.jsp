<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
[
	<c:forEach items="${detail }" var="dto" varStatus="num">
	{
		"busStopDetailCategorySeq":"${dto.busStopDetailCategorySeq}",
		"busStopDetailCategoryName":"${dto.busStopDetailCategoryName}"
	}
	<c:if test="${num.count <detail.size() }">,</c:if>
	</c:forEach>
]
