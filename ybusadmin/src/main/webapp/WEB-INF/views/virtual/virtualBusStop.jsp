<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@include file="/inc/asset.jsp"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="initial-scale=1.0, user-scalable=no">
<meta charset="utf-8">
<title>학교 갈 땐 CAMBUS</title>
<link rel="stylesheet" type="text/css" href="/spring/css/bacisTheme.css" />
<style>
html, body {
   width: 100%;
   height: 100%;
   margin: 0 auto;
   padding: 0;
}

#title {
   text-align: center;
   width:90%;
   
   margin: 10 auto;
}
#virtualTitle{
   border: 0px solid black;
   text-align: center;
   margin: 10px 0px 10px 0px;
   font-weight: bold;
}
#mapForm {
   width: 90%;
   height: 50%;
   margin: 0px auto;
}

#map {
   float: left;
   width: 75%;
   height: 100%;
}

#street-view {
   float: left;
   width: 25%;
   height: 100%;
   position: relative;
   background-color:#eee;
}

#tbl {
   width: 90%;
   margin: 0 auto;
   margin-top: 5%;
}

#searchForm {
   border: 0px solid gray;
   width: 90%;
   height: auto;
   margin: 0 auto;
}

#searchForm h2 {
   text-align: center;
}

#searchForm select {
   margin-top: 10px;
}

 #university {
   float: left;
   width: 35%;
   height: 80px;
}

 #buscategory {
   float: left;
   width: 35%;
   height: 80px;
}

#detailCategory {
   float: left;
   width: 30%;
   height: 80px;
}

 .btnForm {
   width: 95%;
   height: 60px;
   text-align:right;
   margin-top:10%;
}
</style>

<script async defer
   src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBvu3Ngel84QlOc4Lc4BAszD3UeSMEiWgM&callback=initMap"></script>


