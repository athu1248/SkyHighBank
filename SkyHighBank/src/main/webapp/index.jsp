<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix = "t" tagdir = "/WEB-INF/tags" %>

<%
String msg = (String) request.getAttribute("MESSAGE");
String userID = (String) session.getAttribute("USER_ID");
%>
<c:set var="mainContent">
	<% if (msg != null) {%>
	<p><%= msg %></p>
	<% } %>
</c:set>
<t:base title = "Sky High Bank" userID = "<%=userID %>">
	<jsp:attribute name="content">
		${mainContent}
	</jsp:attribute>
</t:base>
