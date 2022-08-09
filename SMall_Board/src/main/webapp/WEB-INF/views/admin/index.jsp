<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<title> AdminPage </title>
	
	<style>
		body { font-family: '맑은고딕', verdana; padding: 0px; margin: 0px; }
		ul { padding: 0px; margin: 0px; list-style: none; }
		
		div#root { width: 90%; margin: 0 auto; }
		
		header#header { font-size: 60px; padding: 20px 0; }
		header#header h1 a { color: #5FE9EC; font-weight: bold; }
		
		nav#nav { padding: 10px; text-align: right; }
		nav#nav ul li { display: inline-block; margin-left: 10px; }
		
		section#container { padding: 20px 0; border-top: 2px solid #3BD2F1; border-bottom: 2px solid #3BD2F1; }
		section#container::after { content: ""; display: block; clear: both; }
		aside { float: left; width: 200px; }
		div#container_box { float: right; width: cale(100%-200px-20px); }
		
		aside ul li { text-align: center; margin-bottom: 10px; }
		aside ul li a { display: block; width: 100%; padding: 10px 0; }
		aside ul li a:hover { background: #47D3DC; }
		
		footer#footer { background: #9EEEF4; padding: 20px; text-align: right;}
		footer#footer ul li { display: inline-block; margin-right: 10px; }
	</style>
	
</head>
<body>

<div id = "root">
	<header id="header">
		<div id="header_box"> <%@ include file="include/header.jsp" %> </div>
	</header>

	<nav id="nav">
		<div id="nav_box"> <%@ include file="include/nav.jsp" %> </div>
	</nav>
	
	<section id="container">
		<aside>
			<%@ include file="include/aside.jsp" %>
		</aside>
	
		<div id="container_box"> 본문영역 </div>
	</section>
	
	<footer id="footer">
		<div id="footer_box"> <%@ include file="include/footer.jsp" %> </div>
	</footer>
</div>

</body>
</html>