<script type="text/javascript">
   var map;
   var markers = [];
   var dragMarkers = [];
   var addMarkerCheck = false;
   var xhr;

   $().ready(
               function() {
                  //수정버튼 감추기 
                  $("#saveBtn").hide();
                  
                  
                  
                  $("#universitySel").ready(function() {
								
                                 var b = $("#universitySel").val();
									
                                 if (b != -1) {
                                    //alert(b);
                                    //선택한 대학교 seq를 서버에 전송 -> 해당 대학 위경도로 맵 이동
                                    $.ajax({
                                             type : "GET",
                                             url : "/spring/busStop/universityMap.action",
                                             data : "seq=" + b,
                                             success : function(data) {

                                                //jQuery XMl제어
                                                //1. data : XMLDocument객체
                                                //2. find() : 태그검색
                                                var list = $(data)
                                                      .find("item");
                                                //alert(list.length);

                                                $(list).each(function(index,item) {
                                                               name = $(item).find("name").text();
                                                               lat = $(item).find("lat").text();
                                                               lng = $(item).find("lng").text();
                                                });
                                                
                                                initMap(lat,lng);

                                             },
                                             error : function() {
                                                alert("데이터 가져오는데 실패하였습니다.");
                                             }

                                          });//ajax

                                 }//if

                                 if (b != -1) {
                                    //alert(b);
                                    //선택한 대학교 seq를 서버에 전송 -> 버스분류 목록 받아오기
                                    $.ajax({
                                             type : "GET",
                                             url : "/spring/busStop/busStopCategory.action",
                                             data : "seq=" + b,
                                             success : function(data) {

                                                $("#busCategorySel").html("<option value='-1'>버스종류를 선택하세요.</option>");
                                                $("#detailCategorySel").html("<option value='-1'>노선종류를 선택하세요.</option>");

                                                //jQuery XMl제어
                                                //1. data : XMLDocument객체
                                                //2. find() : 태그검색
                                                var list = $(data).find("item");
                                                //alert(list.length);

                                                $(list).each(function(index,item) {
                                                               var seq = $(item).find("seq").text();
                                                               var name = $(item).find("name").text();
                                                               //alert(seq);
                                                               // alert(name);

                                                               $("#busCategorySel").append("<option value='"+seq+"'>" + name + "</option>");

                                                            });

                                             },
                                             error : function() {
                                                alert("버스분류 가져오는데 실패하였습니다.");
                                             }

                                          });//ajax

                                 }//if

                              });//$("#university").change(function())

                  /* ------------------------------------------------------------대분류------------------ */

                  $("#busCategorySel")
                        .change(
                              function() {
                                 var b = $(this).val();

                                 if (b != -1) {
                                    //alert(b);
                                    //선택한 버스분류 seq를 서버에 전송 -> 노선분류 목록 받아오기
                                    $.ajax({
                                             type : "GET",
                                             url : "/spring/busStop/busStopDetailCategory.action",
                                             data : "seq=" + b,
                                             success : function(data) {

                                                $("#detailCategorySel").html("<option value='-1'>노선종류를 선택하세요.</option>");
                                                $("#busNumSel").html("<option value='-1'>버스를 선택하세요.</option>");

                                                //jQuery XMl제어
                                                //1. data : XMLDocument객체
                                                //2. find() : 태그검색
                                                var list = $(data).find("item");
                                                //alert(list.length);

                                                $(list).each(function(index,item) {
                                                               var seq = $(item).find("seq").text();
                                                               var name = $(item).find("name").text();
                                                               //alert(seq);
                                                               // alert(name);

                                                               $("#detailCategorySel").append("<option value='"+seq+"'>" + name + "</option>");

                                                            });

                                             },
                                             error : function() {
                                                alert("노선분류 가져오는데 실패하였습니다.");
                                             }
                                          });//ajax
                                 }//if
                              });//$("#buscategorysel").change(function())

                  

                  //노선종류 변경시에 정류장 마커가 유동적으로 출력되어야한다.
                  $("#detailCategorySel").change(function() {
                                 //마커확인 작업
                                 for (var i = 0; i < markers.length; i++) {
                                    console.log("마커" + markers[i]);
                                 }
                                 var b = $(this).val();
                                 //markers = [];
								 if(addMarkerCheck==true){
									 alert("수정중인상태입니다");
								 }else{
									 if (b != -1) {
		                                    //alert(b);
		                                    //선택한 노선종류seq를 서버에 전송 -> 버스 목록 받아오기
		                                    $.ajax({
		                                             type : "GET",
		                                             url : "/spring/virtual/virtualBusStopList.action",
		                                             data : "bseq=" + b,
		                                             success : function(data) {

		                                                //기존 마커 제거
		                                                deleteAllMarkers();

		                                                //jQuery XMl제어
		                                                //1. data : XMLDocument객체
		                                                //2. find() : 태그검색

		                                                var list = $(data).find("item");
		                                                //alert(list.length);
		                                                $(list).each(
		                                                            function(index,item) {
		                                                               seq = $(item) .find("seq").text();
		                                                               order = $(item).find("order").text();
		                                                               name = $(item).find("name").text();
		                                                               lat = $(item).find("lat").text();
		                                                               lng = $(item).find("lng").text();

		                                                               console.log(seq+":"+order+":"+name+":"+lat+":"+lng);
			
		                                                               drawMarker(order,lat,lng);

		                                                            });

		                                             },
		                                             error : function() {
		                                                alert("정류장 마커맵을 가져오는데 실패하였습니다.");
		                                             }
		                                          });//ajax
		                                 }//if
								 }
                                 
                              });//$("#detailcategorysel").change(function())

                  $("#frm")
                        .submit(
                              function() {
                                 var saveCheck = false;
                                 var JSONObject;
                                 var JSONArray;
                                 
                                 if (addMarkerCheck == false) {

                                    alert("수정버튼을 먼저 눌러주세요");

                                 } else {

                                    for (var i = 1; i <= dragMarkers.length; i++) {
                                       //console.log(i);
                                       if ($("#busstopname" + i  + "").val() == "" || $("#line" + i + "").val() == "-1") {
                                          savecheck = true;
                                       }
                                    }
                                    if (saveCheck == true) {
                                       alert("입력하지 않은 정류장이 있습니다.");
                                       return false;
                                    } else {

                                       //지도에 마커 추가 기능 off
                                       addMarkerCheck = false;

                                       //저장 작업

                                       //전체를 담아줄 객체를 설정

                                       var busStopList = new Array();

                                       //테이블 tr의 갯수만큼 포문을 돈다.
                                       for (var i = 1; i <= dragMarkers.length; i++) {

                                          //하나의 정보를 저장할 JSONObject를 설정

                                          var busStop = new Object();

                                          busStop.seq = $("#tbl tbody tr:nth-child(" + i + ")").children().eq(0).val();
                                          busStop.order = $("#tbl tbody tr:nth-child(" + i + ")").children().eq(1).text();
                                          busStop.name = $("#tbl tbody tr:nth-child(" + i + ")").children().eq(2).children("input").val();
                                          busStop.lat = $("#tbl tbody tr:nth-child(" + i + ")").children().eq(3).text();
                                          busStop.lng = $("#tbl tbody tr:nth-child(" + i + ")").children().eq(4).text();
                                          busStop.line = $("#tbl tbody tr:nth-child(" + i + ")").children().eq(5).children("select").val();

                                          busStopList.push(busStop);

                                       }

                                       //전체 JSONObject를저장할 메인JSONObjec객체를 설정하여 저장(키,벨류)
                                       //테이블의 값들 JSON
                                       var jsonInfo = JSON.stringify(busStopList);
									   //alert(jsonInfo);
                                       console.log("jsp"+jsonInfo);

                                       //카테고리 3개의 값 
                                       var universitySel = $("#universitySel").val();
                                       var busCategorySel = $("#busCategorySel").val();
                                       var detailCategorySel = $("#detailCategorySel").val();

                                       /* console.log("jsp"+universitysel);
                                       console.log("jsp"+buscategorysel);
                                       console.log("jsp"+detailcategorysel); */
									   //alert(detailCategorySel);
                                       $("#frm").append("<input type='hidden' name='jsonInfo' value='"+ jsonInfo +"'>");
                                       $("#frm").append("<input type='hidden' name='detailCategorySelect' value='"+ detailCategorySel +"'>");
									   	
                                       //alert("저장완료");

                                       markers = [];
                                       dragMarkers = [];
                                    }
                                    //console.log($("#tbl tbody .busstopname").first().val());
                                 }

                                 return jsonInfo;
                              })

               });

   
  
	  
	  
   //맵 초기화
   function initMap(lat, lng) {
	   try{
	      console.log(markers.length);
	
	      var myLatlng = new google.maps.LatLng(lat, lng);
	      var myOptions = {
	         zoom : 13,
	         center : myLatlng,
	         mapTypeId : google.maps.MapTypeId.ROADMAP
	      }
	      //마커확인 작업
	      for (var i = 0; i < markers.length; i++) {
	         console.log("마커" + markers[i]);
	      }
	
	      map = new google.maps.Map(document.getElementById("map"), myOptions);
	      

	      
	      
	      
	      
	   }
      catch(error){
  		alert("지도 불러오기 실패");
  		location.reload();
  	  }
      
      
     
      
   
      
      
   } // function initialize() 함수 끝

   
   function initStreetView(lat,lng){
	   /* 구글 스트리트뷰 */
		
	      
     	
	   console.log(lat+"/"+lng);
     	var panorama = new google.maps.StreetViewPanorama(
           document.getElementById('street-view'),
           {
             position: {lat: lat, lng: lng},
             pov: {heading: 165, pitch: 0},
             zoom: 1
           });
     	
     	 map.setStreetView(panorama);
     
   }
   
   
   
   //마커 전부 제거 함수
   function deleteAllMarkers() {
      console.log("마커갯수" + markers.length);
      clearAllMarkers();
      markers = [];
      dragMarkers = [];
      $("#tbl tbody").children().remove();
   }
   //마커 전부 숨기기
   function clearAllMarkers() {
      setMapOnAll(null);
   }

   //모든 마커 null로 초기화
   function setMapOnAll(map) {
      for (var i = 0; i < markers.length; i++) {
         markers[i].setMap(map);
         
      }
   }

   

   
   //드래그기능없는 마커 찍기
   function drawMarker(order, blat, blng) {

      //드래그기능없는 마커
      console.log(blat+":"+blng);
      var marker = new google.maps.Marker({

         orders : order,
         map : map,
         draggable : false,
         animation : google.maps.Animation.DROP,
         position : {
            lat : Number(blat),
            lng : Number(blng)
         }
      });
      var infowindow = new google.maps.InfoWindow({
    	    content: order+'번 정류장'
        });
      marker.addListener('click', function() {
  		 infowindow.open(map, marker);
  		initStreetView(this.position.lat(), this.position.lng());
  	  });
      //마커 이동 함수(이동할떄마다 해당 정류장의 위경도 수정)
      google.maps.event.addListener(marker, 'dragend', function(event) {
         //console.log(this.position.lat());
         //console.log(this.position.lng());
         //console.log(this.orders);
         $("#tbl tbody tr:nth-child(" + this.orders + ")").children().eq(3)
               .text(this.position.lat());
         $("#tbl tbody tr:nth-child(" + this.orders + ")").children().eq(4)
               .text(this.position.lng());
         //console.log("end");
         initStreetView(this.position.lat(), this.position.lng());
         
      });
      markers.push(marker);

      //markers[order].addListener('click');
   }

   //드래그기능있는 마커 찍기
   function drawDragMarker(order, blat, blng) {
      //드래그 기능있는 마커
      var marker = new google.maps.Marker({

         orders : order,
         map : map,
         draggable : true,
         animation : google.maps.Animation.DROP,
         position : {
            lat : Number(blat),
            lng : Number(blng)
         }
      });
      var infowindow = new google.maps.InfoWindow({
  	    content: order+'번 정류장'
      });
      marker.addListener('click', function() {
		 infowindow.open(map, marker);
		 initStreetView(this.position.lat(), this.position.lng());
	  });

      //마커 이동 함수(이동할떄마다 해당 정류장의 위경도 수정)
      google.maps.event.addListener(marker, 'dragend', function(event) {
         //console.log(this.position.lat());
         //console.log(this.position.lng());
         //console.log(this.orders);
         $("#tbl tbody tr:nth-child(" + this.orders + ")").children().eq(3)
               .text(this.position.lat());
         $("#tbl tbody tr:nth-child(" + this.orders + ")").children().eq(4)
               .text(this.position.lng());
         //console.log("end");
         initStreetView(this.position.lat(), this.position.lng());
      });
      dragMarkers.push(marker);

      //markers[order].addListener('click');
   }

   //정류장 수정
   function updateBusStop() {
      //alert($("#universitysel").val());
      //alert($("#buscategorysel").val());
      //alert($("#detailcategorysel").val());
      //카테고리를 하나라도 선택하지 않았다면
      clearAllMarkers();
      for (var i = 0; i < dragMarkers.length; i++) {
          dragMarkers[i].setMap(null);
       }
      $("#tbl tbody").html("");

      $("#updateBtn").attr("value","초기화");
      $("#updateBtn").attr("class","btn btn-danger");
      
      if(addMarkerCheck == true){
    	  $("#detailCategorySel").removeAttr("disabled");
          $("#universitySel").removeAttr("disabled");
          $("#busCategorySel").removeAttr("disabled");
          addMarkerCheck = false;
          $("#saveBtn").hide(); 
          $("#updateBtn").attr("value","정류장 수정");
          $("#updateBtn").attr("class","btn btn-warning");
          
      }else if ($("#universitySel").val() == -1 || $("#busCategorySel").val() == -1
            || $("#detailCategorySel").val() == -1) {
         alert("선택하지않은 항목이 있습니다.");
         
      } else {
      
         
         $("#saveBtn").show();
         //지도에 마커 추가 기능 on
         addMarkerCheck = true;
         $("#detailCategorySel").attr("disabled","disabled");
         $("#universitySel").attr("disabled","disabled");
         $("#busCategorySel").attr("disabled","disabled");
       //카테고리 3개의 값 
         var universitySel = $("#universitySel").val();
         var busCategorySel = $("#busCategorySel").val();
         var detailCategorySel = $("#detailCategorySel").val();

         console.log("jsp"+universitySel);
         console.log("jsp"+busCategorySel);
         console.log("jsp"+detailCategorySel);

         
         clearAllMarkers();
         for (var i = 0; i < dragMarkers.length; i++) {
            dragMarkers[i].setMap(null);
         }
         var b = $("#detailCategorySel").val();
         //markers = [];

         if (b != -1) {
            //alert(b);
            //선택한 노선종류seq를 서버에 전송 -> 버스 목록 받아오기
            $.ajax({
               type : "GET",
               url : "/spring/virtual/virtualBusStopList.action",
               data : "bseq=" + b,
               success : function(data) {

                  console.log("마커제거");
                  //기존 마커 제거
                  deleteAllMarkers();

                  //jQuery XMl제어
                  //1. data : XMLDocument객체
                  //2. find() : 태그검색

                  var list = $(data).find("item");
                  //alert(list.length);
                  $(list).each(function(index, item) {
                     seq = $(item).find("seq").text();
                     order = $(item).find("order").text();
                     name = $(item).find("name").text();
                     lat = $(item).find("lat").text();
                     lng = $(item).find("lng").text();

                     drawDragMarker(order, lat, lng);

                  });

                  createTable();

               },
               error : function() {
                  alert("정류장 마커맵을 가져오는데 실패하였습니다.");
               }
            });//ajax
         }//if

         //모든 항목을 선택했다면 해당 노선의 정류장의 위치정보를 테이블로 출력해야한다.

      }
   }

   function createTable() {
      //노선 seq
      var detailCategorySel = $("#detailCategorySel").val();
      console.log("이거값좀"+detailCategorySel);

      if (detailCategorySel != -1) {

         //선택한 노선종류seq를 서버에 전송 -> 정류장 목록 받아오기
         $.ajax({
                  type : "GET",
                  url : "/spring/virtual/virtualBusStopList.action",
                  data : "bseq=" + detailCategorySel,
                  success : function(data) {
                	  console.log("이거값좀"+detailCategorySel);
                     console.log("테이블생성");
                     //jQuery XMl제어
                     //1. data : XMLDocument객체
                     //2. find() : 태그검색
                     $("#tbl tbody").html("");
                     var list = $(data).find("item");
                     //alert(list.length);
                     $(list).each(function(index, item) {
                          
                           seq = $(item).find("seq").text();
                           order = $(item).find("order").text();
                           name = $(item).find("name").text();
                           lat = $(item).find("lat").text();
                           lng = $(item).find("lng").text();
                           line = $(item).find("line").text();
                           console.log(seq +":"+ order +":"+ name +":"+ lat +":"+ lng +":"+ line);
                           $("#tbl tbody").append("<tr><input type='hidden' id='seq"+seq+"' name='seq' value='"+seq+"'><td id='order"+order+"'>" + order + "</td><td><input type='text' readonly id='busStopName"+order+"' class='busStopName' value='"+name+"'></td><td id='lat"+order+"'>"
                                                + lat
                                                + "</td><td id='lng"+order+"'>"
                                                + lng
                                                + "</td><td>"+ line +"</td></tr>");
                                    
                      });

                  },
                  error : function() {
                     alert("정류장 정보를 가져오는데 실패하였습니다.");
                  }
               });//ajax 
      }
   }
   
   
  
   
