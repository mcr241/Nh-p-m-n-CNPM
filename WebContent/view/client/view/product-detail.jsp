<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<c:url value="/view/client/static" var="url"></c:url>

<title>EleKet - Chọn là mua</title>
<!-- Favicon -->
<link rel="shortcut icon" href="favicon.ico">

<!-- Web Fonts -->
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
	href="${url}/plugins/sky-forms-pro/skyforms/css/sky-forms.css">
<link rel="stylesheet"
	href="${url}/plugins/sky-forms-pro/skyforms/custom/custom-sky-forms.css">
<link rel="stylesheet"
	href="${url}/plugins/master-slider/quick-start/masterslider/style/masterslider.css">
<link rel='stylesheet'
	href="${url}/plugins/master-slider/quick-start/masterslider/skins/default/style.css">

<!-- Style Switcher -->
<link rel="stylesheet" href="${url}/css/plugins/style-switcher.css">

<!-- CSS Theme -->
<link rel="stylesheet" href="${url}/css/theme-colors/default.css"
	id="style_color">

<!-- CSS Customization -->
<link rel="stylesheet" href="${url}/css/custom.css">


<style>
#alertQty {
	color: red;
	padding-left: 30px;
	font-size: 15px;
	font-weight: bold;
}
</style>

</head>
<body>
<body class="header-fixed">
	<div class="wrapper">
		<!--=== Header v5 ===-->
		<div class="header-v5 header-static">
			<!-- Topbar v3 -->
			<jsp:include page="topbar.jsp"></jsp:include>
			<!-- End Topbar v3 -->

			<!-- Navbar -->
			<jsp:include page="navbar.jsp"></jsp:include>
			<!-- End Navbar -->
		</div>
		<!--=== End Header v5 ===-->
		
		<!--=== Shop Product ===-->
		<div class="shop-product" style="background-color: white;">
			<div class="content container">
				<div class="row">
					<div class="col-md-12"">
						<span style="font-size: 50px; font-weight: bold;">Chi tiết</span>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12"
						style="background-color: red; padding-bottom: 5px; margin-bottom: 30px"></div>
				</div>
			</div>
			<div class="container">
				<div class="row">
					<div class="col-md-6 md-margin-bottom-10">
					
						<div class="ms-showcase2-template">
							<!-- Master Slider -->
							<div class="master-slider ms-skin-default" id="masterslider">
								<div class="ms-slide">
									<c:url value="/image?fname=${product.image}" var="imgUrl"></c:url>

									<img class="ms-brd" src="${imgUrl}" data-src="${imgUrl}"
										alt="${product.name}">

								</div>
							</div>

							<!-- End Master Slider -->
						</div>
					</div>

					<div class="col-md-6">
						<div class="shop-product-heading" style="text-align: center;font-size: 30px; font-weight: bold; text-transform: uppercase;">
							<span>${product.name}</span>

