<%@page import="model.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.util.Date"%>
<%@ page import ="java.util.List" %>
<%@ page import="model.Transaction;" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="css/obs_styles.css">
<title>My transaction</title>
</head>
<body style="font-family: Verdana;">
	<% 
	List<Transaction> transactions = (List<Transaction>) request.getAttribute("TRANSACTIONS");
	String msg = (String) request.getAttribute("MESSAGE");
	String userID = (String) session.getAttribute("USER_ID");
	%>

	<div
		style="background-color: #e6ffff; padding: 5px; text-align: center;">
		<h2><img src="images/skyhigh.png" width=50/>&nbsp;Skyhigh Banking Corporation</h2>
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
				<a href="contact?c=0">Contact</a>
			</div>
			<div class="menuitem">
				<a href="transfer?t=0">Transfer</a>
			</div>
			<div class="menuitem">
				<p style="background-color:grey;">Transactions</p>
			</div>
		</div>

		<div class="main">
			<% if (msg != null) {%>
				<p><%= msg %></p>
			<%} %>
			<h2>Previous Transaction Details</h2>
			<table border=1 class="tarnsactionTable">
				<tr>
					<th>Date</th>
					<th>Payer/Payee Account Number</th>
					<th>Amount</th>
					<th>Balance</th>
					<th>Type</th>
					<th>Comments</th>
				</tr>
				<%for (Transaction t1:transactions) { %>
				<tr>
					<td><%=t1.getDatetime() %></td>
					<% if (t1.isPayer()) { %>
					<td><%= t1.getPayeeAccNo() %></td>
					<td>-<%= t1.getAmount() %></td>
					<td><%= t1.getPayerBalance() %></td>
					<% } else {%>
					<td><%= t1.getPayerAccNo() %></td>
					<td>+<%= t1.getAmount() %></td>
					<td><%= t1.getPayeeBalance() %></td>
					<% } %>
					<td><%=t1.getType()%></td>
					<td><%=t1.getComments()%></td>
				</tr>
				<% }%>
				
			</table>

		</div>

		<div class="right">
			<h3>News</h3>
			<p>Now you can transfer funds online.</p>
		</div>
	</div>


	<div
		style="background-color: #f1f1f1; text-align: center; padding: 10px; margin-top: 7px; font-size: 12px;">
		Copyright 2020 Skyhigh Banking Corporation</div>

</body>
</html>
