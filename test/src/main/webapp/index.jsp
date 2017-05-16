<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','https://www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-93928507-2', 'auto');
  ga('send', 'pageview');

</script>
<script type="text/javascript" src="http://wcs.naver.net/wcslog.js"></script>
<script type="text/javascript">
if(!wcs_add) var wcs_add = {};
wcs_add["wa"] = "171aefb65e5675";
wcs_do();
</script>
<script>
<%
StringBuffer getUrl = request.getRequestURL();
String url = getUrl.toString();
%>
	var url = "<%=url%>";
	window.onload = function() {
		
		

		if(url == 'http://ybus.uy.to/'){
			location.href = "/cambus/index.jsp";
		}else{
		document.getElementById("frm").submit();
			
		}
		
		



	}
</script>
</head>
<body>

	<form action="/spring/index.action" id="frm" method="get">
		<input type="hidden" name="fromUrl" value="<%=url%>">
	</form>
</body>
</html>