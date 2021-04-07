<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
<link rel="stylesheet" href="css/headingStyle.css">
<link rel="stylesheet" href="css/obs_styles.css">
<title>Sky High Bank - Sign In</title>
</head>
<body class="text-center" style="font-family: Verdana;">

	<%
	String msg = (String) request.getAttribute("MESSAGE");
	String userID = (String) session.getAttribute("USER_ID");
	%>
	

	<main class="form-signin">
		<% if (msg != null) {%>
			<p><%= msg %></p>
		<% } %>
		<form method="POST" action="login">
		    <img class="mb-4" src="images/SkyHighLogo.svg" alt="" width="15%" height="15%">
		    <input type="hidden" name="hiddenField" value="login">
		    <h1 class="h3 mb-3 fw-normal">Please sign in</h1>

		    <div class="form-floating">
		    	<input type="email" class="form-control" id="floatingInput" placeholder="name@example.com" name="email">
		    	<label for="floatingInput">Email address</label>
		    </div>
		    <br>
		    <div class="form-floating">
		    	<input type="password" class="form-control" id="floatingPassword" placeholder="Password" name="passwd">
		    	<label for="floatingPassword">Password</label>
		    </div>
		    <br>
		    <button class="w-100 btn btn-lg btn-primary" type="submit">Sign in</button>
  		</form>
		    <br>
		    <a href="<%=request.getContextPath()%>">
		    	<button class="w-100 btn btn-lg btn-secondary">Return Home</button>
		    </a>
		    <p class="mt-5 mb-3 text-muted">© Sky High Bank</p>
	</main>

</body>
</html>
