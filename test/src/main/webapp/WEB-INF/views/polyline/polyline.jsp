<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/inc/asset.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset=UTF-8">
<title>CamBus 폴리라인</title>

<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

<style>
html, body {
   height: 100%;
   margin: 0px auto;
   padding: 0;
}

.datepicker_inner_container, .datepicker_header {
   position: relative;
   top: 15px;
   left: -231px;
   width: 440px;
}

.datepicker > .datepicker_inner_container > .datepicker_calendar > table {
    width: 350px;
}

#polylineTitle{
   border: 0px solid black;
   text-align: center;
   margin: 10px 0px 10px 0px;
   font-weight: bold;
}


#mapBox{
   margin-top: 0px;
}

#map {
   width : 100%;
   height: 60%;
   margin: 20px auto;
   margin-top: 30px;
}

#totalBox{
   border: 0px solid gray;
   margin: 0px auto;
   width: 90%;
   height: 100%;
}

#controllerBox{
   border: 0px solid black;
   width: 100%;
   height: auto;
   margin: 20px auto;
}

#controllerBox select{
   float: left;
   width : 24%;
   margin-left: 10px;
   cursor: pointer;
}

#controllerBox div select{
   cursor: pointer;
}

#searchForm{
   border : 0px solid gray;
   width : 100%;
   height: 100%;
   margin : 0px auto;
}

#searchForm #operationTime{
   border: 0px solid black;
   width: 100%;
}

#searchForm #operationTime #start, #searchForm #operationTime #end{
   width: 500px;
   text-align: center;
   font-size: 20px;
   font-weight: bold;
   cursor: pointer;
}

#searchForm #operationTime #btnForm{
   border: 0px solid black;
   width: 150px;
   float: right;
}

#searchForm #operationTime #btnForm input{
   width: 70px;
}

#searchForm #operationTime #btnForm #btnSearch{
   float: left;
   margin-right: 10px;
}


#timeLogo{
   border: 1px solid white;
   width: 100%;
   margin: 10px auto;
}

#timeLogo span{
   font-size: 20px;
   font-weight: bold;
   margin-left: 10px;
}



</style>

<script>
var lat;      //학교 위도
var lng;      //학교 경도
var lati="";   //학교 위도
var longi="";   //학교 경도

