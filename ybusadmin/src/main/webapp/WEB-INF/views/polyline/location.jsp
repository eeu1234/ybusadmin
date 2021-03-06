<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%response.setContentType("text/xml"); %>
    <?xml version="1.0" encoding="UTF-8"?>
<list>
	<c:forEach items="${location}" var="dto">
		<item>
			<locationLati>${dto.locationLatitude}</locationLati>
			<locationLongi>${dto.locationLongitude}</locationLongi>
			<locationTime>${dto.locationTime}</locationTime>
		</item>
	</c:forEach>
	
		<c:forEach items="${busLogList}" var="log">
		<busLog>
			<busLogSeq>${log.busLogSeq}</busLogSeq>
			<busLogStaff>${log.busLogStaff}</busLogStaff>
			<busLogDriver>${log.busLogDriver}</busLogDriver>
			<busLogDestination>${log.busLogDestination}</busLogDestination>
			<busLogDistance>${log.busLogDistance}</busLogDistance>
			<busLogLastDistance>${log.busLogLastDistance}</busLogLastDistance>
			<busLogPurpose>${log.busLogPurpose}</busLogPurpose>
			<busLogSignimg>${log.busLogSignimg}</busLogSignimg>
			<busLogStartTime>${log.busLogStartTime}</busLogStartTime>
			<busLogEndTime>${log.busLogEndTime}</busLogEndTime>
			<busLogRegdate>${log.busLogRegdate}</busLogRegdate>
		</busLog>
	</c:forEach>
</list>