<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<title>Cambus</title>

<%@include file="/inc/asset.jsp" %>

<style>
@font-face {
	font-family: "notoFont-medium";
	src: url(/spring/css/fonts/NotoSansCJKkr-Medium.woff) format("truetype");
}

@font-face {
	font-family: "notoFont-bold";
	src: url(/spring/css/fonts/NotoSansCJKsc-Bold.woff) format("truetype");
}
/* iphone5 */
@media screen and (max-width: 320px) {
	#headerArea #notice_content {
		font-size: 1em;
	}
	#weatherText {
		font-size: 1em;
		width: 63%;
		padding-right: 5%;
	}
	#frontTemp {
		font-size: 4.5em;
	}
	#rightTemp {
		font-size: 2em;
	}
}
/* iphone6~ */
@media screen and (min-width: 360px) and (max-width: 520px) {
	#headerArea #notice_content {
		font-size: 1.2em;
	}
	#weatherText {
		font-size: 1em;
		width: 60%;
		padding-right: 5%;
	}
	#frontTemp {
		font-size: 5em;
	}
	#rightTemp {
		font-size: 2em;
	}
}
/* ipad*/
@media screen and (min-width: 768px) and (max-width: 1023px) {
	#headerArea #notice_content {
		font-size: 1.5em;
	}
	#weatherText {
		font-size: 1.5em;
		width: 65%;
		padding-right: 5%;
	}
	#frontTemp {
		font-size: 8em;
	}
	#rightTemp {
		font-size: 2.5em;
	}
}

@media screen and (min-width: 1024px) {
	#headerArea #notice_content {
		font-size: 2.5em;
	}
	#weatherText {
		width: 65%;
		padding-right: 5%;
		font-size: 1.5em;
	}
	#frontTemp {
		font-size: 11em;
	}
	#rightTemp {
		font-size: 4em;
	}
}

body, html, p, ul, img, span, div, a {
	margin: 0;
	padding: 0;
}

body, html {
	position: relative;
	height: 100%;
	width: 100%;
	max-width: 1000px;
	font-family: 'notoFont-bold';
	color: #5E5B5A;
	margin: 0 auto;
}

.clear {
	clear: both;
	margin: 0;
	padding: 0;
}

#container {
	position: relative;
	width: 100%;
	height: 100%;
	background-image: url("images/background_road_new.png");
	background-repeat: no-repeat;
	background-size: cover;
	max-width: 800px;
	margin: 0 auto;
	padding-top: 5%;
}

#headerArea {
	position: relative;
	width: 100%;
	height: 5%;
	background-color: rgba(255, 255, 255, 0.4);
	font-size: 100%;
}

#headerArea #notice_icon {
	float: left;
	width: 20%;
	height: 100%;
}

#headerArea #notice_content {
	float: left;
	width: 80%;
	height: 95%;
	color: #444;
	text-overflow: ellipsis;
	white-space: nowrap;
	word-wrap: normal;
	overflow: hidden;
	margin: 0 auto;
	line-height:2;
}

#headerArea img {
	padding-left: 15%;
	position: relative;
	position: relative;
	width: auto;
	height: 100%;
}

#content {
	position: relative;
	margin: 0 auto;
	margin-top: 10%;
	width: 100%;
	height: 81%;
}

#content #weatherInfo {
	float: left;
	width: 66%;
	height: 50%;
}

#content #weatherInfo #infoMent {
	position: absolute;
	text-shadow: #999999 5px 5px 5px;
	color: white;
	top: 15%;
	left: 10%;
	width: 55%;
	height: 70%;
}

#weatherText {
	text-shadow: #999999 5px 5px 5px;
	color: white;
	text-align: right;
}

#content #weatherInfo #infoMent #temp {
	position: relative;
	text-shadow: #999999 5px 5px 5px;
	color: white;
	width: 90%;
	height: 40%;
}

#frontTemp {
	float: left;
	position: relative;
	text-shadow: #999999 5px 5px 5px;
	color: white;
	width: 50%;
	height: 100%;
	margin-left:15%;
	text-align: right;
}

