<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="/inc/asset.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset=UTF-8">
<title>CamBus 폴리라인</title>





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

#totalKm{
	color:red;
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






/*컨텐츠*/
	
	#tbl1 { width: 1440px; margin: 30px auto;}
	#tbl1 th, #tbl1 td { text-align: center; }
	 

	
	#tbl2 { width: 500px; margin: 20px auto; margin-bottom: 100px;}
	
	#searchMsg { text-align: center; }
	
	#btnSubject{
		background-color: window;
		border: 0px solid white;
	}
	
	#btnSubject:hover{
		color: orange;
		cursor: pointer;
	}
	
	#btnSel{
		border: 0px solid black;
		width: 150px;
		height: 30px;
		margin-left: 20px;
		text-align: center;
	}
	
	#btnEdit{
		position: relative;
		height: 30px;
		top: 0px;
		left: -20px;
	}
	
	#btnDel{
		position: relative;
		height: 30px;
		top: -46px;
		left: 40px;
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
var totalKm = 0 ;
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
	   totalKm = 0 ;
		var oldLati=0;
		var oldLngi=0;
         
          $(list).each(
                  function(index, item) {
					
                     if (list.length != index) {
                    
                    	 
                    	 
                    	
                    	
                        point = new google.maps.LatLng($(item).find(
                              "locationLati").text(), $(item).find(
                              "locationLongi").text());
                    	
                        flightPlanCoordinates.push(point);
                        
                        
                        
                        if(oldLati!=0 && oldLngi!=0){
                        	
                        	totalKm +=  getDistanceFromLatLonInKm($(item).find(
                             "locationLati").text(),$(item).find(
                             "locationLongi").text(),oldLati,oldLngi);
                        }
                             oldLati = $(item).find("locationLati").text(); 
                             oldLngi =$(item).find("locationLongi").text();
                        
                        
                        

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
			
    
            //총거리 게산 소수점3자리 반올림
            $("#totalKm").text("기간동안 총거리는 약 " + totalKm.toFixed(3) + " KM");
            
           
        	
          
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

   function getDistanceFromLatLonInKm(lat1,lng1,lat2,lng2) {
	    function deg2rad(deg) {
	        return deg * (Math.PI/180)
	    }

	    var R = 6371; // Radius of the earth in km
	    var dLat = deg2rad(lat2-lat1);  // deg2rad below
	    var dLon = deg2rad(lng2-lng1);
	    var a = Math.sin(dLat/2) * Math.sin(dLat/2) + Math.cos(deg2rad(lat1)) * Math.cos(deg2rad(lat2)) * Math.sin(dLon/2) * Math.sin(dLon/2);
	    var c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a));
	    var d = R * c; // Distance in km
	    return d;
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
               dataType: "text",
               success : function(data){
               
                  list = [];
                  point ="";
                  flightPlanCoordinates = [];
                  flightPath= "";
                  
               
                  list = $(data).find("item");
                
                  drawPloyLine();
                  
                  
                  listLog = $(data).find("busLog");
                  $('#tbl1 tbody').empty();
                  $('#tbl1 > tbody:last').append('<tr></tr>');
                  
                  
                  
                  //운행기록 km
                  var logTotalKm = 0 ;
 
                  var countFlag = 0;
                  var tempKm = 0;
                  
                  $(listLog).each(
                          function(index, item) {
                        	  
                    
                        	  /*운행 대장 테이블 업데이트*/

								

								
							
		
								var html ="";
								html += '<tr>';
							 	html += '<td>'+$(item).find("busLogSeq").text()+'</td>';
							 	html += '<td>'+$(item).find("busLogStaff").text()+'</td>';
								html += '<td>'+$(item).find("busLogDriver").text()+'</td>';
								html += '<td>'+$(item).find("busLogDestination").text()+'</td>';
								html += '<td>'+$(item).find("busLogPurpose").text()+'</td>';
								html += '<td>'+$(item).find("busLogStartTime").text()+'</td>';
								html += '<td>'+$(item).find("busLogEndTime").text()+'</td>';
								html += '<td>'+$(item).find("busLogDistance").text()+'</td>';
								html += '<td>'+$(item).find("busLogRegdate").text()+'</td>';
								html += '<td><a href="/spring/images/sign/'+$(item).find("busLogSignimg").text()+'" target="_blank">'+"서명보기"+'</a></td>';
							 	html += '</tr>';
								
								
								
								$('#tbl1 tr:last').after(html); 
								 
								
								if(countFlag == 0){
									if(isNaN( parseInt($(item).find("busLogDistance").text())) == false){
										
										//logTotalKm = logTotalKm +   (parseInt($(item).find("busLogDistance").text()));
								
										
									countFlag++;//첫번째 일때만 flag 값 증가 
									tempKm = (parseInt($(item).find("busLogDistance").text()));// 임시km에 저장
									}
									
								}else{
									if(isNaN( parseInt($(item).find("busLogDistance").text())) == false){
										
										logTotalKm = logTotalKm +   (parseInt($(item).find("busLogDistance").text()))-tempKm;
								
										
									tempKm = (parseInt($(item).find("busLogDistance").text()));// 임시km에 저장
									}
									
									
								}
			
							
			                          
                          });
                        	  
		                  //총거리 게산 소수점3자리 반올림
		                  $("#logTotalKm").text("운행기록 총 거리는 " + Math.abs(logTotalKm) + " KM");
		                        	  
                        	  
                        	  
                        	  
                        	  
                        	  
                        	  
                        	  
                        	  
                        	  
                        	  
        		
                  
                  
                  
                  
                    flightPath = new google.maps.Polyline({
                       path : flightPlanCoordinates,
                       geodesic : true,
                       strokeColor : 'blue',
                       strokeOpacity : 1.0,
                       strokeWeight : 2
                    });
                  
                   
               },
               error : function(request,status,error){
            	//   alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);

            	   
                  alert("최대 30일의 데이터만 조회가 가능합니다. 다시 시도해주세요.");
               },
               
               beforeSend: function () {//로딩이미지
               
	               var width = 0;
	               var height = 0;
	               var left = 0;
	               var top = 0;
	
	               width = 400;
	               height = 400;
	
	
	               top = ( $(window).height() - height ) / 2 + $(window).scrollTop();
	               left = 40;

  

	               if($("#div_ajax_load_image").length != 0) {
	                      $("#div_ajax_load_image").css({
	                             "top": top+"px",
	                             "left": left+"%"
	                      });
	                      $("#div_ajax_load_image").show();
	               }
	               else {
	                      $('body').append('<div id="div_ajax_load_image" style="position:absolute; top:' + top + 'px; left:' + left + '%; width:' + width + 'px; height:' + height + 'px; z-index:9999; background:#f0f0f0; filter:alpha(opacity=50); opacity:alpha*0.5; margin:auto; padding:0; "><img src="/spring/images/cambus/image/ajax_loader6.gif" style="width:400px; height:400px;"></div>');
	               }

		        },
		        complete: function () {
		                      $("#div_ajax_load_image").hide();
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
	            <span id="totalKm" style="float:right;"></span>
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



<hr />
<!-- 동승자 로그 시작  -->
<div id="container">
		<h1 class="menuTitle">운행 대장</h1>
	      <span id="logTotalKm" style="float:right;font-size:2em;"></span>
		<table id="tbl1" class="table table-striped">
		<thead>
			<tr>
				<th>번호</th>
				<th>동승자</th>
				<th>운전자</th>
				<th>행선지</th>
				<th>목적</th>
				<th>운행시작</th>
				<th>운행종료</th>
				<th>총거리</th>
				<th>등록일자</th>
				<th>서명</th>
			</tr>
		</thead>
		<tbody>
			<c:if test="${empty alist || alist.size() == 0}">
				<tr>
					<td colspan="10">게시물이 존재하지 않습니다.</td>
				</tr>
			</c:if>

			
			</tbody>
		</table>
		

	</div><!-- content -->
</body>
</html>