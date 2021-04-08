<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix = "t" tagdir = "/WEB-INF/tags" %>
<%@page import="model.User"%>
<%@ page import="java.util.Date"%>
<%@ page import ="java.util.List" %>
<%@ page import="model.Transaction;" %>



<% 
List<Transaction> transactions = (List<Transaction>) request.getAttribute("TRANSACTIONS");
String msg = (String) request.getAttribute("MESSAGE");
String userID = (String) session.getAttribute("USER_ID");
%>

<c:set var="mainContent">
	<div class="main">
		<% if (msg != null) {%>
			<p><%= msg %></p>
		<%} %>
		<h2>Previous Transaction Details</h2>
		<table border=1 class="transactionTable">
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
</c:set>


<t:main title = "Sky High Bank - Transfer" userID = "<%=userID %>" page="transactionview">
	<jsp:attribute name="content">
		${mainContent}
	</jsp:attribute>
</t:main>
