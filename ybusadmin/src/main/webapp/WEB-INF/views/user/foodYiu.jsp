<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1">
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
            padding-bottom:8%;
            background-color:#142637;
            color:white;
            font-size:0.8em;
            border-radius: 50px;
			        
        }


        #selectBtn{
			border:0;
			outline:0;
            postion : relative;
             background-color:#142637;
             color : white;
             font-family : 'Pretendard-SemiBold';
             font-weight: bold;	
            

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
			width:100%;
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
			width:100%;
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
		}
		#dateContents{
			float:left;
			width:60%;
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
			padding:5px 0;
		}
		.detailMenu{
			width:100%;
			text-align:center;
			font-family : 'Pretendard-Medium';
			font-weight:bold;
			color:#142637;
			padding:10px 0;		
		}
    </style>
    <script>
    
    $(function() {

    	

    })//onload

    </script>
</head>
<body>


 <div id="header">
        <div id="infoPage">
            <div id="txtBox">
                <div id="txtType">
					<div style="float:left;width:40%;height:38px;">식단표</div>
					<div style="float:left;height:38px;"><img src="/spring/images/mainIndex/home_btn_navy.png" style="padding-top:2px;height:35px;width:auto;" onclick="location.href='/spring/index.action'" /></div>
					<div class="clear"></div> 
                </div>
            </div>
            <div id="btnBox">
                <div id="btnType">
                <img style="height:70%" src="/spring/images/mainIndex/totalService_white.png">
                   <select id="selectBtn">
                   	<option value="인성관">인성관</option>
                   	<option value="기숙사">기숙사</option>
                   	<option value="환과대">환과대</option>
                   </select>
                </div>
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
					   <span id="searchInput">인성관 1층 입구 앞</span>
					</div>
					<div class="clear"></div>
                </div>
            </div>
            <div id="menuBox">
                <div id="menuContainer">
					<div id="dateBox">
						<div class="moveBtn"><</div>  
						<div id="dateContents">10월 31일 월요일</div>
						<div class="moveBtn">></div>
						<div class="clear"></div>
					</div>
	                <div id="cornerContainer">
	                	<div class="cornerBox">
	                		<div id="cornerA" class="corner">코너 A</div>
                		</div>
                		<div class="cornerBox">
	                		<div id="cornerB" class="corner">코너 B</div>
	                	</div>
	                	<div class="cornerBox">
	                		<div id="cornerC" class="corner">코너 C</div>
                		</div>
	                	<div class="cornerBox">
		                	<div id="cornerD" class="corner_active">코너 D</div>
		                	<div class="cornerDetail">
		                		<p class="detailMenu">1++ 한우</p>
		                		<p class="detailMenu">냉면</p>
		                		<p class="detailMenu">단무지</p>
		                		<p class="detailMenu">초밥</p>
		                	</div>
	                	</div>
                	</div>
                </div>

            </div>
        </div>
		<div id="contentsContainer">
			
			
		</div>
		

    </div>



</body>
</html>