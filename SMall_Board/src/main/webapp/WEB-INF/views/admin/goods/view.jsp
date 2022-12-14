<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html>
<head>
<title> GoodsView </title>

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
/*  width: cale(100% -200px-20px); */
	margin: 5px +550px 5px 0px;
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
.inputArea { margin: 10px 0; }
select {
	width: 100px;
}
label {
	display: inline-block; width: 70px; padding: 5ps;
}
label[for='gdsDes'] {
	display: block;
}
input {
	width: 150px;
}
textarea#gdsDes {
	width: 400px; height: 180px;
}
button[type=button] {
	width: 100px;
	height: 38px;
	background-color: #b7b7ff;
	border: 1px solid #FFFFFF;
	border-radius: 30px;
	box-shadow: 5px 5px 5px #8080ff;
}
.oriImg {
	width: 500px; height: auto;
}
.thumbImg {}
</style>

</head>
<body>

	<div id="root">
		<header id="header">
			<div id="header_box">
				<%@ include file="../include/header.jsp"%>
			</div>
		</header>

		<nav id="nav">
			<div id="nav_box">
				<%@ include file="../include/nav.jsp"%>
			</div>
		</nav>

		<section id="container">
			<aside>
				<%@ include file="../include/aside.jsp"%>
			</aside>

			<div id="container_box">
				<h2> 상품 상세페이지 </h2>

				<form role="form" method="post" autocomplete="off">
				
				<input type="hidden" name="n" value="${goods.gdsNum}" />
				
				<div class="inputArea">
					<label> 1차 카테고리 </label> 
						<span class="category1"></span>
						
					<label> 2차 카테고리 </label> 
						<span class="category2"> ${goods.cateCode} </span>
				</div>
					
				<div class="inputArea">
					<label for="gdsName"> 상품명 </label>
					<span> ${goods.gdsName}</span>
				</div>	
				
				<div class="inputArea">
					<label for="gdsPrice"> 상품가격 </label>
					<span> <fmt:formatNumber value="${goods.gdsPrice}" pattern="###,###,###" /> </span>
				</div>	
				
				<div class="inputArea">
					<label for="gdsStock"> 상품수량 </label>
					<span> ${goods.gdsStock} </span>
				</div>	
				
				<div class="inputArea">
					<label for="gdsDes"> 상품소개 </label>
					<span> ${goods.gdsDes} </span>
				</div>
				
				<div class="inputArea">
					<label for="gdsImg"> 이미지 </label>
 						<p> 원본 이미지 : ${goods.gdsImg} </p>
 						<img src="${goods.gdsImg}" class="oriImg" />
 
 						<p> 썸네일 :${goods.gdsThumbImg} </p>
 						<img src="${goods.gdsThumbImg}" class="thumbImg" />
				</div>
				
				<div class="inputArea">
					<button type="button" id="modify_Btn" class="btn btn-warning"> 수정 </button>
					<button type="button" id="delete_Btn" class="btn btn-danger"> 삭제 </button>
					
					<script>
						var formObj = $("form[role='form']");					
					
						$("#modify_Btn").click(function(){
							formObj.attr("action", "/admin/goods/modify");
					  		formObj.attr("method", "get")
							formObj.submit();
						});
							  
						$("#delete_Btn").click(function(){  
							
							var con = confirm("정말로 삭제하시겠습니까?");
							
							if(con) {
								formObj.attr("action", "/admin/goods/delete");
								formObj.submit();
							}	
						});
					</script>
				</div>
					
				</form>
			</div>
		</section>

		<footer id="footer">
			<div id="footer_box">
				<%@ include file="../include/footer.jsp"%>
			</div>
		</footer>
	</div>

</body>
</html>