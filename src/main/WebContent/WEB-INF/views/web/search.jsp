<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>酒商城</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<%@ include file="../include/public.jsp"%>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/resources/js/web/search.js"></script>
<style type="text/css">
.boxM {
	margin-bottom: 20px;
	height: auto;
}

.classify {
	padding: 20px;
	color: #999;
	font-size: 12px;
}

.data_size {
	text-align: right;
}

.title {
	color: #333;
	float: left;
}

.sea_classify {
	height: 35px;
	margin-left: 25px;
	line-height: 35px;
	border-bottom: 1px solid #ccc;
}

.sea_classify  a {
	margin-left: 20px;
}

.sea_classify ul li {
	float: left;
	padding: auto 10px;
	padding: 0px 10px;
	color: #333;
}

.sea_classify ul li.on {
	background-color: #f27e56;
	color: #fff;
}
</style>
</head>
<body>
	<!-- ./头部-->
	<%@ include file="../include/web/web_header.jsp"%>
	<input id="searchText" type="hidden" value="${searchText }" />
	<!-- ./头部 -->
	<!-- /.页面导航 -->
	<div class="contentDom">
		<div class="contenthead">
			<a class="contentlist" href="#">首页</a> <a class="contentlist"
				href="#">葡萄美酒</a> <a class="contentlist" href="#">一起哈啤</a> <a
				class="contentlist" href="#">酒仙也参团</a> <a class="contentlist"
				href="#">私人订制</a> <a class="contentlist" href="#">小僮不醉</a>
		</div>
	</div>
	<!-- /.页面导航 -->
	<!--/. 筛选 -->
	<div class="divCon classify">
		<div class="data_size">共111条</div>
		<div>
			<div class="sea_classify">
				<span class="title">品牌：</span> <a href="#">拉菲</a> <a href="#">天之蓝</a>
				<a href="#">天之蓝</a> <a href="#">天之蓝</a> <a href="#">天之蓝</a> <a
					href="#">天之蓝</a>
			</div>
			<div class="sea_classify">
				<span class="title">品牌：</span> <a href="#">拉菲</a> <a href="#">天之蓝</a>
				<a href="#">天之蓝</a> <a href="#">天之蓝</a> <a href="#">天之蓝</a> <a
					href="#">天之蓝</a>
			</div>
			<div class="sea_classify">
				<ul>
					<li class="on">综合</li>
					<li>销量</li>
					<li>价格</li>
				</ul>
			</div>
		</div>
	</div>
	<!--/. 筛选 -->
	<!-- 内容 -->
	<div class="divCon">
		<ul class="conBody clearfix" id="wineContainer">

		</ul>
	</div>
	<!-- /.页脚 -->
	<%@ include file="../include/web/web_footer.jsp"%>
	<!-- /.页脚 -->
</body>
</html>