<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
						<li class="dropdown"><a class="dropdown-toggle"
							data-toggle="dropdown" href="#"
							style="background-color: #496486;">일반 관리 <span class="caret"></span>
						</a>

							<ul class="dropdown-menu">
								<li><a href="/spring/university/universityList.action">대학
										관리</a></li>
								<li><a href="/spring/admin/adminManage.action">계정 관리</a></li>
								<li><a href="/spring/admin/notice/notice.action">공지 사항
										관리</a></li>

							</ul></li>
						<li class="dropdown"><a class="dropdown-toggle"
							data-toggle="dropdown" href="#"
							style="background-color: #496486;">세부 관리<span class="caret"></span>
						</a>

							<ul class="dropdown-menu">
								<li><a href="/spring/device/deviceNullList.action">디바이스	- 학교</a></li>
								<li><a href="/spring/deviceInfoManage/deviceInfoManage.action">디바이스 관리</a></li>

								<li><a href="/spring/virtual/virtualBusStop.action">가상정류장 관리</a></li>

							</ul></li>
					</c:if>



		



					<li class="dropdown"><a class="dropdown-toggle"
						data-toggle="dropdown" href="#">노선분류 관리 <span class="caret"></span>
					</a>

						<ul class="dropdown-menu">
							<li><a
								href="/spring/busStopCategory/busStopCategoryAdd.action">1.대분류(버스종류)
									관리</a></li>
							<li><a
								href="/spring/detailCategory/adminDetailCategory.action">2.중분류(운행노선)
									관리</a></li>
							<li><a href="/spring/busStop/busStop.action">3.소분류(정류장) 관리</a></li>
						</ul></li>


					<li class="dropdown"><a class="dropdown-toggle"
						data-toggle="dropdown" href="#">버스/기기 관리 <span class="caret"></span>
					</a>

						<ul class="dropdown-menu">
							<li><a href="/spring/busInfo/busList.action">1.버스 정보 관리</a></li>
							<li><a href="/spring/device/deviceInfoList.action">2.버스 - 기기 매칭</a></li>
							<li><a href="/spring/busCategoryManage/busCategoryManage.action">3.버스 - 노선 매칭</a></li>
						</ul></li>


					<li><a href="/spring/admin/adminBusTimeManage.action">운행시간표 관리</a></li>
					<li><a href="/spring/polyline/polyline.action" style="background-color:#252859;">운행 기록</a></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<ul class="nav navbar-nav navbar-right">
						<li><a
							href="/spring/admin/adminMypage.action?adminID=${adto.adminID}"><span
								class="glyphicon glyphicon-user"></span>My Page</a></li>
						<li><a href="/spring/admin/adminLogOut.action">로그아웃</a></li>
					</ul>
				</ul>
			</div>
		</div>
	</nav>

</div>