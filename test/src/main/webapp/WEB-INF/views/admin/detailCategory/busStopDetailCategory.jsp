<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><%response.setContentType("text/xml"); %><?xml version="1.0" encoding="UTF-8"?>
<list>
   <c:forEach items="${showDetailCategoryList}" var="dto">
      <show>
         <seq>${dto.busStopDetailCategorySeq}</seq>
         <name>${dto.busStopDetailCategoryName}</name>
         <interval>${dto.busStopDetailCategoryInterval}</interval>
         <distance>${dto.busStopDetailCategoryIntervalDistance}</distance>
         <stat>${dto.busStopDetailCategoryStat}</stat>
      </show>
   </c:forEach>
   <c:forEach items="${hideDetailCategoryList}" var="dto">
      <hide>
         <seq>${dto.busStopDetailCategorySeq}</seq>
         <name>${dto.busStopDetailCategoryName}</name>
         <interval>${dto.busStopDetailCategoryInterval}</interval>
         <distance>${dto.busStopDetailCategoryIntervalDistance}</distance>
         <stat>${dto.busStopDetailCategoryStat}</stat>
      </hide>
   </c:forEach>
</list>    