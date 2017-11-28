<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="apple-touch-icon" href="/spring/images/ico/favicon.ico">
<link rel="shortcut icon" href="/spring/images/ico/favicon.ico">
<title></title>

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