$(document).ready(function(){
	// 누르면 버스 노선도 페이지 이동
	$("#btnRouteMap").click(function(){
		location.href="/spring/getBusStopLocation.action?universitySeq="+universitySeq+"&busStopCategorySeq="+busStopCategorySeq+"&busStopDetailCategorySeq="+busStopDetailCategorySeq;
	});
	
	// 누르면 버스 시간표 페이지 이동
	$("#btnBusSchedule").click(function(){
		location.href="/spring/busSchedule/busTimeTable.action?universitySeq="+universitySeq+"&busStopCategorySeq="+busStopCategorySeq+"&busStopDetailCategorySeq="+busStopDetailCategorySeq;
	});
	
	// 홈
	$("#button_Home").click(function(){
		location.href="/spring/index.action?universitySeq="+universitySeq;
	});
});