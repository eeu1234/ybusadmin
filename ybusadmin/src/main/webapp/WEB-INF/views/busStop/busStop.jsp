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
max-width:2440px;
   width: 100%;
   height: 100%;
   margin: 0 auto;
   padding: 0;
}
.controls {
        background-color: #fff;
        border-radius: 2px;
        border: 1px solid transparent;
        box-shadow: 0 2px 6px rgba(0, 0, 0, 0.3);
        box-sizing: border-box;
        font-family: Roboto;
        font-size: 15px;
        font-weight: 300;
        height: 29px;
        margin-left: 17px;
        margin-top: 10px;
        outline: none;
        padding: 0 11px 0 13px;
        text-overflow: ellipsis;
        width: 400px;
      }
.controls:focus {
        border-color: #4d90fe;
      }
#title {
   text-align: center;
   width:90%;
   
   margin: 10 auto;
}
#menuTitle{
   border: 0px solid black;
   text-align: center;
   margin: 10px 0px 10px 0px;
   font-weight: bold;
}

#mapForm {
	position:relative;
	max-width : 1440px;
   width: 90%;
   height: 50%;
   margin: 0px auto;
}

#map {
   float: left;
   width: 100%;
   height: 100%;
}

#pano {
   float: left;
   width: 100%;
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
   max-width : 1440px;
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


   <script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=c5wa0CTc7jalj6c4Y0tw&submodules=panorama"></script>
<script 
      src="https://maps.googleapis.com/maps/api/js?key=AIzaSyC9sI7_yAlqc5XrEulhJ8v4ZtnhXGrED4k&callback=initMap"
        async defer></script>

