<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix = "t" tagdir = "/WEB-INF/tags" %>

<%
String msg = (String) request.getAttribute("MESSAGE");
String userID = (String) session.getAttribute("USER_ID");
%>
<c:set var="mainContent">
	<div class="main">
		<% if (msg != null) {%>
			<p><%= msg %></p>
		<%} %>
		ERROR! Please retry!
	</div>
</c:set>


<t:main title = "Sky High Bank - Portfolio" userID = "<%=userID %>" page="none">
	<jsp:attribute name="content">
		${mainContent}
	</jsp:attribute>
</t:main>