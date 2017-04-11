<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><%response.setContentType("text/xml"); %><?xml version="1.0" encoding="UTF-8"?>
<list>
	<c:forEach items="${busInfo}" var="dto">
		<item>
			<seq>${dto.busInfoSeq}</seq>
			<name>${dto.busInfoName}</name>
		</item>
	</c:forEach>
</list>    