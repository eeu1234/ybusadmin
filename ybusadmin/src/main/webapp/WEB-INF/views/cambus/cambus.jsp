<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!doctype html>
<html lang="ko">
 <head>
  <meta charset="UTF-8">
  <meta name="Generator" content="EditPlus®">
  <meta name="Author" content="">
  <meta name="Keywords" content="">
  <meta name="Description" content="">
  
  <title>Cambus홈페이지</title>
  <%@include file="/inc/asset.jsp" %>
  <link rel="apple-touch-icon" href="/spring/images/ico/favicon.ico">
  <script src="https://code.jquery.com/jquery-2.2.4.min.js"
        integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44="
        crossorigin="anonymous">
  </script>
  <link rel="stylesheet" type="text/css" href="/spring/css/cambus/css/reset.css" />
  <link rel="stylesheet" type="text/css" href="/spring/css/cambus/css/main.css" />


	<script type="text/javascript">
	//<![CDATA[
		$(document).ready(function(){
			tabScroll(".title");
			console.log($('html').css("width"));
			var _str = $('html').css("width");
			var str = _str.substr(0, _str.length - 2);
				console.log(parseInt(str)/4);
			$('html').scrollLeft(str/8);


		});
		function tabScroll(id){
			var tabId = $(id);
			var tabIdtop = tabId.offset().top;
			var tabIdHe = tabId.height();

			$(window).scroll(function(){
				if ($(this).scrollTop() >= tabIdtop) { 
					tabId.css({"position":"fixed"});
				} else {
					tabId.css({"position":"absolute"});
				}
			});

			tabId.find("li").each(function(){
				var liThis = $(this);
				var divId = liThis.find("a").attr("href");
				var divIdtop = $(divId).offset().top-tabIdHe;
				liThis.bind("click", function(e){
					e.preventDefault();
					$('body,html').animate({scrollTop: divIdtop},450);
				});

			});
		}
	//]]>
	</script>

 </head>
 <body>
  <div id="board">
	<div id="main">
		<div class="title" id="cambus">			 
			<div id="mb_bg">
				<div id="main_logo">
				<ul>
					<li><p class="menu"><a href="http://cambus.kr"><img src="/spring/images/cambus/image/logo.png" /></a></p></li>
				</ul>
				</div>
				<ul>
					<li><p class="menu"><a href="#combus_info">캠버스소개</a></p></li>
					<li><p class="menu"><a href="#mobile">캠버스서비스</a></p></li>
					<li><p class="menu"><a href="#detail">이용하기</a></p></li>
					<li><p class="menu"><a href="#askView">문의하기</a></p></li>
				</ul>
			</div>
		</div>
	</div>  



	<div id="combus_info" >
			<img src="/spring/images/cambus/image/info.png" />
	</div>


	<div id="mobile">
		<p style="padding-top:352px; padding-left:1036px;">
			대학생들의 교통편의 및 학교생활을 위한 다양한 서비스를 제공합니다.<br>
			실시간 셔틀버스 위치조회부터 버스시간표 제공  그리고 학식메뉴까지!<br><br>

			대학생의 입장에서 그들의 마음과 생각을 가장 잘 이해할 수 있었던 이유는<br>
			CAMBUS 개발자들이 직접 겪은 대학생의 고충을 토대로 만들었기 때문입니다.<br>
		</p>
		<p style="text-align:right; padding-right:1000px; padding-top:420px;">
			실시간으로 셔틀버스의 위치를 조회할 수 있습니다.<br>
			타임라인 형식의 그래픽과 한 눈에 보기 쉬운 아이콘들로 제작되어<br>
			바쁜 아침 등굣길, 1분 1초의 시간도 아까운 대학생들의 마음을 위합니다.<br><br>

			아직은 대학교의 모든 것이 낯선 신입생들을 위한 친절한 정류장 로드뷰 서비스까지.<br>
			여러분의 설레고 서툰 입학부터 마지막 졸업하는 날 까지 <br>
			CAMBUS는 언제나 당신과 함께입니다. <br>
		</p>
	</div>


	<div id="detail">
		<img src="/spring/images/cambus/image/detail.png" />
	</div>


	<div id="try_line">
		<p>TRY THIS ONE</p>
	</div>


	<div id="askView">

		<div id="ask_title">
			<p><img src="/spring/images/cambus/image/contact.png" /></p>
			<p><img src="/spring/images/cambus/image/ask.png" style="padding-bottom:30px;" /></p>
		</div>


		<div id="contents">
			<div class="div_text">
				<span><img src="/spring/images/cambus/image/name.png" /></span>
				<span><input type="text" name="name" id="name" class="input_text" placeholder="&emsp;이름" /></span>
			</div>
			<div class="div_text">
				<span><img src="/spring/images/cambus/image/school.png" /></span>
				<span><input type="text" name="school" id="school" class="input_text" placeholder="&emsp;대학교 이름" /></span>
			</div>
			<div class="div_text">
				<span><img src="/spring/images/cambus/image/phone.png" /></span>
				<span><input type="text" name="phone" id="phone" class="input_text" placeholder="&emsp;휴대폰번호" /></span>
			</div>
			<div class="div_text">
				<span><img src="/spring/images/cambus/image/text_img.png" style="margin-top:-20px;"/></span>
				<span><textarea name="text" id="text" class="input_text" placeholder="&emsp;내용을 작성해주세요."></textarea>	
			</div>
		</div>

		<div id="radioBtn">
			<img src="/spring/images/cambus/image/ask_btn.png" name="radio" id="radio" />
		</div>
			


	</div>
 
  
	<div id="owner" >
		<div id="owner_p">
			<p>THE OWNER OF THE SCHOOL IS A STUDENT.</p>
		</div>
	</div> 

  

	<div id="footer">
		<div id="logoInfo">
			<div id="footer_info">
				<p>
					캠버스(CAMBUS) | 이도영 | 사업자등록번호 : 594-02-00718<br>
					서울특별시 올림픽로 135<br>
					전화 : 010-9467-4889 | 이메일 : eeu4327@gmail.com<br>
				</p>
				<p style=" margin-top:17px; opacity:0.5;">Copyright ⓒ 2017. All Right Reserved.</p>
			</div>
			<div id="footer_logo"><img src="/spring/images/cambus/image/footer_logo.png" /></div>
		</div>

	</div>


  </div>
 </body>
</html>