#rightTemp {
	float: left;
	position: relative;
	text-shadow: #999999 5px 5px 5px;
	padding-top: 10%;
	color: white;
	width: 30%;
	height: 100%;
	padding-left: 3%;
	color: white;
}

#content #camMain {
	float: left;
	width: 34%;
	height: 25%;
	background-color: rgba(255, 255, 255, 0.2);
}

#content #cityBus {
	float: left;
	width: 34%;
	height: 25%;
	background-color: rgba(255, 255, 255, 0.6);
}
.iconInfo{
	margin-top:10px;
}
#firstBox {
	float: left;
	width: 33%;
	height: 25%;
	background-color: rgba(255, 255, 255, 0.4);
}

#secBox {
	float: left;
	width: 33%;
	height: 25%;
	background-color: rgba(255, 255, 255, 0.6);
}

#thirdBox {
	float: left;
	width: 34%;
	height: 25%;
	background-color: rgba(255, 255, 255, 0.4);
}

#forthBox {
	float: left;
	width: 33%;
	height: 25%;
	background-color: rgba(255, 255, 255, 0.6);
}

#fifthBox {
	float: left;
	width: 33%;
	height: 25%;
	background-color: rgba(255, 255, 255, 0.4);
}

#sixthBox {
	float: left;
	width: 34%;
	height: 25%;
	background-color: rgba(255, 255, 255, 0.6);
}
.iconBox{
	position:relative;
	width:60%;
	height:70%;
	margin:20% auto;
	background-color: ;
	text-align:center;
}




#bottom {
	width: 100%;
	height: 8%;
	background-color: black;
	color: white;
	text-align: center;
	padding-top: 3%;
	font-size: 0.8em;
}
ul,li{
	width:100%;
	height:100%;
	text-overflow: ellipsis;
	white-space: nowrap;
	word-wrap: normal;
	overflow: hidden;
	margin: 0 auto;
}

.iconImg img{
	width:60%;
	height:auto;
}
</style>

<script>
$(function(){
	if(isMobile.any()){
	    if(isMobile.Android()){
	 
	    }else if(isMobile.IOS()){
	        $('body').css("height","110%");
	    }else if(isMobile.BlackBerry()){
	        
	    }else if(isMobile.Opera()){
	        
	    }else if(isMobile.Windows()){
	        
	    }
	}


});


//모바일 에이전트 구분
var isMobile = {
        Android: function () {
                 return navigator.userAgent.match(/Android/i) == null ? false : true;
        },
        BlackBerry: function () {
                 return navigator.userAgent.match(/BlackBerry/i) == null ? false : true;
        },
        IOS: function () {
                 return navigator.userAgent.match(/iPhone|iPad|iPod/i) == null ? false : true;
        },
        Opera: function () {
                 return navigator.userAgent.match(/Opera Mini/i) == null ? false : true;
        },
        Windows: function () {
                 return navigator.userAgent.match(/IEMobile/i) == null ? false : true;
        },
        any: function () {
                 return (isMobile.Android() || isMobile.BlackBerry() || isMobile.IOS() || isMobile.Opera() || isMobile.Windows());
        }
};


	
</script>

