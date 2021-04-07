<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix = "t" tagdir = "/WEB-INF/tags" %>
<%@ page import="model.Portfolio"%>

<%
Portfolio portfolio = (model.Portfolio) request.getAttribute("PORTFOLIO");
String msg = (String) request.getAttribute("MESSAGE");
String userID = (String) session.getAttribute("USER_ID");
%>
<c:set var="mainContent">
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
</c:set>


<t:main title = "Sky High Bank - Portfolio" userID = "<%=userID %>">
	<jsp:attribute name="content">
		${mainContent}
	</jsp:attribute>
</t:main>
