<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>Overlays within Street View</title>
    <style>
      html, body {
        height: 100%;
        margin: 0;
        padding: 0;
      }
      #map {
        height: 100%;
      }
#floating-panel {
  position: absolute;
  top: 10px;
  left: 25%;
  z-index: 5;
  background-color: #fff;
  padding: 5px;
  border: 1px solid #999;
  text-align: center;
  font-family: 'Roboto','sans-serif';
  line-height: 30px;
  padding-left: 10px;
}

      #floating-panel {
        margin-left: -100px;
      }
    </style>
  </head>
  <body>
    <div id="floating-panel">
      <input type="button" value="Toggle Street View" onclick="toggleStreetView();"></input>
    </div>
    <div id="map"></div>
    <script>
var panorama;

function initMap() {
  var astorPlace = {lat: ${bsdto.busStopLatitude}, lng: ${bsdto.busStopLongitude}};
  <%-- var astorPlace = {lat: ${unidto.universityLatitude}, lng: ${unidto.universityLongitude}} --%>
  // Set up the map
  var map = new google.maps.Map(document.getElementById('map'), {
    center: astorPlace,
    zoom: 13,
    streetViewControl: false
  });

  // Set up the markers on the map
  var cafeMarker = new google.maps.Marker({
      position: {lat: ${bsdto.busStopLatitude}, lng: ${bsdto.busStopLongitude}},
      map: map,
      
      title: '${bsdto.busStop}'
  })


  // We get the map's default panorama and set up some defaults.
  // Note that we don't yet set it visible.
  panorama = map.getStreetView();
  panorama.setPosition(astorPlace);
  panorama.setPov(/** @type {google.maps.StreetViewPov} */({
    heading: 265,
    pitch: 0
  }));
}

function toggleStreetView() {
  var toggle = panorama.getVisible();
  if (toggle == false) {
    panorama.setVisible(true);
  } else {
    panorama.setVisible(false);
  }
}

    </script>
    <script
        src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBk_ju7pwO5Gb-Q49o6-t2KvJ8erqmfgiY&callback=initMap"
        async defer>
    </script>
  </body>
</html>