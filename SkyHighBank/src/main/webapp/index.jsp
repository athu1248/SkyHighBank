<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
<link rel="stylesheet" href="css/headingStyle.css">
<title>Sky High Bank</title>
</head>
<body style="font-family: Verdana;">
	<%
	String msg = (String) request.getAttribute("MESSAGE");
	String userID = (String) session.getAttribute("USER_ID");
	%>

	<nav class="navbar sticky-top navbar-light">
		<div class="container-fluid">
			<a class="navbar-brand" href="<%=request.getContextPath()%>" style="text-decoration: none;">
				<img src="images/SkyHighLogo.svg" alt= "" width="15%" height="15%" class="d-inline-block align-text-center"/>
				<p class="d-inline-block align-text-center">Sky High Bank</p>
			</a>
			<div class="d-flex">
				<% if (userID != null) { %>
				<a href="login?l=0">
					<button type="button" class="btn btn-outline-primary">My Portfolio</button>
				</a>
				&nbsp;
				<form action="login" method = "post">
					<input type="hidden" name="hiddenField" value="logout">
					<button class="btn btn-outline-danger" type="submit" value="Logout" id="submitBtn" >Logout</button>
				</form>
				<% } else { %>
				<a href="login">Login</a>
				<% } %>
			</div>
		</div>
	</nav>
	
	<% if (msg != null) {%>
		<p><%= msg %></p>
	<% } %>

	<nav class="navbar fixed-bottom navbar-light bg-light">
		<div class="container-fluid">
	    	<span class="d-inline-block align-text-center" style="text-align: center; margin: 10px auto; font-size: 10px">
	    		© Sky High Bank
	    	</span>
	  	</div>
	</nav>
</body>
</html>
