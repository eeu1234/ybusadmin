<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="topInc">
	<nav class="navbar navbar-inverse">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#myNavbar">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>


			</div>



			<div class="collapse navbar-collapse" id="myNavbar">
				<ul class="nav navbar-nav">
					<li class="active"><a href="http://ybus.kr">CAMBUS</a></li>
			
			       	<c:choose>
			       	<c:when test="${adto.adminLevel =='9999'}">
					<li><a href="/spring/admin/adminMain.action">${adto.universitySeq}:${adto.universityName}</a></li>
					</c:when>
					<c:when test="${adto.adminLevel !='9999'}">
					<li><a href="#">${adto.universitySeq}:${adto.universityName}</a></li>
					</c:when>
					</c:choose>
					
					
					
					 <c:if test="${adto.adminLevel =='9999'}">
					<li class="dropdown"><a class="dropdown-toggle" 	data-toggle="dropdown" href="#" style="background-color: #496486;">최고관리자 페이지 <span class="caret"></span>	</a>
						
						<ul class="dropdown-menu">
							<li><a href="/spring/admin/universityList.action">대학 관리</a></li>
							<li><a href="/spring/admin/adminManage.action">계정 관리</a></li>
							<li><a href="/spring/admin/deviceNullList.action">디바이스 할당</a></li>
							<li><a href="/spring/admin/busCategory.action">버스 분류 관리</a></li>
							<li><a href="/spring/admin/notice/notice.action">공지 사항 관리</a></li>
								
						</ul></li>
 					</c:if>



					<li><a href="/spring/polyline/polyline.action">운행 기록</a></li>
					<li><a href="/spring/admin/deviceBusList.action">단말기 관리</a></li>
					<li><a href="/spring/busStop/busStop.action">정류장 관리</a></li>
					<li><a href="/spring/admin/adminBusTimeManage.action">운행시간표 관리</a></li>

				</ul>
				<ul class="nav navbar-nav navbar-right">
					<ul class="nav navbar-nav navbar-right">
						<li><a href="/spring/admin/adminMypage.action?adminID=${adto.adminID}"><span class="glyphicon glyphicon-user"></span>My Page</a></li>
						<li><a href="/spring/admin/adminLogOut.action">로그아웃</a></li>
					</ul>
				</ul>
			</div>
		</div>
	</nav>

</div>