<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.util.List" %>
<%@ page import="model.Transaction;" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="css/obs_styles.css">
<title>Transfer</title>
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
				<p style="background-color:grey;">Transfer</p>
			</div>
			<div class="menuitem">
				<a href="transfer">Transactions</a>
			</div>
		</div>

		<div class="main">
			
			<% if (msg != null) {%>
				<p><%= msg %></p>
			<%} %>
			<h2>Transfer Form</h2>
			<form action="transfer" method="post">
				<input type="hidden" name="t" value="transferSbmt">
				<table style="height: 300; width: 350;">
					<tr>
						<td><label>Payee Account Number:</label></td>
						<td><input type="text" name="payeeAccNo"></td>
					</tr>
					<tr>
						<td><label>Amount:</label></td>
						<td><input type="text" name="amount"></td>
					</tr>
					<tr>
						<td><label>Type:</label></td>
						<td><input type="text" name="type"></td>
					</tr>
					<tr>
						<td><label>Comments:</label></td>
						<td><input type="text" name="comments"></td>
					</tr>
				</table>
				<input type="submit" value="Transfer!" id="submitBtn">
			</form>

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