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
	href="${url}/plugins/noUiSlider/jquery.nouislider.min.css">
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
<body class="header-fixed">
	<div class="wrapper">
		<!--=== Header v5 ===-->
		<div class="header-v5 header-${url}">
			<!-- Topbar v3 -->
			<jsp:include page="topbar.jsp"></jsp:include>
			<!-- End Topbar v3 -->

			<!-- Navbar -->
			<jsp:include page="navbar.jsp"></jsp:include>
			<!-- End Navbar -->
		</div>
		<!--=== End Header v5 ===-->

		<!--=== back nav bar ===-->
		<div class="content container">
			<div class="row">
				<div class="col-md-12"">
					<span style="font-size: 50px; font-weight: bold;">Trang sản
						phẩm</span>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12"
					style="background-color: red; padding-bottom: 5px"></div>
			</div>
		</div>

		<!--=== end back ===-->

		<!--=== Content Part ===-->
		<div class="content container">
			<div class="row">
				<jsp:include page="/view/client/view/search.jsp"></jsp:include>

				<div class="col-md-9"">
					<div class="row margin-bottom-40">
						<div class="col-sm-12 result-category">
							<h2>Điện thoại</h2>
							<small class="shop-bg-red badge-results">${noOfResult}
								Kết quả</small>
						</div>
					</div>
					<!--/end result category-->

					<!--=== Illustration v2 ===-->
					<div class="illustration-v2 margin-bottom-60">
						<ul class="list-inline">
							<c:forEach items="${productList }" var="p">
								<c:url value="/image?fname=${p.image}" var="imgUrl"></c:url>
								<li class="item" style="width: 178px; margin-top: 15px">
									<div class="product-img" style="height: 20%">
										<a
											href="${pageContext.request.contextPath }/product/detail?id=${p.id}"><img
											width="180" height="180" src="	${imgUrl }" alt=""></a> <a
											class="product-review"
											href="${pageContext.request.contextPath }/product/detail?id=${p.id}">Xem
											sản phẩm</a>

										<c:if test="${p.getSale() > 0}">
											<div class="shop-rgba-red rgba-banner" style="width: 52px">
												<span>Giảm ${p.getSale()}%</span>
											</div>
										</c:if>

									</div>

									<div class="product-description product-description-brd">
										<div class="overflow-h margin-bottom-5">
											<div class="pull-left">${p.name}</div>
											<br>
											<div class="product-price">
												<span class="title-price">${p.getPriceFormat()} <strong
													style="text-decoration: underline; font-weight: bold">đ</strong></span>
												<c:if test="${p.getSale() > 0}">
													<span class="line-through">${p.getPrePriceFormat() }<strong
														style="text-decoration: underline;">đ</strong></span>
												</c:if>
												<c:if test="${p.getSale() == 0}">
													<br>
												</c:if>
											</div>
										</div>
										<ul class="list-inline product-ratings">
											<li><i class="rating-selected fa fa-star"></i></li>
											<li><i class="rating-selected fa fa-star"></i></li>
											<li><i class="rating-selected fa fa-star"></i></li>
											<li><i class="rating-selected fa fa-star"></i></li>
											<li><i class="rating-selected fa fa-star"></i></li>
											<li class="like-icon"><a
												data-original-title="Thêm vào DS mong muốn"
												data-toggle="tooltip" data-placement="left" class="tooltips"
												href="#"><i class="fa fa-heart"></i></a></li>
										</ul>
									</div>
								</li>
							</c:forEach>
						</ul>

					</div>
					<!--=== End Illustration v2 ===-->

					<!--/end filter resilts-->
					<div class="text-center">
						<ul class="pagination pagination-v2">
							<li><a href="${servletURL}&page=${page-1}"><i
									class="fa fa-angle-left"></i></a></li>

							<c:forEach var="p" begin="${1 }" end="${noOfPage }">
								<c:set var="temp" value="${page-p}"></c:set>
								<c:if test="${temp==0 }">
									<li class="active"><a href="${servletURL}&page=${p}">${p }</a></li>
								</c:if>
								<c:if test="${temp!=0 }">
									<li><a href="${servletURL}&page=${p}">${p }</a></li>
								</c:if>
							</c:forEach>
							<li><a href="${servletURL}&page=${page+1}"><i
									class="fa fa-angle-right"></i></a></li>

						</ul>
					</div>
					<!--/end pagination-->
				</div>
			</div>
			<!--/end row-->
		</div>
		<!--/end container-->
		<!--=== End Content Part ===-->

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
	<script src="${url}/plugins/noUiSlider/jquery.nouislider.all.min.js"></script>
	<script
		src="${url}/plugins/scrollbar/js/jquery.mCustomScrollbar.concat.min.js"></script>
	<!-- JS Customization -->
	<script src="${url}/js/custom.js"></script>
	<!-- JS Page Level -->
	<script src="${url}/js/shop.app.js"></script>
	<script src="${url}/js/plugins/mouse-wheel.js"></script>
	<script>
		jQuery(document).ready(function() {
			App.init();
			App.initScrollBar();
			MouseWheel.initMouseWheel();
		});
	</script>
	<!--[if lt IE 9]>
    <script src="${url}/plugins/respond.js"></script>
    <script src="${url}/plugins/html5shiv.js"></script>
    <script src="${url}/js/plugins/placeholder-IE-fixes.js"></script>    
<![endif]-->
	<!--[if lt IE 10]>
    <script src="${url}/plugins/sky-forms-pro/skyforms/js/jquery.placeholder.min.js"></script>
<![endif]-->

</body>

</body>
</html>