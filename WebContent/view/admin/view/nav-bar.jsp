<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<nav class="navbar navbar-default navbar-cls-top " role="navigation"
	style="margin-bottom: 0">
	<div class="navbar-header">
		<button type="button" class="navbar-toggle" data-toggle="collapse"
			data-target=".sidebar-collapse">
			<span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span>
			<span class="icon-bar"></span> <span class="icon-bar"></span>
		</button>
		<a class="navbar-brand" href="${pageContext.request.contextPath }/admin">Quản lý EleKet</a>
	</div>
	<div
		style="color: white; padding: 15px 50px 5px 50px; float: right; font-size: 16px;">
		Xin chào &nbsp; <a href="${pageContext.request.contextPath }/logout"
			class="btn btn-danger square-btn-adjust">Đăng xuất</a>
	</div>
</nav>
