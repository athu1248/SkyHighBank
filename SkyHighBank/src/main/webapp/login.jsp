<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
<link rel="stylesheet" href="css/headingStyle.css">
<link rel="stylesheet" href="css/obs_styles.css">
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
				<form action="login" method = "post">
					<input type="hidden" name="hiddenField" value="logout">
					<input type="submit" value="Logout" id="submitBtn">
				</form>
				<a href="login?l=0">My Portfolio</a>
				<% } else { %>
				<a href="login">Login</a>
				<% } %>
			</div>
		</div>
	</nav>
	
	<% if (msg != null) {%>
		<p><%= msg %></p>
	<% } %>

	<div class="text-center">
		<main class="form-signin">
			<form>
			    <img class="mb-4" src="images/SkyHighLogo.svg" alt="" width="15%" height="15%">
			    <input type="hidden" name="hiddenField" value="login">
			    <h1 class="h3 mb-3 fw-normal">Please sign in</h1>

			    <div class="form-floating">
			    	<input type="email" class="form-control" id="floatingInput" placeholder="name@example.com" name="email">
			    	<label for="floatingInput">Email address</label>
			    </div>
			    <div class="form-floating">
			    	<input type="password" class="form-control" id="floatingPassword" placeholder="Password" name="passwd">
			    	<label for="floatingPassword">Password</label>
			    </div>
			    <button class="w-100 btn btn-lg btn-primary" type="submit">Sign in</button>
			    <p class="mt-5 mb-3 text-muted">© 2017–2021</p>
	  		</form>
		</main>
	</div>

	<nav class="navbar fixed-bottom navbar-light bg-light">
		<div class="container-fluid">
	    	<span class="d-inline-block align-text-center" style="text-align: center; margin: 10px auto; font-size: 10px">
	    		© Sky High Bank
	    	</span>
	  	</div>
	</nav>
</body>
</html>
