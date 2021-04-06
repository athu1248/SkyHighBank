<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="model.Portfolio"%>
<!DOCTYPE html>
<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="css/obs_styles.css">
	<title>My Portfolio</title>
</head>
<body style="font-family: Verdana;">
	<%
	Portfolio portfolio = (model.Portfolio) request.getAttribute("PORTFOLIO");
	String msg = (String) request.getAttribute("MESSAGE");
	String userID = (String) session.getAttribute("USER_ID");
	%>
	
	<div style="background-color: #e6ffff; padding: 5px; text-align: center;">
		<h2><img src="images/skyhigh.png" width=50>&nbsp;Skyhigh BankingCorporation</h2>
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
				<p style="background-color:grey;">Portfolio</p>
			</div>
			<div class="menuitem">
				<a href="contact?c=0">Contact</a>
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
			
			<h2>Portfolio Details</h2>

			<table style="width:100%; border:2px solid;">
				<tr>
					<th width="200">Name</th>
					<td><%=portfolio.getFirstName() + " " + portfolio.getLastName()%></td>
				</tr>
				<tr>
					<th>Account #</th>
					<td><%=portfolio.getAccountNo()%></td>
				</tr>
				<tr>
					<th>Balance</th>
					<td><%=portfolio.getBalance()%></td>
				</tr>
			</table>

		</div>

		<div class="right">
			<h3>News</h3>
			<p>Now you can transfer funds online!</p>
		</div>

	</div>

	<div style="background-color: #f1f1f1; text-align: center; padding: 10px; margin-top: 7px; font-size: 12px;">
		Copyright 2020 Skyhigh Banking Corporation
	</div>

</body>
</html>