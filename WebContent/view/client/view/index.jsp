<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<c:url value="/view/client/static" var="url"></c:url>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EleKet - Chọn là mua</title>
<link rel='stylesheet' type='text/css'
	href='//fonts.googleapis.com/css?family=Open+Sans:400,300,600&amp;subset=cyrillic,latin'>

<!-- CSS Global Compulsory -->
<link rel="stylesheet"
	href="${url}/plugins/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="${url}/css/shop.style.css">

<!-- CSS Header and Footer -->
<link rel="stylesheet" href="${url}/css/headers/header-v5.css">
<link rel="stylesheet" href="${url}/css/footers/footer-v4.css">

<!-- CSS Implementing Plugins -->
<link rel="stylesheet" href="${url}/plugins/animate.css">
<link rel="stylesheet" href="${url}/plugins/line-icons/line-icons.css">
<link rel="stylesheet"
	href="${url}/plugins/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet"
	href="${url}/plugins/scrollbar/css/jquery.mCustomScrollbar.css">
<link rel="stylesheet"
	href="${url}/plugins/owl-carousel/owl-carousel/owl.carousel.css">
<link rel="stylesheet"
	href="${url}/plugins/revolution-slider/rs-plugin/css/settings.css">

<!-- CSS Theme -->
<link rel="stylesheet" href="${url}/css/theme-colors/default.css"
	id="style_color">

<!-- CSS Customization -->
<link rel="stylesheet" href="${url}/css/custom.css">
</head>
<body>
<body class="header-fixed">
	<div class="wrapper">
		<!--=== Header v5 ===-->
		<div class="header-v5 header-static">
			<!-- Topbar v3 -->
			<jsp:include page="/view/client/view/topbar.jsp"></jsp:include>
			<!-- End Topbar v3 -->

			<!-- Navbar -->
			<jsp:include page="/view/client/view/navbar.jsp"></jsp:include>
			<!-- End Navbar -->
		</div>

		<!--=== End Header v5 ===-->

		<div>
			<br>
			<div class="container"
				style="background: red; padding-bottom: 8px; padding-top: 8px; border-radius: 10px">
				<form action="${pageContext.request.contextPath }/product/search">
					<input type="text" class="form-control"
						placeholder="Tìm kiếm" name="name">
					<!-- 					<div class="search-close"> -->
					<!-- 						<i class="icon-close"></i> -->
					<!-- 					</div> -->
				</form>

			</div>
			<br>
		</div>

		<!--=== Slider ===-->
		<div class="container">
		<div class="tp-banner-container">

			<div class="tp-banner">
				<ul>
					<!-- SLIDE -->
					<li>
						<!-- MAIN IMAGE --> <img src="${url}/img/1.jpg" alt="darkblurbg"
						data-bgfit="cover" data-bgrepeat="no-repeat">
					</li>
					<!-- END SLIDE -->

				</ul>
			</div>
		</div>
		</div>
		<!--=== End Slider ===-->

		<!--=== Product Content ===-->
		<div class="container content-md">
			<div class="heading heading-v3 margin-bottom-10">
				<h2 style="font-size: 35px">Sản phẩm Nổi Bật</h2>
			</div>

		</div>
		<!--=== End Product Content ===-->

		<div class="container">
			<!-- Dien thoai -->
			<%
				request.setAttribute("productList", request.getAttribute("phoneList"));
			%>
			<div>
				<div class="row">
					<h2 style="font-size: 40px; font-weight: bold; margin-left: 5%">Điện
						thoại</h2>
				</div>
				<div class="row">
					<div class="col-md-12"
						style="background-color: red; padding-bottom: 4px; margin-bottom: 40px">
					</div>
				</div>
			</div>
			<jsp:include page="/view/client/view/product-grid.jsp"></jsp:include>

			<!-- Laptop -->
			<%
				request.setAttribute("productList", request.getAttribute("laptopList"));
			%>
			<div>
				<div class="row">
					<h2 style="font-size: 40px; font-weight: bold; margin-left: 5%">Laptop</h2>
				</div>
				<div class="row">
					<div class="col-md-12"
						style="background-color: red; padding-bottom: 4px; margin-bottom: 20px">
					</div>
				</div>
			</div>
			<jsp:include page="/view/client/view/product-grid.jsp"></jsp:include>

			<!-- TV -->
			<%
				request.setAttribute("productList", request.getAttribute("tvList"));
			%>
			<div>
				<div class="row">
					<h2 style="font-size: 40px; font-weight: bold; margin-left: 5%">TV</h2>
				</div>
				<div class="row">
					<div class="col-md-12"
						style="background-color: red; padding-bottom: 4px; margin-bottom: 20px">
					</div>
				</div>
			</div>
			<jsp:include page="/view/client/view/product-grid.jsp"></jsp:include>


		</div>
		<!--/end cotnainer-->



		<!--=== Sponsor ===-->
		<div class="container content">
			<div class="heading heading-v1 margin-bottom-40">
				<h2>Công ty cung cấp sản phẩm</h2>
			</div>

			<ul class="list-inline" style="padding-left: 20px">
				<li class="item first-child" height="80px" width="180px"><img
					src="${url}/img/clients/1.png" alt=""></li>
				<li class="item"><img src="${url}/img/clients/2.png"
					height="80px" width="180px"></li>
				<li class="item"><img src="${url}/img/clients/3.png" alt=""
					height="80px" width="180px"></li>
				<li class="item"><img src="${url}/img/clients/4.png" alt=""
					height="80px" width="180px"></li>
				<li class="item"><img src="${url}/img/clients/5.png" alt=""
					height="80px" width="180px"></li>
			</ul>
			<!--/end owl-carousel-->
		</div>
		<!--=== End Sponsors ===-->


		<!--=== Footer v4 ===-->
		<jsp:include page="/view/client/view/footer.jsp"></jsp:include>
		<!--=== End Footer v4 ===-->
	</div>
	<!--/wrapper-->

	<!-- JS Global Compulsory -->
	<script src="${url}/plugins/jquery/jquery.min.js"></script>
	<script src="${url}/plugins/jquery/jquery-migrate.min.js"></script>
	<script src="${url}/plugins/bootstrap/js/bootstrap.min.js"></script>
	<!-- JS Implementing Plugins -->
	<script src="${url}/plugins/back-to-top.js"></script>
	<script src="${url}/plugins/smoothScroll.js"></script>
	<script src="${url}/plugins/jquery.parallax.js"></script>
	<script src="${url}/plugins/owl-carousel/owl-carousel/owl.carousel.js"></script>
	<script
		src="${url}/plugins/scrollbar/js/jquery.mCustomScrollbar.concat.min.js"></script>
	<script
		src="${url}/plugins/revolution-slider/rs-plugin/js/jquery.themepunch.tools.min.js"></script>
	<script
		src="${url}/plugins/revolution-slider/rs-plugin/js/jquery.themepunch.revolution.min.js"></script>
	<!-- JS Customization -->
	<script src="${url}/js/custom.js"></script>
	<!-- JS Page Level -->
	<script src="${url}/js/shop.app.js"></script>
	<script src="${url}/js/plugins/owl-carousel.js"></script>
	<script src="${url}/js/plugins/revolution-slider.js"></script>
	<script>
		jQuery(document).ready(function() {
			App.init();
			App.initScrollBar();
			App.initParallaxBg();
			OwlCarousel.initOwlCarousel();
			RevolutionSlider.initRSfullWidth();
		});
	</script>
</body>
</body>
</html>