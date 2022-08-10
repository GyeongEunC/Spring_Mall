<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 상품리스트 </title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>

<style>
body {
	font-family: '맑은고딕', verdana;
	padding: 0px;
	margin: 0px;
}

ul {
	padding: 0px;
	margin: 0px;
	list-style: none;
}

div#root {
	width: 90%;
	margin: 0 auto;
}

header#header {
	font-size: 60px;
	padding: 20px 0;
}

header#header h1 a {
	color: #5FE9EC;
	font-weight: bold;
}

nav#nav {
	padding: 10px;
	text-align: right;
}

nav#nav ul li {
	display: inline-block;
	margin-left: 10px;
}

section#container {
	padding: 20px 0;
	border-top: 2px solid #3BD2F1;
	border-bottom: 2px solid #3BD2F1;
}

section#container::after {
	content: "";
	display: block;
	clear: both;
}

aside {
	float: left;
	width: 200px;
}

div#container_box {
	float: right;
/* 	width: cale(100% -200px-20px); */
	margin: 10px +105px 10px 0px;
}

aside ul li {
	text-align: center;
	margin-bottom: 10px;
}

aside ul li a {
	display: block;
	width: 100%;
	padding: 10px 0;
}

aside ul li a:hover {
	background: #47D3DC;
}

footer#footer {
	background: #9EEEF4;
	padding: 20px;
	text-align: right;
}

footer#footer ul li {
	display: inline-block;
	margin-right: 10px;
}
</style>

<style>
#container_box table td {
	width: 141px;
}
</style>

</head>
<body>

<div id = "root">
	<header id="header">
		<div id="header_box"> <%@ include file="../include/header.jsp" %> </div>
	</header>

	<nav id="nav">
		<div id="nav_box"> <%@ include file="../include/nav.jsp" %> </div>
	</nav>
	
	<section id="container">
		<aside>
			<%@ include file="../include/aside.jsp"%>
		</aside>
		<div id="container_box">
			
			<table>
				<thead>
					<tr>
						<th> 번호 </th>
						<th> 이름 </th>
						<th> 카테고리 </th>
						<th> 가격 </th>
						<th> 수량 </th>
						<th> 등록날짜 </th>
					</tr>
				</thead>
				
				<tbody>
					<c:forEach items="${list}" var="list">
						<tr>
							<td> ${list.gdsNum} </td>
							<td> 
								<a href="/admin/goods/view?n=${list.gdsNum}"> ${list.gdsName} </a>
							</td>
							<td> ${list.cateCode} </td>
							<td> <fmt:formatNumber value="${list.gdsPrice}" pattern="###,###,###" /> </td>
							<td> ${list.gdsStock} </td>
							<td> <fmt:formatDate value="${list.gdsDate}" pattern="yyyy-MM-dd"/> </td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</section>
	
	<footer id="footer">
		<div id="footer_box"> <%@ include file="../include/footer.jsp" %> </div>
	</footer>
</div>

</body>
</html>