$(document).ready(function(){
   

      //학교 Select-옵션 클릭시 버스종류 옵션 생성!!         
      if($("#universitySel option").size()==1){ 

          $("#universitySel").ready(function(){
          var b = $("#universitySel").val();
               if(b != -1){
                  
                  //선택한 seq로 위도 경도 받아오기
                  $.ajax({
                     type : "GET",
                     url : "/spring/polyline/universityMap.action",
                     data : "seq="+b,
                     success : function(data){

                        var list = $(data).find("item");                        

                        $(list).each(function(index,item){
                           lat = $(item).find("lats").text();
                           lng = $(item).find("lngs").text();

                        });
                        
                       lati = Number(lat);   //위도, 경도를 넘기려면 number로 형변환
                       longi = Number(lng);

                       initMap(15,lati,longi);      //MAP으로 zoom, 위도, 경도 넘기기!!!!!!

                     },
                     error : function(){
                        alert("데이터 가져오는데 실패하였습니다.");
                     }

                  });//ajax

               }//if
               

               if(b != -1){
                  
                  //선택한 학교seq를 서버에 전송 -> 버스종류 목록 받아오기
                  $.ajax({
                     type : "GET",
                     url : "/spring/polyline/busStopCategory.action",
                     data : "seq="+b,
                     success : function(data){

                        $("#busCategorySel").html("<option value='-1'>버스종류를 선택하세요.</option>");
                        $("#detailCategorySel").html("<option value='-1'>노선종류를 선택하세요.</option>");
                        $("#busnumSel").html("<option value='-1'>노선종류를 선택하세요.</option>");

                        var list = $(data).find("item");
                        //alert(list.length);

                        $(list).each(function(index,item){
                           var seq = $(item).find("seq").text();
                           var name = $(item).find("name").text();
                           //alert(seq);
                           // alert(name);
                           
                           $("#busCategorySel").append("<option value='"+seq+"'>"+name+"</option>");
                           
                        });
                        
                     },
                     error : function(){
                        alert("버스종류 가져오는데 실패하였습니다.");
                     }

                     
                  });//ajax
                  
               }//if
       
            });//$("#university").change(function())
         
      } else {
            alert("학교정보를 가져올 수 없습니다!!!");
      
      }//admin if

      /* ------------------------------------------------------------------------------ */
      
       //버스종류 Select-옵션 클릭시 노선종류 옵션 생성!!
      $("#busCategorySel").change(function(){
            var b = $(this).val();
            
            if(b != -1){
               
               //선택한 버스종류seq를 서버에 전송 -> 노선종류 목록 받아오기
               $.ajax({
                  type : "GET",
                  url : "/spring/polyline/busStopDetailCategory.action",
                  data : "seq="+b,
                  success : function(data){

                     $("#detailCategorySel").html("<option value='-1'>노선종류를 선택하세요.</option>");
                     $("#busnumSel").html("<option value='-1'>버스를 선택하세요.</option>");
           
                     var list = $(data).find("item");
                    
                     $(list).each(function(index,item){
                        var seq = $(item).find("seq").text();
                        var name = $(item).find("name").text();

                        $("#detailCategorySel").append("<option value='"+seq+"'>"+name+"</option>");
                        
                     });
                     
                  },
                  error : function(){
                     alert("노선종류 가져오는데 실패하였습니다.");
                  }
               });//ajax

         
                   
            }//if
            
         });//$("#buscategorysel").change(function())

      /* ------------------------------------------------------------------------- */
       //노선종류 Select-옵션 클릭시 버스선택 옵션 생성!!
      $("#detailCategorySel").change(function(){
            var b = $(this).val();
            
            if(b != -1){
              
               //선택한 노선종류seq를 서버에 전송 -> 버스 목록 받아오기
               $.ajax({
                  type : "GET",
                  url : "/spring/polyline/busInfo.action",
                  data : "seq="+b,
                  success : function(data){

                     $("#busnumSel").html("<option value='-1'>버스를 선택하세요.</option>");

                     var list = $(data).find("item");

                     $(list).each(function(index,item){
                        var seq = $(item).find("seq").text();
                        var name = $(item).find("name").text();
   
                        $("#busnumSel").append("<option value='"+seq+"'>"+name+"</option>");

                     });
                     
                  },
                  error : function(){
                     alert("버스종류 가져오는데 실패하였습니다.");
                  }
               });//ajax  

            
            }//if
         });//$("#detailcategorysel").change(function())
               
}); //ready

</script>

<!-- ---------------------------------구글맵 연동, 폴리라인 표시------------------------------------ -->

<script>

var maker;
var locationLati = [];
var locationLongi = [];
var list = [];
var markers=[];
var flightPath;
var flightPlanCoordinates = new Array();
var point;
var map;

function initMap(lens,lati,longi) {

   //alert(lati +","+ longi);

   map = new google.maps.Map(document.getElementById('map'), {
    zoom: lens,                                                      //확대율
    center: {lat: Number(lati), lng: Number(longi)}                    //지도 가운데 좌표
    
  });
   
}//initMap()


   //폴리라인 그리기
   function drawPloyLine() {
         
          $(list).each(
                  function(index, item) {

                     if (list.length != index) {
                        point = new google.maps.LatLng($(item).find(
                              "locationLati").text(), $(item).find(
                              "locationLongi").text());
                        flightPlanCoordinates.push(point);

                     }

                  });

            flightPath = new google.maps.Polyline({
               path : flightPlanCoordinates,
               geodesic : true,
               strokeColor : 'blue',
               strokeOpacity : 1.0,
               strokeWeight : 2
            });
               
            flightPath.setMap(map);//list

   }//function drawPloyLine() 

   //정류장 마커 찍기
   function drawMarker(order, blat, blng) {

      bmarker = new google.maps.Marker({
         map : map,
         draggable : false,
         animation : google.maps.Animation.DROP,
         position : {
            lat : Number(blat),
            lng : Number(blng)
         }
      });
      markers.push(bmarker);
   }

   function toggleBounce() {
      if (marker.getAnimation() !== null) {
         marker.setAnimation(null);
      } else {
         marker.setAnimation(google.maps.Animation.BOUNCE);
      }
   
   }

</script>

<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAqkSVH4lOztiSHYWlitRMnFPXC3--QX_8&callback=initMap"></script>
</script>

