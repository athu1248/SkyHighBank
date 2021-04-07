<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix = "t" tagdir = "/WEB-INF/tags" %>
<%@ page import="model.Contact"%>

<%
Contact contact = (Contact) request.getAttribute("CONTACT");
String msg = (String) request.getAttribute("MESSAGE");
String userID = (String) session.getAttribute("USER_ID");
%>
<c:set var="mainContent">
	<div class="main">
		<% if (msg != null) {%>
			<p><%= msg %></p>
		<%} %>
		<h2>Contact Details</h2>
		<!-- <a href = "contact?c=1">Modify</a> -->
		
		<table style = "width:100%; border: 2x solid;">
			<tr>
				<th width="200">Address</th>
				<td><%=contact.getAddress()%></td>
			</tr>
			<tr>
				<th>Phone</th>
				<td><%=contact.getPhone()%></td>
			</tr>
			<tr>
				<th>Email</th>
				<td><%=contact.getEmail()%></td>
			</tr>
		</table>

	</div>
</c:set>


<t:main title = "Sky High Bank - Conatct" userID = "<%=userID %>">
	<jsp:attribute name="content">
		${mainContent}
	</jsp:attribute>
</t:main>
