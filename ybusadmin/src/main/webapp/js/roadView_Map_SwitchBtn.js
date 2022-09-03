/*	적용된 곳
	getBusStopRoadView.jsp
	getBusStopMapView.jsp
*/

$(document).ready(function(){
	$(".viewBtn:eq(0)").click(function(){
		location.href="/spring/getBusStopRoadView.action?universitySeq="+universitySeq+"&busStopCategorySeq="+busStopCategorySeq+"&busStopSeq="+busStopSeq;
	});
	
	$(".viewBtn:eq(1)").click(function(){
		location.href="/spring/getBusStopMapView.action?universitySeq="+universitySeq+"&busStopCategorySeq="+busStopCategorySeq+"&busStopSeq="+busStopSeq;
	});

	$("#backBtn").click(function(){
		location.href="/spring/getBusStopLine.action?universitySeq="+universitySeq+"&busStopCategorySeq="+busStopCategorySeq;
	});
});