<script type="text/javascript">
   var map;
   var marker;
   var markers = [];
   var dragMarkers = [];
   var addMarkerCheck = false;
   var xhr;
   var deleteSeq = [];
   var markerInfo = [];

   $().ready(function() {
                  //수정버튼 감추기 
                  $("#saveBtn").hide();
                  
                  
                  
                  $("#universitySel").ready(function() {
								
                                 var b = $("#universitySel").val();
									
                                 if (b != -1) {
                                    //alert(b);
                                    //선택한 대학교 seq를 서버에 전송 -> 해당 대학 위경도로 맵 이동
                                    $
                                          .ajax({
                                             type : "GET",
                                             url : "/spring/busStop/universityMap.action",
                                             data : "seq=" + b,
                                             success : function(
                                                   data) {

                                                //jQuery XMl제어
                                                //1. data : XMLDocument객체
                                                //2. find() : 태그검색
                                                var list = $(
                                                      data)
                                                      .find(
                                                            "item");
                                                //alert(list.length);

                                                $(list)
                                                      .each(
                                                            function(
                                                                  index,
                                                                  item) {
                                                               name = $(
                                                                     item)
                                                                     .find(
                                                                           "name")
                                                                     .text();
                                                               lat = $(
                                                                     item)
                                                                     .find(
                                                                           "lat")
                                                                     .text();
                                                               lng = $(
                                                                     item)
                                                                     .find(
                                                                           "lng")
                                                                     .text();

                                                            });

                                                console
                                                      .log(lat);
                                                console
                                                      .log(lng);
                                                
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
                                             success : function(
                                                   data) {

                                                $(
                                                      "#busCategorySel")
                                                      .html(
                                                            "<option value='-1'>버스종류를 선택하세요.</option>");
                                                $(
                                                      "#detailCategorySel")
                                                      .html(
                                                            "<option value='-1'>노선종류를 선택하세요.</option>");

                                                //jQuery XMl제어
                                                //1. data : XMLDocument객체
                                                //2. find() : 태그검색
                                                var list = $(
                                                      data)
                                                      .find(
                                                            "item");
                                                //alert(list.length);

                                                $(list)
                                                      .each(
                                                            function(
                                                                  index,
                                                                  item) {
                                                               var seq = $(
                                                                     item)
                                                                     .find(
                                                                           "seq")
                                                                     .text();
                                                               var name = $(
                                                                     item)
                                                                     .find(
                                                                           "name")
                                                                     .text();
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
                                    $
                                          .ajax({
                                             type : "GET",
                                             url : "/spring/busStop/busStopDetailCategory.action",
                                             data : "seq=" + b,
                                             success : function(
                                                   data) {

                                                $(
                                                      "#detailCategorySel")
                                                      .html(
                                                            "<option value='-1'>노선종류를 선택하세요.</option>");
                                                $("#busNumSel")
                                                      .html(
                                                            "<option value='-1'>버스를 선택하세요.</option>");

                                                //jQuery XMl제어
                                                //1. data : XMLDocument객체
                                                //2. find() : 태그검색
                                                var list = $(
                                                      data)
                                                      .find(
                                                            "item");
                                                //alert(list.length);

                                                $(list)
                                                      .each(
                                                            function(index,item) {
                                                               var seq = $(item).find("seq").text();
                                                               var name = $(item).find("name").text();
                                                               var count = $(item).find("count").text();
                                                               //alert(seq);
                                                               // alert(name);

                                                               $( "#detailCategorySel").append("<option value='"+seq+"'>"  + name  + "(정류장 갯수 : "+count+"개)</option>");

                                                            });

                                             },
                                             error : function() {
                                                alert("노선분류 가져오는데 실패하였습니다.");
                                             }
                                          });//ajax
                                 }//if
                              });//$("#buscategorysel").change(function())


					
                              
                  //노선종류 변경시에 정류장 마커가 유동적으로 출력되어야한다.
                  $("#detailCategorySel")
                        .change(
                              function() {
                                 //마커확인 작업
                                 for (var i = 0; i < markers.length; i++) {
                                    console.log("마커" + markers[i]);
                                 }
                                 var b = $(this).val();
                                 //markers = [];
								 if(addMarkerCheck==true){
									 
								 }else{
									 if (b != -1) {
		                                    //alert(b);
		                                    //선택한 노선종류seq를 서버에 전송 -> 버스 목록 받아오기
		                                    $
		                                          .ajax({
		                                             type : "GET",
		                                             url : "/spring/busStop/universityMap.action",
		                                             data : "bseq=" + b,
		                                             success : function(
		                                                   data) {

		                                                //기존 마커 제거
		                                                deleteAllMarkers();

		                                                //jQuery XMl제어
		                                                //1. data : XMLDocument객체
		                                                //2. find() : 태그검색

		                                                var list = $(
		                                                      data)
		                                                      .find(
		                                                            "item");
		                                                //alert(list.length);
		                                                $(list)
		                                                      .each(
		                                                            function(
		                                                                  index,
		                                                                  item) {
		                                                               seq = $(
		                                                                     item)
		                                                                     .find(
		                                                                           "seq")
		                                                                     .text();
		                                                               order = $(
		                                                                     item)
		                                                                     .find(
		                                                                           "order")
		                                                                     .text();
		                                                               name = $(
		                                                                     item)
		                                                                     .find(
		                                                                           "name")
		                                                                     .text();
		                                                               lat = $(
		                                                                     item)
		                                                                     .find(
		                                                                           "lat")
		                                                                     .text();
		                                                               lng = $(
		                                                                     item)
		                                                                     .find(
		                                                                           "lng")
		                                                                     .text();

		                                                               drawMarker(
		                                                                     order,
		                                                                     lat,
		                                                                     lng);

		                                                            });

		                                             },
		                                             error : function() {
		                                                alert("정류장 마커맵을 가져오는데 실패하였습니다.");
		                                             }
		                                          });//ajax
		                                 }//if
								 }
                                 
                              });//$("#detailcategorysel").change(function())


            	  //저장버튼을 눌렀을시 작동
                  $("#frm").submit(function() {
                                 var saveCheck = false;
                                 var JSONObject;
                                 var JSONArray;

                                 
                                 
                                 if (addMarkerCheck == false) {

                                    alert("수정버튼을 먼저 눌러주세요");

                                 } else {

                                    for (var i = 1; i <= dragMarkers.length; i++) {
                                       //console.log(i);
                                       if ($("#busstopname" + i + "").val() == "" || $("#line" + i + "").val() == "-1") {
                                          saveCheck = true;
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

                                          busStop.seq = $(
                                                "#tbl tbody tr:nth-child("
                                                      + i
                                                      + ")")
                                                .children().eq(
                                                      0)
                                                .val();
                                          busStop.order = $(
                                                "#tbl tbody tr:nth-child("
                                                      + i
                                                      + ")")
                                                .children().eq(
                                                      1)
                                                .text();
                                          busStop.name = $(
                                                "#tbl tbody tr:nth-child("
                                                      + i
                                                      + ")")
                                                .children()
                                                .eq(2)
                                                .children(
                                                      "input")
                                                .val();
                                          busStop.lat = $(
                                                "#tbl tbody tr:nth-child("
                                                      + i
                                                      + ")")
                                                .children().eq(
                                                      3)
                                                .text();
                                          busStop.lng = $(
                                                "#tbl tbody tr:nth-child("
                                                      + i
                                                      + ")")
                                                .children().eq(
                                                      4)
                                                .text();
                                          busStop.line = $(
                                                "#tbl tbody tr:nth-child("
                                                      + i
                                                      + ")")
                                                .children()
                                                .eq(5)
                                                .children(
                                                      "select")
                                                .val();

                                          busStopList
                                                .push(busStop);

                                       }

                                       //전체 JSONObject를저장할 메인JSONObjec객체를 설정하여 저장(키,벨류)
                                       //테이블의 값들 JSON
                                       var jsonInfo = JSON
                                             .stringify(busStopList);

                                       //카테고리 3개의 값 
                                       var universitySel = $(
                                             "#universitySel")
                                             .val();
                                       var busCategorySel = $(
                                             "#busCategorySel")
                                             .val();
                                       var detailCategorySel = $(
                                             "#detailCategorySel")
                                             .val();

                                       /* console.log(jsonInfo);
                                       console.log(universitysel);
                                       console.log(buscategorysel);
                                       console.log(detailcategorysel); */

                                       $("#frm")
                                             .append(
                                                   "<input type='hidden' name='jsonInfo' value='"+ jsonInfo +"'>");
                                       $("#frm")
                                             .append(
                                                   "<input type='hidden' name='deleteSeq' value='"+ deleteSeq +"'>");
                                       $("#frm").append("<input type='hidden' name='detailCategorySelect' value='"+ detailCategorySel +"'>");


									   //저장버튼을 눌렀을경우 busStop테이블의 내용이 수정되어야됨
									   //수정된 busstop의 테이블 의 모든 내용이 virtualbusstop테이블로 그대로 복사가 되야함
									   //virtualbusstop 테이블에서 정류장 세부분류seq가 같은  모든 내용을 delete하고
									   //busstopdml 정류장 세부분류seq가 같은 모든 행을 그대로 복사
									    
									   
                                       alert("저장완료");

                                       markers = [];
                                       dragMarkers = [];
                                       deleteSeq = [];
                                    }
                                    //console.log($("#tbl tbody .busstopname").first().val());
                                 }

                                 return jsonInfo;
                              })

               });

   //네이버 로드뷰 출력
   var HOME_PATH = window.HOME_PATH || '.', pano = null;

   var nlat;
   var nlng;

   function initPanorama(nlat, nlng) {
	  $("#pano").children("div").remove();
      console.log(nlat + ":" + nlng);
      nlat = Number(nlat);
      nlng = Number(nlng);
      if (nlat == "undefined" || nlng == "undefined") {
         pano = new naver.maps.Panorama("pano", {
            position : new naver.maps.LatLng(38, 111),
            pov : {
               pan : -135,
               tilt : 29,
               fov : 100
            }
         });
      } else {
         pano = new naver.maps.Panorama("pano", {
            position : new naver.maps.LatLng(nlat, nlng),
            pov : {
               pan : -135,
               tilt : 29,
               fov : 100
            }
         });
      }

      naver.maps.Event.addListener(pano, "init", function() {
         marker.setMap(pano);

         var proj = pano.getProjection();
         var lookAtPov = proj.fromCoordToPov(marker.getPosition());
         if (lookAtPov) {
            pano.setPov(lookAtPov);
         }
      });
      var marker = new naver.maps.Marker({
         position : new naver.maps.LatLng(nlat, nlng),
         icon : { // 레티나 디스플레이 대응 마커 아이콘
            url : HOME_PATH + "/img/example/pin_map.png", // 110x72 크기의 원본 이미지
            size : new naver.maps.Size(55, 36),
            anchor : new naver.maps.Point(28, 36),
            origin : new naver.maps.Point(0, 0),
            scaledSize : new naver.maps.Size(55, 36)
         }
      });
   }

   //로드뷰 마커 클릭함수
   /* naver.maps.Event.addListener(marker, "click", function(e) {
    alert("marker clicked");
    }); */

   $("#marker").on("click", function(e) {
      e.preventDefault();

      var el = $(this);

      if (marker.getMap()) {
         marker.setMap(null);
         el.val("Marker 추가").removeClass("control-on");
      } else {
         marker.setMap(pano);
         el.val("Marker 제거").addClass("control-on");
      }
   });

   //naver.maps.onJSContentLoaded = initPanorama;

   //맵 초기화
   function initMap(lat, lng) {
	  try{
	      console.log(markers.length);
	      
	      var myLatlng = new google.maps.LatLng(lat, lng);
	      var myOptions = {
	         zoom : 15,
	         center : myLatlng,
	         mapTypeId : google.maps.MapTypeId.ROADMAP
	      }
	      //마커확인 작업
	      for (var i = 0; i < markers.length; i++) {
	         console.log("마커" + markers[i]);
	      }
	
	      map = new google.maps.Map(document.getElementById("map"), myOptions);
	      //클릭했을 때 이벤트
	      google.maps.event.addListener(map, 'click', function(event) {
	         addMarker(event.latLng);
	         //infowindow.setContent("latLng: " + event.latLng); // 인포윈도우 안에 클릭한 곳위 좌표값을 넣는다.
	         //infowindow.setPosition(event.latLng); // 인포윈도우의 위치를 클릭한 곳으로 변경한다.
	         //markers.push(event.latLng);
	         console.log(markers.length);
	         console.log(event.latLng.lat());
	         console.log(event.latLng.lng());
	      });
	      
	    //주소검색
	      var input = document.getElementById('pac-input');
	      var autocomplete = new google.maps.places.Autocomplete(input, {placeIdOnly: true});
	      autocomplete.bindTo('bounds', map);
	      map.controls[google.maps.ControlPosition.TOP_LEFT].push(input);
	      var geocoder = new google.maps.Geocoder;
	      var infowindow = new google.maps.InfoWindow();
	      /* var marker = new google.maps.Marker({
	          map: map
	        }); */
	      autocomplete.addListener('place_changed', function() {
	          infowindow.close();
	          var place = autocomplete.getPlace();

	          if (!place.place_id) {
	            return;
	          }
	          geocoder.geocode({'placeId': place.place_id}, function(results, status) {

	            if (status !== 'OK') {
	              window.alert('Geocoder failed due to: ' + status);
	              return;
	            }
	            map.setZoom(16);
	            map.setCenter(results[0].geometry.location);
	            // Set the position of the marker using the place ID and location.
	            /* marker.setPlace({
	              placeId: place.place_id,
	              location: results[0].geometry.location
	            });
	            marker.setVisible(true); */
	            //document.getElementById('place-name').textContent = place.name;
	            //document.getElementById('place-id').textContent = place.place_id;
	            //document.getElementById('place-address').textContent =
	                //results[0].formatted_address;
	            //infowindow.setContent(document.getElementById('infowindow-content'));
	            //infowindow.open(map, marker);
	          });
	        });     
	      //========================
	  }
	  catch(error){
		alert("지도 불러오기 실패");
		//location.reload();
	  }
      
      //infowindow.open(map); 윈도우창 열기

   } // function initialize() 함수 끝

   //마커 추가 함수
   function addMarker(location) {
      if (addMarkerCheck) {
         var marker = new google.maps.Marker({
            orders : dragMarkers.length+1,
            position : location,
            draggable : true,
            map : map
         });
         
         //dragMarkers.push(marker);
         
         var infowindow = new google.maps.InfoWindow({
	  	    content: (dragMarkers.length+1)+'번 정류장',
	      });

	      
	 	  marker.addListener('click', function() {
	 	    infowindow.open(map, marker);
	 	   
	 	  });
         
         
         //마커 이동 함수(이동할떄마다 해당 정류장의 위경도 수정)
         google.maps.event.addListener(marker, 'dragend', function(event) {
            console.log(this.position.lat());
            console.log(this.position.lng());
            
            //console.log(this.orders);
            $("#tbl tbody tr:nth-child(" + dragMarkers.length + ")")
                  .children().eq(3).text(this.position.lat());
            $("#tbl tbody tr:nth-child(" + dragMarkers.length + ")")
                  .children().eq(4).text(this.position.lng());
            //console.log("end");
            initPanorama(this.position.lat(), this.position.lng());
            
         });

         markerInfo.push(infowindow);
         dragMarkers.push(marker);
         
         initPanorama(location.lat(), location.lng());
         //$("#tbl tbody").append("<tr><td>"+markers.length+"</td><td><input type='text'></td><td>"+location.lat()+"</td><td>"+location.lng()+"</td></tr>");
         $("#tbl tbody")
               .append(
                     "<tr><input type='hidden' id='seq"+dragMarkers.length+"' name='seq' value=''><td id='order"+dragMarkers.length+"'>"
                           + dragMarkers.length
                           + "</td><td><input type='text' id='busstopname"+dragMarkers.length+"' class='busstopname'></td><td id='lat"+dragMarkers.length+"'>"
                           + location.lat()
                           + "</td><td id='lng"+dragMarkers.length+"'>"
                           + location.lng()
                           + "</td><td><select id='line"+dragMarkers.length+"' class='form-control'><option value='-1'>라인 종류</option><option value='up'>상행</option>   <option value='down'>하행</option><option value='turn'>회차점</option><option value='pass'>미정차</option></select></td><td><input type='button' value='삭제' id='delbusstop"
                           + dragMarkers.length
                           + "' class='btn btn-info'  onclick='deleteOneMarkers("
                           + dragMarkers.length + ");'></td></tr>");
      } else {
         alert("정류장 수정 버튼을 누른후에 사용해 주세요.");
      }
   }

   //마커 전부 제거 함수
   function deleteAllMarkers() {
      console.log("마커갯수" + markers.length);
      clearAllMarkers();
      markers = [];
      dragMarkers = [];
      markerInfo = [];
      $("#tbl tbody").children().remove();
   }
   //마커 전부 숨기기
   function clearAllMarkers() {
      setMapOnAll(null);
   }
   

   //모든 마커 null로 초기화
   function setMapOnAll(map) {
      for (var i = 0; i < markers.length; i++) {
         markerInfo[i].close();
         markers[i].setMap(map);
      }
   }

   //모든 마커 정보창 지우기
   function initMarkerInfo(){
	  for(var i=0;i<markerInfo.length;i++){
		 markerInfo[i].close();
	  }
   }

   //내가 클릭한 마커 null로 초기화
   function deleteOneMarkers(num) {
      console.log("마커갯수" + markers.length);
      if (dragMarkers.length > 0) {
         var length = markerInfo.length;
         //console.log("삭제한 num : " + num);
         //console.log(markerInfo[num-1]);
         //console.log("삭제한 정류장 content : "+markerInfo[num-1].content);
         //clearOneMarkers(num - 1);
         //dragMarkers.splice(num - 1, 1);
         //markerInfo.splice(num - 1,1);

		 //마커 삭제하고 다시생성
		 //num부터 끝까지 마커제거,인포창 닫기
		 //alert(markerInfo.length);//8
         initMarkerInfo();//인포창 닫기

         var temp = [];
         //지운값 제외한 다음배열부터 임시배열에 넣어둠
         for(var i=num;i<markerInfo.length;i++){
			temp.push(dragMarkers[i]);
         }
         
         for (var i = num-1; i < markerInfo.length; i++) {
             dragMarkers[i].setMap(null);
          }
         //for(var i=num-1;i<length;i++){
       	 dragMarkers.splice(num-1,length);
       	 markerInfo.splice(num-1,length);
         //alert(markerInfo.length);
         //}
         //alert(dragMarkers[num-1].orders);
         //alert(dragMarkers[num-1].position.lat());
         //alert(dragMarkers[num-1].position.lng());
         
         //마커,인포를 지우곳부터 다시 생성
         for(var i=0;i<temp.length;i++){
        	 drawDragMarker(temp[i].orders-1,temp[i].position.lat(),temp[i].position.lng());
         }
         
         //console.log("삭제한 곳에 채워진 content : "+markerInfo[num-1].content);
         //마지막부터 삭제할때
         //$("#tbl tbody").children().last().remove();

         //해당 삭제 버튼을 클릭했을때 그tr의 히든 태그에 seq값이 있으면 deleteseq배열에 값을 추가하고,
         //seq값이 없으면 원래대로 작업을 진행한다.
         //console.log("삭제한 라인의 seq"+$("#tbl tbody tr:nth-child("+num+")").children().eq(0).val());
         if ($("#tbl tbody tr:nth-child(" + num + ")").children().eq(0)
               .val() != "") {
            //console.log("ggo");
            deleteSeq.push($("#tbl tbody tr:nth-child(" + num + ")")
                  .children().eq(0).val());
            /* for(var i=0;i<deleteSeq.length;i++){
               console.log(deleteSeq[i]);
            } */
         }

         //사이에서 삭제하고 할때 클릭함수의 파라미터수정, 순번 수정
         //삭제한 이후의 테이블 행의 값들을 하나씩 다 줄여야한다.

         for (var i = num; i <= dragMarkers.length; i++) {
            //console.log($("#tbl tbody tr:nth-child("+i+")").children().eq(0).text());
            //console.log($("#tbl tbody tr:nth-child("+i+")").children().eq(1).children("input").val());
            $("#tbl tbody tr:nth-child(" + i + ")").children().eq(0).val(
                  $("#tbl tbody tr:nth-child(" + (i + 1) + ")")
                        .children().eq(0).val());

            $("#tbl tbody tr:nth-child(" + i + ")").children().eq(1)
                  .text(i);

            $("#tbl tbody tr:nth-child(" + i + ")").children().eq(2)
                  .children("input").attr("id", "busStopName" + i + "");
            $("#tbl tbody tr:nth-child(" + i + ")").children().eq(2)
                  .children("input").val(
                        $("#tbl tbody tr:nth-child(" + (i + 1) + ")")
                              .children().eq(2).children("input")
                              .val());

            $("#tbl tbody tr:nth-child(" + i + ")").children().eq(3).attr(
                  "id", "lat" + i + "");
            $("#tbl tbody tr:nth-child(" + i + ")").children().eq(3).text(
                  $("#tbl tbody tr:nth-child(" + (i + 1) + ")")
                        .children().eq(3).text());

            $("#tbl tbody tr:nth-child(" + i + ")").children().eq(4).attr(
                  "id", "lng" + i + "");
            $("#tbl tbody tr:nth-child(" + i + ")").children().eq(4).text(
                  $("#tbl tbody tr:nth-child(" + (i + 1) + ")")
                        .children().eq(4).text());

            $("#tbl tbody tr:nth-child(" + i + ")").children().eq(5)
                  .children("select").attr("id", "line" + i + "");
            $("#tbl tbody tr:nth-child(" + i + ")").children().eq(5)
                  .children("select").val(
                        $("#tbl tbody tr:nth-child(" + (i + 1) + ")")
                              .children().eq(5).children("select")
                              .val());

            $("#tbl tbody tr:nth-child(" + i + ")").children().eq(6)
                  .children("input").attr("id", "delBusStop" + i + "");
         }
         //해당 정류장 삭제
         $("#tbl tbody tr").last().remove();

      } else {
         console.log("마커가 존재하지 않습니다.");
      }
   }

   function clearOneMarkers(num) {
      setMapOnOne(num, null);
   }

   function setMapOnOne(num, map) {
      dragMarkers[num].setMap(map);
      console.log(markerInfo.length);
      markerInfo[num].close();
   }

   //드래그기능없는 마커 찍기
   function drawMarker(order, blat, blng) {

      //드래그기능없는 마커
      var marker = new google.maps.Marker({
         map : map,
         draggable : false,
         animation : google.maps.Animation.DROP,
         position : {lat : Number(blat),lng : Number(blng)},
         orders : order
      });
      console.log(blat+":"+blng);
      //var markLocation = new google.maps.LatLng(blat,blng);
      var infowindow = new google.maps.InfoWindow({
  	    content: order+'번 정류장'
      });

      
 	  marker.addListener('click', function() {
 		 infowindow.open(map, marker);
 		initPanorama(this.position.lat(), this.position.lng());
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
         initPanorama(this.position.lat(), this.position.lng());
      });
      
      markers.push(marker);
      markerInfo.push(infowindow);


     

      
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
   	 initPanorama(this.position.lat(), this.position.lng());
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
         initPanorama(this.position.lat(), this.position.lng());
      });


      dragMarkers.push(marker);
      markerInfo.push(infowindow);
      //markers[order].addListener('click');
   }

   //정류장 수정
   function updateBusStop() {
      //alert($("#universitysel").val());
      //alert($("#buscategorysel").val());
      //alert($("#detailcategorysel").val());
      //카테고리를 하나라도 선택하지 않았다면
      $("#pano").children("div").remove();
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
	          $("#updateOrderBtn").hide();	  
	          
	  }else if ($("#universitySel").val() == -1 || $("#busCategorySel").val() == -1
            || $("#detailCategorySel").val() == -1) {
         alert("선택하지않은 항목이 있습니다.");
         $("#updateBtn").attr("value","정류장 수정");
         $("#updateOrderBtn").hide();
         
      } else {
      
         
         $("#saveBtn").show();
         $("#updateOrderBtn").show();
         //지도에 마커 추가 기능 on
         addMarkerCheck = true;
         //버스카테고리 선택못하게 막음
         $("#detailCategorySel").attr("disabled","disabled");
         $("#universitySel").attr("disabled","disabled");
         $("#busCategorySel").attr("disabled","disabled");
         clearAllMarkers();
         //deleteAllMarkers();
         //clearAllInfo();
         for (var i = 0; i < dragMarkers.length; i++) {
            dragMarkers[i].setMap(null);
         }
         var b = $("#detailCategorySel").val();
         //markers = [];
		 //markerInfo = [];
         if (b != -1) {
            //alert(b);
            //선택한 노선종류seq를 서버에 전송 -> 버스 목록 받아오기
            $.ajax({
               type : "GET",
               url : "/spring/busStop/universityMap.action",
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
   function updateOrder(){
	   $("#detailCategorySel").val();
		location.href = "/spring/busStop/updateOrder.action?detailCategorySel="+$("#detailCategorySel").val();
   }

   function createTable() {
      //노선 seq
      var detailCategorySel = $("#detailCategorySel").val();
      //alert(detailcategorysel);

      if (detailCategorySel != -1) {

         //선택한 노선종류seq를 서버에 전송 -> 정류장 목록 받아오기
         $
               .ajax({
                  type : "GET",
                  url : "/spring/busStop/busStopList.action",
                  data : "seq=" + detailCategorySel,
                  success : function(data) {
                     console.log("테이블생성");
                     //jQuery XMl제어
                     //1. data : XMLDocument객체
                     //2. find() : 태그검색
                     $("#tbl tbody").html("");
                     var list = $(data).find("item");
                     //alert(list.length);
                     $(list)
                           .each(
                                 function(index, item) {
                                    seq = $(item).find("seq")
                                          .text();
                                    order = $(item).find("order")
                                          .text();
                                    name = $(item).find("name")
                                          .text();
                                    lat = $(item).find("lat")
                                          .text();
                                    lng = $(item).find("lng")
                                          .text();
                                    line = $(item).find("line")
                                          .text();
                                    if (line == "up") {
                                       $("#tbl tbody")
                                             .append(
                                                   "<tr><input type='hidden' id='seq"+seq+"' name='seq' value='"+seq+"'><td id='order"+order+"'>"
                                                         + order
                                                         + "</td><td><input type='text' id='busStopName"+order+"' class='busStopName' value='"+name+"'></td><td id='lat"+order+"'>"
                                                         + lat
                                                         + "</td><td id='lng"+order+"'>"
                                                         + lng
                                                         + "</td><td><select id='line"+order+"' class='form-control'><option value='-1'>라인 종류</option><option value='up' selected>상행</option>   <option value='down'>하행</option><option value='turn'>회차점</option><option value='pass'>미정차</option></select></td><td><input type='button' value='삭제' id='delBusStop"
                                                         + order
                                                         + "' class='btn btn-danger' onclick='deleteOneMarkers("
                                                         + order
                                                         + ");'></td></tr>");
                                    } else if (line == "down") {
                                       $("#tbl tbody")
                                             .append(
                                                   "<tr><input type='hidden' id='seq"+seq+"' name='seq' value='"+seq+"'><td id='order"+order+"'>"
                                                         + order
                                                         + "</td><td><input type='text' id='busStopName"+order+"' class='busStopName' value='"+name+"'></td><td id='lat"+order+"'>"
                                                         + lat
                                                         + "</td><td id='lng"+order+"'>"
                                                         + lng
                                                         + "</td><td><select id='line"+order+"' class='form-control'><option value='-1'>라인 종류</option><option value='up'>상행</option>   <option value='down' selected>하행</option><option value='turn'>회차점</option><option value='pass'>미정차</option></select></td><td><input type='button' value='삭제' id='delBusStop"
                                                         + order
                                                         + "' class='btn btn-danger' onclick='deleteOneMarkers("
                                                         + order
                                                         + ");'></td></tr>");
                                    } else if (line == "turn") {
                                       $("#tbl tbody")
                                             .append(
                                                   "<tr><input type='hidden' id='seq"+seq+"' name='seq' value='"+seq+"'><td id='order"+order+"'>"
                                                         + order
                                                         + "</td><td><input type='text' id='busStopName"+order+"' class='busStopName' value='"+name+"'></td><td id='lat"+order+"'>"
                                                         + lat
                                                         + "</td><td id='lng"+order+"'>"
                                                         + lng
                                                         + "</td><td><select id='line"+order+"' class='form-control'><option value='-1'>라인 종류</option><option value='up'>상행</option>   <option value='down'>하행</option><option value='turn' selected>회차점</option><option value='pass'>미정차</option></select></td><td><input type='button' value='삭제' id='delBusStop"
                                                         + order
                                                         + "' class='btn btn-danger' onclick='deleteOneMarkers("
                                                         + order
                                                         + ");'></td></tr>");
                                    }else if (line == "pass") {
                                        $("#tbl tbody")
                                        .append(
                                              "<tr><input type='hidden' id='seq"+seq+"' name='seq' value='"+seq+"'><td id='order"+order+"'>"
                                                    + order
                                                    + "</td><td><input type='text' id='busStopName"+order+"' class='busStopName' value='"+name+"'></td><td id='lat"+order+"'>"
                                                    + lat
                                                    + "</td><td id='lng"+order+"'>"
                                                    + lng
                                                    + "</td><td><select id='line"+order+"' class='form-control'><option value='-1'>라인 종류</option><option value='up'>상행</option>   <option value='down'>하행</option><option value='turn'>회차점</option><option value='pass' selected>미정차</option></select></td><td><input type='button' value='삭제' id='delBusStop"
                                                    + order
                                                    + "' class='btn btn-danger' onclick='deleteOneMarkers("
                                                    + order
                                                    + ");'></td></tr>");
                               }
                                 });

                  },
                  error : function() {
                     alert("정류장 정보를 가져오는데 실패하였습니다.");
                  }
               });//ajax 
      }
   }
   function captureReturnKey(e) {
	    if(e.keyCode==13 && e.srcElement.type != 'textarea')
	    return false;
	}

</script>



</head>

<body >
   <%@include file="/inc/top.jsp"%>
   <h1 id="menuTitle"><img src="/spring/images/logo.PNG"> 버스 정류장 관리</h1>
   <input id="pac-input" class="controls" type="text"
        placeholder="주소를 입력하세요">
   <form id="frm" method="POST" action="/spring/busStop/busStopOK.action" onkeydown="return captureReturnKey(event)">
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
      <div id="pano"></div>
   </div>
   <div>
      <table id="tbl" class="table table-striped">
         <thead>
            <tr>
               <th>정류장순서</th>
               <th>이름</th>
               <th>위도</th>
               <th>경도</th>
               <th>라인</th>
               <th>비고</th>
            </tr>
         </thead>
         <tbody>
         </tbody>
      </table>

   
         <div class="btnForm">
            <input type="button" id="updateOrderBtn" value="정류장 순서 변경" class="btn btn-warning" onclick="updateOrder();" style="display: none;"> 
            <input type="button" id="updateBtn" value="정류장 수정" class="btn btn-warning" onclick="updateBusStop();"> 
               <input   type="submit" id="saveBtn" value="정류장 저장" class="btn btn-primary">
         </div>
   </div>
   </form>
   
</body>
</html>