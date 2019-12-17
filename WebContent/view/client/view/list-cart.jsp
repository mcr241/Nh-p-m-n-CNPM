<%@page import="tools.Converter"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>EleKet - Chọn là mua</title>
<!-- Favicon -->
<link rel="shortcut icon" href="favicon.ico">
<c:url value="/view/client/static" var="url"></c:url>

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
	href="${url}/plugins/jquery-steps/css/custom-jquery.steps.css">
<link rel="stylesheet"
	href="${url}/plugins/scrollbar/css/jquery.mCustomScrollbar.css">

<!-- Style Switcher -->
<link rel="stylesheet" href="${url}/css/plugins/style-switcher.css">

<!-- CSS Theme -->
<link rel="stylesheet" href="${url}/css/theme-colors/default.css"
	id="style_color">

<!-- CSS Customization -->
<link rel="stylesheet" href="${url}/css/custom.css">
</head>
<body>
	<!-- Subiz -->
	<!-- 	<script> -->
	<!-- 	// (function(s, u, b, i, z) { // u[i] = u[i] || function() { // u[i].t -->
	<!-- 	= +new Date(); // (u[i].q = u[i].q || []).push(arguments); // }; // z = -->
	<!-- 	s.createElement('script'); // var zz = -->
	<!-- 	s.getElementsByTagName('script')[0]; // z.async = 1; // z.src = b; // -->
	<!-- 	z.id = 'subiz-script'; // zz.parentNode.insertBefore(z, zz); // -->
	<!-- 	})(document, window, 'https://widgetv4.subiz.com/static/js/app.js', // -->
	<!-- 	'subiz'); // subiz('setAccount', 'acqetkhujxyunuatbxzw'); -->
	<!-- 	</script> -->
	<!-- End Subiz -->
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

		<!--=== Breadcrumbs v4 ===-->
		<div class="content container">
			<div class="row">
				<div class="col-md-12"">
					<span style="font-size: 50px; font-weight: bold;">Giỏ hàng</span>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12"
					style="background-color: red; padding-bottom: 5px"></div>
			</div>
		</div>
		<!--=== End Breadcrumbs v4 ===-->

		<!--=== Content Medium Part ===-->
		<div class="content-md margin-bottom-30">
			<div class="container">
				<form class="shopping-cart" action="#">
					<div>
						<div class="header-tags">
							<div class="overflow-h">
								<h2 style="padding-bottom: 30px; font-weight: bold;">Danh
									sách đơn hàng</h2>
							</div>
						</div>
						<section>
							<div class="table-responsive">
								<table class="table table-striped">
									<thead>
										<tr>
											<th>Sản phẩm</th>
											<th>Giá</th>
											<th>Số lượng</th>
											<th>Tổng</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${sessionScope.cart}" var="map">

											<tr>
												<c:url value="/image?fname=${map.value.product.image }"
													var="imgUrl"></c:url>
												<td class="product-in-table"><img
													class="img-responsive" src="${imgUrl}" alt="">
													<div class="product-it-in">
														<h3>${map.value.product.name }</h3>
														<span>${map.value.product.des }</span>
													</div></td>
												<td><span class="main-price">${map.value.product.getPriceFormat() }<strong>đ</strong></span></td>
												<td>${map.value.quantity }</td>

												<td><span class="main-price">${map.value.product.getPriceFormat(map.value.quantity)}
														<strong>đ</strong>
												</span></td>

												<td><a
													href="${pageContext.request.contextPath}/member/cart/remove?pId=${map.value.product.id}"><button
															type="button" class="close">
															<span>&times;</span><span class="sr-only">Close</span>
														</button></a></td>
											</tr>
										</c:forEach>

									</tbody>
								</table>
							</div>
						</section>




						<div class="header-tags">
							<div class="overflow-h">
								<h2>Thanh toán</h2>

								<div class="col-sm-4 col-sm-offset-4">
									<ul class="list-inline total-result">
										<li>
											<h4>Tổng giá trị đơn hàng:</h4> <c:set var="total"
												value="${0}" /> <c:forEach items="${sessionScope.cart}"
												var="map">
												<c:set var="total"
													value="${total + map.value.quantity * map.value.product.getMainPrice()}" />
											</c:forEach> <c:set var="total" scope="request" value="${total }"></c:set>
											<div class="total-result-in">

												<%
													long x = Long.parseLong(request.getAttribute("total").toString());
													request.setAttribute("mainTotal", Converter.convertToStandardPrice(x));
												%>
												<span class="main-price" style="color: red">${mainTotal}<strong>đ</strong></span>

											</div>
										</li>
										<li>
											<h4>Phí vận chuyển:</h4>
											<div class="total-result-in">
												<span class="text-right">0 đ</span>
											</div>
										</li>
										<li class="divider"></li>
										<li class="total-price">
											<h4>Tổng cộng:</h4>
											<div class="total-result-in">

												<%
													x = Long.parseLong(request.getAttribute("total").toString());
													request.setAttribute("mainTotal", Converter.convertToStandardPrice(x));
												%>
												<span class="main-price" style="color: red">${mainTotal}<strong>đ</strong></span>

											</div>
										</li>
									</ul>
								</div>
								<c:if test="${mainTotal != '0'}">

									<div class="coupon-code">
										<div class="row">
											<div class="col-sm-4 col-sm-offset-9">
												<a href="${pageContext.request.contextPath }/member/order">
													<button type="button" class="btn-u btn-u-sea-shop"
														style="font-size: 14px;">
														<strong style="text-align: center; padding-left: 8px">Gửi
															đơn hàng</strong>
													</button>
												</a>
											</div>

										</div>
									</div>
								</c:if>
							</div>
						</div>


					</div>
				</form>
			</div>
			<!--/end container-->
		</div>
		<!--=== End Content Medium Part ===-->

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
	<script src="${url}/plugins/jquery-steps/build/jquery.steps.js"></script>
	<script
		src="${url}/plugins/scrollbar/js/jquery.mCustomScrollbar.concat.min.js"></script>
	<script
		src="${url}/plugins/sky-forms-pro/skyforms/js/jquery.validate.min.js"></script>
	<!-- JS Customization -->
	<script src="${url}/js/custom.js"></script>
	<!-- JS Page Level -->
	<script src="${url}/js/shop.app.js"></script>
	<script src="${url}/js/forms/page_login.js"></script>
	<script src="${url}/js/plugins/stepWizard.js"></script>
	<script src="${url}/js/forms/product-quantity.js"></script>
	<script>
		jQuery(document).ready(function() {
			App.init();
			Login.initLogin();
			App.initScrollBar();
			StepWizard.initStepWizard();
			StyleSwitcher.initStyleSwitcher();
		});
	</script>

	<!--[if lt IE 9]>
    <script src="${url}/plugins/respond.js"></script>
    <script src="${url}/plugins/html5shiv.js"></script>
    <script src="${url}/plugins/sky-forms-pro/skyforms/js/sky-forms-ie8.js"></script>
<![endif]-->
	<!--[if lt IE 10]>
    <script src="${url}/plugins/sky-forms-pro/skyforms/js/jquery.placeholder.min.js"></script>
<![endif]-->

</body>

</body>
</html>