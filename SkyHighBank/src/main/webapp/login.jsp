<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="css/obs_styles.css">
<title>Login</title>
</head>
<body style="font-family: Verdana;">
	<%
		String msg = (String) request.getAttribute("MESSAGE");
	%>
	<div style="background-color: #e6ffff; padding: 5px; text-align: center;">
		<h2><img src="images/skyhigh.png" width=50 />&nbsp;Skyhigh Banking Corporation</h2>
	</div>
	
	<% if (msg != null) {%>
		<p><%= msg %></p>
	<%} %>
	
	<div id="main">
		<form action="login" method="post">
			<input type="hidden" name="hiddenField" value="login">
			<table style="height: 300; width: 350;">
				<caption>Enter ID and Password</caption>
				<tr>
					<td><label>Login ID:</label></td>
					<td><input type="text" name="email"></td>
				</tr>
				<tr>
					<td><label>Password:</label></td>
					<td><input type="password" name="passwd"></td>
				</tr>
			</table>
			<input type="submit" value="Login" id="submitBtn">
		</form>
	</div>

	<div
		style="background-color: #f1f1f1; text-align: center; padding: 10px; margin-top: 7px; font-size: 12px;">
		Copyright 2020 Skyhigh Banking Corporation</div>
</body>
</html>