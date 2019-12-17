<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!--=== Illustration v2 ===-->
<div class="illustration-v2 margin-bottom-60">
	<ul class="list-inline">
							<c:forEach items="${productList }" var="p">
								<c:url value="/image?fname=${p.image}" var="imgUrl"></c:url>
								<li class="item" style="padding-top: 15px">
								
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
											<div class="pull-left">${p.name}
											</div>
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
