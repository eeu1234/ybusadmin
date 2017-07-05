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
body {
	position: relative;
	margin: 0 auto;
	width: 100%;
	height: 100%;
	max-width: 600px;
	 overflow: auto; 
	 -webkit-overflow-scrolling: touch;
}


</style>
<script>

	$(function() {

	
	
	
	});

</script>
</head>
<body>
	<%@include file="/inc/top.jsp"%>

<a id="kakao-login-btn"></a>
<script type='text/javascript'>
  //<![CDATA[
    // 사용할 앱의 JavaScript 키를 설정해 주세요.
    Kakao.init('497e3896cc14549676d2ada05a95e0fd');
    // 카카오 로그인 버튼을 생성합니다.
    Kakao.Auth.createLoginButton({
      container: '#kakao-login-btn',
      success: function(authObj) {
        // 로그인 성공시, API를 호출합니다.
        Kakao.API.request({
          url: '/v1/user/me',
          success: function(res) {
            var token = JSON.stringify(res);
            alert(token);
            
            $.ajax({
				type : "POST",
				url : "/jspTest/login.do",
				dataType: "json",
				data : "token=" + token,
				
				success: function(result){
					alert(result);
					
					
				},//sucess
			    error: function(xhr, textStatus, error) {
				        alert('Error' + error);
			    }
			
				
			});//ajax
            
            
          },
          fail: function(error) {
            alert(JSON.stringify(error));
          }
        });
      },
      fail: function(err) {
        alert(JSON.stringify(err));
      }
    });
  //]]>
</script>



</body>
</html>