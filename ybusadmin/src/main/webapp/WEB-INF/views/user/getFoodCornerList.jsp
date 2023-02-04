<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.Calendar" %>
<%@ page import="java.time.LocalDate" %> 
<%@ page import="java.time.DayOfWeek" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<!-- import 시작 -->
<script src="https://code.jquery.com/jquery-1.12.4.min.js"
	integrity="sha256-ZosEbRLbNQzLpnKIkEdrPv7lOy9C27hHQ+Xp8a4MxAQ="
	crossorigin="anonymous"></script>
<title>식단표</title>

 <style>    
	@font-face {
	font-family: "Pretendard-Bold";
	src:url(/spring/css/2022css/2022/Pretendard-Bold.subset.woff2) format("truetype");
    }
    }
    @font-face {
	font-family: "Pretendard-ExtraLight";
	src:url(/spring/css/2022css/2022/Pretendard-ExtraLight.subset.woff2) format("truetype");
    }
    @font-face {
	font-family: "Pretendard-Medium";
	src:url(/spring/css/2022css/2022/Pretendard-Medium.subset.woff2) format("truetype");
    }
    @font-face {
	font-family: "Pretendard-SemiBold";
	src:url(/spring/css/2022css/2022/Pretendard-SemiBold.subset.woff2) format("truetype");
    }
	
	
        body, html, p, ul, img, span, div, a {
            margin: 0;
            padding: 0;
        }
		

        body, html {
			min-width:375px;
			max-width:600px;
            position: relative;
            height: 100%;
            width: 100%;
            margin: 0 auto;
            color: #222;
            background-color: #FAFAFC;
        }

        .clear {
            clear: both;
            margin: 0;
            padding: 0;
        }

        #container {
            position: relative;
            width: 100%;
            height:100%;
            margin: 0 auto;
            margin-top:6%;
        }

        #header {
            position: relative;
            margin-top:5%;
            width: 100%;
            text-align: center;
            color: white;
	

        }
        #infoPage {
            position: relative;
			width:90%;
			padding-top:5%;
			padding-left:5%;
			padding-right:5%;
        }
        #txtBox {
            position: relative;
            float:left;
            width: 60%;
            
        }
        #btnBox {
            position: relative;
            float:left;
            width: 40%;
            text-align:right;
            
		}
        #txtType{
            position: relative;
            font-weight: bold;
            color : #142637;
            text-align: left;
            font-size: 2em;
			padding-top:0.5%;
			padding-bottom:0.5%;
			font-family: "Pretendard-Bold";

			
        }
        #btnType{	
            position: relative;
            float:right;
            text-align: right;    
            text-align:center;
            width:65%;
            height:15px;
            padding-top:5%;
            padding-bottom:5%;
            background-color:#142637;
            color:white;
            font-size:0.8em;
            border-radius: 50px;
            
			        
        }


        #selectBtn{
			border:0;
			outline:0;
            background-color:#142637;
            color : white;
            font-family : 'Pretendard-SemiBold';
            font-weight: bold;
            -webkit-appearance: none;
            margin-right: auto;
            height: 120%;
        }

        #searchContainer{
			position:relative;
            width:100%;
			padding-top:1%;
            margin: 0 auto;
        }
		#contentsContainer{
			position:relative;
			padding-top:5%;
			padding-bottom:3.5%;
			
		}
        #searchBox{
			position:relative;
			width:80%;
            height:80%;
			padding:3% 5%;
            background-color:white;
            border-radius:15px;
            box-shadow: 5px 10px 30px #e0e0e0;
			margin:0 auto;

        }
        #menuBox{
			position:relative;
			width:80%;
			padding:1% 5%;
			padding-bottom:10%;
            background-color:white;
            border-radius:15px;
            box-shadow: 5px 10px 30px #e0e0e0;
			margin:0 auto;
			margin-top:25px;

        }
       	#menuContainer{
			position:relative;
			width:100%;
            background-color:#72bdd6;
            border-radius:15px;
            box-shadow: 5px 10px 30px #e0e0e0;
			margin:0 auto;
			margin-top:25px;
			padding-bottom:10%;

        }
        
		.contentsBox{
			position:relative;
			width:90%;
            height:161.4px;
			padding-top:20px;
            background-color:white;
            border-radius:10px;
            box-shadow: 5px 10px 30px #e0e0e0;
			margin:0 auto;
			margin-bottom:5%;
			
		}
		.content_category{
			position:relative;
			width:14%;
            height:16px;
			margin-left:5%;
			margin-right:5%;
			text-align:center;
		}
        #search{
			position:relative;
			margin: 0 auto;
            background-color: #FAFAFC;
            border-radius:30px;
			padding:2% 0;
        }      
		#searchNotice{
			position:relative;
			margin: 0 auto;
            height: 35%;        
			padding-top:3%;			
        }
		#searchInput{
			width:50%;
			height:100%;
			font-family : 'Pretendard-Medium';
		}	
		#searchInput::placeholder {
			width:100%;
			height:100%;
			color: #142637;
			font-family : 'Pretendard-Medium';
		}
		.search_iconBox{
			float:left;
			width:18px;
			padding:1.5px 1.3% 1.5px 3.3%;
		}
		.search_iconBox_notice{
			postion:relative;
			float:left;
			width:10%;
			text-align:center;
			
		}
		.search_inputBox{
			float:left;
			width:86%;
		}
		
		#search_icon{
			width:100%;
		}		 
		#notice_icon{
			width:45%;
			margin:0 auto;
		}
		#searchInput{
			border:transparent;
			background-color:transparent;
			font-size:1em;
		    color : #142637;
			font-weight:bold;
			
		}
		#searchInputBoxNotice{
			
			padding-top:0.5%;
			border:transparent;
			background-color:transparent;
			font-size:0.8em;
		    color : #767676;
			font-family : 'Pretendard-Medium';
			
		}
		#dateBox{
			position:relative;
			width:80%;
			text-align:center;
			color:white;
			font-family : 'Pretendard-Medium';
			padding-top:20px;
			margin-bottom:40px;
			padding-left:10%;
			padding-right:10%;
			
		}
		.moveBtn{
			float:left;
			width:10%;
			font-weight: bold;
		}
		#dateContents{
			float:left;
			width:80%;
			font-weight: bold;
		}
		#cornerContainer{
			position:relative;
			width:80%;
			padding-left:10%;
			padding-right:10%;
		}
		.cornerBox{
			width:100%;
			background-color:white;
			border-radius:15px;
		}
		.corner{
			position:relative;
			width:100%;
			height:45px;
			text-align:center;
			color:#142637;
			font-family : 'Pretendard-Medium';
			font-weight:bold;
			font-size:1.5em;
			background-color:white;
			margin-top:20px;
			padding-top:13px;
			border-radius:15px;
           
		}
		.corner_active{
			position:relative;
			width:100%;
			height:45px;
			text-align:center;
			color:#142637;
			font-family : 'Pretendard-Medium';
			font-weight:bold;
			font-size:1.5em;
			background-color:white;
			margin-top:20px;
			padding-top:13px;
			border-radius:15px;
			box-shadow: 0px 10px 10px #e0e0e0;
           
		}
		
		.cornerDetail{
			width:100%;
			text-align:center;
			background-color:#fafafc;
			border-radius:15px;
			
			max-height:0;
			overflow:hidden;
			transition:all .5s;
		}
		
		.detailMenu{
			width:100%;
			text-align:center;
			font-family : 'Pretendard-Medium';
			font-weight:bold;
			color:#142637;
			padding:1% 0;
			
		}
		.down
		{
		padding:5px 0;
		max-height:180px
		}
		
		@import "https://fonts.googleapis.com/css?family=Montserrat";






    </style>
    <script>
    
    $(function() {

    	

    })//onload

    </script>
    <script src="//code.jquery.com/jquery.min.js"></script>
