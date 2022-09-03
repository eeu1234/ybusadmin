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
        var busType_code = 0;  //셀렉트 박스의 정보에 따라 어느 버스인지 파악하는 변수

        var busAddress = [
	        ['url("/spring/images/busSchedule/blue_1.png")','url("/spring/images/busSchedule/blue_2.png")','url("/spring/images/busSchedule/blue_3.png")'],
	        ['url("/spring/images/busSchedule/yellow_1.png")','url("/spring/images/busSchedule/yellow_2.png")','url("/spring/images/busSchedule/yellow_3.png")'],
	        ['url("/spring/images/busSchedule/red_1.png")','url("/spring/images/busSchedule/red_2.png")','url("/spring/images/busSchedule/red_3.png")']
        ];  // 이미지경로를 담고 있는 배열.
        

        function checkTime_Logo(){ // 시간에 따른 메인 로고 변경 함수

            if( hour > 7 && hour < 17){
                $('#header_top').css('background-image',busAddress[busType_code][0]);
            }
            else if(hour > 16 && hour < 20){
                $('#header_top').css('background-image',busAddress[busType_code][1]);
            }
            else if(hour > 19 || hour < 7){
                $('#header_top').css('background-image',busAddress[busType_code][2]);
            }
        }

        function changeBox(){ // 현재 시간에서 탈 수 있는 버스표시해주는 함수
            var timeList = $('.footer_timeTable_box_schedule'); // 버스가 움직이는 시간들이 들어가 있는 배열.
            var timeList_pro = []; // 시간표를 분단위로 계산하여 넣음.
            var spot ; //  
            for (var i = 0; i < timeList.length; i++){
                var timeSplitArr = $(timeList[i]).attr('id').split("_"); // 시간을 분단위로 변환
                timeList_pro.push(Number(timeSplitArr[0])*60 + Number(timeSplitArr[1])); // 리스트에 넣어버림
            }

            var nowTime = (hour * 60) + minute; //현재시간을 분단위로

            for(var i = 0; i<timeList_pro.length; i++){ //현재시간에서 탈 수 있는 가장 가까운거 찾기 위한 반복문
                if( nowTime < timeList_pro[i]){ // 현재시간이 리스트의 있는 시간보다 작다면
                    spot = i; // 배열의 인덱스를 저장.
                    break;
                }
                else{
                	spot = 0;
                }
            }
			if(spot != 0){
	            $(timeList[spot]).children(".footer_timeTable_box_schedule_top").css('color','#142637');
	            $(timeList[spot]).children(".footer_timeTable_box_schedule_bottom").css('background-image','url("/spring/images/busSchedule/순환코스(해당시간)_박스.png")');
	
	            // 회색 긴줄에 네이비 칠해주는 작업
	            $(timeList[spot]).parent().css('border-left','3px solid #142637');
			}else{
				$('<img id = "header_bottom_logo"  src="/spring/images/busSchedule/안내_아이콘.png">').prependTo('#header_bottom_text');
				$('#notice_text').text('지금은 버스운행 시간이 아닙니다.');
			}

        }

        function checkBus_Logo(type){ // 셀렉트박스에서 버스 종류가 가져와서 메인 이미지 변경하는데 필요한 코드를 변경함
            if(type == 18){
                busType_code = 0;
            }
            else if(type == 36){
                busType_code = 1;
            }
        }

        function countChild(){  // 자식요소의 개수를 카운팅하여 시간을 나타내는 div 수직정렬에 가깝게 만듬.
            var childArray;
            var i = 1;
            while(true){
                childArray = $("#" +i).children();
                if(childArray.length > 4){
                    $('#'+i).parent().prev().css('padding-top','11%');
                }
                if(childArray.length == 0){
                    break;
                }
                i++;
             }
        }
        
        function schedule(flag){
        	
        	var seq = $("#container_selectBus").val();
        	var detail_seq = $("#container_selectWay").val();
        	var weekDays = $("#container_selectDay").val();
        	if(flag == 1){
        		if(seq == 37){
	        		location.href="/spring/busSchedule/schoolBusTimeTable.action?busStopCategorySeq="+seq+"&weekDays="+weekDays;
	        	}else{
	        		location.href="/spring/busSchedule/busTimeTable.action?busStopCategorySeq="+seq+"&weekDays="+weekDays;
	        	}
        	}else{
	        	location.href="/spring/busSchedule/busTimeTable.action?busStopCategorySeq="+seq+"&busStopDetaliCategorySeq="+detail_seq+"&weekDays="+weekDays;
        	}
        }
		
        $(document).ready(function(){
            var busType = $("#container_selectBus").val();
            checkBus_Logo(busType);
        	checkTime_Logo();
            changeBox();
            countChild();
            $("#container_selectBus").change(function(){
                var busType = $("#container_selectBus").val(); // 셀렉트 박스에 값 가져오기
                checkBus_Logo(busType);
                checkTime_Logo();
                schedule(1);
            });
            $("#container_selectWay").change(function(){
                schedule();
            });
            $("#container_selectDay").change(function(){
				schedule();
            });
            
            

            window.onpageshow = function(event) {
            if ( event.persisted || (window.performance && window.performance.navigation.type == 2)) {
            // Back Forward Cache로 브라우저가 로딩될 경우 혹은 브라우저 뒤로가기 했을 경우
            		window.location.reload();
            	}
            }
            
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
            background:url("./img/blue_1.png");
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
            width:60.18%;
            margin-left:35.21%;
            margin-right:4.61%;
            margin-top:3.074%;
            margin-bottom:3.074%;
        }
        #container_selectBus{
            width:32%;
            height:26px;
            box-shadow: 0px 0px 15px #0F296B1F;
            border-radius: 13px;
            text-align: center;
            font-family: "Pretendard-Bold";
            color:#142637;
            border:0;
			outline:0;
			font-size:0.9em;
        }
        #container_selectWay{
            width:32%;
            height:26px;
            box-shadow: 0px 0px 15px #0F296B1F;
            border-radius: 13px;
            text-align: center;
            font-family: "Pretendard-Bold";
            color:#142637;
            border:0;
			outline:0;
			font-size:0.9em;
        }
        #container_selectDay{
            width:30%;
            height:26px;
            box-shadow: 0px 0px 15px #0F296B1F;
            border-radius: 13px;
            text-align: center;
            font-family: "Pretendard-Bold";
            color:#142637;
            border:0;
			outline:0;
			font-size:0.9em;
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
        #notBusTime{
        	font-size:1.1em;
        	font-family: "Pretendard-Medium";
        	text-align:center;
        	padding: 7% 0;
        	letter-spacing:2px;
        }
        .footer_timeTable_box_left{
            width:14.14%;
            float:left;
            padding-top:5.5%;
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
            border-left:3px solid #b4b4b4;
            padding-top:3%;
            padding-bottom:3%;
        }
        .footer_timeTable_box_right_box{
            position:relative;
            left:-3px;
            width:100%;
            float:left;
            border-left:3px solid rgba(0,0,0, .0);
        }
        .footer_timeTable_box_schedule{
            width:19.11%;
            float:left;
            margin: 0 2.625%;
            font-size:0.75em;
            text-align: center;
            letter-spacing: -0.3px;
        }
        .footer_timeTable_box_schedule_top{
            width:25%;
            margin:auto;
            font-family: "Pretendard-Medium";
            color:#b4b4b4;
        }
        .footer_timeTable_box_schedule_bottom{
            width:100%;
            background:url("/spring/images/busSchedule/순환코스_박스.png");
            background-size: 100% 100%;

            margin:4% auto;
            max-width:60px;
            font-family: "Pretendard-Medium";
            color:#ffffff;
        }
        .whiteBox{
            width:100%;
            background-color:#FFFFFF;
        }
        .grayBox{
            width:100%;
            background-color:#fafafc;
        }
    </style>
