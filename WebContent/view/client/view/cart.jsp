<%@page import="tools.Converter"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<ul class="list-inline shop-badge badge-lists badge-icons pull-right">
	<li><a href="#"><i class="fa fa-shopping-cart"></i></a> <c:set
			var="count" value="${0}" /> <c:forEach items="${sessionScope.cart}"
			var="map">
			<c:set var="count" value="${count + map.value.quantity}" />
		</c:forEach> <span class="badge badge-sea rounded-x">${count }</span>

		<ul class="list-unstyled badge-open mCustomScrollbar"
			data-mcs-theme="minimal-dark">
			<c:forEach items="${sessionScope.cart}" var="map">
				<li><c:url value="/image?fname=${map.value.product.image }"
						var="imgUrl"></c:url> <img src="${imgUrl}" alt="" width="10"
					height="20"> <a
					href="${pageContext.request.contextPath}/member/cart/remove?pId=${map.value.product.id} "><button
							type="button" class="close">×</button></a>
					<div class="overflow-h">
						<span>${map.value.product.name }</span> <small style="color: red">${map.value.product.getPriceFormat(map.value.quantity)}
							<strong class="currency">đ</strong>
						</small>
					</div></li>
			</c:forEach>

			<li class="subtotal">
				<div class="overflow-h margin-bottom-10">
					<span style="font-weight: bold;">Tổng</span>
					<c:set var="total" value="${0}"/>
					<c:forEach items="${sessionScope.cart}" var="map">
						<c:set var="total"
							value="${total + map.value.quantity * map.value.product.getMainPrice()}" />
					</c:forEach>
					<c:set var="total" value="${total}" scope="request"/>
					
					<%
					long x = Long.parseLong(request.getAttribute("total").toString());
					request.setAttribute("mainTotal", Converter.convertToStandardPrice(x));
					
					%>
					<span class="pull-right subtotal-cost">${mainTotal} <strong class="currency">đ</strong></span>

				</div>
				<div class="row">
					<div class="col-xs-6 col-xs-offset-3">
						<a href="${pageContext.request.contextPath}/member/cart"
							class="btn-u btn-brd btn-brd-hover btn-u-sea-shop btn-block">Xem
							giỏ hàng</a>
					</div>
				</div>
			</li>
		</ul></li>
</ul>