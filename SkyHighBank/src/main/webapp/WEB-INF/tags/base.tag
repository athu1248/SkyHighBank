<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ attribute name = "title" required = "true" %>
<%@ attribute name = "userID" required = "true" %>
<%@ attribute name = "style" fragment = "true" %>
<%@ attribute name = "content" fragment = "true" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>${title}</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
<link rel="stylesheet" href="css/style.css">
</head>
<body style="font-family: Verdana;">

	<nav class="navbar sticky-top navbar-light">
		<div class="container-fluid">
			<a class="navbar-brand" href="<%=request.getContextPath()%>" style="text-decoration: none;">
				<img src="images/SkyHighLogo.svg" alt= "" class="d-inline-block align-text-center navbarLogo"/>
				Sky High Bank
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
				<a href="login">
					<button class="btn btn-outline-success" value="Login">Login</button>
				</a>
				<% } %>
			</div>
		</div>
	</nav>
	
	<jsp:invoke fragment="content"></jsp:invoke>
	
	<nav class="navbar fixed-bottom navbar-light bg-light">
		<div class="container-fluid">
	    	<span class="d-inline-block align-text-center footer">
	    		© Sky High Bank
	    	</span>
	  	</div>
	</nav>
	
	<script src="js/script.js"></script>
	
</body>
</html>
