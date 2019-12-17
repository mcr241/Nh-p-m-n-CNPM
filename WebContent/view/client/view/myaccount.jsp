<%@page import="tools.Converter"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:url value="/view/client/static" var="url"></c:url>
<title>Register</title>
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
<!-- <link rel="stylesheet" href="${url}/plugins/sky-forms-pro/skyforms/css/sky-forms.css"> -->
<!-- <link rel="stylesheet" href="${url}/plugins/sky-forms-pro/skyforms/custom/custom-sky-forms.css"> -->

<!-- CSS Page Styles -->
<link rel="stylesheet" href="${url}/css/pages/log-reg-v3.css">

<!-- Style Switcher -->
<link rel="stylesheet" href="${url}/css/plugins/style-switcher.css">

<!-- CSS Theme -->
<link rel="stylesheet" href="${url}/css/theme-colors/default.css"
	id="style_color">

<!-- CSS Customization -->
<link rel="stylesheet" href="${url}/css/custom.css">
</head>
<body class="header-fixed">

	<!-- 	<div id="fb-root"></div> -->
	<!-- 	<script async defer crossorigin="anonymous" -->
	<!-- 		src="https://connect.facebook.net/vi_VN/sdk.js#xfbml=1&version=v5.0&appId=584492278790537&autoLogAppEvents=1"></script> -->

	<!-- 	<div class="fb-comments" -->
	<!-- 		data-href="http://localhost:8080/AWEB_BTL/login" data-width="600" -->
	<!-- 		data-numposts="5"></div> -->


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
	</div>

	<div class="content container">
		<div class="row">
			<div class="col-md-12"">
				<span style="font-size: 50px; font-weight: bold;">Thông tin</span>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12"
				style="background-color: red; padding-bottom: 5px"></div>
		</div>
	</div>


	<hr>
	<div class="container bootstrap snippet">
		<div class="row">
			<div class="col-sm-10" style="padding-bottom: 20px">
				<h1>Hi, ${sessionScope.account.username}</h1>
			</div>
		</div>
		<div class="row" style="margin-left: 30px">
			<div class="col-sm-3  col-sm-offset-4">
				<!--left col-->
				<c:url value="/member/myaccount" var="myaccount"></c:url>
				<form class="form" action="${myaccount }" method="post"
					id="registrationForm" enctype="multipart/form-data">
					<input name="role" value="${sessionScope.account.roleId }"
						hidden=""> <input name="id"
						value="${sessionScope.account.id }" hidden="">
					<div class="text-center">
						<c:url value="/image?fname=${sessionScope.account.avatar }"
							var="imgUrl"></c:url>
						<img src="${imgUrl }" class="avatar img-circle img-thumbnail"
							alt="avatar">
						<!-- 						<h6>Chọn ảnh đại diện khác...</h6> -->
						<!-- 						<input type="file" name="avatar" -->
						<!-- 							class="text-center center-block file-upload"> -->
					</div>
				</form>

				<br>
			</div>
			<!--/col-3-->
			<div class="col-sm-9">
				<div class="tab-content">
					<div class="tab-pane active" id="home">
						<hr>

						<div class="form-group">

							<div class="col-xs-6">
								<label for="first_name"><h4>Tên đăng nhập:</h4></label> <input
									type="text" class="form-control" name="username"
									id="first_name" value="${sessionScope.account.username }"
									title="enter your first name if any." readonly>
							</div>
						</div>

						<div class="form-group">

							<div class="col-xs-6">
								<label for="first_name"><h4>Email:</h4></label> <input
									type="text" class="form-control" name="email" id="first_name"
									value="${sessionScope.account.email } "
									title="enter your first name if any." readonly>
							</div>
						</div>
						<div class="form-group">

							<div class="col-xs-6">
								<label for="phone"><h4>Mật khẩu</h4></label> <input
									type="password" class="form-control" name="password" id="phone"
									value="${sessionScope.account.password }"
									title="enter your phone number if any."readonly>
							</div>
						</div>

						<div class="form-group">
							<div class="col-xs-6  col-sm-offset-5" style="margin-top: 20px">
								<br>
								<button class="btn btn-lg btn-success" type="button"
									style="background-color: red">
									<i class="glyphicon"></i>
									<a style="color: white;" href="${pageContext.request.contextPath }/member/changeinfor">Đổi mật khẩu</a>
								</button>
							</div>
						</div>
						<hr>

					</div>
					<!--/tab-pane-->
					<div class="tab-pane" id="messages">

						<h2></h2>

						<hr>


					</div>
					<!--/tab-pane-->
					<div class="tab-pane" id="settings">


						<hr>
						<form class="form" action="" method="post" id="registrationForm">
							<div class="form-group">

								<div class="col-xs-6">
									<label for="first_name"><h4>First name</h4></label> <input
										type="text" class="form-control" name="first_name"
										id="first_name" placeholder="first name"
										title="enter your first name if any.">
								</div>
							</div>
							<div class="form-group">

								<div class="col-xs-6">
									<label for="last_name"><h4>Last name</h4></label> <input
										type="text" class="form-control" name="last_name"
										id="last_name" placeholder="last name"
										title="enter your last name if any.">
								</div>
							</div>

							<div class="form-group">

								<div class="col-xs-6">
									<label for="phone"><h4>Phone</h4></label> <input type="text"
										class="form-control" name="phone" id="phone"
										placeholder="enter phone"
										title="enter your phone number if any.">
								</div>
							</div>

							<div class="form-group">
								<div class="col-xs-6">
									<label for="mobile"><h4>Mobile</h4></label> <input type="text"
										class="form-control" name="mobile" id="mobile"
										placeholder="enter mobile number"
										title="enter your mobile number if any.">
								</div>
							</div>
							<div class="form-group">

								<div class="col-xs-6">
									<label for="email"><h4>Email</h4></label> <input type="email"
										class="form-control" name="email" id="email"
										placeholder="you@email.com" title="enter your email.">
								</div>
							</div>
							<div class="form-group">

								<div class="col-xs-6">
									<label for="email"><h4>Location</h4></label> <input
										type="email" class="form-control" id="location"
										placeholder="somewhere" title="enter a location">
								</div>
							</div>
							<div class="form-group">

								<div class="col-xs-6">
									<label for="password"><h4>Password</h4></label> <input
										type="password" class="form-control" name="password"
										id="password" placeholder="password"
										title="enter your password.">
								</div>
							</div>
							<div class="form-group">

								<div class="col-xs-6">
									<label for="password2"><h4>Verify</h4></label> <input
										type="password" class="form-control" name="password2"
										id="password2" placeholder="password2"
										title="enter your password2.">
								</div>
							</div>
							<div class="form-group">
								<div class="col-xs-12">
									<br>
									<button class="btn btn-lg btn-success pull-right" type="submit">
										<i class="glyphicon glyphicon-ok-sign"></i> Lưu
									</button>
									<!--<button class="btn btn-lg" type="reset"><i class="glyphicon glyphicon-repeat"></i> Reset</button>-->
								</div>
							</div>
						</form>
					</div>

				</div>
				<!--/tab-pane-->
			</div>
			<!--/tab-content-->

		</div>

		<div class="row" style="padding-top: 60px">
			<div class="col-sm-10" style="padding-bottom: 20px">
				<h1>Thông tin đơn hàng</h1>
			</div>
		</div>

		<div class="row" style="padding-top: 20px; margin-left: 20px">

			<div class="col-sm-11">

				<table class="table table-striped table-bordered table-hover"
					id="dataTables-example">
					<thead style="text-align: center;">
						<tr>
							<th style="text-align: center;">STT</th>
							<th style="text-align: center;">ID</th>
							<th style="text-align: center;">Ngày mua</th>
							<th style="text-align: center;">Tên sản phẩm</th>
							<th style="text-align: center;">Giá</th>
							<th style="text-align: center;">SL</th>
							<th style="text-align: center;">Tổng cộng</th>
							<th style="text-align: center;">Trạng thái</th>
						</tr>
					</thead>
					<tbody>
						</a>
						<c:set var="index" value="${0}" />
						<c:forEach items="${cartItemList }" var="list">
							<tr class="odd gradeX">
								<c:set var="index" value="${index + 1}" />
								<td>${index }</td>
								<td>${list.id }</td>
								<td>${list.cart.buyDate }</td>
								<c:set var="p1" value="${list.unitPrice}" scope="request" />
								<c:set var="qty" value="${list.quantity}" scope="request" />
								<%
									long x = Long.parseLong(request.getAttribute("p1").toString());
										long y = Long.parseLong(request.getAttribute("qty").toString());
										request.setAttribute("p1", Converter.convertToStandardPrice(x * 1000));
										request.setAttribute("p2", Converter.convertToStandardPrice(y * x * 1000));
								%>
								<td>${list.product.name }</td>
								<td>${p1}</td>
								<td>${list.quantity }</td>
								<td>${p2}</td>
								<td class="center">Gửi thành công</td>
								<!-- 							<td><a -->
								<%-- 								href="<c:url value='/admin/order/delete?id=${list.id }'/>" --%>
								<!-- 								class="center">Xóa</a></td> -->

							</tr>
						</c:forEach>

					</tbody>
				</table>
			</div>
		</div>
		<!--/col-9-->
	</div>
	<!--/row-->

	<jsp:include page="footer.jsp"></jsp:include>

	<!-- JS Global Compulsory -->
	<script src="${url}/plugins/jquery/jquery.min.js"></script>
	<script src="${url}/plugins/jquery/jquery-migrate.min.js"></script>
	<script src="${url}/plugins/bootstrap/js/bootstrap.min.js"></script>
	<!-- JS Implementing Plugins -->
	<script src="${url}/plugins/back-to-top.js"></script>
	<script src="${url}/plugins/smoothScroll.js"></script>
	<script
		src="${url}/plugins/sky-forms-pro/skyforms/js/jquery.validate.min.js"></script>
	<script
		src="${url}/plugins/scrollbar/js/jquery.mCustomScrollbar.concat.min.js"></script>
	<!-- JS Customization -->
	<script src="${url}/js/custom.js"></script>
	<!-- JS Page Level -->
	<script src="${url}/js/shop.app.js"></script>
	<script src="${url}/js/forms/page_registration.js"></script>
	<script>
		jQuery(document).ready(function() {
			App.init();
			App.initScrollBar();
			Registration.initRegistration();
		});
	</script>

</body>

</html>