/*	적용된 곳
	getBusStopRoadView.jsp
	getBusStopMapView.jsp
*/

$(document).ready(function(){
	// 누르면 현재 버스 카테고리에서 로드뷰 페이지 보여줌
	$(".viewBtn:eq(0)").click(function(){
		location.href="/spring/getBusStopRoadView.action?universitySeq="+universitySeq+"&busStopCategorySeq="+busStopCategorySeq+"&busStopSeq="+busStopSeq;
	});
	
	// 누르면 현재 버스 카테고리에서 맵 페이지 보여줌
	$(".viewBtn:eq(1)").click(function(){
		location.href="/spring/getBusStopMapView.action?universitySeq="+universitySeq+"&busStopCategorySeq="+busStopCategorySeq+"&busStopSeq="+busStopSeq;
	});


	// 뒤로가기
	$("#backBtn").click(function(){
		location.href="/spring/getBusStopLine.action?universitySeq="+universitySeq+"&busStopCategorySeq="+busStopCategorySeq;
	});
});