<script>
    $(document).ready(function(){
	
	$("#selectBtn").change(function(){
		$("#location").submit();
	});
	// http://localhost:7070/spring/admin/spring/admin/adminFoodList.action?menuLocation=%EC%9D%B8%EC%84%B1%EA%B4%80
	})
</script>
	
</head>
<body>


<% 
	String[] weekDay = {"일요일","월요일","화요일","수요일","목요일","금요일","토요일", "일요일"};
	String date = request.getParameter("date");
	String universitySeq = request.getParameter("universitySeq");
	String[] dateArr = date.split("-");
	String location = request.getParameter("menuLocation");
	LocalDate lDate = LocalDate.of(Integer.parseInt(dateArr[0]),Integer.parseInt(dateArr[1]),Integer.parseInt(dateArr[2]));
	DayOfWeek dayOfWeek = lDate.getDayOfWeek();
%>


 <div id="header">
        <div id="infoPage">
            <div id="txtBox">
                <div id="txtType">
					<div style="float:left;width:45%;height:38px; text-align:center;">식단표</div>
					<div style="float:left;height:38px;"><img src="/spring/images/mainIndex/home_btn_navy.png" style="padding-top:2px;height:35px;width:auto;" onclick="location.href='/spring/index.action'" /></div>
					<div class="clear"></div> 
                </div>
            </div>
            <div id="btnBox">
            <form id="location" method="GET" action="/spring/food.action">
            
                <div id="btnType" style="text-align:center;">
                <div style="height: 100%; display:flex; justify-content: space-between;">
                
                	<img style="height: 85%; margin-top: 2.5%; margin-right: 2.5%; margin-left: auto;" src="/spring/images/mainIndex/totalService_white.png">
                
                
                	<input type="hidden" value="<%=universitySeq%>" name="universitySeq">
                	<input type="hidden" value="<%=date%>" name="date">
                   <select name="menuLocation" id="selectBtn">
                   <c:set var="loc" value="<%= location %>" />
                   <c:if test="${loc eq '인성관'}">
                   	<option value="인성관" selected>인성관</option>
                   	<option value="생활관">생활관</option>
                   	<option value="환과대">환과대</option>
                   	</c:if>
                   	<c:if test="${loc eq '생활관'}">
                   	<option value="인성관">인성관</option>
                   	<option value="생활관" selected>생활관</option>
                   	<option value="환과대">환과대</option>
                   	</c:if>
                   	<c:if test="${loc eq '환과대'}">
                   	<option value="인성관">인성관</option>
                   	<option value="생활관">생활관</option>
                   	<option value="환과대" selected>환과대</option>
                   	</c:if>
                   </select>
                   </div>
                   
                </div>
                 </form>
            </div>
            <div class="clear"></div>
        </div>
    </div>
    <div id="container">
        <div id="searchContainer">
            <div id="searchBox">
                <div id="search">
					<div class="search_iconBox">
						<img src='/spring/images/mainImage/pin_icon.png' id="search_icon">
					</div>
					<div class="search_inputBox">
					<c:set var="loc" value="<%= location %>" />
					<c:if test="${loc eq '인성관'}">
					   <span id="searchInput">인성관 1층 입구 앞</span>
					   <span id="searchInput" style="float:right; text-align:right;">08:00 ~ 19:00</span>
					 </c:if>
					 <c:if test="${loc eq '환과대'}">
					   <span id="searchInput">환과대 지하 1층</span>
					   <span id="searchInput" style="float:right; text-align:right;">08:00 ~ 19:00</span>
					 </c:if>
					 <c:if test="${loc eq '생활관'}">
					   <span id="searchInput">생활관 </span>
					   <span id="searchInput" style="float:right; text-align:right;">10:00 ~ 19:00</span>
					 </c:if>
					</div>
					<div class="clear"></div>
                </div>
            </div>
            <div id="menuBox">
                <div id="menuContainer">
					<div id="dateBox">
					<c:set var="dow" value="<%=dayOfWeek.getValue()%>"/>
					<c:choose>
						<c:when test="${dow eq 1}">
						<div class="moveBtn" style="color: #DCDCDC">　</div>  
							<div id="dateContents"><%= dateArr[1] %>월 <%= dateArr[2]%>일 월요일 </div>
						<div class="moveBtn" onclick="location.href=AddDays(1);">></div>
						</c:when>
						<c:when test="${dow eq 5}">
						<div class="moveBtn" onclick="location.href=AddDays(-1);"><</div>  
							<div id="dateContents"><%= dateArr[1] %>월 <%= dateArr[2]%>일 금요일 </div>
						<div class="moveBtn" style="color: #DCDCDC">　</div>
						</c:when>
						<c:otherwise>
						<div class="moveBtn" onclick="location.href=AddDays(-1);"><</div>  
							<div id="dateContents"><%= dateArr[1] %>월 <%= dateArr[2]%>일 <%= weekDay[dayOfWeek.getValue()] %> </div>
						<div class="moveBtn" onclick="location.href=AddDays(1);">></div>
						</c:otherwise>
						
					</c:choose>
						<div class="clear"></div>
					</div>
	                <div id="cornerContainer">
	                	<div class="cornerBox">
	                		<div id="cornerA" class="corner" onclick="dp_menu(0)">코너 A</div>
	                		<div class="cornerDetail down">
	                		<c:choose>
	                			<c:when test="${empty foodList or empty foodList[0].menu1}">
		                		<div class="detailMenu"><h3 style="color: gray;">정보가 없습니다.</h3></div>
		                		</c:when>
		                		<c:otherwise>
		                		<div class="detailMenu" style="color: #ED4040">${foodList[0].menu1}</div>
		                		<div class="detailMenu">${foodList[0].menu2}</div>
		                		<div class="detailMenu">${foodList[0].menu3}</div>
		                		<div class="detailMenu">${foodList[0].menu4}</div>
		                		<div class="detailMenu">${foodList[0].menu5}</div>
		                		</c:otherwise>
		                	</c:choose>
		                	</div>
                		</div>
                		<div class="cornerBox">
	                		<div id="cornerB" class="corner" onclick="dp_menu(1)">코너 B</div>
	                		<div class="cornerDetail">
		                		<c:choose>
	                			<c:when test="${empty foodList or empty foodList[1].menu1}">
		                		<div class="detailMenu"><h3 style="color: gray;">정보가 없습니다.</h3></div>
		                		</c:when>
		                		<c:otherwise>
		                		<div class="detailMenu" style="color: #ED4040">${foodList[1].menu1}</div>
		                		<div class="detailMenu">${foodList[1].menu2}</div>
		                		<div class="detailMenu">${foodList[1].menu3}</div>
		                		<div class="detailMenu">${foodList[1].menu4}</div>
		                		<div class="detailMenu">${foodList[1].menu5}</div>
		                		</c:otherwise>
		                	</c:choose>
		                	</div>
	                	</div>
	                	<div class="cornerBox">
	                		<div id="cornerC" class="corner" onclick="dp_menu(2)">코너 C</div>
	                		<div class="cornerDetail">
		                		<c:choose>
	                			<c:when test="${empty foodList or empty foodList[2].menu1}">
		                		<div class="detailMenu"><h3 style="color: gray;">정보가 없습니다.</h3></div>
		                		</c:when>
		                		<c:otherwise>
		                		<div class="detailMenu" style="color: #ED4040">${foodList[2].menu1}</div>
		                		<div class="detailMenu">${foodList[2].menu2}</div>
		                		<div class="detailMenu">${foodList[2].menu3}</div>
		                		<div class="detailMenu">${foodList[2].menu4}</div>
		                		<div class="detailMenu">${foodList[2].menu5}</div>
		                		</c:otherwise>
		                	</c:choose>
		                	</div>
                		</div>
	                	<div class="cornerBox">
		                	<div id="cornerD" class="corner" onclick="dp_menu(3)">코너 D</div>		                	
		                	<div class="cornerDetail">
		                		<c:choose>
	                			<c:when test="${empty foodList or empty foodList[3].menu1}">
		                		<div class="detailMenu"><h3 style="color: gray;">정보가 없습니다.</h3></div>
		                		</c:when>
		                		<c:otherwise>
		                		<div class="detailMenu" style="color: #ED4040">${foodList[3].menu1}</div>
		                		<div class="detailMenu">${foodList[3].menu2}</div>
		                		<div class="detailMenu">${foodList[3].menu3}</div>
		                		<div class="detailMenu">${foodList[3].menu4}</div>
		                		<div class="detailMenu">${foodList[3].menu5}</div>
		                		</c:otherwise>
		                	</c:choose>
		                	</div>
	                	</div>
                	</div>
                </div>

            </div>
        </div>
		<div id="contentsContainer">
			
			
		</div>
		

    </div>


