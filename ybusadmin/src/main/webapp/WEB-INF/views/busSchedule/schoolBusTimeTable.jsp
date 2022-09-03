<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0" />
    <title>운행시간표</title>
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>

    <script>
        var now = new Date(); // 시간을 받아오는 객체 생성
        var hour = now.getHours(); // 시
        var minute = now.getMinutes(); // 분
        var busType_code = 0;

        var busAddress = [
        'url("/spring/images/busSchedule/red_1.png")','url("/spring/images/busSchedule/red_2.png")','url("/spring/images/busSchedule/red_3.png")'
        ];


        function checkTime_Logo(){ // 시간에 따른 메인 로고 변경 함수

            if( hour > 7 && hour < 17){
                $('#header_top').css('background-image',busAddress[0]);
            }
            else if(hour > 16 && hour < 20){
                $('#header_top').css('background-image',busAddress[1]);
            }
            else if(hour > 19 || hour < 7){
                $('#header_top').css('background-image',busAddress[2]);
            }
        }
        
        function changBoxColor(){
        	var scheduleList = $(".added_box_container_right");
        	var nowTime = (hour * 60) + minute;
        	var mainTimeList = [];
        	var spot = 0;
        	
        	for(var i = 0; i<scheduleList.length; i++){  // 시간을 mianTimeList에 담는 작업
        		var	timeList = $(scheduleList[i]).find('.added_box_container_right_schedule_top'); //시간을 담고
        		var timeList_pro = [];
        		for(var j = 0; j<timeList.length; j++){
        			var time_divide = $(timeList[j]).text().split(':'); //해당시간을 시와 분으로 쪼개둠
    				var time_ToMin = Number(time_divide[0]*60) + Number(time_divide[1]); //분단위로 시간을 변환
    				timeList_pro.push(time_ToMin); // 시간을 리스트에 넣기
        		}
        		mainTimeList.push(timeList_pro); // 모은 리스트를 메인 리스트에 넣기
        	}
        	
        	for(var i = 0; i<mainTimeList.length; i++){	
        		for(var j = 0; j<mainTimeList[i].length; j++){
        			if(mainTimeList[i][j] > nowTime){
        				spot = j;
        				var top = $(scheduleList[i]).find('.added_box_container_right_schedule_top')[spot];
        				var bottom = $(scheduleList[i]).find('.added_box_container_right_schedule_bottom');
        				$(top).css('color','#142637');
        				$(bottom).css('background-image','url("/spring/images/busSchedule/순환코스(해당시간)_박스.png")');
        			}	
        		}
        	}
        	if(nowTime > pickMax(mainTimeList)){
        		$('<img id = "header_bottom_logo"  src="/spring/images/busSchedule/안내_아이콘.png">').prependTo('#header_bottom_text');
				$('#notice_text').text('지금은 버스운행 시간이 아닙니다.');
        	}
        	
        }
		
        function pickMax(list){
        	var max = 0;
        	for(var i = 0; i<list.length; i++){
        		for(var j = 0; j<list[i].length;j++){
        			if(max <= list[i][j]){
        				max = list[i][j];
        			}
        		}
        	}
        	return max;
        }
        
        
        
        $(document).ready(function(){
            checkTime_Logo();
            changBoxColor();
            $("#container_selectBus").change(function(){
                var busType = $("#container_selectBus").val(); // 셀렉트 박스에 값 가져오기
                checkTime_Logo();
            });

            $('.whiteBox_charge,.grayBox_charge').click(function(){
                $(this).next(".added_box").stop().slideToggle(300);
                $(this).toggleClass('on').siblings().removeClass('on');
                $(this).next(".added_box").siblings(".added_box").slideUp(300);

            });
            
            $("#container_selectBus").change(function(){
            	var weekDays = $("#container_selectDay").val();
            	var seq = $("#container_selectBus").val();
				if(seq != 37){
					location.href="/spring/busSchedule/busTimeTable.action?busStopCategorySeq="+seq+"&weekDays="+weekDays;
				}
			});
            
            $("#container_selectDay").change(function(){
            	var weekDays = $("#container_selectDay").val();
            	var seq = $("#container_selectBus").val();
            	location.href="/spring/busSchedule/schoolBusTimeTable.action?busStopCategorySeq="+seq+"&weekDays="+weekDays;
        	});
        });




    </script>


    <style>
        @font-face {
			font-family: "Pretendard-Bold";
			src:url(/spring/css/fonts/2022/Pretendard-Bold.woff) format("truetype");
	    }
	    @font-face {
			font-family: "Pretendard-Medium";
			src:url(/spring/css/fonts/2022/Pretendard-Medium.woff) format("truetype");
	    }

        html,body{
            width: 100%;
            max-width:600px;
            min-width:375px;
            margin: 0 auto;
            background-color:#fafafc;
            padding-bottom:5%;
        }
        #header{
            width:100%;
        }
        #header_top{
            width:100%;
            background:url("/spring/images/busSchedule/blue_1.png");
            background-size: 100% 100%;
            background-position: center center;
            background-repeat: no-repeat;
        }
        #header_top_text{
            font-size:1.8em;
            padding-top:15.37%;
            padding-bottom:31.5%;
            padding-left:4.611%;
            font-family: "Pretendard-Bold";
            color:#ffffff;
        }
        #header_bottom{
            width:100%;
            height:16px;
            padding:5px 0;
            background-color:#585858;
        }
        #header_bottom_layout{
            height:100%;
            text-align:center;
        }
        #header_bottom_logo{
            height:100%;
            padding-right:1%;
        }
        #header_bottom_text{
            width:100%;
            height:100%;
            font-family: "Pretendard-Medium";
            color:#ffffff;
            font-size:0.75em;
            float:left;
        }
        #container{
            width:45.18%;
            margin-left:50.21%;
            margin-right:4.61%;
            margin-top:3.074%;
            margin-bottom:3.074%;
        }
        #container_selectBus{
            width:51.95%;
            height:26px;
            box-shadow: 0px 0px 15px #0F296B1F;
            border-radius: 13px;
            text-align: center;
            font-family: "Pretendard-Bold";
            color:#142637;

        }
        #container_selectDay{
            width:41.38%;
            height:26px;
            box-shadow: 0px 0px 15px #0F296B1F;
            border-radius: 13px;
            margin-left:3%;
            text-align: center;
            font-family: "Pretendard-Bold";
            color:#142637;
        }
        #footer{
            width:81.534%;
            margin: 0 4.62%;
            padding:5.125% 4.613%;
            box-shadow: 0px 0px 15px #0F296B1F;
            border-radius: 12px;
            background-color:#ffffff;
        }
        #footer_timeTable{
            position:relative;
            width:100%;
            box-shadow: 0px 0px 15px #0F296B1F;
            border-radius: 12px;
            overflow:hidden;
        }
        .footer_timeTable_box_left{
            width:14.14%;
            float:left;
            margin-right:2%;
            margin-top:2.3%;
        }
        .footer_timeTable_box_hour{
            font-size:0.75em;
            text-align:center;
            color:#142637;
            font-family: "Pretendard-Bold";
        }
        .footer_timeTable_box_right{
            width:83.86%;
            /*margin-top:4.715%;
            margin-bottom:4.715%;*/
            float:left;
        }
        .footer_timeTable_box_schedule{
            width:19.11%;
            float:left;
            margin: 0 2.625%;
        }
        .footer_timeTable_box_schedule_top{
            width:25%;
            font-size:0.75em;
            margin:auto;
            font-family: "Pretendard-Medium";
            color:#b4b4b4;
        }
        .footer_timeTable_box_schedule_bottom{
            width:100%;
            background:url("/spring/images/busSchedule/순환코스_박스.png");
            background-size: 100% 100%;
            background-position: center center;
            background-repeat: no-repeat;
            font-size:0.75em;
            text-align: center;
            letter-spacing: -0.3px;
            color: #FFFFFF;
            margin:4% 0;
            font-family: "Pretendard-Medium";
            color:#ffffff;
        }
        .grayBox_charge{
            background-color:#fafafc;
            height:50px;
        }
        .whiteBox_charge{
            background-color:#ffffff;
            height:50px;
        }
        .busCharge_left{
            font-size:0.75em;
            float:left;
            height:19px;
            padding:15.5px 0;
            padding-right:4.4%;
            margin-left:5%;
            line-height:22px;
            letter-spacing: -0.3px;
            font-family: "Pretendard-Bold";
        }
        .busCharge_mid{
            content:url("/spring/images/busSchedule/아이콘_더보기.png");
            float:left;
            height:19px;
            padding:15.5px 0;
        }
        .busCharge_right{
            background:url("/spring/images/busSchedule/순환코스(해당시간)_박스.png");
            background-size: 100% 100%;
            width:25%;
            max-width:75px;
            float:right;
            color:#ffffff;
            font-size:0.75em;
            text-align:center;
            height:19px;
            line-height:20px;
            margin:15.5px 5% 15.5px 0;
            letter-spacing: -0.25px;
            font-family: "Pretendard-Medium";
        }
        .added_box{
            display:none;
        }
        .added_box_container{
            height:100%;
            border-top:1px solid #b4b4b4;
            margin: 0 5%;
        }
        .added_box_container_left{
            width:35%;
            float:left;
            padding:12px 0;
            font-family: "Pretendard-Bold";
            letter-spacing: -0.25px;
            color: #142637;
            font-size:0.5em;
        }
        .added_box_container_right{
            width:59.5%;
            height:100%;
            margin-left:5.5%;
            float:left;
        }
        .added_box_container_right_schedule{
            width:29%;
            max-width:50px;
            padding:10px 0;
            margin:0 2%;
            height:30px;
            font-family: "Pretendard-Medium";
            letter-spacing: -0.3px;
            text-align:center;
            font-size:0.8em;
            float:left;
        }
        .added_box_container_right_schedule_top{
            width:100%;
            height:14px;
            margin-bottom:2px;
            color:#b4b4b4;
        }
        .added_box_container_right_schedule_bottom{
            width:100%;
            height:14px;
            background:url("/spring/images/busSchedule/순환코스_박스.png");
            background-size: 100% 100%;
            color:#ffffff;
            line-height:14px;
        }

    </style>
