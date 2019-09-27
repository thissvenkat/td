<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.ntj.util.DBConnection"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>.: JEWELLERY || LOGOUT :.</title>
	<script>
		addEventListener("load", function () {
			setTimeout(hideURLbar, 0);
		}, false);

		function hideURLbar() {
			window.scrollTo(0, 1);
		}
	</script>
	<link href="assets/css/1Login-font-awesome.css" rel="stylesheet">
	<link href="assets/css/Loginstyle.css" rel='stylesheet' type='text/css' />
	
</head>
<body>


<h1>Thank you !!! <%=session.getAttribute("userName")%></h1>
	<div class="clear-loading spinner">
		<span></span>
	</div>
	<div class="w3ls-login box box--big">
	
		
	</div>
	 
 <%session.setAttribute("userName", null);%>

<a href="JewelleryLoginPage.html"> <h1>Login Again</h1></a>	
<%DBConnection.disconnect();
%>
</body>


</html>