</script>



</head>

<body>
   <%@include file="/inc/top.jsp"%>
   
	
	<h1 id="virtualTitle"><img src="/spring/images/logo.PNG"> 가상 정류장</h1>	
   <form id="frm" method="POST" action="/spring/virtual/virtualBusStopOK.action">
   <div id="searchForm">
         <div id="university">
            <select id="universitySel" name="universitySel" class="form-control" value="${adto.universitySeq}">
               <option value="${adto.universitySeq}">${adto.universityName}</option>
               <%-- <option value="-1">대학교를 선택하세요.</option>
               <c:forEach items="${university}" var="dto">
                  <option value="${dto.universitySeq}">${dto.universityName}</option>
               </c:forEach> --%>

            </select>
         </div>

         <div id="busCategory">
            <select id="busCategorySel" name="busCategorySel"
               class="form-control">
               <option value="-1">버스종류를 선택하세요.</option>
            </select>
         </div>

         <div id="detailCategory">
            <select id="detailCategorySel" name="detailCategorySel"
               class="form-control">
               <option value="-1">노선종류를 선택하세요.</option>
               
            </select>
         </div>
         <div style="clear:both"></div>
      

      </div>
   
   
   <div id="mapForm">
      <div id="map"></div>
      <div id="street-view"></div>
   </div>
      <table id="tbl" class="table table-striped">
         <thead>
            <tr>
               <th>정류장순서</th>
               <th>이름</th>
               <th>위도</th>
               <th>경도</th>
               <th>라인</th>
            </tr>
         </thead>
         <tbody>
         </tbody>
      </table>

   
         <div class="btnForm">
            <input type="button" id="updateBtn" value="정류장 수정" class="btn btn-warning" onclick="updateBusStop();"> 
               <input type="submit" id="saveBtn" value="정류장 저장" class="btn btn-primary">
         </div>

      </div>
   </form>
</body>
</html>