<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title> 상품수정 </title>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

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
	margin: 5px +670px 5px 0px;
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
.inputArea {
	margin: 10px 0;
}

select {
	width: 100px;
}

label {
	display: inline-block;
	width: 70px;
	padding: 5ps;
}

label[for='gdsDes'] {
	display: block;
}

input {
	width: 150px;
}

textarea#gdsDes {
	width: 400px;
	height: 180px;
}

button[type=submit] {
	width: 100px;
	height: 38px;
	background-color: #b7b7ff;
	border: 1px solid #FFFFFF;
	border-radius: 30px;
	box-shadow: 5px 5px 5px #8080ff;
}
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
				<h2>상품수정</h2>

				<form role="form" method="post" autocomplete="off">

					<input type="hidden" name="n" value="" />

					<div class="inputArea">

						<label> 1차 카테고리 </label> <select class="category1">
							<option value="">전체</option>
						</select> <label> 2차 카테고리 </label> <select class="category2"
							name="cateCode">
							<option value="">전체</option>
						</select>
					</div>

					<div class="inputArea">
						<label for="gdsName"> 상품명 </label> <input type="text" id="gdsName"
							name="gdsName" value="${goods.gdsName}" />
					</div>

					<div class="inputArea">
						<label for="gdsPrice"> 상품가격 </label> <input type="text"
							id="gdsPrice" name="gdsPrice" value="${goods.gdsPrice}" />
					</div>

					<div class="inputArea">
						<label for="gdsStock"> 상품수량 </label> <input type="text"
							id="gdsStock" name="gdsStock" value="${goods.gdsStock}" />
					</div>

					<div class="inputArea">
						<label for="gdsDes"> 상품소개 </label>
						<textarea rows="5" cols="50" id="gdsDes" name="gdsDes"> ${goods.gdsDes} </textarea>
					</div>

					<div class="inputArea">
						<button type="submit" id="update_Btn" class="btn btn-primary">
							완료</button>
						<button type="submit" id="back_Btn" class="btn btn-warning">
							취소</button>

						<script>
							$("#back_Btn").click(function() {
								// 	histroy.back();
								//	뒤로가기 코드	
								location.href = "/admin/goods/view?n=" + $
								{
									goods.gdsNum
								}
								;
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

	<script>
		// 컨트롤러에서 데이터 받기
		var jsonData = JSON.parse('${category}');
		console.log(jsonData);

		var cate1Arr = new Array();
		var cate1Obj = new Object();

		// 1차 분류 셀렉트 박스에 삽입할 데이터 준비
		for (var i = 0; i < jsonData.length; i++) {

			if (jsonData[i].level == "1") {
				cate1Obj = new Object(); //초기화
				cate1Obj.cateCode = jsonData[i].cateCode;
				cate1Obj.cateName = jsonData[i].cateName;
				cate1Arr.push(cate1Obj);
			}
		}

		// 1차 분류 셀렉트 박스에 데이터 삽입
		var cate1Select = $("select.category1")

		for (var i = 0; i < cate1Arr.length; i++) {
			cate1Select.append("<option value='" + cate1Arr[i].cateCode + "'>"
					+ cate1Arr[i].cateName + "</option>");
		}

		$(document).on("change", "select.category1", function() {
							
		var cate2Arr = new Array();					
		var cate2Obj = new Object();

							
		// 2차 분류 셀렉트 박스에 삽입할 데이터 준비
		for (var i = 0; i < jsonData.length; i++) {

		if (jsonData[i].level == "2") {
			cate2Obj = new Object(); //초기화
			cate2Obj.cateCode = jsonData[i].cateCode;
			cate2Obj.cateName = jsonData[i].cateName;
			cate2Obj.cateCodeRef = jsonData[i].cateCodeRef;
			cate2Arr.push(cate2Obj);
			}
		}

		var cate2Select = $("select.category2");
		cate2Select.children().remove();

		$("option:selected", this).each( function() {

												
		var selectVal = $(this).val();
												
		cate2Select
													
		.append("<option value='" + selectVal +"'>전체</option>");

		for (var i = 0; i < cate2Arr.length; i++) {												
			if (selectVal == cate2Arr[i].cateCodeRef) {										
				cate2Select.append("<option value='" + cate2Arr[i].cateCode + "'>"
					+ cate2Arr[i].cateName + "</option>");
				}
			}
		});
	});

		var select_cateCode = '${goods.cateCode}';
		var select_cateCodeRef = '${goods.cateCodeRef}';
		var select_cateName = '${goods.cateName}';

		if (select_cateCodeRef != null && select_cateCodeRef != '') {
			$(".category1").val(select_cateCodeRef);
			$(".category2").children().remove();
			$(".category2").append(
					"<option value='" + select_cateCodeRef + "'>전체</option>");

			var cate2Arr = new Array();
			var cate2Obj = new Object();

			// 2차 분류 셀렉트 박스에 삽입할 데이터 준비
			for (var i = 0; i < jsonData.length; i++) {

				if (jsonData[i].level == "2") {
					cate2Obj = new Object(); //초기화
					cate2Obj.cateCode = jsonData[i].cateCode;
					cate2Obj.cateName = jsonData[i].cateName;
					cate2Obj.cateCodeRef = jsonData[i].cateCodeRef;

					cate2Arr.push(cate2Obj);
				}
			}

			var cate2Select = $("select.category2");

			for (var i = 0; i < cate2Arr.length; i++) {
				if (select_cateCodeRef == cate2Arr[i].cateCodeRef) {
					if (select_cateCode == cate2Arr[i].cateCode) {
						cate2Select
								.append("<option value='" + select_cateCode + "' selected='selected'>"
										+ select_cateName + "</option>");
					} else {
						cate2Select
								.append("<option value='" + cate2Arr[i].cateCode + "'>"
										+ cate2Arr[i].cateName + "</option>");
					}
				}
			}

		} else {
			$(".category1").val(select_cateCode);
			$(".category2").append("<option value='" + select_cateCode + "' selected='selected'>전체</option>");
		}
	</script>

</body>
</html>