<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix = "t" tagdir = "/WEB-INF/tags" %>
<%@ page import ="java.util.List" %>
<%@ page import="model.Transaction" %>

<% 
String msg = (String) request.getAttribute("MESSAGE");
String userID = (String) session.getAttribute("USER_ID");
%>
<c:set var="mainContent">
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
</c:set>


<t:main title = "Sky High Bank - Transfer" userID = "<%=userID %>" page="transfer">
	<jsp:attribute name="content">
		${mainContent}
	</jsp:attribute>
</t:main>
