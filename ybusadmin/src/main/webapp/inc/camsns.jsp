<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div id="topInc">
	<nav class="navbar navbar-inverse">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#myNavbar">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>


			</div>



			<div class="collapse navbar-collapse" id="myNavbar">
				<ul class="nav navbar-nav">
					<li class="active"><a href="/spring/index.action">CAMBUS</a></li>
                    <!-- <li class="active"><a href="/spring/camsns/snsboard/camsnsNotice">공지사항</a></li> -->
                    <li class="active"><a href="/spring/camsns/snsboard/camsnsNews">뉴스</a></li>
					<li class="active"><a href="/spring/camsns/snsMain.action">메인으로</a></li>
				</ul>
			
			</div>
		</div>
	</nav>

</div>



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
				url : "/spring/camsns/login.action",
				dataType: "text",
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