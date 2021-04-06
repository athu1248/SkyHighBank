<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="css/obs_styles.css">
<title>SkyHigh Bank</title>
</head>
<body style="font-family: Verdana;">
	<%
	String msg = (String) request.getAttribute("MESSAGE");
	String userID = (String) session.getAttribute("USER_ID");
	%>
	<div style="background-color: #e6ffff; padding: 5px; text-align: center;">
		<h2><img src="images/skyhigh.png" width=50 />&nbsp;Skyhigh Banking Corporation</h2>
		<% if (userID != null) { %>
		<form action="login" method = "post">
			<input type="hidden" name="hiddenField" value="logout">
			<input type="submit" value="Logout" id="submitBtn">
		</form>
		<a href="login?l=0">My Portfolio</a>
		<% } else { %>
		<a href="login">Login</a>
		<% } %>
	</div>
	
	<% if (msg != null) {%>
		<p><%= msg %></p>
	<%} %>

	<div style="background-color: #f1f1f1; text-align: center; padding: 10px; margin-top: 7px; font-size: 12px;">
		Copyright 2020 Skyhigh Banking Corporation</div>
</body>
</html>