</head>
<body>
<div id = "header">
    <div id = "header_top">
        <div id = "header_top_text">
            <span>버스 시간표</span>
        </div>
    </div>
    <div id = "header_bottom">
        <div id = "header_bottom_layout">
            <div id = "header_bottom_text">
                <span id = "notice_text" style="position:relative; bottom:25%;"></span>
            </div>
        </div>
    </div>
</div>
<div id = "container">
    <select id = "container_selectBus">
        <c:forEach items = "${clist}" var = "category">
    	<option value="${category.busStopCategorySeq}"  <c:if test="${busStopCategorySeq == category.busStopCategorySeq}">selected</c:if>>${category.busStopCategory}</option>    	
    </c:forEach>
    </select>
    <select id = "container_selectDay">
        <option value="normal"  <c:if test="${weekDays == 'normal'}">selected</c:if>>월-목</option>
    <option value="friday"  <c:if test="${weekDays == 'friday'}">selected</c:if>>금요일</option>
    </select>
</div>
<div id = "footer">
    <div id = "footer_timeTable">
      
        
        
        
        
        <c:forEach  items = "${dlist}" var = "dlist" varStatus = "out">
			<c:if test = "${not empty slist[out.index].timeList[0].busTime}">
		        <div class = "whiteBox_charge" >
			        <div class = "busCharge_left">${dlist.busStopDetailCategoryName}</div>
			        <div class = "busCharge_mid"></div>
			        <div class = "busCharge_right">${dlist.buspee}</div>
			    	<div style="clear:both;"></div>
			    </div>
		    </c:if>
		    <div class = "added_box">
		        <c:forEach items = "${slist}" var = "slist" varStatus = "in">
			        <c:if test="${out.count == in.count }">
	        			<c:forEach items = "${slist.timeList}" var = "timelist">
   						            <div class = "added_box_container">
						                <div class = "added_box_container_left">
						                    <span>${timelist.courseName}</span>
						                </div>
						                <div class = "added_box_container_right">
						                <c:forEach items = "${timelist.busTimeHourMin}" var = "timeHourMin">
						                    <div class = "added_box_container_right_schedule">
					                        	<div class = "added_box_container_right_schedule_top">${timeHourMin}</div>
					                        	<div class = "added_box_container_right_schedule_bottom">${fn:split(dlist.busStopDetailCategoryName,'(')[0]}</div>
					                    	</div>
					                    </c:forEach>
					                	</div>
					                	<div style="clear:both;"></div>
					            	</div>
			        	</c:forEach>
			        </c:if>	
        		</c:forEach>
		 	</div>
        </c:forEach>
        
        
        
        
       
    </div>
</div>
</body>
</html>