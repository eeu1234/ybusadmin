<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><%response.setContentType("text/xml"); %><?xml version="1.0" encoding="UTF-8"?>
<list>
	<c:if test="${!empty universityMap}">
		<c:forEach items="${universityMap}" var="dto">
			<item>
				<name>${dto.universityName}</name>
				<lat>${dto.universityLatitude}</lat>
				<lng>${dto.universityLongitude}</lng>
			</item>
		</c:forEach>
	</c:if>
	<c:if test="${!empty busStop}">
		<c:forEach items="${busStop}" var="dto">
			<item>
				<seq>${dto.busStopSeq}</seq>
				<order>${dto.busStopOrder}</order>
				<name>${dto.busStop}</name>
				<line>${dto.busStopLine}</line>
				<lat>${dto.busStopLatitude}</lat>
				<lng>${dto.busStopLongitude}</lng>
			</item>
		</c:forEach>
	</c:if>
</list>    