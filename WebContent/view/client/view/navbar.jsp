<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<c:url value="/view/client/static" var="url"></c:url>

<div class="navbar navbar-default mega-menu" role="navigation">
	<div class="container">
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target=".navbar-responsive-collapse">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="${pageContext.request.contextPath}">
				<img id="logo-header" src="${url}/img/logo.png" alt="Logo">
			</a>
		</div>

		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse navbar-responsive-collapse">
			<!-- Shopping Cart -->
			<jsp:include page="/view/client/view/cart.jsp"></jsp:include>
			<!-- End Shopping Cart -->

			<!-- Nav Menu -->
			<ul class="nav navbar-nav">
				<!-- Chức năng -->

				<li class="dropdown"><a href="${path}" class="dropdown-toggle"
					data-hover="dropdown">Pages</a>
					<ul class="dropdown-menu">

						<li><a href="${pageContext.request.contextPath }/index">Trang
								chủ</a></li>
						<li><a
							href="${pageContext.request.contextPath }/product/list">Trang
								sản phẩm</a></li>
						<li><a href="${pageContext.request.contextPath }/member/cart">Giỏ
								hàng</a></li>
						<li><a href="${pageContext.request.contextPath }/login">Đăng
								nhập</a></li>
						<li><a href="${pageContext.request.contextPath }/register">Đăng
								kí</a></li>
					</ul></li>

				<!-- End Pages -->

				<!-- Dien thoai -->
				<c:set var="pPath"
					value="${pageContext.request.contextPath}/product/list?cate=1"></c:set>
				<li class="dropdown"><a href="${path}" class="dropdown-toggle"
					data-hover="dropdown">Điện thoại</a>
					<ul class="dropdown-menu">
						<li><a href="${pPath}&manu=1">Apple</a></li>
						<li><a href="${pPath}&manu=2">SamSung</a></li>
						<li><a href="${pPath}&manu=3">LG</a></li>
						<li><a href="${pPath}&manu=4">Sony</a></li>
					</ul></li>

				<!-- Lap top -->
				<c:set var="pPath"
					value="${pageContext.request.contextPath}/product/list?cate=2"></c:set>
				<li class="dropdown"><a
					href="${pageContext.request.contextPath}/product/list?cate=2"
					class="dropdown-toggle" data-hover="dropdown">Laptop</a>
					<ul class="dropdown-menu">
						<li><a href="${pPath}&manu=7">Asus</a></li>
						<li><a href="${pPath}&manu=5">Hp</a></li>
						<li><a href="${pPath}&manu=6">Dell</a></li>
						<li><a href="${pPath}&manu=1">Macbook</a></li>
					</ul></li>

				<!-- TV -->
				<c:set var="pPath"
					value="${pageContext.request.contextPath}/product/list?cate=3"></c:set>
				<li class="dropdown"><a
					href="${pageContext.request.contextPath}/product/list?cate=3"
					class="dropdown-toggle" data-hover="dropdown">TV</a>
					<ul class="dropdown-menu">
						<li><a href="${pPath}&manu=2">SamSung</a></li>
						<li><a href="${pPath}&manu=4">Sony</a></li>
						<li><a href="${pPath}&manu=3">LG</a></li>
					</ul></li>
				<!-- End Nav Menu -->
		</div>
	</div>
</div>