<script>

function dp_menu(num) {
	  document.getElementsByClassName('cornerDetail')[num].classList.toggle('down');
	  
	  if (document.getElementsByClassName('cornerDetail')[num].classList.contains('down')) {
	    setTimeout(function() {
	      document.getElementsByClassName('cornerDetail')[num].style.overflow = 'visible'
	    }, 50)
	  } else {
	    document.getElementsByClassName('cornerDetail')[num].style.overflow = 'hidden'
	  } 
}

function like(){
	document.getElementsByClassName("detailMenu")[0].style.backgroundColor = "gray";
	
	document.getElementsByClassName("detailMenu")[0].onclick = function() {
		this.style.backgroundColor = "red";
	}
}

function convertDateForIos(date) {
    var arr = date.split(/[- :]/);
    date = new Date(arr[0], arr[1]-1, arr[2]);
    return date;
}
	
function AddDays(day) {
	var universitySeq = '<%=universitySeq%>';
	var location = '<%=location%>';
	var date = '<%=date%>';
	
    var result = convertDateForIos(date);
   
    
    result.setDate(result.getDate() + day);
    
    
    var resultDate = result.getFullYear()+'-'+(result.getMonth()+1)+'-'+result.getDate();
    
    var link = "/spring/food.action?universitySeq="+universitySeq+"&menuLocation="+location+"&date="+resultDate;
    return link
}
<%-- function DayBefore(day) {
	var universitySeq = '<%=universitySeq%>';
	var location = '<%=location%>';
	var date = '<%=date%>';
    var result = new Date(date);

    if (result.getDay() === 1) {
    	result.setDate(result.getDate() + day);
    	result.setDate(result.getDate() + day);
    	result.setDate(result.getDate() + day);
    } else {
    	result.setDate(result.getDate() + day);
    }

    var resultDate = result.getFullYear()+'-'+(result.getMonth()+1)+'-'+result.getDate();
    
    var link = "/spring/food.action?universitySeq="+universitySeq+"&menuLocation="+location+"&date="+resultDate;
    return link
} --%>
</script>
</body>
</html>