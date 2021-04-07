<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix = "t" tagdir = "/WEB-INF/tags" %>
<%@ attribute name = "userID" required = "true" %>
<%@ attribute name = "title" required = "true" %>
<%@ attribute name = "content" fragment = "true" %>

<t:base title = "${title}" userID = "${userID}">

	<jsp:attribute name="content">
		<div style="overflow: auto">
		
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
	
			<jsp:invoke fragment="content"></jsp:invoke>
	
			<div class="right">
				<h3>News</h3>
				<p>Now you can transfer funds online!</p>
			</div>
	
		</div>
		
	</jsp:attribute>
</t:base>