<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
    <script>
        var img = {
            redBus:['url(/spring/images/mainIndex/redBus_1.png)','url(/spring/images/mainIndex/redBus_2.png)','url(/spring/images/mainIndex/redBus_3.png)'],
            yellowBus:['url(/spring/images/mainIndex/yellowBus_1.png)','url(/spring/images/mainIndex/yellowBus_2.png)','url(/spring/images/mainIndex/yellowBus_3.png)'],
            blueBus:['url(/spring/images/mainIndex/blueBus_1.png)','url(/spring/images/mainIndex/blueBus_2.png)','url(/spring/images/mainIndex/blueBus_3.png)'],
            weatherBack:['url(/spring/images/mainIndex/weatherBackground_1.png)','url(/spring/images/mainIndex/weatherBackground_2.png)','url(/spring/images/mainIndex/weatherBackground_3.png)'],
            findWayBack:['url(/spring/images/mainIndex/menu_top_1.png)','url(/spring/images/mainIndex/menu_top_2.png)','url(/spring/images/mainIndex/menu_top_3.png)'],
            scheduleBack:['C','url(/spring/images/mainIndex/menu_bottom_2.png)','url(/spring/images/mainIndex/menu_bottom_3.png)'],
        };

        var now = new Date(); // 시간을 받아오는 객체 생성
        var hour = now.getHours(); // 시

        function changeImgByTime(){
            if( hour > 7 && hour < 17){
                $('#container_top_weather').css('background-image',img.weatherBack[0]);
                $('#container_top_findWay').css('background-image',img.findWayBack[0]);
                $('#container_top_schedule').css('background-image',img.scheduleBack[0]);
                $('#container_mid_redBus').css('background-image',img.redBus[0]);
                $('#container_mid_yellowBus').css('background-image',img.yellowBus[0]);
                $('#container_mid_blueBus').css('background-image',img.blueBus[0]);
            }
            else if(hour > 16 && hour < 20){
                $('#container_top_weather').css('background-image',img.weatherBack[1]);
                $('#container_top_findWay').css('background-image',img.findWayBack[1]);
                $('#container_top_schedule').css('background-image',img.scheduleBack[1]);
                $('#container_mid_redBus').css('background-image',img.redBus[1]);
                $('#container_mid_yellowBus').css('background-image',img.yellowBus[1]);
                $('#container_mid_blueBus').css('background-image',img.blueBus[1]);
            }
            else if(hour > 19 || hour < 7){
                $('#container_top_weather').css('background-image',img.weatherBack[2]);
                $('#container_top_findWay').css('background-image',img.findWayBack[2]);
                $('#container_top_schedule').css('background-image',img.scheduleBack[2]);
                $('#container_mid_redBus').css('background-image',img.redBus[2]);
                $('#container_mid_yellowBus').css('background-image',img.yellowBus[2]);
                $('#container_mid_blueBus').css('background-image',img.blueBus[2]);
            }
        }
        
        function getWeather() {
      	  var url = 'http://api.openweathermap.org/data/2.5/weather?lat=${universityDto.universityLatitude}&lon=${universityDto.universityLongitude}&APPID=62790597231fb6fa089bb576c8f8b650&units=metric&lang=kr';
      	  $.ajax({
      	    dataType: "jsonp",
      	    url: url,
      	    jsonCallback: 'jsonp',
      	
      	    cache: false,
      	    success: function (data) {
      	    	var temp = parseInt(data.main.temp);
      	    	var waetherIcon = data.weather[0].icon;
      	    	var status = data.weather[0].description;
      	    	$("#container_top_weather_bottom_temperature").text(temp+'°');
      	    	$("#container_top_weather_bottom_weatherIcon").css("content","url('/spring/images/mainIndex/"+waetherIcon+".png')")
 				$("#container_top_weather_bottom_weatherStatus").text(status);	
      	    }
      	  });
      	}

        function convertWeek(code){
        	if(code == 1){return "월";}
        	else if(code == 2){return "화";}
        	else if(code == 3){return "수";}
        	else if(code == 4){return "목";}
        	else if(code == 5){return "금";}
        	else if(code == 6){return "토";}
        	else if(code == 0){return "일";}
        }
        
        function changeDate(){
        	var yyyy = now.getFullYear();
        	var mm = now.getMonth()+1;
        	var dd = now.getDate();
        	var week = convertWeek(now.getDay());
        	
        	$('#container_top_weather_top_date').text(yyyy+'년 '+mm+'월 '+dd+'일 '+week);

        }
        
        
        /* 공지사항 회전 */
	(function($) {
        var defaults, internal, methods;
		defaults = {
		  speed: 150,
		  pause: 3000,
		  showItems: 1,
		  mousePause: true,
		  height: '100%',
		  animate: true,
		  margin: 0,
		  padding: 0,
		  startPaused: false,
		  autoAppend: true
		};
		internal = {
		  moveUp: function(state, attribs) {
		    return internal.showNextItem(state, attribs, 'up');
		  },
		  moveDown: function(state, attribs) {
		    return internal.showNextItem(state, attribs, 'down');
		  },
		  nextItemState: function(state, dir) {
		    var height, obj;
		    obj = state.element.children('ul');
		    height = state.itemHeight;
		    if (state.options.height > 0) {
		      height = obj.children('li:first').height();
		    }
		    height += state.options.margin + state.options.padding * 2;
		    return {
		      height: height,
		      options: state.options,
		      el: state.element,
		      obj: obj,
		      selector: dir === 'up' ? 'li:first' : 'li:last',
		      dir: dir
		    };
		  },
		  showNextItem: function(state, attribs, dir) {
		    var clone, nis;
		    nis = internal.nextItemState(state, dir);
		    nis.el.trigger('vticker.beforeTick');
		    clone = nis.obj.children(nis.selector).clone(true);
		    if (nis.dir === 'down') {
		      nis.obj.css('top', '-' + nis.height + 'px').prepend(clone);
		    }
		    if (attribs && attribs.animate) {
		      if (!state.animating) {
		        internal.animateNextItem(nis, state);
		      }
		    } else {
		      internal.nonAnimatedNextItem(nis);
		    }
		    if (nis.dir === 'up' && state.options.autoAppend) {
		      clone.appendTo(nis.obj);
		    }
		    return nis.el.trigger('vticker.afterTick');
		  },
		  animateNextItem: function(nis, state) {
		    var opts;
		    state.animating = true;
		    opts = nis.dir === 'up' ? {
		      top: '-=' + nis.height + 'px'
		    } : {
		      top: 0
		    };
		    return nis.obj.animate(opts, state.options.speed, function() {
		      $(nis.obj).children(nis.selector).remove();
		      $(nis.obj).css('top', '0px');
		      return state.animating = false;
		    });
		  },
		  nonAnimatedNextItem: function(nis) {
		    nis.obj.children(nis.selector).remove();
		    return nis.obj.css('top', '0px');
		  },
		  nextUsePause: function() {
		    var options, state;
		    state = $(this).data('state');
		    options = state.options;
		    if (state.isPaused || internal.hasSingleItem(state)) {
		      return;
		    }
		    return methods.next.call(this, {
		      animate: options.animate
		    });
		  },
		  startInterval: function() {
		    var options, state;
		    state = $(this).data('state');
		    options = state.options;
		    return state.intervalId = setInterval((function(_this) {
		      return function() {
		        return internal.nextUsePause.call(_this);
		      };
		    })(this), options.pause);
		  },
		  stopInterval: function() {
		    var state;
		    if (!(state = $(this).data('state'))) {
		      return;
		    }
		    if (state.intervalId) {
		      clearInterval(state.intervalId);
		    }
		    return state.intervalId = void 0;
		  },
		  restartInterval: function() {
		    internal.stopInterval.call(this);
		    return internal.startInterval.call(this);
		  },
		  getState: function(from, elem) {
		    var state;
		    if (!(state = $(elem).data('state'))) {
		      throw new Error("vTicker: No state available from " + from);
		    }
		    return state;
		  },
		  isAnimatingOrSingleItem: function(state) {
		    return state.animating || this.hasSingleItem(state);
		  },
		  hasMultipleItems: function(state) {
		    return state.itemCount > 1;
		  },
		  hasSingleItem: function(state) {
		    return !internal.hasMultipleItems(state);
		  },
		  bindMousePausing: (function(_this) {
		    return function(el, state) {
		      return el.bind('mouseenter', function() {
		        if (state.isPaused) {
		          return;
		        }
		        state.pausedByCode = true;
		        internal.stopInterval.call(this);
		        return methods.pause.call(this, true);
		      }).bind('mouseleave', function() {
		        if (state.isPaused && !state.pausedByCode) {
		          return;
		        }
		        state.pausedByCode = false;
		        methods.pause.call(this, false);
		        return internal.startInterval.call(this);
		      });
		    };
		  })(this),
		  setItemLayout: function(el, state, options) {
		    var box;
		    el.css({
		      overflow: 'hidden',
		      position: 'relative'
		    }).children('ul').css({
		      position: 'absolute',
		      margin: 0,
		      padding: 0
		    }).children('li').css({
		      margin: options.margin,
		      padding: options.padding
		    });
		    if (isNaN(options.height) || options.height === 0) {
		      el.children('ul').children('li').each(function() {
		        if ($(this).height() > state.itemHeight) {
		          return state.itemHeight = $(this).height();
		        }
		      });
		      el.children('ul').children('li').each(function() {
		        return $(this).height(state.itemHeight);
		      });
		      box = options.margin + options.padding * 2;
		      return el.height((state.itemHeight + box) * options.showItems + options.margin);
		    } else {
		      return el.height(options.height);
		    }
		  },
		  defaultStateAttribs: function(el, options) {
		    return {
		      itemCount: el.children('ul').children('li').length,
		      itemHeight: 0,
		      itemMargin: 0,
		      element: el,
		      animating: false,
		      options: options,
		      isPaused: options.startPaused,
		      pausedByCode: false
		    };
		  }
		};
		methods = {
		  init: function(options) {
		    var clonedDefaults, el, state;
		    if (state = $(this).data('state')) {
		      methods.stop.call(this);
		    }
		    state = null;
		    clonedDefaults = jQuery.extend({}, defaults);
		    options = $.extend(clonedDefaults, options);
		    el = $(this);
		    state = internal.defaultStateAttribs(el, options);
		    $(this).data('state', state);
		    internal.setItemLayout(el, state, options);
		    if (!options.startPaused) {
		      internal.startInterval.call(this);
		    }
		    if (options.mousePause) {
		      return internal.bindMousePausing(el, state);
		    }
		  },
		  pause: function(pauseState) {
		    var el, state;
		    state = internal.getState('pause', this);
		    if (!internal.hasMultipleItems(state)) {
		      return false;
		    }
		    state.isPaused = pauseState;
		    el = state.element;
		    if (pauseState) {
		      $(this).addClass('paused');
		      return el.trigger('vticker.pause');
		    } else {
		      $(this).removeClass('paused');
		      return el.trigger('vticker.resume');
		    }
		  },
		  next: function(attribs) {
		    var state;
		    state = internal.getState('next', this);
		    if (internal.isAnimatingOrSingleItem(state)) {
		      return false;
		    }
		    internal.restartInterval.call(this);
		    return internal.moveUp(state, attribs);
		  },
		  prev: function(attribs) {
		    var state;
		    state = internal.getState('prev', this);
		    if (internal.isAnimatingOrSingleItem(state)) {
		      return false;
		    }
		    internal.restartInterval.call(this);
		    return internal.moveDown(state, attribs);
		  },
		  stop: function() {
		    var state;
		    state = internal.getState('stop', this);
		    return internal.stopInterval.call(this);
		  },
		  remove: function() {
		    var el, state;
		    state = internal.getState('remove', this);
		    internal.stopInterval.call(this);
		    el = state.element;
		    el.unbind();
		    return el.remove();
		  }
		};
		return $.fn.vTicker = function(method) {
		  if (methods[method]) {
		    return methods[method].apply(this, Array.prototype.slice.call(arguments, 1));
		  }
		  if (typeof method === 'object' || !method) {
		    return methods.init.apply(this, arguments);
		  }
		  return $.error('Method ' + method + ' does not exist on jQuery.vTicker');
		};
		})(jQuery);
        
        
        
        
        
        $(document).ready(function(){
            changeImgByTime();
            getWeather();
            changeDate();
            $('#header_notice_mid').vTicker();
        });

    </script>

    <title>학교갈땐::YBUS</title>
    <style>

    @font-face {
	font-family: "Pretendard-Bold";
	src:url(/spring/css//fonts/2022/Pretendard-Bold.woff) format("truetype");
    }
    }
    @font-face {
	font-family: "Pretendard-ExtraLight";
	src:url(/spring/css//fonts//2022/Pretendard-ExtraLight.woff) format("truetype");
    }
    @font-face {
	font-family: "Pretendard-Medium";
	src:url(/spring/css//fonts//2022/Pretendard-Medium.woff) format("truetype");
    }
    @font-face {
	font-family: "Pretendard-SemiBold";
	src:url(/spring/css//fonts//2022/Pretendard-SemiBold.woff) format("truetype");
    }

    a {
        text-decoration: none;
        color:black;
    }   
    
    

    html,body{
        width: 100%;
        height: 100%;
        max-width:600px;
        min-width:375px;
        margin: 0 auto;
        background-color:#fafafc;
    }
    #content{
        width:90.8%;
        position:relative;
        margin: 12.81% 4.611%;

    }
    #header{
        width:100%;
        position:relative;
    }
    #header_logoBox{
    	widht:100%;
    	height:34px;
    }
    #header_logo{
        height:100%;
        float:left;
        content:url("/spring/images/mainIndex/YBUS_logo.png")
    }
    #header_kakao{
    	height:24px;
    	padding:4px 0;
    	float:right;
   		content:url("/spring/images/mainIndex/kakao.png");
    }
    #header_notice{
        width:100%;
        height:36px;
        margin-top:23px;
        border-radius: 23px; 
        background-color:white;
        box-shadow: 0px 0px 15px #0F296B1F;
    }
    #header_notice_left{
        position:relative;
		padding:6px 12px 6px 7px;
		height:24px;
        content:url("/spring/images/mainIndex/header_notice.png");
        float:left;
    }
    #header_notice_mid{
    	float:left;
    	width:83.6%;
    	font-size:0.7em;
    	line-height:36px;
    	font-family: "Pretendard-SemiBold";
    }
    #header_notice_right{
    	width:9.7%;
    	float:left;
    }
    #container{
        width:100%;
        position:relative;
    }
    #container_top{
        width:100%;
        height:104px;
        position:relative;
        margin-top:5.7%;
    }
    #container_top_left{
        width:48.3%;
        height:100%;
        margin-right:1.7%;
        float:left;
    }

    #container_top_weather{
        height:100%;
        background-image:url("/spring/images/mainIndex/weatherBackground_1.png");
        background-size: 100% 100%;
        background-position: center center;
        background-repeat: no-repeat;
        box-shadow: 0px 0px 15px #0F296B1F;
        border-radius: 12px;
        padding-left:10.5%;
    }
    .container_top_weather_blank{
        height:16.4%;
    }
    #container_top_weather_top{
        width:100%;
        height:33.6%;
        position:relative;
    }
    #container_top_weather_top_uniName{
        font-size:1em;
        letter-spacing: -0.4px;
    	font-family: "Pretendard-Bold";
    	color:#ffffff;
    }
    #container_top_weather_top_date{
        font-size:0.5em;
        letter-spacing: -0.25px;
        font-family: "Pretendard-Medium";
        color:#ffffff;
    }
    #container_top_weather_bottom{
        width:100%;
        height:33.6%;
        position:relative;
    }
    #container_top_weather_bottom_weatherIcon{
        height:100%;
        float:left;
    }
    #container_top_weather_bottom_temperature{
        position:relative;
        height:100%;
        font-size:1.9em;
        float:left;
        letter-spacing: -1.6px;
        right:8%;
        font-family: "Pretendard-Bold";
        color:#ffffff;
    }
    #container_top_weather_bottom_weatherStatus{
    	width:38%;
        position:relative;
        font-size:0.75em;
        float:left;
        right:5.5%;
        letter-spacing: -0.3px;
        padding-top:2%;
        font-family: "Pretendard-Bold";
    	color:#ffffff;
    }
    #container_top_right{
        width:48.3%;
        height:100%;
        margin-left:1.7%;
        float:left;
    }
    .container_top_right_blank{
        height:24%
    }
    #container_top_findWay{
        height:44.225%;
        background-image:url("/spring/images/mainIndex/menu_top_1.png");
        background-size: 100% 100%;
        background-position: center center;
        background-repeat: no-repeat;
        box-shadow: 0px 0px 15px #0F296B1F;
        border-radius: 12px;
    }
    #container_top_findWay_left{
        content:url("/spring/images/mainIndex/findway.png");
        height:52%;
        padding-left:11%;
        padding-right:3%;
        float:left;
    }
    #container_top_findWay_right{
        height:52%;
        line-height:175%;
        font-size:0.85em;
        text-align: left;
        letter-spacing: -0.35px;
        float:left;
        font-family: "Pretendard-Bold";
        color:#ffffff;
    }
    #container_top_blank{
        height:11.55%;
    }
    #container_top_schedule{
        height:44.225%;
        background-image:url("/spring/images/mainIndex/menu_bottom_1.png");
        background-size: 100% 100%;
        background-position: center center;
        background-repeat: no-repeat;
        box-shadow: 0px 0px 15px #0F296B1F;
        border-radius: 12px;
    }
    #container_top_schedule_left{
        content:url("/spring/images/mainIndex/bus_schedule.png");
        height:52%;
        padding-left:11%;
        padding-right:3%;
        float:left;
    }
    #container_top_schedule_right{
        height:52%;
        line-height:175%;
        font-size:0.85em;
        text-align: left;
        letter-spacing: -0.35px;
        float:left;
        font-family: "Pretendard-Bold";
        color:#ffffff;
    }
    #container_mid{
        width:100%;
        position:relative;
        margin-top:5.7%;
    }
    .checkBus_box{
        position:absolute;
        width:10%;
        height:10%;
        background-color:#F43B66;
        top:8%;
        left:8%;
        border-radius:50%;
    }
    .container_bus_rayout{
    	position:relative;
        width:31.04%;
        background-size: 100% 100%;
        background-position: center center;
        background-repeat: no-repeat;
        float:left;
        box-shadow: 0px 0px 15px #0F296B1F;
        border-radius: 12px;
    	
    }
    #container_mid_redBus{
        
    }

    #container_mid_redBus_text{
        padding-top:78.72%;
        padding-bottom:4.55%;
        font-size:14px;
        text-align: center;
        letter-spacing: -0.35px;
        font-family: "Pretendard-Bold";
        color: #142637;
    }
    #container_mid_yellowBus{
		margin:0 3.4%;
    }
    #container_mid_yellowBus_text{
        padding-top:78.72%;
        padding-bottom:4.55%;
        font-size:14px;
        text-align: center;
        letter-spacing: -0.35px;
        font-family: "Pretendard-Bold";
        color: #142637;
    }
    #container_mid_blueBus{
        
    }
    #container_mid_blueBus_text{
        padding-top:78.72%;
        padding-bottom:4.55%;
        font-size:14px;
        text-align: center;
        letter-spacing: -0.35px;
        font-family: "Pretendard-Bold";
        color: #142637;
    }
    #container_bottom{
        width:100%;
        position:relative;
        margin-top:11.285%;
    }
    #container_bottom_title{
        font-size:20px;
        letter-spacing: -0.5px;
        margin-bottom:3.4%;
        font-family: "Pretendard-Bold";
        color: #142637;
    }
    #container_bottom_menu{
        width:100%;
        background-color:#ffffff;
        padding-top:6.21%;
        padding-bottom:6.21%;
        box-shadow: 0px 0px 15px #0F296B1F;
        border-radius: 12px;
    }
    #container_bottom_menu_sns{
        position:relative;
        width:19.74%;
        margin-left:4.2%;
        margin-right:4.2%;
        float:left;
    }
    #container_bottom_menu_sns_top{
        width:28.59%;
        content:url("/spring/images/mainIndex/sns.png");
        margin:auto;
        padding-bottom:17.16%;
    }
    #container_bottom_menu_sns_bottom{
        font-size:12px;
        letter-spacing: -0.3px;
        text-align: center;
        font-family: "Pretendard-SemiBold";
        color: #142637;
    }
    #container_bottom_menu_notice{
        width:19.74%;
        margin-right:4.2%;
        float:left;
    }
    #container_bottom_menu_notice_top{
        width:28.59%;
        content:url("/spring/images/mainIndex/container_notice.png");
        margin:auto;
        padding-bottom:17.2%;
    }
    #container_bottom_menu_notice_bottom{
        font-size:12px;
        letter-spacing: -0.3px;
        text-align: center;
        font-family: "Pretendard-SemiBold";
        color: #142637;
    }
    #container_bottom_menu_total{
        width:19.74%;
        margin-right:4.2%;
        float:left;
    }
    #container_bottom_menu_total_top{
        width:33.95%;
        content:url("/spring/images/mainIndex/totalService.png");
        margin:auto;
        padding-bottom:17.16%;
    }
    #container_bottom_menu_total_bottom{
        font-size:12px;
        letter-spacing: -1.3px;
        text-align: center;
        font-family: "Pretendard-SemiBold";
        color: #142637;
    }
    #container_bottom_menu_yteam{
        width:19.74%;
        margin-right:4.2%;
        float:left;
    }
    #container_bottom_menu_yteam_top{
        width:23.24%;
        content:url("/spring/images/mainIndex/YBUSteam.png");
        margin:auto;
        padding-bottom:17.16%;
    }
    #container_bottom_menu_yteam_bottom{
        font-size:12px;
        letter-spacing: -0.3px;
        text-align: center;
        font-family: "Pretendard-SemiBold";
        color: #142637;
    }
    #container_bottom_adver{
        width:100%;
        content:url("/spring/images/mainIndex/banner.png");
        box-shadow: 0px 0px 15px #0F296B1F;
        border-radius: 12px;
        margin-top:5.08%;
    }
    #footer{
        width:100%;
        margin:11.3% 0;
    }
    #footer_title{
        width:100%;
        font-size:20px;
        letter-spacing: -0.5px;
        font-family: "Pretendard-Bold";
        color: #142637;
    }
    #footer_tip{
        width:100%;
        height:110px;
        margin-top:3.4%;
    }
    .footer_tip_blank{
        height:10%;
    }
    #footer_tip_left{
        width:43.22%;
        height:100%;
        background:url("/spring/images/mainIndex/tipBackgoround.png");
        background-size: 100% 100%;
        background-position: center center;
        background-repeat: no-repeat;
        margin-right:3.4%;
        padding-left:5.08%;
        float:left;
        box-shadow: 0px 0px 15px #0F296B1F;
        border-radius: 12px;
    }
    #footer_tip_left_top{
        font-size:0.71em;
        letter-spacing: -0.28px;
        font-family: "Pretendard-Medium";
        color: #142637;
    }
    #footer_tip_left_bottom{
        font-size:0.875em;
        line-height:1.35em;
        letter-spacing: -0.28px;
        font-family: "Pretendard-Bold";
        color: #142637;
    }
    #footer_tip_right{
       width:48.3%;
       height:100%;
       background-color:white;
       float:left;
       box-shadow: 0px 0px 15px #0F296B1F;
       border-radius: 12px;
    }
    #footer_tip_right_top{
    }
    #footer_tip_right_bottom{
    }
        #main_footer{
        width:90%;
        padding:0 5%;
        background-color:gray;
        color:white;
    }
    #logo{
        width:23.2%;
        padding:7.2% 0;
    }
    #prevVersion{
        font-family:"Pretendard-semiBold";
        font-size:0.7em;
    }
    #info{
        width:100%;
        padding-top:12.8px;
        padding-bottom:25.6px;
        font-family:"Pretendard-Medium";
        font-size:0.7em;
        letter-spacing:-0.5px;
    }
    #info_left{
        width:80%;
        float:left;
    }
    #info_right{
        width:20%;
        float:left;
    }
    #info_right_gmail{
        width:45%;
        margin-right:10%;
        float:left;
        content:url("/spring/images/mainIndex/gmail_logo.png");
    }
    #info_right_kakao{
        width:45%;
        float:left;
        content:url("/spring/images/mainIndex/kakao.png");
    }
    </style>
