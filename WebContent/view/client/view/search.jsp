<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="col-md-2 filter-by-block md-margin-bottom-60">


	<h1>Tìm kiếm theo</h1>
	<div class="panel-group" id="accordion">
		<div class="panel panel-default">
			<div class="panel-heading">
				<h2 class="panel-title">
					<a data-toggle="collapse" data-parent="#accordion"
						href="#collapseOne"> Tên <i class="fa fa-angle-down"></i>
					</a>
				</h2>
			</div>
			<div id="collapseOne" class="panel-collapse collapse in">
				<div class="panel-body">
					<ul class="list-unstyled checkbox-list">
						<form action="${pageContext.request.contextPath }/product/search"
							method="get">
							<input style="width: 98%" type="text" name="name" /> <input
								type="submit" style="margin-top: 5px" value="Tìm">
						</form>

					</ul>
				</div>
			</div>
		</div>
	</div>
	<!--/end panel group-->

	<div class="panel-group" id="accordion-v2">
		<div class="panel panel-default">
			<div class="panel-heading">
				<h2 class="panel-title">
					<a data-toggle="collapse" data-parent="#accordion-v2"
						href="#collapseTwo"> Danh mục <i class="fa fa-angle-down"></i>
					</a>
				</h2>
			</div>
			<div id="collapseTwo" class="panel-collapse collapse in">
				<div class="panel-body">
					<ul class="list-unstyled checkbox-list">
						<a href="${pageContext.request.contextPath}/product/list?cate=all">Tất cả</a>
						<br>
						<a href="${pageContext.request.contextPath}/product/list?cate=1">Điện
							thoại</a>
						<br>
						<a href="${pageContext.request.contextPath }/product/list?cate=2">Laptop</a>
						<br>
						<a href="${pageContext.request.contextPath }/product/list?cate=3">TV</a>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<!--/end panel group-->

	<div class="panel-group" id="accordion-v4">
		<div class="panel panel-default">
			<div class="panel-heading">
				<h2 class="panel-title">
					<a data-toggle="collapse" data-parent="#accordion-v4"
						href="#collapseFour"> Giá khoảng<i class="fa fa-angle-down"></i>
					</a>
				</h2>
			</div>
			<div id="collapseTwo" class="panel-collapse collapse in">
				<div class="panel-body">
					<ul class="list-unstyled checkbox-list" style="color: black;">
						<a style="text-align: center;" href="${servletURL}&interval=all">Tất
							cả</a>
						<br>
						<a href="${servletURL}&interval=1">Giá &#8804 5 (Tr)</a>
						<br>
						<a href="${servletURL}&interval=2">5 &lt Giá &#8804 15 (Tr) </a>
						<br>
						<a href="${servletURL}&interval=3">15 &lt Giá &#8804 30 (Tr) </a>
						<br>
						<a href="${servletURL}&interval=4">Giá &#8805 30 (Tr)</a>
						<br>

					</ul>
				</div>
			</div>
		</div>
	</div>
	<!--/end panel group-->

	<div class="panel-group" id="accordion-v4">
		<div class="panel panel-default">
			<div class="panel-heading">
				<h2 class="panel-title">
					<a data-toggle="collapse" data-parent="#accordion-v4"
						href="#collapseFour"> Sắp xếp theo<i class="fa fa-angle-down"></i>
					</a>
				</h2>
			</div>
			<div id="collapseTwo" class="panel-collapse collapse in">
				<div class="panel-body">
					<ul class="list-unstyled checkbox-list" style="color: black;">
						<a href="${servletURL}&sort=increPrice">Giá Tăng</a>
						<br>
						<a href="${servletURL}&sort=decrePrice">Giá giảm</a>
						<br>
						<a href="${servletURL}&sort=decreSale">Sale lớn</a>
						<br>

					</ul>
				</div>
			</div>
		</div>
	</div>
	<!--/end panel group-->

	<!-- 	<button type="button" -->
	<!-- 		class="btn-u btn-brd btn-brd-hover btn-u-lg btn-u-sea-shop btn-block">Reset</button> -->
</div>