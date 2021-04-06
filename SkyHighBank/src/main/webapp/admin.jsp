<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="css/obs_styles.css">
<title>Create User</title>
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
		<% } %>
	</div>
	
	<% if (msg != null) {%>
		<p><%= msg %></p>
	<%} %>

	<div id="main">
		<h1>ADMIN PAGE</h1>
		<form action="admin" method="post">
			<input type="hidden" name="hiddenField" value="createuser">
			<table style="height: 300; width: 350;">
				<caption>Enter User Details</caption>
				<tr>
					<td><label>email:</label></td>
					<td><input type="text" name="email"></td>
				</tr>
				<tr>
					<td><label>Password:</label></td>
					<td><input type="password" name="password1"></td>
				</tr>
				<tr>
					<td><label>Re-type password:</label></td>
					<td><input type="password" name="password2"></td>
				</tr>
				<tr>
					<td><label>First Name:</label></td>
					<td><input type="text" name="firstName"></td>
				</tr>
				<tr>
					<td><label>Last Name:</label></td>
					<td><input type="text" name="lastName"></td>
				</tr>
				<tr>
					<td><label>Phone:</label></td>
					<td><input type="text" name="phone"></td>
				</tr>
				<tr>
					<td><label>Address:</label></td>
					<td><input type="text" name="address"></td>
				</tr>
				<tr>
					<td><label>Balance:</label></td>
					<td><input type="text" name="balance"></td>
				</tr>
			</table>
			<input type="submit" value="CreateUser" id="submitBtn">
		</form>
	</div>

	<div
		style="background-color: #f1f1f1; text-align: center; padding: 10px; margin-top: 7px; font-size: 12px;">
		Copyright 2020 Skyhigh Banking Corporation</div>
</body>
</html>