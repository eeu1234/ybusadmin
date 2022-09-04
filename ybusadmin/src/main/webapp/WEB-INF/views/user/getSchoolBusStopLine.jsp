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
    <link rel="stylesheet" href="/spring/css/2022css/busStopHeader.css">

    <script>
       var now = new Date(); // 시간을 받아오는 객체 생성
       var hour = now.getHours(); // 시
       var minute = now.getMinutes(); // 분
       var busAddress = ['url("/spring/images/busSchedule/red_1.png")','url("/spring/images/busSchedule/red_2.png")','url("/spring/images/busSchedule/red_3.png")'];
   
   
       function checkTime_Logo(){ // 시간에 따른 메인 로고 변경 함수
   
           if( hour > 7 && hour < 17){
               $('#hedaerTop').css('background-image',busAddress[0]);
           }
           else if(hour > 16 && hour < 20){
               $('#hedaerTop').css('background-image',busAddress[1]);
           }
           else if(hour > 19 || hour < 7){
               $('#hedaerTop').css('background-image',busAddress[2]);
           }
       }
   
       function checkBorder(){
           var box = $('.added_box');
           for(var i = 0; i<box.length; i++){
               $(box[i]).children().last().css('border-bottom','0px solid black');
           }
       }
   
   
   
   
   
       $(document).ready(function(){
           checkTime_Logo();
           checkBorder();
           $('.whiteBox').click(function(){
               $(this).next(".added_box").stop().slideToggle(300);
               $(this).toggleClass('on').siblings().removeClass('on');
               $(this).next(".added_box").siblings(".added_box").slideUp(300);
   
           });
           
           $(".added_box_container").click(function(){
             location.href="/spring/getBusStopRoadView.action?university=1&busStopCategorySeq=37&busStopSeq="+$(this).attr("busStopSeq");
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
        #header_top_text_box_schedule{
            content:url("/spring/images/busSchedule/시간표.png");
            height:35.2px;
            margin-left:2.15%;
            margin-right:4.835%;
            float:right;
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
        #footer{
            width:90.76%;
            margin: 4.613% 4.62%;
            box-shadow: 0px 0px 15px #0F296B1F;
            border-radius: 12px;
            background-color:#ffffff;
            overflow:hidden;
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
        .whiteBox{
            width:93.38%;
            background-color:#FFFFFF;
            padding:3% 3.31%
        }
        .whiteBox_left{
            font-family: "Pretendard-Bold";
            font-size:0.75em;
            float:left;
            line-height:200%;
        }
        .whiteBox_right{
            float:right;
            content:url("/spring/images/busSchedule/아이콘_더보기.png");
            width:5%;
        }
        .added_box{
            display:none;
            margin: 0 3.31%;
            background-color: #fafafc;
        }
        .added_box_container{
            height:100%;
            border-bottom:1px solid #b4b4b4;
            margin: 0 5.443%;
            font-family: "Pretendard-Bold";
            font-size:0.75em;
            padding:3.63% 0;
        }
   
    </style>
</head>
<body>
   <!-- <div id = "header">
       <div id = "header_top">
           <div id = "header_top_text">
               <span style = "float:left;margin-right:10px;"><img src="/spring/images/2022busStop/ButtonHome_White.png" style="height:30px;"></span>
               <span style = "float:left;">통학 버스</span>
               <div id = "header_top_text_box_schedule" onclick="location.href='/spring/busSchedule/schoolBusTimeTable.action?busStopCategorySeq=37&weekDays=normal';"></div>
           </div>
       </div>
       <div id = "header_bottom">
           <div id = "header_bottom_layout">
               <div id = "header_bottom_text">
                   <img id = "header_bottom_logo"  src="/spring/images/busSchedule/안내_아이콘.png">
                   <span style="position:relative; bottom:25%;">통학버스는 실시간 조회 서비스를 제공하지 않습니다.</span>
               </div>
           </div>
       </div>
   </div> -->
   
   
   
   
   <div id="header">
       <input type="hidden" id="busStopCategorySeq" value="${busStopCategorySeq}">
        <div id="hedaerTop">
         <div id="headerTopContents">
            <div id="button_Home_Zone">
               <div id="button_Home" onclick="location.href='/spring/index.action'">
                  
               </div>
            </div>
             <div id="busTypeZone">
                <div id = "busType">통학 버스</div>
             </div>
             <div id="buttonsZone">
                 <div id="buttons">
                     <div id="btnBusScheduleZone" onclick="location.href='/spring/busSchedule/schoolBusTimeTable.action?busStopCategorySeq=37&weekDays=normal';">
                         <div id="btnBusSchedule">
                         </div>
                     </div>
                     <div id="btnRouteMapZone">
                         <div id="btnRouteMap" style = "background:none;" >
                         </div>
                     </div>
                 </div>
             </div>
         </div>
        </div>
        <div id="busStopNotification">
            <div id="busStopNotice" >
                <div id="noticeIconZone" class="busNotice">
                    <div id="noticeIcon">
                       <!-- css background에 이미지 들어있음 -->
                    </div>
                </div>
                <div id="busNoticeContents" class="busNotice">
                    통학버스는 위치조회 서비스를 제공하지 않습니다.
                </div>
                <div style="clear: both"></div>
            </div>
        </div>
    </div>
   
   
   
   
   <div id = "footer">
      <c:forEach items = "${dlist}" var = "dlist" varStatus = "out">
         <div class = "whiteBox" >
            <div class = "whiteBox_left">${dlist.busStopDetailCategoryName}</div>
            <div class = "whiteBox_right"></div>
            <div style="clear:both;"></div>
         </div>
         <div class = "added_box">
            <c:forEach items = "${busStopList}" var = "busStopList" varStatus = "in">
               <c:if test="${dlist.busStopDetailCategoryName == busStopList.busStopDetailCategoryName }">
                  <div class = "added_box_container" busStopSeq='${busStopList.busStopSeq}' >
                     ${busStopList.busStop}
                  </div>
               </c:if>
            </c:forEach>
         </div>   
      </c:forEach>
   </div>
</body>
</html>