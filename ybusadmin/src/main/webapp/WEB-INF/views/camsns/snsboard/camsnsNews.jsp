<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 각종 임포트 -->
<%@include file="/inc/camsnsAsset.jsp"%>

<title>Sns</title>
<style>

html,body {
    position: relative;
    margin: 0 auto;
    width: 100%;
    height:100%;
    max-width: 600px;
}

#subMenu {
    width: 90%;
    height: 50px;
    margin: 0 auto;
}



#container {
    position: relative;
    margin: 0 auto;
    width: 100%;
    height: 100%;
}



.backBlue {
    background-color: #337AB7;
    border-color: #337AB7;
}

.backRed {
    background-color: #D9534F;
    border-color: #D9534F;
}

.backYellow {
    background-color: #F0AD4E;
    border-color: #F0AD4E;
}

.backGreen {
    background-color: #5CB85C;
    border-color: #5CB85C;
}

.backSkyBlue {
    background-color: #5BC0DE;
    border-color: #5BC0DE;
}





.contentArea {
    position: relative;
    width: 90%;
    height:auto;
    background-color: #D5D5D5;
    margin: 0 auto;
}

.contentHeader {
    position: relative;
    width: 100%;
    height: 35px;
    color: white;
    border-radius: 4px;
}

.contentNum {
    float: left;
    position: relative;
    width: 20%;
    height: 35px;
    text-align: center;
    padding-top: 8px;
    margin: 0;
}

.title {
    float: left;
    position: relative;
    width: 67%;
    height: 35px;
    padding-top: 8px;
    margin: 0;
    font-weight: bold;
    text-overflow: ellipsis;
    white-space: nowrap;
    overflow: hidden;">
}

.shareArea {
    float: left;
    position: relative;
    width: 13%;
    height: 35px;
}

.shareBtn {
    width: 90%;
    height: 90%;
    color: white;
    border: 0px;
}

.content {
    position: relative;
    width: 100%;
    height: 20%;
    min-height: 200px;
    background-color: white;
    padding: 8px;
    box-shadow: 0px 7px 10px 0 silver inset;
}

.contentPic {
    position: relative;
    margin: 10px auto;
    width: 100%;
    height: auto;
    text-align:center;
}

.contentRegdate {
    position: relative;
    margin: 0px auto;
    width: 100%;
    height: auto;
    text-align: right;
    font-size: 0.7em;
    color: #888;
}

.comment {
    position: relative;
    padding: 7px;
    width: 100%;
    height: 5%;
    min-height: 270px;
    font-size: 0.8em;
    border-bottom:2px solid  #bfbfbf;
}



.addComment {
    width: 100%;
    height: 100%;
    margin-top:10px;
    margin-bottom:10px;
    color:#888;
}

.commentText {
    float: left;
    width: 88%;
    height: 30px;
}


#picUpBtn {
    position: relative;
    float: left;
    width: 10%;
    height: 30px;
    color: gray;
    margin-left: 5px;
    margin-top:5px;
}

.clear {
    both: clear;
}

img {
    width: 100%;
    height: auto;
}

#picUpBtn label {
    width: 100%;
    height: 100%;
    display: inline-block;
    color: #999;
    text-align: center;
    padding-top: 0.1em;
    font-size: 1.5em;
    line-height: normal;
    background-color: #fdfdfd;
    cursor: pointer;
    border: 1px solid #ebebeb;
    border-bottom-color: #e2e2e2;
    border-radius: .25em;
}

#picUpBtn input[type="file"] { /* 파일 필드 숨기기 */
    position: absolute;
    width: 1px;
    height: 1px;
    padding: 0;
    margin: -1px;
    overflow: hidden;
    clip: rect(0, 0, 0, 0);
    border: 0;
}




/* 코멘트 */

.commentArea{
    position:relative;
    width: 100%;
    height: 100;
    max-width: 600px;
    margin-top:10px;
    margin-bottom:8%;
     
}


.commInfo{
    position:relative;
    float:left;
    width:100%;
    height:30%;
    font-size:0.7em;
    
    
}
.userEmail{
    float:left;
    width:50%;
    height:100%;
    background-color: #dadada;
    padding-top:1%;
    padding-left:2%;
    color: #3b5998;
    
    
    border-left: 2px solid;
    border-radius: 25px 0px 0px 0px;
    
}
.commRegdate{
    float:left;
    width:50%;
    height:100%;
    text-align:right;
    background-color: #dadada;
    padding-top:1%; 
    padding-right:2%;
    color: #bfbfbf;
}

.commContent{
    position:relative;
    float:left;
    width:100%;
    height:100%;
    min-height:100px;
    
    background-color: #f6f7f9;
    margin:0 auto;
    padding-left:2%;
    padding-top:2%;
    border-bottom:2px solid #e5e5e5;
}

.commContent img{
    width:90%;
    height:auto;
}

.more {
}

#btnTr {
    text-align: center;
    cursor: pointer;
}

.link, .content {
    border: 1px solid #ffffff
}
</style>
<script>
    var tr;
    var idx = 1;
    var camsnsNews = {
        init : function () {
            camsnsNews.event();
            camsnsNews.getNews(idx);
        },
        event : function() {
        },
        getDescription : function(obj) {
            var content = $(obj).data('content');
            var link = $(obj).data('link');
            if($('#content') != null || $('#content') != 'undefined') {
                $('#content').remove();
            }
            
            if($('#link') != null || $('#link') != 'undefined') {
                $('#link').remove();
            }
            
            var tmpl = '<tr id="content" class="content">';
            tmpl +=         '<td colspan="2">' + content + '</td>';
            tmpl +=    '</tr>';
            tmpl += '<tr id="link" class="link">';
            tmpl +=         '<td colspan="2"><a href="' + link + '">' + link + '</a></td>';
            tmpl +=    '</tr>';
            $(obj).after(tmpl);
        },
        getNews : function(k){
            $.ajax({
               type : "POST",
               url : "/spring/camsns/snsboard/getNews",
               data : "start="+k,
               dataType: "text",
               success : function(data){
                   var jsonArray = JSON.parse(data);
                   for(var i=0; i<jsonArray.length; i++) {
                       var tmpl = '<tr data-content="' + jsonArray[i].description + '" data-link="' + jsonArray[i].link + '" onclick="camsnsNews.getDescription(this)")>';
                       tmpl += '<td>' + jsonArray[i].title + '</td>';
                       tmpl += '<td>' + jsonArray[i].date + '</td>';
                       tmpl += '</tr>';
                       
                       $('#tbl1 tbody').append(tmpl);
                   }
                   idx += 5;
                   if($('#btnTr') != 'undefined') {
                       $('#btnTr').remove();
                   }
                   var btn = '<tr id="btnTr"><td colspan="2"><a onclick="camsnsNews.getNews(' + idx + ')">더보기</a></td></tr>';
                   $('#tbl1 tbody:last').append(btn);
               },
               error : function(request, status, error){
               }
            });
        }
    }
    $(function(){
        camsnsNews.init();
    });
</script>
</head>
<body>
    <%@include file="/inc/camsns.jsp"%>
    <div id="subMenu">
        <a href="javascript:history.back()" id="newBoardBtn" class="glyphicon glyphicon-arrow-left"></a> 
    </div>
    <div id="container">
        <!-- 공지사항 -->
        <!-- 본문 글 쿼리 -->
        <table id="tbl1" class="table table-striped">
            <thead>
                <tr>
                    <th>제목</th>
                    <th>작성일</th>
                </tr>
            </thead>
            <tbody>
            </tbody>
        </table>
    </div><!-- 컨테이너 -->
</body>
</html>