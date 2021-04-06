<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="model.Contact"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="css/obs_styles.css">
<title>Modify Contact</title>
</head>
<body style="font-family: Verdana;">
	<%
		Contact contact = (Contact) request.getAttribute("CONTACT");
	%>
	<div
		style="background-color: #e6ffff; padding: 5px; text-align: center;">
		<h2>
			<img src="images/skyhigh.png" width=50 />&nbsp;Skyhigh
			BankingCorporation
		</h2>
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
				<a href="transfer">Transactions</a>
			</div>
		</div>

		<div class="main">
			<h2>Modify Contact Details</h2>
			
			<form action = "contact?c=2" method="post">
				<label>Address:</label>
				<textarea name="address"><%=contact.getAddress()%></textarea>
				<br>
				<label>Phone:</label>
				<textarea name="phone"><%=contact.getPhone()%></textarea>
				<br>
				<label>Email:</label>
				<textarea name="email"><%=contact.getEmail()%></textarea>
				<br><br>
				<label>Please enter password:</label>
				<input type="password" name="password">
				<br>
				<input type="submit" value="Modify">
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