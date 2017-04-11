<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><%response.setContentType("text/xml"); %><?xml version="1.0" encoding="UTF-8"?>
<list>
		<c:forEach items="${virtualBusStop}" var="dto">
			<item>
				<seq>${dto.virtualBusStopSeq}</seq>
				<order>${dto.virtualBusStopOrder}</order>
				<name>${dto.virtualBusStop}</name>
				<line>${dto.virtualBusStopLine}</line>
				<lat>${dto.virtualBusStopLatitude}</lat>
				<lng>${dto.virtualBusStopLongitude}</lng>
			</item>
		</c:forEach>
</list>    