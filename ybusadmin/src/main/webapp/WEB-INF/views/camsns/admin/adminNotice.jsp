<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset=UTF-8">
<title>Cambus:: 관리자 페이지</title>
<%@include file="/inc/asset.jsp"%>

<style>
	body{
		position:relative;
		width:100%;
		max-widht:1440px;
		height:100%;
		overflow:auto;
	}
	.noticeContent{
		width:500px;
		height: 500px;
	}
	.noticeTitle{
		width: 500px;
	}
</style>
<script>
var tr;
    var adminNotice = {
        init : function () {
            adminNotice.event();
        },
        event : function() {
            $('#createNoticeBtn').on('click', function() {
                $('#createNoticeModal').modal('show')
            });
            $('#tbl1 tbody tr').on('click', function(e) {
                tr = e.currentTarget;
                var content = $(tr.children.item(1)).data('content');
                if($('#content') != null || $('#content') != 'undefined') {
                    $('#content').remove();
                }
                var tmpl = '<tr id="content">';
                tmpl +=         '<td colspan="5">' + content + '</td>';
                tmpl +=    '</tr>';
                $(tr).after(tmpl);
            })
        },
        createNotice : function() {
            var title = $('#noticeTitle').val();
            var content = $('#noticeContent').val();
            if(title == null || title == "" || title == 'undefined') {
                alert('제목을 입력해주세요.');
                return false;
            }
            if(content == null || content == "" || content == 'undefined') {
                alert('내용을 입력해주세요.');
                return false;
            }
            $.ajax({
                url: "/spring/camsns/admin/createNotice?" + "content=" + content + "&title=" + title,
                success : function() {
                    alert('작성이 완료되었습니다.')
                    $('#createNoticeModal').modal('hide');
                },
                error : function(request,status,error) {
                    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
                }
            });
        },
        delNotice : function(obj) {
            event.stopPropagation();
            var tr = obj.closest('tr');
            var seq = $(tr.children.item(0)).data('seq');
            $.ajax({
                url: "/spring/camsns/admin/delNotice?" + "noticeSeq=" + seq,
                success : function() {
                    alert('삭제가 완료되었습니다.');
                    location.reload();
                },
                error : function(request,status,error) {
                    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
                }
            });
        },
        closeModal : function(){
        	$('#createNoticeModal').modal('hide');
        }
    }
	$(function(){
	    adminNotice.init();
	});
</script>

</head>
<body>
	<%@include file="/inc/top.jsp"%>
	<h1>관리자 관리</h1>
    <button id="createNoticeBtn">공지사항 작성</button>
	<table id="tbl1" class="table table-striped">
        <thead>
    		<tr>
    			<th>순번</th>
    			<th>제목</th>
                <th>학교</th>
    			<th>등록날짜</th>
                <th>삭제</th>
    		</tr>
        </thead>
        <tbody>
    		<c:if test="${empty noticeList || noticeList.size() == 0}">
    			<tr>
    				<td colspan="5">게시물이 존재하지 않습니다.</td>
    			</tr>
    		</c:if>
    		<c:forEach items="${noticeList}" var="noticeList" varStatus="status">
        		<tr>
        			<td data-seq = "${noticeList.notice_seq}">${status.count}</td>
        			<td data-content="${noticeList.content}">${noticeList.title}</td>
                    <td>${noticeList.universitySeq}</td>
                    <td>${noticeList.writeDt}</td>
                    <td><button id="noticeDelBtn" onclick="adminNotice.delNotice(this)">삭제</button></td>
                </tr>
    		</c:forEach>
		</tbody>
	</table>
	<div id="pagebar" style="text-align: center;">
		${pagebar}
	</div>
</body>
<!-- Modal -->
<div class="modal fade" id="createNoticeModal" tabindex="-1" role="dialog" aria-hidden="true" data-keyboard="false" data-backdrop="static">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-body">
                <div>제목</div>
                <input type="text" id="noticeTitle" class="noticeTitle">
                <div>내용</div>
                <textarea id="noticeContent" class="noticeContent" style="resize: none;"></textarea>
            </div>
            <div class="modal-footer work-footer">
            	<button type="button" class="btn btn-primary" onclick="adminNotice.closeModal();">취소</button>
                <button type="button" class="btn btn-primary btn-blue" onclick="adminNotice.createNotice();">확인</button>
            </div>
        </div>
    </div>
</div>
</html>