<script>
/* --------------------------------------폴리라인 생성-------------------------------- */
var saveCheck = false;
 
function search(){
      
       if($("#universitySel").val() == "-1"){
              alert("학교정보를 클릭해주세요.");
              saveCheck = true;  
              
           } else if($("#busCategorySel").val() == "-1"){
              alert("버스종류를 클릭해주세요.");
              saveCheck = true;  
              
           } else if($("#detailCategorySel").val() == "-1"){
              alert("노선종류를 클릭해주세요.");
              saveCheck = true;  
              
           } else if($("#busnumSel").val() == "-1"){
              alert("버스를 클릭해주세요.");
              saveCheck = true;  
              
           } else {

               
        }

      if(saveCheck == true){
         
            
         }else{
            

       var busnumSel = $("#busnumSel").val();
       var start = $("#start").val();
       var end = $("#end").val();

      if(busnumSel != null || busnumSel == ""){
         $.ajax({
               type : "GET",
               url : "/spring/polyline/location.action",
               data : "seq="+busnumSel+"&start="+start+"&end="+end,
               success : function(data){
               
                  list = [];
                  point ="";
                  flightPlanCoordinates = [];
                  flightPath= "";
                  
               
                  list = $(data).find("item");
                  drawPloyLine();
                  
                   
               },
               error : function(){
                  alert("실패하였습니다.");
               }
            });//ajax

            /* ------------------------------------------정류장---------------------------------- */
              
            $.ajax({
                type : "GET",
                url : "/spring/polyline/busStop.action",
                data : "seq="+busnumSel,
                success : function(data){ 

                  markers = [];
                   
                   var list = $(data).find("item");
                   
                    $(list).each(function(index,item){
                     
                      order = $(item).find("order").text();
                     name = $(item).find("name").text();
                     blat = $(item).find("lat").text();
                     blng = $(item).find("lng").text();

                       drawMarker(order,blat,blng);
                    
                   });
                       
               
                },
                error : function(){
                   alert("정류장 마커맵을 가져오는데 실패하였습니다.");
                }
             });//ajax
   
      }else{
         alert("검색 옵션 선택하세요");
      }
      initMap(15,lati,longi);   //맵 좌표 초기화!!!!!(**************중요***********)
      
         }

         saveCheck = false;
}

</script>

<!-- --------------------------------날짜/시간------------------------------------------------ -->

<link rel="stylesheet" href="/spring/css/jquery.simple-dtpicker.css">
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
<script src="//mugifly.github.io/jquery-simple-datetimepicker/jquery.simple-dtpicker.js"></script>
<script>
$(function(){
    $('.datetimepicker').appendDtpicker({'locale':'ko'});

   
});
</script>

</head>
<body>   <!-- 메인 MAP 좌표  -->

   <%@include file="/inc/top.jsp"%>

   <h1 id="polylineTitle"><img src="/spring/images/logo.PNG"> 운행기록</h1>
   
      <div id="totalBox">
         <div id="controllerBox">
            
               <select id="universitySel" class="form-control">
                     <option value="${adto.universitySeq}">${adto.universityName}</option>
               </select>
            
      
               
               <select id="busCategorySel" class="form-control">
                  <option value="-1">버스종류를 선택하세요.</option>
               </select>
      
               
               <select id="detailCategorySel" class="form-control">
                  <option value="-1">노선종류를 선택하세요.</option>
               </select>
      
               
               <select id="busnumSel" class="form-control" name="busnumSel">
                  <option value="-1">버스를 선택하세요.</option>
               </select>
               <div style="clear: both;"></div>
         </div>
         <div id="mapBox">
            <div id="map"></div>
         </div>
         
	         <div id="timeLogo">
	            <span>기간 선택</span>
	         </div>
	   <div id="searchForm">
	
	      <div id="operationTime">
	         <input type="text" id="start" name="startTime" class='datetimepicker' value="" > ~ <input type="text" id="end" name="endTime" class='datetimepicker' value="" > 
	            
	
	         <div id="btnForm">
	            <input type="button" id="btnSearch" value="검색" onclick="search();" class="btn btn-primary">
	            <form method="POST" action="/spring/polyline/polyline.action">
	               <input type="submit" id="btnReset" value="초기화" class="btn btn-danger">
	            </form>
	         </div>
	      </div>
	
	   </div>
 </div>


</body>
</html>