</head>
<body>
	<div id="container">
		<div id="headerArea">
			<div id="notice_icon">
				<img src="images/icon_notice.png" id="noticeIcon">
			</div>
			<div id="notice_content">

				<ul>
					<c:forEach items="${nList}" var="ndto">
						<li class="nContent" value="${ndto.noticeSeq}"><a href="/spring/user/noticeView.action?noticeSeq=${ndto.noticeSeq}">${ndto.noticeSubject}</a></li>
					</c:forEach>
				</ul>

			</div>
		</div>
		<div id="content">
			<div id="weatherInfo">
				<div id="infoMent">
					<div id="weatherText">
						Have a nice day<br> ${wsdto.sky }
					</div>
					<div id="temp">
						<div id="frontTemp">${wsdto.temperature}</div>
						<div id="rightTemp">º</div>
					</div>
				</div>

			</div>
			<div id="camMain">
				<div class="iconBox">
					<div class="iconImg"><img src="./images/mainImage/camMain.png" style="width:50%;height:auto;" /></div>
					<div class="iconInfo">CAMBUS</div>
					
				</div>
			</div>
			<div id="cityBus">
				<div class="iconBox" onclick="location.href='http://m.gbis.go.kr/common/main.do?osInfoType=M'">
            	<div class="iconImg"><img src="./images/mainImage/cityBus.png" alt="" /></div>
               	<div class="iconInfo">경기버스</div>
	            	위치조회
	            </div>
			</div>

			<div class="clear"></div>

			<div id="firstBox" class="BSC1 busLine"></div>
			<div id="secBox" class="BSC2 busLine"></div>
			<div id="thirdBox" class="BSC3 busLine"></div>
			<div class="clear"></div>

			<div id="forthBox" class="BSC4" onclick="location.href='/spring/busSchedule/busTimeTable.action';">
																						 
				<div class="iconBox">
            	<div class="iconImg"><img src="./images/mainImage/busTimeTable.png" alt="" /></div>
               	<div class="iconInfo">전체버스</div>
	            	시간표
	            </div>
			</div>
			<div id="fifthBox" class="BSC5">
				<div class="iconBox">
            	<div class="iconImg"><img src="./images/mainImage/tempIcon.png" alt="" /></div>
               	<div class="iconInfo"></div>
	               	학교위치
	            </div>
			</div>
			<div id="sixthBox" class="BSC6" onclick="location.href='/spring/user/makeIcon.action'">
				<div class="iconBox">
            	<div class="iconImg"><img src="./images/mainImage/howToAdd.png" alt="" /></div>
               	<div class="iconInfo"></div>
	               	App 등록
	            </div>
			</div>
			<div class="clear"></div>
		</div>
		<div id="bottom">Copyright C. All right reserved. Servie by	CAMBUS.</div>

	</div>



<script>

/*
  Vertical News Ticker 1.21

  Original by: Tadas Juozapaitis ( kasp3rito [eta] gmail (dot) com )
               https://github.com/kasp3r/vTicker

  Forked/Modified by: Richard Hollis @richhollis - richhollis.co.uk
 */

	  

(function($) {
	appendCategory();
	
	//alert(${universityDto.universitySeq});
	
	
	
	$(".mvpage").click(function(){
		
		
		 
		var busStopCategorySeq = $(this).attr("value");
		//alert(busStopCategorySeq);
		
		
		//alert(busStopCategorySeq);
		location.href="/spring/getBusStopLine.action?universitySeq="+${universityDto.universitySeq}+"&busStopCategorySeq="+busStopCategorySeq;
	})
	
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
$(function() {
  $('#notice_content').vTicker();
});

function appendCategory(){
	
	<c:forEach items="${bscList}" var="bscDto" varStatus="status">
		var iconImg = document.createElement("div");
		iconImg.setAttribute("class","iconImg");
		
		var img = document.createElement("img");
		<c:choose>
			<c:when test="${status.count==1}">
				img.setAttribute("src","./images/mainImage/mainBus.png");
			</c:when>
			<c:when test="${status.count==2}">
			img.setAttribute("src","./images/mainImage/mainBus.png");
			</c:when>
			<c:when test="${status.count==3}">
			img.setAttribute("src","./images/mainImage/schoolBus.png");
			</c:when>
		</c:choose>
		var iconInfo = document.createElement("div");
		iconInfo.setAttribute("class","iconInfo");
	
		var iconBox = document.createElement("div");
		//iconBox.setAttribute("class","iconBox");
		iconBox.setAttribute("class","iconBox bscs${status.count} mvpage");
		var text = document.createElement("span");
		text.innerText="위치조회";
		
		iconImg.appendChild(img);
		iconInfo.innerText = "${bscDto.busStopCategory}";
		
		
		iconBox.appendChild(iconImg);
		iconBox.appendChild(iconInfo);
		iconBox.appendChild(text);
	
		$(".BSC${status.count}").append(iconBox);
		
		$(".bscs${status.count}").attr("value","${bscDto.busStopCategorySeq}");
		//$("#firstBox").append(iconBox);
		//$(iconBox).appendTo($("#firstBox"));
		//$("#firstBox").append("<a>test</a>");
		
	</c:forEach>
	 
	
	
}



       



</script>

</body>
</html>