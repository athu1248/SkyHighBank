<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix = "t" tagdir = "/WEB-INF/tags" %>
<%@ attribute name = "userID" required = "true" %>
<%@ attribute name = "title" required = "true" %>
<%@ attribute name = "page" required = "true" %>
<%@ attribute name = "content" fragment = "true" %>

<c:set var = "page" scope = "session" value = "${page}"/>
<c:choose>

	<c:when test="${page == 'portfolio'}">
		<c:set var = "menu">
			<nav class="menu">
				<a class="nav-link disabled menuitem" href="login?l=0">Portfolio</a>
				<a class="nav-link menuitem" href="contact?c=0">Contact</a>
				<a class="nav-link menuitem" href="transfer?t=0">Transfer</a>
				<a class="nav-link menuitem" href="transfer">Transactions</a>
			</nav>
		</c:set>
	</c:when>
	
	<c:when test="${page == 'contact'}">
		<c:set var = "menu">
			<nav class="menu">
				<a class="nav-link menuitem" href="login?l=0">Portfolio</a>
				<a class="nav-link disabled menuitem" href="contact?c=0">Contact</a>
				<a class="nav-link menuitem" href="transfer?t=0">Transfer</a>
				<a class="nav-link menuitem" href="transfer">Transactions</a>
			</nav>
		</c:set>
	</c:when>
	
	<c:when test="${page == 'transfer'}">
		<c:set var = "menu">
			<nav class="menu">
				<a class="nav-link menuitem" href="login?l=0">Portfolio</a>
				<a class="nav-link menuitem" href="contact?c=0">Contact</a>
				<a class="nav-link disabled menuitem" href="transfer?t=0">Transfer</a>
				<a class="nav-link menuitem" href="transfer">Transactions</a>
			</nav>
		</c:set>
	</c:when>
	
	<c:when test="${page == 'transactionview'}">
		<c:set var = "menu">
			<nav class="menu">
				<a class="nav-link menuitem" href="login?l=0">Portfolio</a>
				<a class="nav-link menuitem" href="contact?c=0">Contact</a>
				<a class="nav-link menuitem" href="transfer?t=0">Transfer</a>
				<a class="nav-link disabled menuitem" href="transfer">Transactions</a>
			</nav>
		</c:set>
	</c:when>
	
	<c:otherwise>
		<div class="menu">
			<div class="menuitem">
				<a href="login?l=0">Portfolio</a>
			</div>
			<div class="menuitem">
				<a href="contact?c=0">Contact</a>
			</div>
			<div class="menuitem">
				<a href="transfer?t=0">Transfer</a>
			</div>
			<div class="menuitem">
				<a href="transfer">Transactions</a>
			</div>
		</div>
	</c:otherwise>

</c:choose>


<t:base title = "${title}" userID = "${userID}">

	<jsp:attribute name="content">
		<div style="overflow: auto">
		
			${menu}
	
			<jsp:invoke fragment="content"></jsp:invoke>
	
			<div class="right">
				<h3>News</h3>
				<p>Now you can transfer funds online!</p>
			</div>
	
		</div>
		
	</jsp:attribute>
</t:base>