<!-- 							<ul class="list-inline shop-product-social"> -->
<!-- 								<li><a href="#"><i class="fa fa-facebook"></i></a></li> -->
<!-- 								<li><a href="#"><i class="fa fa-google-plus"></i></a></li> -->
<!-- 							</ul> -->
						</div>
						<!--/end shop product social-->

						<!--/end shop product ratings-->
						<br>
						<ul class="list-inline shop-product-prices margin-bottom-30">
							<h3 style="text-align: center; color: green;"">${message }</h3>
							<p style="font-size: 20px">
								<strong
									style="padding-right: 5px; font-size: 30px; color: black">Mô
									tả: </strong>${product.des}</p>
							<span class="title-price" style="font-size: 40px; color: red;">${product.getPriceFormat()}
								<strong class="currency">đ</strong>
							</span>
							<br>
							<c:if test="${product.getSale() > 0}">
								<span class="line-through"
									style="color: red; font-size: 30px; padding-left: 30px;">${product.getPrePriceFormat()}<strong
									class="currency">đ</strong></span>
							</c:if>
							<c:if test="${product.getSale() == 0}">
								<br>
							</c:if>
							<p style="font-size: 30px">
								<strong
									style="padding-right: 10px; font-size: 30px; color: black">Hãng:</strong><strong style="color: brown;">${product.manufacturer.name}</strong></p>
						</ul>
						<!--/end shop product prices-->

						<!-- 						<h3 class="shop-product-title">Màu sắc</h3> -->
						<!-- 						<ul class="list-inline product-color margin-bottom-30"> -->
						<!-- 							<li><input type="radio" id="color-1" name="color"> <label -->
						<!-- 								class="color-one" for="color-1"></label></li> -->
						<!-- 							<li><input type="radio" id="color-2" name="color" checked> -->
						<!-- 								<label class="color-two" for="color-2"></label></li> -->
						<!-- 							<li><input type="radio" id="color-3" name="color"> <label -->
						<!-- 								class="color-three" for="color-3"></label></li> -->
						<!-- 						</ul> -->
						<!--/end product color-->

						<h3 class="shop-product-title"
							style="padding-right: 5px; font-size: 27px; padding-bottom: 20px; color: black">
							<%-- 							<c:set var="temp" value="${pr}"></c:set> --%>
							<c:if test="${product.getQuantity() == 0}">
								<div id="alertQty" style="font-size: 40px">HẾT HÀNG</div>

							</c:if>
							<c:if test="${product.getQuantity() != 0}">
								Số lượng: <span>${product.getQuantity() }</span>
							</c:if>
						</h3>

						<div id="alertQty"></div>
						<c:if test="${product.getQuantity() != 0}">
							
						<div class="margin-bottom-40">


							<form name="f1" class="product-quantity sm-margin-bottom-20"
								method="get" action="<c:url value="/member/cart/add" ></c:url>"
								onSubmit="return checkQty()">
								<input type="text" value="${product.id }" name="pId" hidden="">
								<button type='button' class="quantity-button" name='subtract'
									onclick='javascript: subtractQty();' value='-'>-</button>
								<input type='text' class="quantity-field" name='quantity'
									value="1" id='qty' />
								<button type='button' class="quantity-button" name='add'
									onclick='javascript: addQty(${product.quantity});' value='+'>+</button>

								<button type="submit" class="btn-u btn-u-sea-shop btn-u-lg">Thêm
									vào giỏ hàng</button>

							</form>

						</div>
						</c:if>
						<!--/end product quantity-->

						<ul class="list-inline add-to-wishlist add-to-wishlist-brd">
							<li class="wishlist-in" style="margin-top: 10px"><i
								class="fa fa-heart"></i> <a href="#">Thêm vào danh sách ưa
									thích</a></li>
						</ul>
						<p class="wishlist-category">
							<strong>Danh mục: <strong
								style="color: red; font-size: 20px">${product.category.name }</strong></strong>
						</p>
					</div>
				</div>
				<!--/end row-->
			</div>
		</div>
		<!--=== End Shop Product ===-->

		<!--=== Content Medium ===-->
		<div class="content-md container">

			<div class="tab-v5">
				<ul class="nav nav-tabs" role="tablist">
					<li class="active"><a href="#description" role="tab"
						data-toggle="tab" style="font-size: 30px; font-weight: bold">Mô
							tả chi tiết</a></li>
				</ul>

				<div class="tab-content">
					<div class="tab-pane fade in active" id="description">
						<div class="row">
							<div class="col-md-10">

								<br>

								<div class="row">
									<div class="col-sm-12">
										<p style="font-size: 22px">${product.getDes2() }</p>
									</div>
								</div>

								<!-- 								<h3 class="heading-md margin-bottom-20">Specifies</h3> -->
								<!-- 								<div class="row"> -->
								<!-- 									<div class="col-sm-6"> -->
								<!-- 										<ul class="list-unstyled specifies-list"> -->
								<!-- 											<li><i class="fa fa-caret-right"></i>Brand Name: <span>Lacoste</span></li> -->
								<!-- 											<li><i class="fa fa-caret-right"></i>Technics: <span>Computer</span> -->
								<!-- 												Knitted</li> -->
								<!-- 											<li><i class="fa fa-caret-right"></i>Sleeve Length: <span>Full</span></li> -->
								<!-- 											<li><i class="fa fa-caret-right"></i>Sleeve Style: <span>Regular</span></li> -->
								<!-- 											<li><i class="fa fa-caret-right"></i>Pattern Type: <span>PAID</span></li> -->
								<!-- 											<li><i class="fa fa-caret-right"></i>Style: <span>Casual</span></li> -->
								<!-- 										</ul> -->
								<!-- 									</div> -->
								<!-- 									<div class="col-sm-6"> -->
								<!-- 										<ul class="list-unstyled specifies-list"> -->
								<!-- 											<li><i class="fa fa-caret-right"></i>Material: <span>Cotton,Nylon</span></li> -->
								<!-- 											<li><i class="fa fa-caret-right"></i>Item Type: <span>Pullovers</span></li> -->
								<!-- 											<li><i class="fa fa-caret-right"></i>Thickness: <span>Thin</span></li> -->
								<!-- 											<li><i class="fa fa-caret-right"></i>Model Number: <span>TM-11013 -->
								<!-- 											</span></li> -->
								<!-- 											<li><i class="fa fa-caret-right"></i>Gender: <span>Men</span></li> -->
								<!-- 											<li><i class="fa fa-caret-right"></i>MATERIAL: <span>80%COTTON+10%NYLON</span></li> -->
								<!-- 										</ul> -->
								<!-- 									</div> -->
								<!-- 								</div> -->
							</div>
						</div>
					</div>

				</div>
			</div>
		</div>
		<!--/end container-->
		<!--=== End Content Medium ===-->

		<!--=== Illustration v2 ===-->
		<div class="container">
			<div class="heading heading-v1 margin-bottom-20"
				style="margin-right: 40px">
				<h2>Sản phẩm liên quan</h2>
			</div>

			<!-- Dien thoai -->
			<%
				request.setAttribute("productList", request.getAttribute("relateProduct"));
			%>
			<jsp:include page="/view/client/view/product-grid.jsp"></jsp:include>


		</div>
		<!--=== End Illustration v2 ===-->

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
		<jsp:include page="footer.jsp"></jsp:include>
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
	<script src="${url}/plugins/owl-carousel/owl-carousel/owl.carousel.js"></script>
	<script
		src="${url}/plugins/scrollbar/js/jquery.mCustomScrollbar.concat.min.js"></script>
	<!-- Master Slider -->
	<script
		src="${url}/plugins/master-slider/quick-start/masterslider/masterslider.min.js"></script>
	<script
		src="${url}/plugins/master-slider/quick-start/masterslider/jquery.easing.min.js"></script>
	<!-- JS Customization -->
	<script src="${url}/js/custom.js"></script>
	<!-- JS Page Level -->
	<script src="${url}/js/shop.app.js"></script>
	<script src="${url}/js/plugins/owl-carousel.js"></script>
	<script src="${url}/js/plugins/master-slider.js"></script>
	<script src="${url}/js/forms/product-quantity.js"></script>
	<script>
		jQuery(document).ready(function() {
			App.init();
			App.initScrollBar();
			OwlCarousel.initOwlCarousel();
			MasterSliderShowcase2.initMasterSliderShowcase2();
		});
	</script>

	<!--[if lt IE 9]>
    <script src="${url}/plugins/respond.js"></script>
    <script src="${url}/plugins/html5shiv.js"></script>
    <script src="${url}/js/plugins/placeholder-IE-fixes.js"></script>    
<![endif]-->

</body>
</body>
</html>