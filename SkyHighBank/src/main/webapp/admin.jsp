<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix = "t" tagdir = "/WEB-INF/tags" %>
<%@ page import="model.Portfolio"%>


<%
String msg = (String) request.getAttribute("MESSAGE");
String userID = (String) session.getAttribute("USER_ID");
%>

<c:set var="mainContent">
	<div id="main">
		<h1>ADMIN PAGE</h1>
		<% if (msg != null) { %>
			<p><%= msg %></p>
		<% } %>
		<form action="admin" method="post">
			<input type="hidden" name="hiddenField" value="createuser">
			<table style="height: 300; width: 350; caption-side: top;">
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
</c:set>


<t:base title = "Sky High Bank - Portfolio" userID = "<%=userID %>">
	<jsp:attribute name="content">
		${mainContent}
	</jsp:attribute>
</t:base>