</head>
<body>
<div id = "header">
  <div id = "header_top">
    <div id = "header_top_text">버스 시간표</div>
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
  <select id = "container_selectWay">
  	<c:forEach items = "${dlist}" var = "category">
    	<option value="${category.busStopDetailCategorySeq}" <c:if test="${busStopDetaliCategorySeq == category.busStopDetailCategorySeq}">selected</c:if>>${category.busStopDetailCategoryName}</option>    	
    </c:forEach>
  </select>
  <select id = "container_selectDay">
    <option value="normal"  <c:if test="${weekDays == 'normal'}">selected</c:if>>월-목</option>
    <option value="friday"  <c:if test="${weekDays == 'friday'}">selected</c:if>>금요일</option>
    <option value="weekends"  <c:if test="${weekDays == 'weekends'}">selected</c:if>>주말</option>
  </select>
</div>


<div id = "footer">
  <div id = "footer_timeTable">
  
	<c:choose>
		<c:when test = "${slist.timeList.size() == 0}">
			<div id = "notBusTime">운행예정인버스가 없습니다.</div>
		</c:when>
		<c:otherwise>
		  	<c:forEach items = "${slist.timeList}" var = "time" varStatus = "out">
		  		<c:choose>
		  			<c:when test = "${out.index % 2 eq 0 }">
		  				<div class = "grayBox">
		  					<div class = "footer_timeTable_box_left">
		        				<div class = "footer_timeTable_box_hour">${fn:split(time.busTime,':')[0]} </div>
		      				</div>
		  					<div class = "footer_timeTable_box_right">
						 		<div id = "${out.count}" class = "footer_timeTable_box_right_box">
						 		<c:forEach items = "${time.busTimeHourMin}" var = "timeArray" varStatus = "in">
		          					<div id = "${fn:split(timeArray,':')[0]}_${fn:split(timeArray,':')[1]}" class = "footer_timeTable_box_schedule">
		           						<div class = "footer_timeTable_box_schedule_top">${fn:split(timeArray,':')[1]}</div>
		          						<div class = "footer_timeTable_box_schedule_bottom">${fn:split(time.busStopDetaliCategoryName,'-')[0]}</div>
		        					</div>
		        				</c:forEach>	
		       					</div>		
		   					</div>
		      				<div style="clear:both;"></div>
		      			</div>
		  			
		  			</c:when >
		  			<c:when test = "${out.index % 2 eq 1}">
		  				<div class = "whiteBox">
		  					<div class = "footer_timeTable_box_left">
		        				<div class = "footer_timeTable_box_hour">${fn:split(time.busTime,':')[0]} </div>
		      				</div>
		  					<div class = "footer_timeTable_box_right">
						 		<div id = "${out.count}" class = "footer_timeTable_box_right_box">
						 		<c:forEach items = "${time.busTimeHourMin}" var = "timeArray" varStatus = "in">
		          					<div id = "${fn:split(timeArray,':')[0]}_${fn:split(timeArray,':')[1]}" class = "footer_timeTable_box_schedule">
		           						<div class = "footer_timeTable_box_schedule_top">${fn:split(timeArray,':')[1]}</div>
		          						<div class = "footer_timeTable_box_schedule_bottom">${fn:split(time.busStopDetaliCategoryName,'-')[0]}</div>
		        					</div>
		        				</c:forEach>	
		       					</div>		
		   					</div>
		      				<div style="clear:both;"></div>
		      			</div>
		  			</c:when>
		      	</c:choose>
		  	  </c:forEach>
	  	  </c:otherwise>
  	  </c:choose>
  </div>
  
  
  
  </div>



</body>
</html>