</head>
<body>
    <div id = "content">
        <div id = "header">
        	<div id = "header_logoBox">
            <div id = "header_logo" onClick="window.location.reload();"></div>
            <div id = "header_kakao" onclick="location.href='http://pf.kakao.com/_Rxkxjxeu'"></div>
            <div style = "clear:both"></div>
            </div>
            <div id = "header_notice">
                <div id = "header_notice_left"></div>
                <div id = "header_notice_mid">
                	<ul>
					<c:forEach items="${nList}" var="ndto">
						<li class="nContent" value="${ndto.noticeSeq}"><a href="/spring/user/noticeView.action?noticeSeq=${ndto.noticeSeq}">${ndto.noticeSubject}</a></li>
					</c:forEach>
					</ul>
                </div>
                <div id = "header_notice_right"></div>
                <div style = "clear:both"></div>
            </div>
        </div>
        <div id = "container">
            <div id = "container_top">
                <div id = "container_top_left">
                    <div id = "container_top_weather">
                        <div class = "container_top_weather_blank"></div>
                        <div id = "container_top_weather_top">
                            <div id = "container_top_weather_top_uniName">용인대학교</div>
                            <div id = "container_top_weather_top_date"></div>
                        </div>
                        <div id = "container_top_weather_bottom">
                            <div id = "container_top_weather_bottom_weatherIcon"></div>
                            <div id = "container_top_weather_bottom_temperature"></div>
                            <div id = "container_top_weather_bottom_weatherStatus"></div>
                            <div style="clear:both"></div>
                        </div>
                        <div class = "container_top_weather_blank"></div>
                    </div>
                </div>
                <div id = "container_top_right">
                    <div id = "container_top_findWay" onclick="location.href='/spring/user/seoulBus.action'">
                        <div class = "container_top_right_blank"></div>
                        <div id = "container_top_findWay_left"></div>
                        <div id = "container_top_findWay_right">대중교통</div>
                        <div class = "container_top_right_blank" style="clear:both"></div>
                        </div>
                    <div id = "container_top_blank"></div>
                    <div id = "container_top_schedule" onclick="location.href='/spring/busSchedule/busTimeTable.action';">
                        <div class = "container_top_right_blank"></div>
                        <div id = "container_top_schedule_left"></div>
                        <div id = "container_top_schedule_right">시간표</div>
                        <div class = "container_top_right_blank" style="clear:both"></div>
                    </div>
                </div>
                <div style="clear:both"></div>
            </div>
            <div id = "container_mid">
                <div id = "container_mid_blueBus" class = "container_bus_rayout" value = "18" onclick = "location.href='/spring/getBusStopLine.action?universitySeq=${universityDto.universitySeq}&busStopCategorySeq=18';">
                    <div id = "container_mid_blueBus_dot" class = "checkBus_box"
                    	<c:forEach items = "${cblList}" var = "list">
                    		<c:if test = "${list.busStopCategorySeq == 18}">
                    			style = "background-color:#6DFA5B;"
                    		</c:if>
                    	</c:forEach>
                    ></div>
                    <div id = "container_mid_blueBus_text">시내버스</div>
                </div>
                <div id = "container_mid_yellowBus" class = "container_bus_rayout" value = "36" onclick = "location.href='/spring/getBusStopLine.action?universitySeq=${universityDto.universitySeq}&busStopCategorySeq=36';">
                    <div id = "container_mid_yellowBus_dot" class = "checkBus_box"
                    	<c:forEach items = "${cblList}" var = "list">
                    		<c:if test = "${list.busStopCategorySeq == 36}">
                    			style = "background-color:#6DFA5B;"
                    		</c:if>
                    	</c:forEach>
                    ></div>
                    <div id = "container_mid_yellowBus_text">노란버스</div>
                </div>
                <div id = "container_mid_redBus" class = "container_bus_rayout" value = "36" onclick = "location.href='/spring/getSchoolBusStopLine.action';">
                    <div id = "container_mid_redBus_dot" class = "checkBus_box" style = "background-color:gray;"></div>
                    <div id = "container_mid_redBus_text">통학버스</div>
                </div>
                <div style="clear:both;"></div>
            </div>
            <div id = "container_bottom">
                <div id = "container_bottom_title">더보기</div>
                <div id = "container_bottom_menu">
                    <div id = "container_bottom_menu_sns" onclick="location.href='/spring/camsns/snsMain.action?universitySeq=${universityDto.universitySeq}';">
                        <div id = "container_bottom_menu_sns_top"></div>
                        <div id = "container_bottom_menu_sns_bottom">자유게시판</div>
                    </div>
                    <div id = "container_bottom_menu_notice" onclick="location.href='/spring/user/noticeList.action';">
                        <div id = "container_bottom_menu_notice_top"></div>
                        <div id = "container_bottom_menu_notice_bottom">공지사항</div>
                    </div>
                    <div id = "container_bottom_menu_total">
                        <a href = "https://total.yongin.ac.kr/login.do">
                            <div id = "container_bottom_menu_total_top"></div>
                            <div id = "container_bottom_menu_total_bottom">종합정보시스템</div>
                        </a>
                    </div>
                    <div id = "container_bottom_menu_yteam">
                        <div id = "container_bottom_menu_yteam_top"></div>
                        <div id = "container_bottom_menu_yteam_bottom">YBUS팀</div>
                    </div>
                    <div style="clear:both;"></div>
                </div>
                <div id = "container_bottom_adver"></div>
                <div style="clear:both;"></div>
            </div>
        </div>
        <div id = "footer">
            <div id = "footer_title">YBUS 이용 팁</div>
            <div id = "footer_tip">
                <div id = "footer_tip_left" onclick="location.href='/spring/user/makeIcon.action'">
                    <div class = "footer_tip_blank"></div>
                    <div id = "footer_tip_left_top">YBUS 이용 팁</div>
                    <div class = "footer_tip_blank"></div>
                    <div id = "footer_tip_left_bottom">YBUS를<br>앱처럼이용하고<br>사용하고싶다면?</div>
                </div>
                <div id = "footer_tip_right">
                    <div id = "footer_tip_right_top"></div>
                    <div id = "footer_tip_right_bottom"></div>
                </div>
                <div style="clear:both;"></div>
            </div>
        </div>
        
        <div id = "main_footer">
	        <div id = "logo">
	        	<img style= "width:100%;" src="/spring/images/mainIndex/YBUS_footer.png"  onclick = "location.href='/spring/admin/adminLogin.action'">
	        </div>
	        <div id = "prevVersion">
	            <span>이전 버전으로 </span>
	        </div>
	        <div id = "info">
	            <div id = "info_left">
	                <div>
	                    <span>The UNIV BUS::YBUS made by YBUS Team</span>
	                </div>
	                <div>
	                    <span>2022 All right (C) reserved.</span>
	                </div>
	            </div>
	            <div id = "info_right">
	                <div id = "info_right_gmail" onclick = "location.href='mailto:eeu4327@gmail.com'"></div>
	                <div id = "info_right_kakao" onclick="location.href='http://pf.kakao.com/_Rxkxjxeu'"></div>
	            </div>
	            <div style ="clear:both;"></div>
	        </div>
	    </div>
    </div>

	
</body>
</html>
 