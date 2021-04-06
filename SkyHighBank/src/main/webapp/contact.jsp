<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="model.Contact"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="css/obs_styles.css">
<title>My contact</title>
</head>
<body style="font-family: Verdana;">
	<%
	Contact contact = (Contact) request.getAttribute("CONTACT");
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
	
	<div style="overflow: auto">
		<div class="menu">
			<div class="menuitem">
				<a href="login?l=0">Portfolio</a>
			</div>
			<div class="menuitem">
				<p style="background-color:grey;">Contact</p>
			</div>
			<div class="menuitem">
				<a href="transfer?t=0">Transfer</a>
			</div>
			<div class="menuitem">
				<a href="transfer">Transactions</a>
			</div>
		</div>

		<div class="main">
			<% if (msg != null) {%>
				<p><%= msg %></p>
			<%} %>
			<h2>Contact Details</h2>
			<!-- <a href = "contact?c=1">Modify</a> -->
			
			<table style = "width:100%; border: 2x solid;">
				<tr>
					<th width="200">Address</th>
					<td><%=contact.getAddress()%></td>
				</tr>
				<tr>
					<th>Phone</th>
					<td><%=contact.getPhone()%></td>
				</tr>
				<tr>
					<th>Email</th>
					<td><%=contact.getEmail()%></td>
				</tr>
			</table>

		</div>

		<div class="right">
			<h3>News</h3>
			<p>Now you can transfer funds online.</p>
		</div>

	</div>

	<div style="background-color: #f1f1f1; text-align: center; padding: 10px; margin-top: 7px; font-size: 12px;">
		Copyright 2020 Skyhigh Banking Corporation</div>

</body>
</html>