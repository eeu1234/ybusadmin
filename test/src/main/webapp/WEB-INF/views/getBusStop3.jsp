<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
  <head>


<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no, target-densitydpi=medium-dpi" />

<meta name="mobile-web-app-capable" content="yes">


	
 <script async defer
      src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBk_ju7pwO5Gb-Q49o6-t2KvJ8erqmfgiY&callback=initMap">
    </script>
    

    
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
    var map;
    var panorama;
	var marker;
    function initMap() {
      var astorPlace = {lat: ${bsdto.busStopLatitude}, lng: ${bsdto.busStopLongitude}};

      // Set up the map
      map = new google.maps.Map(document.getElementById('map'), {
        center: astorPlace,
        zoom: 13,
        streetViewControl: false
      });

      // Set up the markers on the map
      Marker = new google.maps.Marker({ 
          map: map,
          draggable: true,
  	      animation: google.maps.Animation.DROP,
  	      position: {lat: ${bsdto.busStopLatitude}, lng: ${bsdto.busStopLongitude}},
          title: '${bsdto.busStop}'
      })
      marker.addListener('click', toggleBounce);

      // We get the map's default panorama and set up some defaults.
      // Note that we don't yet set it visible.
      panorama = map.getStreetView();
      panorama.setPosition(astorPlace);
      panorama.setPov(/** @type {google.maps.StreetViewPov} */({
        heading: 276,
        pitch: 0
      }))
    }

    function toggleStreetView() {
      var toggle = panorama.getVisible();
      if (toggle == false) {
        panorama.setVisible(true);
      } else {
        panorama.setVisible(false);
      }
    };
	
    function toggleBounce() {
  	  if (marker.getAnimation() !== null) {
  	    marker.setAnimation(null);
  	  } else {
  	    marker.setAnimation(google.maps.Animation.BOUNCE);
  	  }
  	};
    
    </script>

  </body>
</html>